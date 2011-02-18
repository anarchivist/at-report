class ResourceComponent < ActiveRecord::Base
  
  set_primary_key 'resourceComponentId'
  set_table_name 'ResourcesComponents'
  belongs_to :resource
  #attr_accessor :resource
  has_many :children, :class_name => "ResourceComponent", :foreign_key => "parentResourceComponentId"
  belongs_to :parent, :class_name => "ResourceComponent", :foreign_key => "parentResourceComponentId"
  
  def get_parent component
    return get_parent component.parent if component.resourceId.nil?
    component.resourceId
  end
  
  def resource
    return Resource.find(get_parent self.parent) if self.resourceId.nil?
    Resource.find(self.resourceId)
  end
  
end