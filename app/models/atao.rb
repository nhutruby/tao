class Atao
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id1, type: :object_id
  field :id2, type: :object_id
  field :atype, type: :string
  class << self
  # Add an association
  # @param [Hash] params Association payload
  # @option params [String] id1 The object 1's ID
  # @option params [String] id2 The object 2's ID
  # @option params [String] atype The association type
  # @option params [String] inverse_atype The inverse ossociation type
  # @return [Boolean] true if the assoc was successfully saved, false otherwise.
  # @raise [Mongoid::Errors::Rollback] if the record is invalid and validations fail.
  def  assoc_add(params)
    Atao.transaction do
      Atao.new(id1: params[:id1], id2: params[:id2], atype: params[:atype]).save
      Atao.new(id1: params[:id2], id2: params[:id1], atype: params[:inverse_atype]).save if params[:inverse_atype]
    end
  end

  def assoc_delete
  end

  def  assoc_change_type
  end

  def assoc_get
  end

  def assoc_count
  end

  def assoc_range
  end

  def assoc_time_range
  end
  end
end
