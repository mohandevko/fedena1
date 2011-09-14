class Education < ActiveRecord::Base
  belongs_to :user

  attr_accessor :removed
end
