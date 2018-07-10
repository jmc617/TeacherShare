class SavePost < ApplicationRecord
  belongs_to :teacher
  belongs_to :post
end
