class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  validates :year, :inclusion => 1980..Time.now.year
end
