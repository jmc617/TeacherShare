class Group < ApplicationRecord
  has_many_attached :pictures
  belongs_to :teacher
  has_many :posts, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :teachers, :through => :memberships
end
