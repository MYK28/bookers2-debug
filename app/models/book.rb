class Book < ApplicationRecord

	belongs_to :user
	has_many :book_comments, dependent: :destroy #Book.book_commentsで、ユーザーの所有するコメントを取得できる

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
