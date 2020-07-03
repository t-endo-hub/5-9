class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]

	def index
		@book = Book.new
		@books = Book.all
		@user = User.find_by(id: current_user.id)
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = User.find_by(id: @book.user_id)
		@books = Book.all
		if @book.save
			redirect_to @book, notice: 'You have creatad book successfully.'
		else
			render 'index'
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find_by(id: @book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@user = User.find_by(id: @book.user_id)
		@books = Book.all
		if @book.update(book_params)
			redirect_to book_path(@book), notice: 'You have updated book successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_user
		@book = Book.find(params[:id])
		redirect_to books_path unless @book.user_id == current_user.id
	end
end
