# frozen_string_literal: true

class User < Otao
  include PermittableAttributes
  field :first_name, type: :string
  field :last_name, type: :string

  # Validates that fist name and last name are present
  validates :first_name, :last_name, presence: true
end
