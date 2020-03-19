# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_voter
  has_many :pics, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :name, presence: true
  has_attached_file :image,
                    path: ':attachment/user/:id/:style.:extension',
                    styles: { medium: '300x300>', thumb: '200x200>' },
                    default_url: '/system/pics/images/no_image_300.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
  before_destroy :validate_testuser

  protected

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(name: auth.info.name,
                         email: User.dumy_email(auth),
                         provider: auth.provider,
                         uid: auth.uid,
                         password: Devise.friendly_token[0, 20])
    user
  end

  private

  def self.dumy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com" # POINT
  end

  def validate_testuser
    throw(:abort) if email == 'test@bestmen.com'
  end
end
