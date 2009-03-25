class CostCentresController < ApplicationController
  
  def index
    @cost_centres = CostCentre.find(:all)
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cost_centres }
    end
  end
  
  def new
     @cost_centre = CostCentre.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @cost_centre }
     end
   end

  
   def edit
     @cost_centre= CostCentre.find(params[:id])
   end

   
   def create
     @cost_centre = CostCentre.new(params[:cost_centre])

     respond_to do |format|
       if @cost_centre.save
         flash[:notice] = 'Cost Center was successfully created.'
         format.html { redirect_to(cost_centres_url) }
         
       else
         format.html { render :action => "new" }
         
       end
     end
   end

   
   def update
     @cost_centre = CostCentre.find(params[:id])

     respond_to do |format|
       if @cost_centre.update_attributes(params[:cost_centre])
         flash[:notice] = 'Cost Center was successfully updated.'
         format.html { redirect_to(cost_centres_url) }
         
       else
         format.html { render :action => "edit" }
         
       end
     end
   end

   
   def destroy
     @cost_centre = CostCentre.find(params[:id])
     @cost_centre.destroy

     respond_to do |format|
       format.html { redirect_to(cost_centres_url) }
       format.xml  { head :ok }
     end
   end
end