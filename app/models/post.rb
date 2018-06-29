class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :teacher
  belongs_to :group
end
