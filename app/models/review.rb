class Review < ApplicationRecord
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image, styles: {
  thumb: '100x100>',
  square: '200x200#',
  medium: '300x300>'
}
# Validate the attached image is image/jpg, image/png, etc
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many_attached :pictures
  has_many :review_comments, dependent: :destroy
  belongs_to :teacher
end
