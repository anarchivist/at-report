class Resource < ActiveRecord::Base
  set_primary_key 'resourceId'
  set_table_name 'Resources'
  has_many :components, :class_name => "ResourceComponent", :foreign_key => "resourceId", :order => "sequenceNumber"
end
