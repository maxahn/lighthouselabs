class Review < ActiveRecord::Base
  validates :review, presence: true
  validates_uniqueness_of :user_id, :scope => :track_id
  belongs_to :track
  belongs_to :user
end