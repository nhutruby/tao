class Atao
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id1, type: :object_id
  field :id2, type: :object_id
  field :atype, type: :string

  def  assoc_add

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