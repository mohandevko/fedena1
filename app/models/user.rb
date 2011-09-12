class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :avatar, :phone, :mission_statement, :email_subscription, :location

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # Associations
    has_many :authorizations, :dependent => :destroy
    has_many :skills
    has_many :work_histories
    has_many :educations
<<<<<<< HEAD
  
=======

>>>>>>> e3a2f68cb6ec0a418d3b8b91e8bab55af689977a
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
