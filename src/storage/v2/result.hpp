#pragma once

#include <type_traits>

#include "utils/result.hpp"

namespace storage {

static_assert(std::is_same_v<uint8_t, unsigned char>);

enum class Error : uint8_t {
  SERIALIZATION_ERROR,
  NONEXISTENT_OBJECT,
  DELETED_OBJECT,
  VERTEX_HAS_EDGES,
  PROPERTIES_DISABLED,
};

template <class TValue>
using Result = utils::BasicResult<Error, TValue>;

}  // namespace storage
