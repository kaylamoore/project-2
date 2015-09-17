class NotesController < ApplicationController
	def index
		@users = User.all 
	end
	def show
		@user = User.find(params[:id])
		@notes = Note.where(user_id: @user.id)
	end
	def create
		new_user = User.create(user_params)
		redirect_to user_path(new_user)
	end
	def new
		@user = User.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end
	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to user_path
	end

	private 

	def user_params
		params.require( :user ).permit(:name, :email, :password, :password_confirmation)
	end
end
