#pragma once

#include <algorithm>
#include <iostream>
#include <vector>

#include "transaction.hpp"
#include "utils/algorithm.hpp"
#include "utils/assert.hpp"
#include "utils/option.hpp"

namespace tx {

class Engine;

/** Ascendingly sorted collection of transaction ids.
 *
 * Represents the transactions that were active at
 * some point in the discrete transaction time.
 */
class Snapshot {
 public:
  Snapshot() = default;
  Snapshot(std::vector<transaction_id_t> &&active)
      : transaction_ids_(std::move(active)) {}
  // all the copy/move constructors/assignments act naturally

  /** Returns true if this snapshot contains the given
   * transaction id.
   *
   * @param xid - The transcation id in question
   */
  bool contains(transaction_id_t id) const {
    return std::binary_search(transaction_ids_.begin(), transaction_ids_.end(),
                              id);
  }

  /** Adds the given transaction id to the end of this Snapshot.
   * The given id must be greater then all the existing ones,
   * to maintain ascending sort order.
   *
   * @param id - the transaction id to add
   */
  void insert(transaction_id_t id) {
    transaction_ids_.push_back(id);
    debug_assert(
        std::is_sorted(transaction_ids_.begin(), transaction_ids_.end()),
        "Snapshot must be sorted");
  }

  /** Removes the given transaction id from this Snapshot.
   *
   * @param id - the transaction id to remove
   */
  void remove(transaction_id_t id) {
    auto last =
        std::remove(transaction_ids_.begin(), transaction_ids_.end(), id);
    transaction_ids_.erase(last, transaction_ids_.end());
  }

  transaction_id_t front() const {
    debug_assert(transaction_ids_.size(), "Snapshot.front() on empty Snapshot");
    return transaction_ids_.front();
  }

  transaction_id_t back() const {
    debug_assert(transaction_ids_.size(), "Snapshot.back() on empty Snapshot");
    return transaction_ids_.back();
  }

  size_t size() const { return transaction_ids_.size(); }
  bool empty() const { return transaction_ids_.empty(); }
  bool operator==(const Snapshot &other) const {
    return transaction_ids_ == other.transaction_ids_;
  }
  auto begin() { return transaction_ids_.begin(); }
  auto end() { return transaction_ids_.end(); }
  auto begin() const { return transaction_ids_.cbegin(); }
  auto end() const { return transaction_ids_.cend(); }

  friend std::ostream &operator<<(std::ostream &stream,
                                  const Snapshot &snapshot) {
    stream << "Snapshot(";
    PrintIterable(stream, snapshot.transaction_ids_);
    stream << ")";
    return stream;
  }

 private:
  std::vector<transaction_id_t> transaction_ids_;
};
}
