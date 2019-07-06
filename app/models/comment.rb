class Comment < ApplicationRecord
  belongs_to :pic
  belongs_to :user
end
