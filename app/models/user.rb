class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :avatar, :phone, :email_subscription, :location
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def to_s
    s = "#{self.first_name} #{self.last_name}"
    s = self.email if s.strip.empty?
    
    return s
  end
end
