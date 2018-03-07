Rails.application.routes.draw do
  namespace:v1 do
    get "/peter_url" => "contacts#peter"
    get "/bruce_url" => "contacts#bruce"
    get "/clark_url" => "contacts#clark"
    get "/show_all_contacts_url" => "contacts#show_all"

  end
end