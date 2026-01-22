# frozen_string_literal: true

class User < Otao
  include PermittableAttributes
  field :first_name, type: :string
  field :last_name, type: :string
end
