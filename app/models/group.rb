class Group < ApplicationRecord
  belongs_to :teacher
  has_many :posts, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :teachers, :through => :memberships
end
