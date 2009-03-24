class PhonecallsController < ApplicationController
  # GET /phonecalls
  # GET /phonecalls.xml
  def index
    @phonecalls = Phonecall.find(:all)
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phonecalls }
    end
  end

  # GET /phonecalls/1
  # GET /phonecalls/1.xml
  def show
    @phonecall = Phonecall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phonecall }
    end
  end

  # GET /phonecalls/new
  # GET /phonecalls/new.xml
  def new
    @phonecall = Phonecall.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phonecall }
    end
  end

  # GET /phonecalls/1/edit
  def edit
    @phonecall = Phonecall.find(params[:id])
  end

  # POST /phonecalls
  # POST /phonecalls.xml
  def create
    @phonecall = Phonecall.new(params[:phonecall])

    respond_to do |format|
      if @phonecall.save
        flash[:notice] = 'Phonecall was successfully created.'
        format.html { redirect_to(@phonecall) }
        format.xml  { render :xml => @phonecall, :status => :created, :location => @phonecall }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phonecall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phonecalls/1
  # PUT /phonecalls/1.xml
  def update
    @phonecall = Phonecall.find(params[:id])

    respond_to do |format|
      if @phonecall.update_attributes(params[:phonecall])
        flash[:notice] = 'Phonecall was successfully updated.'
        format.html { redirect_to(@phonecall) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phonecall.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phonecalls/1
  # DELETE /phonecalls/1.xml
  def destroy
    @phonecall = Phonecall.find(params[:id])
    @phonecall.destroy

    respond_to do |format|
      format.html { redirect_to(phonecalls_url) }
      format.xml  { head :ok }
    end
  end
end
