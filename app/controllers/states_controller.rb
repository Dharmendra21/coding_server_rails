# Controller : States
# Author name :Dharmendra Garg

class StatesController < ApplicationController	

# Method Name : index
# Parameter   : NULL
#  Task       : Loading View for states List
	def index
	  @countries = Country.all
	  @states = State.all	
	end
  
# Method Name : new
# Parameter   : NULL
#  Task       : Loading View for States add
	def new
		@state = State.new
	end

# Method Name : create
# Parameter   : country id, name, status
#  Task       : Create state
	def create
		@state = State.create(states_params)
		if @state.save
			flash[:success] = "Record updated successfully"
			redirect_to states_path
		  else
		  	flash[:error] = "Record not updated"
		    redirect_to states_path
		end
	end

# Method Name : edit
# Parameter   : state id
#  Task       : Loading View for states edit
	def edit
		@state = State.find(params[:id])
	end
  
# Method Name : update
# Parameter   : state id, country id, name, status
#  Task       : update state record
	def update
		@state = State.find(params[:id])
		if @state.update(states_params)
			flash[:success] = "Record updated successfully"
		  redirect_to states_path
		  else
     	flash[:error] = "Record not updated"
       redirect_to states_path
		end
	end

# Method Name : set_status
# Parameter   : id ,status
#  Task       : status change according to user
  def set_status
	  @id=params[:id]
	  @state = State.find(@id)
	  @status =  @state.status
    if @status == true
      @state.update_attributes(status: 'false')
      flash[:success] = "Status upadated In-Active"
    else
      @state.update_attributes(status: 'true')
      flash[:success] = "Status updated Active"
    end
    redirect_to states_path
  end
  

# Method Name : destroy
# Parameter   : state id
#  Task       : Destroy state record
	def destroy
		@state = State.find(params[:id])
    if @state.destroy
    	flash[:success] = "Record destroyed"
    	redirect_to states_path
    else
    	flash[:error] = "Record not destroyed"
    end
	end

	private
# Method Name : states_params
# Parameter   : country id, name, status
#  Task       : declare states parameters
  def states_params
	 	 params.require(:state).permit(:country_id, :name, :status)
	 end
end
