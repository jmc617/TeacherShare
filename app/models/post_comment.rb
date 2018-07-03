class PostComment < ApplicationRecord
  belongs_to :teacher
  belongs_to :post
end
