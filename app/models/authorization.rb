class Authorization < ActiveRecord::Base
  serialize :details
  
  belongs_to :user
  
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end
  
  def self.create_from_hash(hash, user = nil)
    if user.nil?
      user = User.find_by_email(hash['user_info']['email']) if hash['user_info']['email'].present?
      if user.nil?
        user = User.create_from_hash!(hash['user_info'].merge(:password => Devise.friendly_token[0,20], :external_account => true))
      end
    end
    Authorization.create!(:user => user, :uid => hash['uid'], :provider => hash['provider'], :details => hash)
  end
end
