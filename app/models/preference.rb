class Preference < ActiveRecord::Base
  attr_accessible :user_id, :jelly_bean_id, :value, :quantity
  validates 	:user_id, :jelly_bean_id, :value, :quantity, :presence => true
  belongs_to 	:user
  belongs_to 	:jelly_bean
end
