class SessionsController < ApplicationController
	def new
		
	end
	def create
		user = User.find_by(email: params[:login][:email].downcase)
		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id.to_s
			redirect_to show_user_path(user), notice: "LOGGED IN"
		else
			render :new
		end
	end
	def destroy
		session.delete(:user_id)
		redirect_to login_path, notice: "LOGGED OUT"
	end
end