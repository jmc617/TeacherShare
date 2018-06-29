class Review < ApplicationRecord
  has_many_attached :pictures
  belongs_to :teacher
end
