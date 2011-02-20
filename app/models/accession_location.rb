class AccessionLocation < ActiveRecord::Base
  set_primary_key 'accessionsLocationId'
  set_table_name 'AccessionsLocations'
  
  belongs_to :accession, :foreign_key => "accessionId"
  belongs_to :location, :foreign_key => "locationId"
end
