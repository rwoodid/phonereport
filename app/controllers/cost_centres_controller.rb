class CostCentresController < ApplicationController
  
  def index
    @cost_centres = CostCentre.find(:all)
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cost_centres }
    end
  end
end