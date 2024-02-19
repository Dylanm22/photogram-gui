class UsersController < ApplicationController
  def index
    matching_user = User.all

    @list_of_users = matching_user.order(:username)

    render({ :template => "user_template/index" })
  end

  def show
    # Parameters: {"username"=>"austin"}

    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    render({ :template => "user_template/show" })
  end

  def new_user
    new_username = params.fetch("new_username")

    add_user = User.new

    add_user.username = new_username
    
    add_user.save
 redirect_to("/users/" + add_user.username)
   
  end


#  def add
#    the_username = params.fetch("update")

#    matching_user = User.where({:username => the_username})
 
#    the_user = matching_user.first

#   update_user = params.fetch("update")
  
#   the_user.username = update_user

#   the_user.save

#   redirect_to("/users/" + user.username)
#   render({ :template => "user_template/add" })
#  end 
end
