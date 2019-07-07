class Comment < ApplicationRecord
  belongs_to :pic
  belongs_to :user
  validates :content, presence: true
end
