class UsersController < ApplicationController


  def show
    # @nickname = current_user.nickname

    #あと何が必要か分からない
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    
  end
  


end
