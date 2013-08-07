class FriendshipsController < ApplicationController

	def create
		friend = User.find(params[:id])
		Friendship.create(:user_id => current_user.id, :friend_id => friend.id)
		redirect_to user_path(friend.id)
	end
end
