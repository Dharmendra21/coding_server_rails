Rails.application.routes.draw do
  devise_for :users
       devise_scope :user do
        get '/login' => 'devise/sessions#new'
        get '/logout' => 'devise/sessions#destroy'
      end
	root 'home#index'
	resources :countries do
	  get 'set_status', :on => :member
	end
	resources :states do
	  get 'set_status', :on => :member
	end

	 resources :cities do
	 	get 'get_state', :on => :collection
	 	get 'set_status', :on => :member
	 end
	
	resources :clients do
	  get 'set_status', :on => :member
	end

	# get 'cities/get_state/', to: 'cities#get_state', as: :get_state
end
