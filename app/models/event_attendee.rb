class EventAttendee < ApplicationRecord
  validates :user_id, presence: true
  validates :event_id, presence: true

  def self.registered(event_id, user_id)
    where(event_id: event_id, user_id: user_id)
  end
end
