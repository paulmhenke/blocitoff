class ItemsController < ApplicationController
 
  def create
    @user = current_user
    @item = @user.items.build(params[:name])
    
    if @item.save
      redirect_to @user, notice: "Success. Now do it."
    else
      flash[:danger] = "No Dice."
    end
  end
end
