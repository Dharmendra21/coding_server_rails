#Cities controller
#Author name :Dharmendra

class CitiesController < ApplicationController
 
# Method Name : index
# Parameter   : NULL
#  Task        : Loading View for cites List
  def index
    @countries = Country.all
    @states = State.all
  	@cities = City.all
  end

# Method Name : new
# Parameter   : NULL
#  Task       : Loading view for city add
	def new
	  @city = City.new
	end

# Method Name : create
# Parameter   : cities params
# Task        : Create city
  def create
  	@city = City.create(cities_params)
  	if @city.save
      flash[:success] = "Record saved successfully."
  		redirect_to cities_path
    else
      flash[:error] = "Record not saved"
      redirect_to new_city_path
  	end
  end

# Method Name : get_state
# Parameter   : country id
#  Task       : Get states according to country id
  def get_state  
    @country = params[:country_id]
    # @contry_states = State.where(country_id: @country).pluck(:name)
    @contry_states = State.where(country_id: @country)
    @test=''; 
    @contry_states.each do |contry_states| 
      @name =contry_states.name
      @states_id=contry_states.id.to_s
      @test =@test+"<option value="+@states_id+">"+@name+"</option>"
    end
    respond_to do |format|
      format.json  { render :json => @test} # don't do msg.to_json
    end
  end

# Method Name : edit
# Parameter   : id
#  Task       : Loading view for city edit
  def edit
  	@city = City.find(params[:id])
  end


# Method Name : update
# Parameter   : id
#  Task       : Update city 
  def update
  	@city = City.find(params[:id])
  	if @city.update(cities_params)
      flash[:success] = "Record updated successfully"
  		redirect_to cities_path
    else
  		flash[:error] = "Record not updated"
      redirect_to cities_path
  	end
  end


# Method Name : set_status
# Parameter   : id ,status
#  Task       : status change according to user
  def set_status
    @id=params[:id]
    @city = City.find(@id)
    @status =  @city.status
      if @status == true
        @city.update_attributes(status: 'false')
        flash[:success] = "Status upadated In-Active"
      else
        @city.update_attributes(status: 'true')
        flash[:success] = "Status updated Active"
      end
      redirect_to cities_path
  end

# Method Name : destroy
# Parameter   : city id
#  Task       : Destroy city
	def destroy
		@city = City.find(params[:id])
    if @city.destroy
      flash[:success] = "Record destroyed"
    	redirect_to cities_path
    else
      flash[:error] = "Record not destroyed"
    end
	end


  private
#  cities_params
#  Task        : declare city parameters
   def cities_params
   	params.require(:city).permit(:country_id, :state_id, :name, :status )
   end
end
