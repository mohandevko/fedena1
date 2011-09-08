class Skill < ActiveRecord::Base
  #Associations
  belongs_to :user
  
  #Validations
  validates_presence_of :name

  attr_accessor :removed
end
