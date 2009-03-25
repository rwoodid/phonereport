class PeriodsController < ApplicationController

 def index
      @periods = Period.find(:all)



      respond_to do |format|
        format.html # index.html.erb
        format.xml  {render :xml => @periods }
      end
    
  end
  
  def show
      @period = Period.find(params[:id])
      @cost_centres = CostCentre.find(:all)
      @phonecalls = Phonecall.find(:all, :conditions => {:period_id => @period})
      @clis_without_cost_centres = Cli.find(:all, :conditions => {:cost_centre_id => nil})
      @phonecalls_for_this_period_without_cost_centres = Phonecall.find(:all, :conditions => ["period_id=? and cli_id=?", @period, @clis_without_cost_centres])
      respond_to do |format|
      format.html # show.html.erb
      format.xml {render :xml => @period }
      format.pdf {render :layout => false }
    end
  end
end