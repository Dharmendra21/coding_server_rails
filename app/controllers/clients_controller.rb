#Clients controller
#Author name :Dharmendra
class ClientsController < ApplicationController 
# Method Name : index
# Parameter   : NULL
#  Task        : Loading View for clients List
  def index
  	@clients = User.all
  end

# Method Name : new
# Parameter   : NULL
#  Task       : Loading view for client add
	def new
   @client = User.new
	end
   
# Method Name : create
# Parameter   : (clients_params)
#  Task         Create client
	def create
		@client = User.create(clients_params)
		if @client.save
      flash[:success] = "Record saved successfully."
			redirect_to clients_params
    else
      @error = @client.errors.full_messages
      redirect_to clients_params
		end
	end
  
# Method Name : set_status
# Parameter   : id ,status
#  Task       : status change according to client id
	def set_status
    @id=params[:id]
    @client = User.find(@id)
    @status =  @client.status
      if @status == true
        @client.update_attributes(status: 'false')
        flash[:success] = "Status upadated In-Active"
      else
        @client.update_attributes(status: 'true')
        flash[:success] = "Status updated Active"
      end
      redirect_to clients_path
  end

# Method Name : show
# Parameter   : user id
#  Task       : show user profile
  def show
    @client = User.find(params[:id])
  end
  
# Method Name : edit
# Parameter   : user id
#  Task       : Loading view for client edit
  def edit
    @client = User.find(params[:id])
  end
  
# Method Name : update
# Parameter   : user id
#  Task       : Update client 
  def update
	  @client = User.find(params[:id])
		if @client.update(clients_params)
      flash[:success] = "Record updated successfully"
			redirect_to clients_path
		else
      flash[:error] = "Record not updated"
			redirect_to new_client_path
	  end
  end
  
# Method Name : destroy
# Parameter   : id
#  Task       : Delete client
  def destroy
  	@client = User.find(params[:id])
  	if @client.destroy
      flash[:success] = "Record destroyed"
  		redirect_to clients_path
    else
      flash[:error] = "Record not destroyed"
  	end
  end

	private
#  client_params
#  Task        : declare client parameters
	def clients_params
		params.require(:user).permit(:first_name, :last_name, :email, :status, :image,
                                 :status, :password, :password_confirmation, 
                                 :mobile_no, :address)
                                 
	end
end
