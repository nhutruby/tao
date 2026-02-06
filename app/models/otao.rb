class Otao
  include Mongoid::Document
  shard_key :_id, :hashed
end
