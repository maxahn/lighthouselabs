class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :increase_employee_counter, if: :store #won't run if employee has no store
  after_destroy :decrease_employee_counter, if: :store
  

  def annual_salary
    hourly_rate * 1950
  end

  # def self.average_hourly_rate_for(gender)
  #   if gender
  #     Employee.where(gender: gender).average(:hourly_rate).round(2)
  #   else
  #     Employee.average(:hourly_rate).round(2)
  #   end
  # end

  def self.average_hourly_rate_for(gender)
    if gender
      employees = self.where(gender: gender)
    else
      employees = self
    end
    employees.average(:hourly_rate).round(2)
  end

  private

  def increase_employee_counter
    if self.gender == 'F'
      self.store.female_employees += 1
      self.store.save
    elsif self.gender == 'M'
      self.store.male_employees += 1
      self.store.save
    end
  end

  def decrease_employee_counter
    if self.gender == 'F'
      self.store.female_employees -= 1
      self.store.save
    elsif self.gender == 'M'
      self.store.male_employees -= 1
      self.store.save
    end
  end

end
