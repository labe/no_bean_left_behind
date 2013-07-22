class StaticPagesController < ApplicationController
	def login
		@user = User.new
		if params[:user]
			if user = User.authenticate(params[:user])
				session[:user_id] = user.id
				redirect_to user_path(user.id)
			else
				flash[:error] = "Errors in your login attempt, dollface. Try again?"
			end
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to login_path
	end
end
