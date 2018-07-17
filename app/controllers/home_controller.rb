#Home controller
#Author name :Dharmendra

class HomeController < ApplicationController

# before_action :authorize_admin, only: [:index]
	
# Method Name : index
# Parameter   : NULL
#  Task       : Loading View for application home page
	def index 
	 current_user
	end

  # private
  # def authorize_admin
  #   redirect_to root_path, alert: "Permissions denied" unless
  #   current_user.admin?
  # end
end
