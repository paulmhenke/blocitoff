class ItemsController < ApplicationController
 
  def create
    @user = current_user
    
    @item = @user.items.build(params.require(:item).permit(:name))
    @item.user = @user
    @new_item = Item.new
  
    
    if @item.save
      redirect_to @user, notice: "Success. Now do it."
    else
      flash[:danger] = "No Dice."
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Task marked as completed."
    else
      flash[:error] = "Error has occured."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
