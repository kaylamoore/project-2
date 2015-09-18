class NotesController < ApplicationController
	def index
		@notes = Note.all 
	end
	def show
		@user = User.find(params[:id])
		@notes = Note.where(user_id: @user.id)
	end
	def create
		# new_user = User.create(user_params)
		@note = Note.create(user_params)
		if @note.save
			current_user.notes << @note
			redirect_to user_path
		end
	end
	def new
		# @user = User.new
		@note = Note.new
	end


	def edit
		@user = User.find(params[:id])
	end
	def update
		note = Note.find(params[:id])
		note.update(user_params)
		redirect_to user_path(user)
	end
	def destroy
		note = Note.find(params[:id])
		note.destroy
		redirect_to user_path
	end

	private 

	def user_params
		params.require(:note).permit(:title, :list)
	end
end
