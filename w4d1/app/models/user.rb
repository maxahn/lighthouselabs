class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 140 }, uniqueness: true
  validates :password, presence: true, length: { maximum: 40 }
  has_many :tracks
  has_many :votes
end