# frozen_string_literal: true

class Pic < ApplicationRecord
  acts_as_votable
  acts_as_taggable

  belongs_to :user
  has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true
  validates :tag_list, presence: true

  has_attached_file :image,
                      :path => ":attachment/pic/:id/:style.:extension",
                      styles: { medium: '300x300>', thumb: '200x200>' },
                      default_url: '/system/pics/images/no_image_300.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
