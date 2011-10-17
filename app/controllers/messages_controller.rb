class MessagesController < ApplicationController

  def index
    @messages = current_user.received_messages
  end

  def new
    @message = Message.new
    @users = User.all
    @sender_id = current_user.id
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to dashboard_user_path(current_user)
    else 
      redirect_to messages_path
    end
  end
  
  def sent 
    @messages = current_user.sent_messages
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to :action => "index"
  end
  
  
  
  
end
