class JellyBean < ActiveRecord::Base
  attr_accessible :flavor
  validates :flavor, :presence => true, :uniqueness => true
  has_many	:preferences
  has_many 	:users, :through => :preferences, :uniq => true
end
