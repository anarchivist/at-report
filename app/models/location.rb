class Location < ActiveRecord::Base
  set_primary_key 'locationId'
  set_table_name 'LocationsTable'
  #has_many :accessions, :through => :accession_locations
  has_many :instances, :foreign_key => "locationId"
end
