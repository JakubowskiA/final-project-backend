class Entry < ApplicationRecord
  belongs_to :user

  def self.created_on(date)
    where(["created_at >= ? AND created_at < ?", date, date + 1])
  end
end
