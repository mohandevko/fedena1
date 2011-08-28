class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user.update_attributes(params[:user])
    redirect_to :action => 'show'
  end

end
