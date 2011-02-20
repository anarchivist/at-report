class LocationsController < ApplicationController
  
  def index
  end
  
  def pallets
    @results = Location.find :all, :conditions => {:coordinate1Label => "pallet"},  :include => {:instances => :resource} 
  end
end