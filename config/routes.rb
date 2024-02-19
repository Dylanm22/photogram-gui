Rails.application.routes.draw do
get("/", {:controller => "users" , :action => "index"})
get("/users", {:controller => "users" , :action => "index"})
get("/users/:username", {:controller => "users" , :action => "show"})

get("/new_user", {:controller => "users", :action => "new_user"})

get("/add", {:controller => "users", :action => "add"})


# get("/update/:username", {:controller => "users", :action => "update"})


get("/photos", {:controller => "photos", :action => "index"})
get("/photos/:photo_id", {:controller => "photos", :action => "show"})
get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})

get("/add_photo", {:controller => "photos", :action => "add"})
 
get("/update_photo/:photo_id", {:controller => "photos", :action => "update"})


end
