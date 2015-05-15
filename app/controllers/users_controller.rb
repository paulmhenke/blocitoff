class UsersController < ApplicationController
  def show
    @user = current_user
    @items = @user.items
  end
  
  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Redirect Test"
      redirect_to users_show
    else
      flash[:error] = "Something went wrong. Try again."
      redirect_to edit_user_registration_path
    end
  end
end
