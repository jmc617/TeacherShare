class ReviewComment < ApplicationRecord
  class PostComment < ApplicationRecord
    belongs_to :teacher
    belongs_to :review
  end
end
