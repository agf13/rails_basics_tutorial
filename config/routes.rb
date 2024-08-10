Rails.application.routes.draw do
	root "articles#index"

	get 'instances/index'
	get 'instances/help'

	#get "/articles", to: "articles#index"
	#get "/articles/:id", to: "articles#show"
	resources :articles do
		resources :comments
	end
end
