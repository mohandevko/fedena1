class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @skills = current_user.skills
    @work_histories = current_user.work_histories
    @wk = current_user.work_histories
    puts"=================================="
      puts @wk.inspect
    puts"=================================="
  end

  def edit
      @user = current_user
  end
  
  def update
    puts "==========================================="
      puts params.inspect
    puts "==========================================="
    current_user.update_attributes(params[:user])
    redirect_to :action => 'show'
  end
  
  def dashboard
    
  end

end
