class Review < ApplicationRecord
  has_many_attached :pictures
  has_many :review_comments, dependent: :destroy
  belongs_to :teacher
end
