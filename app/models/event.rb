# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :comment
    validates :category_id, numericality: { other_than: 1 }
    validates :event_datetime
    validates :meeting_time
    validates :place_id, numericality: { other_than: 1 }
    validates :bring
    validates :deadline_datetime
    validates :capacity, numericality: { in: 1..20 }
  end
end
