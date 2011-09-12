class EducationsController < ApplicationController
  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_to user_path(current_user)
  end

  def mass_input
    @educations = Education.all
    @education = Education.new
  end

  def mass_create
    (params[:existing_educations] || {}).each do |id, education_data|
      education = Education.find(id)
      if education_data[:removed] == "1"
        education.destroy
      else
        education.update_attributes(education_data)
      end
    end

    (params[:new_educations] || []).each do |education_data|
      if education_data[:removed] != "1"
        education_data[:user_id] = current_user.id
        education = Education.new(education_data)
        education.save
      end
    end

    redirect_to user_path(current_user)
  end

end
