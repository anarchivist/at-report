class Instance < ActiveRecord::Base
  set_primary_key 'archDescriptionInstancesId'
  set_table_name 'ArchDescriptionInstances'
  belongs_to :location, :class_name => "Location", :foreign_key => "locationId"
  belongs_to :resource, :foreign_key => "resourceId"
  belongs_to :resource_component, :foreign_key => "resourceComponentId"
  
  def resource
    if self.resourceId != nil
      Resource.find(self.resourceId)
    elsif self.parentResourceId != nil
      Resource.find(self.parentResourceId)
    else
      self.resource_component.resource
    end
  end
end
