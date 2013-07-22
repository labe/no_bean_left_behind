class Group < ActiveRecord::Base
  attr_accessible :creator, :name
  validates		:creator_id, :name, :presence => true
  belongs_to	:creator, :class_name => "User"
  has_many 		:users_in_groups
  has_many 		:users, :through => :users_in_groups, :uniq => true
end
