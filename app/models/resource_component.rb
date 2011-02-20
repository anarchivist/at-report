class ResourceComponent < ActiveRecord::Base
  
  set_primary_key 'resourceComponentId'
  set_table_name 'ResourcesComponents'
  belongs_to :resource, :foreign_key => "resourceId"
  #attr_accessor :resource
  has_many :components, :class_name => "ResourceComponent", :foreign_key => "parentResourceComponentId", :order => "sequenceNumber", :conditions => {:hasChild => "\001"}
  belongs_to :parent_component, :class_name => "ResourceComponent", :foreign_key => "parentResourceComponentId"
  has_many :instances, :foreign_key => "resourceComponentId"
  
  def get_parent component
    return get_parent component.parent_component if component.resourceId.nil?
    component.resourceId
  end
  
  def resource
    return Resource.find(get_parent self.parent_component) if self.resourceId.nil?
    Resource.find(self.resourceId)
  end
  
end