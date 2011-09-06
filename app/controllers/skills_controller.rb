class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end
  def new
    @skill = Skill.new
    @user = current_user
  end

  def create
    @skill = Skill.new(params[:skill])
    if @skill.save
      redirect_to edit_user_path(current_user)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @skill = Skill.find(params[:id])
    @user = @skill.user_id
  end
  
  def update
    @skill = Skill.find(params[:id])
    if @skill.update_attributes(params[:skill])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  
  
 def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to :action => 'index'
  end
  
  

end
