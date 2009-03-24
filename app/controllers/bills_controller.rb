class BillsController < ApplicationController

def new
  @bill = Bill.new

  respond_to do |format|
    format.html # new.html.erb
   
    format.xml  { render :xml => @bill }
  end
end
  
def create
    @bill = Bill.new(params[:bill])
    
    respond_to do |format|
      if @bill.save
        flash[:notice] = 'File was successfully uploded.'
        format.html { redirect_to(@bill) }
        
      else
        format.html { render :action => "new" }
        
      end
end
end
end
