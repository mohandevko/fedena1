class InvitationMailer < ActionMailer::Base
  default :from => "support@tect-credentials.com"
  
  def invitation(inv)
    @invitation = inv
    
    mail( :to       => @invitation.email,
          :subject  => "[Tech-Credentials] Invitation from #{@invitation.user.to_s}",
          :from     => @invitation.user.email )
  end
  
end
