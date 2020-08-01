class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
  has_many :favorited_posts,through: :favorites, source: :post

	validates :title, presence: true,
			   		  length: { maximum: 200}
	validates :body, presence: true,
					  length: { maximum: 200}
end
