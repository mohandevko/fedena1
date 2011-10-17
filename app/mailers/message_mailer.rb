class MessageMailer < ActionMailer::Base
  default :from => "support@tect-credentials.com"
  
  def message_notification(msg)
    @message = msg
    mail( :to       => @message.receiver.email,
          :subject  => "Message Notification",
          :from     => @message.sender.email )
  end
  
end
