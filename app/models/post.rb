class Post < ApplicationRecord
  has_many_attached :images
  has_many :post_comments, dependent: :destroy
  has_many :save_posts, dependent: :destroy
  belongs_to :teacher
  belongs_to :group
end
