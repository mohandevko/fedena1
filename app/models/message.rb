class Message < ActiveRecord::Base

  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  after_create :send_email
  
  def send_email
    MessageMailer.message_notification(self).deliver
  end

end
