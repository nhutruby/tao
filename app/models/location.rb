# frozen_string_literal: true

class Location < Otao
  field :name, type: String
  # Store location as a GeoJSON Point object
  field :location, type: Hash

  # Index for geospatial queries
  index({ location: "2dsphere" })
end
