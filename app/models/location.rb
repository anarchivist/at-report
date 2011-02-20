class Location < ActiveRecord::Base
  set_primary_key 'locationId'
  set_table_name 'LocationsTable'
  has_many :accessions, :through => :accession_location, :foreign_key => "locationId"
  has_many :instances, :foreign_key => "locationId"
  has_many :accession_location, :foreign_key => "locationId"
end
