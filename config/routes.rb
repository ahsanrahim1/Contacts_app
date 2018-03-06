Rails.application.routes.draw do
  get "/peter_url" => "contacts#peter"
  get "/bruce_url" => "contacts#bruce"
  get "/clark_url" => "contacts#clark"

end
