class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :taproom

  validates_uniqueness_of :user_id, scope: :taproom_id
end
