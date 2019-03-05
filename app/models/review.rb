class Review < ApplicationRecord
  belongs_to :user
  belongs_to :taproom

  validates :comment, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :visit_date, presence: true

  def brewery
    Taproom.find(self.taproom_id).brewery
  end

  def stars
    "#{9733.chr(Encoding::UTF_8)}" * self.rating + "#{9734.chr(Encoding::UTF_8)}" * (5 - self.rating)
  end
end
