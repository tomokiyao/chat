Rails.application.routes.draw do
  get 'tops/index'
  get 'tops/show'
  devise_for :users
	resources :users, only: [:show, :edit, :index, :update]do
		resource :relationships, only: [:create, :destroy]
		get :following, on: :member
		get :followers, on: :member
	end

	resources :post_books do
		resource :post_comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
	end



	# resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end





