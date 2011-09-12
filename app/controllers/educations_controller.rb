class EducationsController < ApplicationController
  def new
    @user_id = current_user.id
    @e = Education.new
  end

  def create
    @e = Education.new(params[:education])
    if @e.save
      redirect_to user_path(current_user)
    else
      render :action => 'new'
    end
  end

end
