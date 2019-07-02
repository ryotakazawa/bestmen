class Pic < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/system/pics/images/no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
