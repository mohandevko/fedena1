class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :avatar, :phone, :mission_statement, 
                  :email_subscription, :location, :status_message, :position

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # Associations
    has_many :authorizations, :dependent => :destroy
    has_many :skills
    has_many :work_histories
    has_many :educations
    has_many :invitations
    has_many :sent_messages, :class_name => "Message", :foreign_key => :sender_id
    has_many :received_messages, :class_name => "Message", :foreign_key => :receiver_id

  # For omniauth
    def self.create_from_hash!(hash)
      u = User.new(hash)
      u.save(:validate => false)

      return u
    end

  def to_s
    s = "#{self.first_name} #{self.last_name}"
    s = self.email if s.strip.empty?

    return s
  end
end
