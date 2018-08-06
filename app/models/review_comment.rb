class ReviewComment < ApplicationRecord
  belongs_to :teacher
  belongs_to :review
end
