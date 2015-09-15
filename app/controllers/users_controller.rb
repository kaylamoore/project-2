class UsersController < ApplicationController
	include SessionsHelper
	def index
		@users = User.all
	end
	def show
		@users = current_user
	end
	def new
		@user = User.new
	end

	def create
		name = user_params[:name]
		email = user_params[:email]
		digest = user_params[:password_field]

		@user = User.new({name:name, email:email, password_digest: digest})
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to users_path
		else
			render :new
		end 
	end

	private
	def user_params
		params.require( :user ).permit( :name, :email, :password_field, :password_confirmation)
	end
end
