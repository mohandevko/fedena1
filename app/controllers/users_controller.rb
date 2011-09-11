class UsersController < ApplicationController

  def show
    @menu = "profile"
    @user = User.find(params[:id])
    @skills = current_user.skills
    @work_histories = current_user.work_histories
    @e = Education.find_all_by_user_id(current_user.id)
    @wk = current_user.work_histories
  end

  def edit
      @user = current_user
  end

  def update
    current_user.update_attributes(params[:user])
    redirect_to :action => 'show'
  end

  def dashboard
    @menu = "dashboard"
  end

end
