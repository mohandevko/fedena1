class EducationsController < ApplicationController
  def new
    @user_id = current_user.id
    @e = Education.new
  end

  def create
<<<<<<< HEAD
    @education = Eduction.new(params[:educations])
    if @education.save
=======

    @e = Education.new(params[:education])
    if @e.save
>>>>>>> e3a2f68cb6ec0a418d3b8b91e8bab55af689977a
      redirect_to user_path(current_user)
    else
      render :action => 'new'
    end
  end

end
