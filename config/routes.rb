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
  get "/entries/:user_id/entry", to: "entries#show"
  # Get stress levels
  get "/users/:user_id/stress_levels", to: "entries#get_stress_level_data"
  # get "/users/:user_id/stress_post_levels", to: "entries#get_stress_post_level_data"

  # get "/entries/:user_id/:entry_id", to: "entries#show"
  delete "/entries/:user_id/:entry_id", to: "entries#destroy"

  # Appointments
  post "/appointments", to: "appointments#create"
  get "/users/:user_id/appointment", to: "appointments#show"
end
