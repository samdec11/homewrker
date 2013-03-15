Homewrkr::Application.routes.draw do

  root :to => 'home#index'

 resources :students, :assignments

end
