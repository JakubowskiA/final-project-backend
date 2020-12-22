class Appointment < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :date, presence: true

  def self.date(date)
    where(["date >= ? AND date < ?", date, date + 1])
  end
end
