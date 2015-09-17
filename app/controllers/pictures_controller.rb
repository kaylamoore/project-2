class PicturesController < ApplicationController

	before_action :set_photo, only: [:show, :edit]

  	before_action :authenticate, except: [:index, :show ]
	def index
		@pictures = Picture.all 
	end
	def show
		#@user = User.find(params[:id])
		#@pictures = Picture.where(user_id: @user.id)
	end
	def create
		#new_user = User.create(user_params)
		#redirect_to user_path(new_user)
	end
	def new
		@picture = Picture.new
	end
	def edit
		#@user = User.find(params[:id])
	end
	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end
	def destroy
		@picture = current_user.photos.find(params[:id])
		@picture.destroy
	end

	private 

	def set_picture
		@picture = Picture.find(params[:id])
	end
	def picture_params
		params.require(:picture).permit(:title, :caption)
	end
end
