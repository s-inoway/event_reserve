class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :place

  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :title
    validates :image
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
