class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new(params[:user])
		if user.save
			session[:user_id] = user.id
			redirect_to user_path(user.id)
		else
			@error = "Blast! There was a kerfuffle creating your account."
			p user.errors
			@user = User.new
			render "users/new"
		end
	end

	def show
		@user = User.find(params[:id])
		@friendship = current_user.is_friends_with?(@user) if current_user
	end
end
