class UsersController < ApplicationController

  def show
    @menu = "profile"
    @user = User.find(params[:id])
    @skills = current_user.skills
    @work_histories = current_user.work_histories
    @wk = current_user.work_histories
    @edu = Education.find_all_by_user_id(current_user.id)
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
    @user = User.find(params[:id])
    @skills = current_user.skills
    @work_histories = current_user.work_histories
    @wk = current_user.work_histories
    @edu = Education.find_all_by_user_id(current_user.id)
  end
  
  def edit_status
  end
  
  def updatestatus
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to :action => "dashboard"
  end
  
  def edit_position
  end
  def update_position
    puts "===================="
       puts params.inspect
    puts "===================="
    
    @user = current_user
    @user.update_attributes(params[:user])
    
    puts "===================="
       puts @user.inspect
    puts "===================="
    
    redirect_to :action => "dashboard"
  end
  
  
end
