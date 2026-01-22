# frozen_string_literal: true

class PermittableAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    # Returns an array of all column names for the model
    def permitted_attributes
      self.column_names.map(&:to_sym) - [ :created_at, :updated_at]
    end
  end

end
