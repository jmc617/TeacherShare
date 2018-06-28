class Membership < ApplicationRecord
  belongs_to :teacher
  belongs_to :group
end
