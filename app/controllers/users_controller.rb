class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]

	def top
	end

	def index
		@users = User.all
		@user = User.find_by(id: current_user.id)
		@book =Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "You have updated user successfully."
		else
			render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to user_path(current_user.id) unless @user.id == current_user.id
	end
end
def ensure_correct_user
	@user = User.find(params[:id])
	unless @user == current_user
		redirect_to user_path(current_user)
	end
end