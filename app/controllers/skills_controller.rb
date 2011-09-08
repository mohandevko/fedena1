class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end
  
  def new
    @skill = Skill.new
  end
  
  def create
    params[:skills].each do |skill_data|
      skill_data[:user_id] = current_user.id
      Skill.new(skill_data).save
    end
    redirect_to user_path(current_user)
  end
  
  def edit
    @skill = Skill.find(params[:id])
    @user = @skill.user_id
  end
  
  def update
    @skill = Skill.find(params[:id])
    if @skill.update_attributes(params[:skill])
      redirect_to user_path(current_user)
    else
      render :action => 'edit'
    end
  end
  
  
 def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to user_path(current_user)
  end
  
  def mass_input
    @skills = Skill.all
    @skill = Skill.new
  end
  
  def mass_create
    (params[:existing_skills] || {}).each do |id, skill_data|
      skill = Skill.find(id)
      if skill_data[:removed] == "1"
        skill.destroy
      else
        skill.update_attributes(skill_data)
      end
    end
    
    (params[:new_skills] || []).each do |skill_data|
      if skill_data[:removed] != "1"
        skill_data[:user_id] = current_user.id
        skill = Skill.new(skill_data)
        skill.save
      end
    end
    
    redirect_to user_path(current_user)
  end
end
