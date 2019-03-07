class Taproom < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :favourites


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

  def img_url=(imgurl)
    if imgurl.empty?
      "no-image.jpg"
    else
      imgurl
    end
  end
end
