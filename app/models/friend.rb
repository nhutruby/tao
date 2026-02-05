# frozen_string_literal: true

class Friend
  # Add a friend
  # @param [Hash] params Friend payload
  # @option params [String] id1 The person 1's ID
  # @option params [String] id2 The person 2's ID
  # @return [Boolean] true if the friendship was successfully saved, false otherwise.
  # @raise [Mongoid::Errors::Rollback] if the record is invalid and validations fail.
  def self.add_friend(params)
    params.merge!({ atype: "friend", inverse_atype: "friend" })
    Atao.assoc_add(params)
  end
end
