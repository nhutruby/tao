# frozen_string_literal: true

module PermittableAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    # Returns an array of all column names for the model
    def permitted_attributes
      self.attribute_names.map(&:to_sym) - [ :created_at, :updated_at]
    end
  end

end
