Rails.application.routes.draw do
  # get"/",  controller:  "movies", action: "index"
  root "movies#index"
  #this is a nice shortcut. i'm not sure if you can do it in other areas
  # Routes for the Movie resource:

  # CREATE
  post"/movies" => "movies#create"
  get"/movies/new"=> "movies#new"
          
  # READ
  get"/movies" => "movies#index"
  get"/movies/:id" => "movies#show"
  
  # UPDATE
  patch"/movies/:id" => "movies#update"
  get"/movies/:id/edit"=> "movies#edit"
  
  # DELETE
  delete"/movies/:id"=> "movies#destroy"

  #------------------------------
end
