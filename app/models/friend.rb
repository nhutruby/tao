# frozen_string_literal: true

class Friend
  # Add an association
  # @param [Hash] params Association payload
  # @option params [String] id1 The object 1's ID
  # @option params [String] id2 The object 2's ID
  # @return [Boolean] true if the assoc was successfully saved, false otherwise.
  # @raise [Mongoid::Errors::Rollback] if the record is invalid and validations fail.
  def self.add_friend(params)
    params.merge!({ atype: "friend", inverse_atype: "friend" })
    Atao.assoc_add(params)
  end
end
