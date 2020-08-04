class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_posts,through: :favorites, source: :post
	has_many :book_comments,dependent: :destroy

	validates :title, presence: true,
			   		  length: { maximum: 200}
	validates :body, presence: true,
						length: { maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
						
end

