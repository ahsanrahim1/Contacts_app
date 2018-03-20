
Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace:v1 do
    get "/peter_url" => "contacts#peter"
    get "/bruce_url" => "contacts#bruce"
    get "/clark_url" => "contacts#clark"
    get "/show_all_contacts_url" => "contacts#show_all"
  end
  namespace:v2 do
    get "/contacts" => "contacts#index"
    get "/contacts/:id" => "contacts#show"
    post "/contacts" => "contacts#create"
    patch "/contacts/:id" => "contacts#update"
    delete "/contacts/:id" => "contacts#destroy"
    post "/user" => "users#create"
   
    # patch 
  end
end