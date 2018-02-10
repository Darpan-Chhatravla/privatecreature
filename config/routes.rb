Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ifsc_codes, only: [:index] do
  	collection do
  		get 'auto_complete'
  		get 'search_code'
  		get 'find_attribute'
  	end
  end

  resources :micr_codes, only: [:index] do
  	collection do
  		get 'auto_complete'
  		get 'search_code'
  		get 'find_attribute'
  	end
  end

  root to: "ifsc_codes#index"
end
