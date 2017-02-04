# -----------------------------------------------------------------------------
# COPY header files required by query engine (query compiler)
# TODO: create a copy function, COPY_RELATIVE(base relative_path dst)
# TODO: somehow automate (in destination dir should be only required include files)
FILE(COPY ${include_dir}/database/db.hpp DESTINATION ${build_include_dir}/database)
FILE(COPY ${include_dir}/database/db_transaction.hpp DESTINATION ${build_include_dir}/database)
FILE(COPY ${include_dir}/database/db_accessor.hpp DESTINATION ${build_include_dir}/database)

FILE(COPY ${include_dir}/storage/graph.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/edge.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/edge_record.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/vertex_record.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/edge_accessor.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/vertex.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/vertex_accessor.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/record_accessor.hpp DESTINATION ${build_include_dir}/storage)
FILE(COPY ${include_dir}/storage/locking/record_lock.hpp DESTINATION ${build_include_dir}/storage/locking)
FILE(COPY ${include_dir}/storage/locking/lock_status.hpp DESTINATION ${build_include_dir}/storage/locking)
FILE(COPY ${include_dir}/storage/edge_x_vertex.hpp DESTINATION ${build_include_dir}/storage)

FILE(COPY ${include_dir}/query/util.hpp DESTINATION ${build_include_dir}/query)
FILE(COPY ${include_dir}/query/i_plan_cpu.hpp DESTINATION ${build_include_dir}/query)
FILE(COPY ${include_dir}/query/strip/stripped.hpp DESTINATION ${build_include_dir}/query/strip)

FILE(COPY ${include_dir}/data_structures/concurrent/concurrent_map.hpp DESTINATION ${build_include_dir}/data_structures/concurrent)
FILE(COPY ${include_dir}/data_structures/concurrent/concurrent_set.hpp DESTINATION ${build_include_dir}/data_structures/concurrent)
FILE(COPY ${include_dir}/data_structures/concurrent/concurrent_list.hpp DESTINATION ${build_include_dir}/data_structures/concurrent)
FILE(COPY ${include_dir}/data_structures/concurrent/common.hpp DESTINATION ${build_include_dir}/data_structures/concurrent)
FILE(COPY ${include_dir}/data_structures/concurrent/skiplist.hpp DESTINATION ${build_include_dir}/data_structures/concurrent)
FILE(COPY ${include_dir}/data_structures/concurrent/skiplist_gc.hpp DESTINATION ${build_include_dir}/data_structures/concurrent)
FILE(COPY ${include_dir}/data_structures/map/rh_hashmultimap.hpp DESTINATION ${build_include_dir}/data_structures/map)
FILE(COPY ${include_dir}/data_structures/map/rh_common.hpp DESTINATION ${build_include_dir}/data_structures/map)

FILE(COPY ${include_dir}/data_structures/bitset/dynamic_bitset.hpp DESTINATION ${build_include_dir}/data_structures/bitset)

FILE(COPY ${include_dir}/threading/sync/lockable.hpp DESTINATION ${build_include_dir}/threading/sync)
FILE(COPY ${include_dir}/threading/sync/spinlock.hpp DESTINATION ${build_include_dir}/threading/sync)
FILE(COPY ${include_dir}/threading/sync/futex.hpp DESTINATION ${build_include_dir}/threading/sync)
FILE(COPY ${include_dir}/threading/sync/lock_timeout_error.hpp DESTINATION ${build_include_dir}/threading/sync)

FILE(COPY ${include_dir}/memory/freelist.hpp DESTINATION ${build_include_dir}/memory)
FILE(COPY ${include_dir}/memory/lazy_gc.hpp DESTINATION ${build_include_dir}/memory)

FILE(COPY ${include_dir}/mvcc/cre_exp.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/hints.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/id.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/mvcc_error.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/record.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/serialization_error.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/version.hpp DESTINATION ${build_include_dir}/mvcc)
FILE(COPY ${include_dir}/mvcc/version_list.hpp DESTINATION ${build_include_dir}/mvcc)

FILE(COPY ${include_dir}/transactions/transaction.hpp DESTINATION ${build_include_dir}/transactions)
FILE(COPY ${include_dir}/transactions/lock_store.hpp DESTINATION ${build_include_dir}/transactions)
FILE(COPY ${include_dir}/transactions/snapshot.hpp DESTINATION ${build_include_dir}/transactions)
FILE(COPY ${include_dir}/transactions/commit_log.hpp DESTINATION ${build_include_dir}/transactions)
FILE(COPY ${include_dir}/transactions/engine.hpp DESTINATION ${build_include_dir}/transactions)
FILE(COPY ${include_dir}/transactions/transaction_store.hpp DESTINATION ${build_include_dir}/transactions)
FILE(COPY ${include_dir}/transactions/transaction_read.hpp DESTINATION ${build_include_dir}/transactions)

FILE(COPY ${include_dir}/storage/typed_value.hpp DESTINATION ${build_include_dir}/storage/model)
FILE(COPY ${include_dir}/storage/typed_value_store.hpp DESTINATION ${build_include_dir}/storage/model)
FILE(COPY ${include_dir}/storage/typed_value_utils.hpp DESTINATION ${build_include_dir}/storage/model)

FILE(COPY ${include_dir}/storage/garbage/delete_sensitive.hpp DESTINATION ${build_include_dir}/storage/garbage)
FILE(COPY ${include_dir}/storage/garbage/garbage.hpp DESTINATION ${build_include_dir}/storage/garbage)

FILE(COPY ${include_dir}/utils/string_buffer.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/handle_write.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/sys.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/char_str.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/void.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/array_store.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/bswap.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/stacktrace/stacktrace.hpp DESTINATION ${build_include_dir}/utils/stacktrace)
FILE(COPY ${include_dir}/utils/stacktrace/log.hpp DESTINATION ${build_include_dir}/utils/stacktrace)
FILE(COPY ${include_dir}/utils/auto_scope.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/assert.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/reference_wrapper.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/underlying_cast.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/total_ordering.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/crtp.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/placeholder.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/likely.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/cpu_relax.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/counters/atomic_counter.hpp DESTINATION ${build_include_dir}/utils/counters)
FILE(COPY ${include_dir}/utils/counters/simple_counter.hpp DESTINATION ${build_include_dir}/utils/counters)
FILE(COPY ${include_dir}/utils/random/fast_binomial.hpp DESTINATION ${build_include_dir}/utils/random)
FILE(COPY ${include_dir}/utils/random/xorshift128plus.hpp DESTINATION ${build_include_dir}/utils/random)
FILE(COPY ${include_dir}/utils/datetime/timestamp.hpp DESTINATION ${build_include_dir}/utils/datetime)
FILE(COPY ${include_dir}/utils/datetime/datetime_error.hpp DESTINATION ${build_include_dir}/utils/datetime)
FILE(COPY ${include_dir}/utils/types/byte.hpp DESTINATION ${build_include_dir}/utils/types)
FILE(COPY ${include_dir}/utils/option_ptr.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/option.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/border.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/order.hpp DESTINATION ${build_include_dir}/utils)
FILE(COPY ${include_dir}/utils/numerics/saturate.hpp DESTINATION ${build_include_dir}/utils/numerics)
FILE(COPY ${include_dir}/utils/memory/stack_allocator.hpp DESTINATION ${build_include_dir}/utils/memory)
FILE(COPY ${include_dir}/utils/memory/block_allocator.hpp DESTINATION ${build_include_dir}/utils/memory)
FILE(COPY ${include_dir}/utils/exceptions/basic_exception.hpp DESTINATION ${build_include_dir}/utils/exceptions)
FILE(COPY ${include_dir}/utils/exceptions/out_of_memory.hpp DESTINATION ${build_include_dir}/utils/exceptions)

FILE(COPY ${include_dir}/utils/iterator/iterator_base.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/virtual_iter.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/iterator.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/composable.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/count.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/accessor.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/combined.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/count.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/filter.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/flat_map.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/for_all.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/inspect.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/iterator_accessor.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/lambda_iterator.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/limited_map.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/map.hpp DESTINATION ${build_include_dir}/utils/iterator)
FILE(COPY ${include_dir}/utils/iterator/range_iterator.hpp DESTINATION ${build_include_dir}/utils/iterator)

FILE(COPY ${include_dir}/communication/communication.hpp DESTINATION ${build_include_dir}/communication)
FILE(COPY ${include_dir}/communication/bolt/v1/config.hpp DESTINATION ${build_include_dir}/communication/bolt/v1)
FILE(COPY ${include_dir}/communication/bolt/v1/serialization/record_stream.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/serialization)
FILE(COPY ${include_dir}/communication/bolt/v1/serialization/bolt_serializer.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/serialization)
FILE(COPY ${include_dir}/communication/bolt/v1/transport/bolt_encoder.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/transport)
FILE(COPY ${include_dir}/communication/bolt/v1/transport/chunked_buffer.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/transport)
FILE(COPY ${include_dir}/communication/bolt/v1/transport/chunked_encoder.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/transport)
FILE(COPY ${include_dir}/communication/bolt/v1/transport/socket_stream.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/transport)
FILE(COPY ${include_dir}/communication/bolt/v1/transport/stream_error.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/transport)
FILE(COPY ${include_dir}/communication/bolt/v1/packing/codes.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/packing)
FILE(COPY ${include_dir}/communication/bolt/v1/messaging/codes.hpp DESTINATION ${build_include_dir}/communication/bolt/v1/messaging)

FILE(COPY ${include_dir}/io/network/socket.hpp DESTINATION ${build_include_dir}/io/network)
FILE(COPY ${include_dir}/io/network/addrinfo.hpp DESTINATION ${build_include_dir}/io/network)
FILE(COPY ${include_dir}/io/network/network_error.hpp DESTINATION ${build_include_dir}/io/network)
FILE(COPY ${include_dir}/io/network/socket.hpp DESTINATION ${build_include_dir}/io/network)

FILE(COPY ${include_dir}/logging/default.hpp DESTINATION ${build_include_dir}/logging)
FILE(COPY ${include_dir}/logging/log.hpp DESTINATION ${build_include_dir}/logging)
FILE(COPY ${include_dir}/logging/logger.hpp DESTINATION ${build_include_dir}/logging)
FILE(COPY ${include_dir}/logging/levels.hpp DESTINATION ${build_include_dir}/logging)
FILE(COPY ${include_dir}/logging/loggable.hpp DESTINATION ${build_include_dir}/logging)

FILE(COPY ${include_dir}/snapshot/snapshot_engine.hpp DESTINATION ${build_include_dir}/snapshot)
# -----------------------------------------------------------------------------
