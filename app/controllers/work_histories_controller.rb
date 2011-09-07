class WorkHistoriesController < ApplicationController

  def index
    @wk = WorkHistory.all
  end
  
  def new 
    @wk = WorkHistory.new
    @user = current_user
  end
  
  def create
    puts"=========================="
      puts params.inspect
    puts"=========================="
    @wk = WorkHistory.new(params[:work_history])
    if @wk.save
      redirect_to work_histories_path
    else 
      render :action => 'new'
    end
  end

  def edit
    @wk = WorkHistory.find(params[:id])
    @user = @wk.user_id
  end
  
   def destroy
    @wk = WorkHistory.find(params[:id])
    @wk.destroy
    redirect_to :action => 'index'
  end
    
  def show
    @wk = WorkHistory.find(params[:id])
  end
  

end
