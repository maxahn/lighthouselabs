class Booking < ActiveRecord::Base

  belongs_to :suite
  validates :full_name, presence: true, length: { maximum: 50 }
  validates :guests, numericality: { greater_than: 0, less_than: 5, only_integer: true }

  after_create :increase_revenue, if: :suite #won't run if employee has no store
  after_destroy :decrease_revenue, if: :suite
  


  def nights
    (self.checkout - self.checkin).to_i
  end

  def market_cost
    self.nights * self.suite.rate
  end

  def final_cost
    self.nights * (self.suite.rate - self.discount_per_night)
  end

  private

  def increase_revenue
    self.suite.revenue += self.final_cost
    self.suite.save
  end

  def decrease_revenue
    self.suite.revenue -= self.final_cost
    self.suite.save
  end

end
