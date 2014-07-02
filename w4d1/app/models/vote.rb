class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => :track_id
  validates :user_id, presence: true
  validates :track_id, presence: true
  belongs_to :track
  belongs_to :user
end