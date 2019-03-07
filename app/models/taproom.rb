class Taproom < ApplicationRecord
  before_save :img_set

  has_many :reviews
  has_many :users, through: :reviews
  has_many :favourites
  has_many :posts
  has_one :user


  def favourited?(user)
    Favourite.find_by(user_id: user, taproom_id: self.id)
  end


  def stars
    if self.reviews.any?
      total = self.reviews.sum {|rev| rev.rating}
      average = total / self.reviews.count
      "#{9733.chr(Encoding::UTF_8)}" * average + "#{9734.chr(Encoding::UTF_8)}" * (5 - average)
    else
      "#{9734.chr(Encoding::UTF_8)}" * 5
    end
  end

  def img_set
    self.img_url = "no-image.jpg" if self.img_url.empty?
  end

  def self.recents
    self.last(4).reverse
  end
end
