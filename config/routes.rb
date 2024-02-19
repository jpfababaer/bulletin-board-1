#NOTES -> Starts below

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"

#1 Auto generating routes + complete, database-backed web resource: use draft:resource generator. The general format is as follows:
# rails generate draft:resource <MODEL_NAME_SINGULAR> <COLUMN_1_NAME>:<COLUMN_1_DATATYPE> <COLUMN_2_NAME>:<COLUMN_2_DATATYPE> ...

#2 Essentially, the above format is as follows: a) The model name MUST be singular b) Separate the column names and datatypes with colons (NO SPACES) c) Separate name:datatype pairs with SPACES (NO COMMAS).

#3 Running these commands: rails generate draft:resource post title:string body:text expires_on:date board_id:integer AND rails generate draft:resource board name:string ...will NOT only create the databases and columns but also the corresponding models, controllers, and view templates.

#4 Do NOT forget to do rake db:migrate
Rails.application.routes.draw do
  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Board resource:

  # CREATE
  post("/insert_board", { :controller => "boards", :action => "create" })

  #HOMEPAGE
  get("/" , controller: "boards" , action: "index")
          
  # READ
  get("/boards", { :controller => "boards", :action => "index" })
  
  get("/boards/:path_id", { :controller => "boards", :action => "show" })
  
  # UPDATE
  
  post("/modify_board/:path_id", { :controller => "boards", :action => "update" })
  
  # DELETE
  get("/delete_board/:path_id", { :controller => "boards", :action => "destroy" })

  #------------------------------

  
end
