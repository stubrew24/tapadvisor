class User < ApplicationRecord
  has_many :reviews
  has_many :taprooms, through: :reviews
end
