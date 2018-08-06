class Post < ApplicationRecord
  has_attached_file :image, styles: {
  thumb: '100x100>',
  square: '200x200#',
  medium: '300x300>'
}
# Validate the attached image is image/jpg, image/png, etc
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :post_comments, dependent: :destroy
  has_many :save_posts, dependent: :destroy
  belongs_to :teacher
  belongs_to :group
end
