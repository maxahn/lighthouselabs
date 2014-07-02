class Suite < ActiveRecord::Base

  has_many :bookings, dependent: :destroy
  validates :number, presence: true, uniqueness: true, length: { maximum: 4 }
  validates :rate, numericality: { greater_than: 0, only_integer: true }
  validates :capacity, numericality: { greater_than: 0, only_integer: true }

  before_destroy :check_bookings

  def available?(date)
    self.bookings.each do |booking|
      if date >= booking.checkin && date <= booking.checkout
        return false
      end
    end
    return true
  end

  

# The following doesn't work quite right, suspect bookings cannot be saved into database.

  # def check_bookings
  #   self.bookings.each do |booking|
  #     if booking
  #       return false
  #     end
  #   end
  #   return true
  # end
  def check_bookings
    puts "is it running?"
    if self.bookings.any?
      puts "there are bookings"
      self.errors[:base] << "This suite has an active booking and thus can't be deleted"
      return false
    else
      "it didn't run"
      return true
    end
  end

end
