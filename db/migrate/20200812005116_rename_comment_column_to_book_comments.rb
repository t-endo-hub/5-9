class RenameCommentColumnToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_comments, :comment, :content
  end
end
