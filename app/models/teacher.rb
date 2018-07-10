class Teacher < ApplicationRecord
  has_one_attached :avatar
  has_many :groups
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :save_posts, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :groups, :through => :memberships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
