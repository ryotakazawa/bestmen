class Pic < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :title, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/system/pics/images/no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
