class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { maximum: 25 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0, only_integer: true } 
  validates :male_employees, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :female_employees, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  
  
  # def male_employees=(male_employees)
  #   male_employees = Employee.where(gender: 'M').where(store_id: self.id).count
  # end

  # def male_employees
  #   Employee.where(gender: 'M').count
  # end

  # def female_employees
  #   Employee.where(gender: 'F').count
  # end

  def annual_expense
    expense = 0
    Employee.all.each do |e|
      expense += e.annual_salary
    end
    expense
  end

  # def annual_expense
  #   self.employees.inject(0) {|sum, emp| sum += emp.annual_salary }
  # end

  def annual_profit
    annual_revenue - annual_expense
  end

  #scope :male_employees, -> {Employee.where(gender: 'M').count}


end
