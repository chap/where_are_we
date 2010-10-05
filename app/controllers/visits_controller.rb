class VisitsController < ApplicationController
  # GET /visits/new
  # GET /visits/new.xml
  def new
  end

  # POST /visits
  # POST /visits.xml
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to(@visit, :notice => 'Visit was successfully created.') }
        format.xml  { render :xml => @visit, :status => :created, :location => @visit }
        format.json  { render :json => @visit, :status => :created, :location => @visit, :methods => [:city_state, :unemployment_rate, :match_country_name, :match_country_stat] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
        format.json  { render :json => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end
end
