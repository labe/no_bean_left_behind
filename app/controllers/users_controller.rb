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
			flash[:error] = "Blast! There was a kerfuffle creating your account."
			p user.errors
			redirect_to new_user_path
		end
	end

	def show
		@current_user = current_user
		@user = User.find(params[:id])
		@friend = @current_user.is_friends?(@user)
	end
end
