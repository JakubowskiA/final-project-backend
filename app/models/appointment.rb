class Appointment < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :date, presence: true

  def self.date(date)
    # byebug
    where(["date >= ? AND date < ?", date, date + 1])
  end
end
