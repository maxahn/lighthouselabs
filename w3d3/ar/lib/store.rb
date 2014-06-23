class Store < ActiveRecord::Base
  def has_male_or_female
    if (mens_apparel == false && womens_apparel == false)
      errors[:base] << "can't do it"
    end
  end

  has_many :employees


  validates :name, presence: true, length: { minimum: 3}
  validates :annual_revenue, presence: true, numericality: true
  validate :has_male_or_female


end
