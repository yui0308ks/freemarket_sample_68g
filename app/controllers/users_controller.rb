class UsersController < ApplicationController


  def show
    @nickname = current_user.nickname
    
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    
  end
  


end
