class Messages < ActionMailer::Base
  default :from => "support@tect-credentials.com"
  
  def message(msg)
    @message = msg
    
    mail( :to       => @message.email,
          :subject  => "[Tech-Credentials] message from #{@message.user.to_s}",
          :from     => @message.user.email )
  end
  
end
