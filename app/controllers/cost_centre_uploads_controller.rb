class CostCentreUploadsController < ApplicationController

def new
  @cost_centre_upload = CostCentreUpload.new

  respond_to do |format|
    format.html # new.html.erb
   
    format.xml  { render :xml => @cost_centre_upload }
  end
end
  
def create
    @cost_centre_upload = CostCentreUpload.new(params[:cost_centre_upload])
    
    respond_to do |format|
      if @cost_centre_upload.save
        flash[:notice] = 'File was successfully uploded.'
        format.html { redirect_to(@cost_centre_upload) }
        format.xml  { render :xml => @cost_centre_upload, :status => :created, :location => @cost_centre_upload }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
end
end
end
