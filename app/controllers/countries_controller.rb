# countries controller
#Author name :Dharmendra

class CountriesController < ApplicationController
load_and_authorize_resource

# Method Name : index
# Parameter   : NULL
#  Task        : Loading View for Countries List
  def index
	  @countries = Country.all
	end
  
# Method Name : new
# Parameter   : NULL
#  Task       : Loading View for Country add
	def new
	  @country = Country.new
	end
	
# Method Name : create
# Parameter   : country name, country status
#  Task       : Loading View for Country create
	def create
	  @country = Country.new(country_params)
	  if @country.save
	  	flash[:success] = "Record updated successfully"
		  redirect_to countries_path
	   else
	   	flash[:error] = "Record not updated"
	   	redirect_to countries_path 	
	  end
	end
  

 # Method Name : edit
 # Parameter   : country id
 # Task        : Loading View for Country edit
    def edit
	    @country = Country.find(params[:id])
    end
  
 # Method Name : update
 # Parameter   : country Id, country name, 
 # Task        : udate country 
   
	def update
	  @country = Country.find(params[:id])
		if @country.update(country_params)
			flash[:success] = "Record updated successfully"
			redirect_to countries_path
	   else
	   	flash[:error] = "Record not updated"
	   	redirect_to countries_path
	  end
  end
 
 # Method Name : set status
 # Parameter   : country Id, status, 
 # Task        : set status accrording to user
  def set_status
   @id=params[:id]
	  @country = Country.find(@id)
	  @status =  @country.status
    if @status == true
    	@country.update_attributes(status: 'false')
      flash[:success] = "Status upadated In-Active"
    else
      @country.update_attributes(status: 'true')
      flash[:success] = "Status update Active"
    end
    redirect_to countries_path
  end  
 
 # Method Name : delete
 # Parameter   : country Id, country name, 
 # Task        : destroy country
  def destroy
  	@country = Country.find(params[:id])
    if @country.destroy
    	flash[:success] = "Record destroyed"
    	redirect_to countries_path
    else
    	flash[:error] = "Record not destroyed"
    end
  end

  
	private
 # Method Name : country_params
 # Parameter   : country name, 
 # Task        : delcare country parameter
	  def country_params
	    params.require(:country).permit(:name, :status) 
	  end
end
