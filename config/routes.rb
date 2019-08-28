Rails.application.routes.draw do
  # Create user
  post "/signup", to: "users#create"
  #  Login
  post "/login", to: "auth#create"
  get "/retrieve_user", to: "auth#retrieve"
  # Get user entries
  get "/users/:user_id/entries", to: "users#show_user_entries"
  # Creating, seeing, and destroying entries
  post "/entries", to: "entries#create"
  get "/entries/:user_id/:id", to: "entries#show"
  # get "/entries/:user_id/:entry_id", to: "entries#show"
  delete "/entries/:user_id/:entry_id", to: "entries#destroy"
end
