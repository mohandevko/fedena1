class EducationsController < ApplicationController
  def new
    @user_id = current_user.id
    @education = Education.new
  end
  
  def create
    @education = Eduction.new(params[:educations])
    if @education.save
      redirect_to user_path(current_user)
    else
      render :action => 'new'
    end
  end
  
end
