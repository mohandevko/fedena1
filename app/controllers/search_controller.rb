class SearchController < ApplicationController

  def search
  end
  
  def result
    @users = User.where("first_name like ? OR last_name like ? OR email like ?", params[:s] + "%", params[:s] + "%", "%" + params[:s] + "%")
    @skills = Skill.where("name like ? ", params[:s] + "%")
    @educations = Education.where("qualification like ? ", params[:s] + "%")
  end

end
