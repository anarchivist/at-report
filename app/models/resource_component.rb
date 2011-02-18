class ResourceComponent < ActiveRecord::Base
  
  set_primary_key 'resourceComponentId'
  set_table_name 'ResourcesComponents'
  attr_accessor :parent
  
  def self.parent rscid
    component = self.find(rscid)
    if component.resourceId.nil?
      self.parent component.parentResourceComponentId
    else
      return component.resourceId
    end
  end
end