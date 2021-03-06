class User < ActiveRecord::Base
	has_secure_password

  attr_accessible :name, :username, :email, :password, :password_confirmation, :location

  validates :name, :username, :email, :password, :password_confirmation, :location, 
            :presence => true

  validates :username,  :uniqueness => true
  validates :email,     :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates	:password,  :confirmation => true

  has_many	:preferences
  has_many	:jelly_beans,  :through => :preferences, :uniq => true, :dependent => :destroy

  has_many	:users_in_groups
  has_many	:groups,       :through => :users_in_groups, :uniq => true, :dependent => :destroy

  has_many	:friendships
  has_many	:friends,      :through => :friendships, :uniq => true, :dependent => :destroy

  has_many 	:reverse_friendships, :foreign_key => :friend_id,
  					:class_name => "Friendship", :uniq => true, :dependent =>:destroy

  def self.authenticate(params)
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      user
    else
      false
    end
  end

  def is_friends_with?(user)
    true if self.friendships.find_by_friend_id(user.id) && user.friendships.find_by_friend_id(self.id)
  end
end
