require "redis-clustering"

redis ||=  ConnectionPool.new(size: 5, timeout: 5) {
  Redis::Cluster.new(nodes: (7000..7005).map { |port| "redis://127.0.0.1:#{port}" })
}
