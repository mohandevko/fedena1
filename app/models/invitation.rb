class Invitation < ActiveRecord::Base
  belongs_to :user

  before_create :generate_token
  after_create :send_email
  
  def generate_token
    self.token = rand(36**8).to_s(36)
  end
  
  def send_email
    InvitationMailer.invitation(self).deliver
  end
end
