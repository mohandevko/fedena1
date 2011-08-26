class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def profile
    @user = User.find(current_user)
  end
  
  def creat_profile
   @user = current_user
  end
  
  def update
    current_user.update_attributes(params[:user])

    redirect_to :action => 'profile'
  end
  
end
