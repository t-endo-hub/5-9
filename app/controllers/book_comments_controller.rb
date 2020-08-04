class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.save
    @book_comments = @book.book_comments
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find_by(id: params[:id])
    @book_comment.destroy
    @book_comments = @book.book_comments
  end


  private
  def book_comment_params
    params.require(:book_comment).permit(:content)
  end
end
