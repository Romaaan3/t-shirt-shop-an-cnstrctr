Rails.application.routes.draw do

  namespace :cp do
    resources :images
  end
  devise_for :users

  constraints :subdomain => "cp" do
    scope :module => "cp", :as => "cp" do
      resources :users
      resources :products
      resources :news
      resources :requests
      resources :news_photos
      resources :subscribers
      resources :events
      resources :blocks
      resources :constructor_images
      resources :orders
      resources :reviews do
        member do
          put 'activate'
          get 'activate'
          put 'deactivate'
          get 'deactivate'
        end
      end
      root "products#index"
    end
    post '/tinymce_assets' => 'tinymce_assets#create'
  end

  scope :module => "fe", :as => "fe" do

    get "/main", to: "static_pages#main", as: :main
    get "/dostavka-i-oplata", to: "static_pages#dostavka_i_oplata", as: :dip
    get "/price", to: "static_pages#price", as: :price
    get "/shirts", to: "static_pages#shirts", as: :shirts
    get "/mans-shirt", to: "static_pages#mans_shirt", as: :mans_shirt
    match "/kontakty" => 'static_pages#kontakty', :via => [:get, :post], as: :kontakty
    resources :news
    resources :orders
    resources :events
    resources :reviews
    resources :requests
    resources :subscribers do
    end
    match "/unsubscribe" => 'subscribers#unsubscribe', :via => [:get, :put], as: :unsub
    root "static_pages#main"
  end
end
