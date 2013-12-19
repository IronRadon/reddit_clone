RedditClone::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :subs, :except => [:index]
  resources :links, :except => [:index]
end
