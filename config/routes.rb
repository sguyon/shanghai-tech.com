Shanghaitech2::Application.routes.draw do


  match '/:locale' => 'pages#home'  
  root :to => 'pages#home'  

  scope ":locale" do

    mount RailsAdmin::Engine => 'admin', :as => 'rails_admin'
        
    resources :jobs, :events, :companies, :people, :pages
    resources :users, :user_sessions
    resources :password_resets, :only => [ :new, :create, :edit, :update ]

    #match "company/new" => "companies#new"
    match 'register' => "users#new",      :as => :register
    match 'login' => "user_sessions#new",      :as => :login
    match 'logout' => "user_sessions#destroy", :as => :logout  
    match 'account' => "users#show", :as => :account  
    
    match 'users/:id', :to => 'users#show', :as => :user
      
    match 'about',   :to => 'pages#about'
    match 'pages/:action', :controller => 'pages'

  end

end
