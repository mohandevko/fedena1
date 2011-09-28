class SearchController < ApplicationController

  def search
  end
  
  def result
    @users = User.find_all_by_first_name(params[:s])
    @skills = Skill.find_all_by_name(params[:s])
    @educations = Education.find_all_by_qualification(params[:s])
  end

end
