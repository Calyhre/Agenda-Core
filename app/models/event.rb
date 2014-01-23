class Event < ActiveRecord::Base
  EVENT_TYPES = ['meeting', 'task', 'appointment', 'day', 'period']
  RECURRENT_TYPES = [nil, 'weekly', 'monthly', 'yearly']

  belongs_to :user
  has_and_belongs_to_many   :members, class_name: User

  default_scope { where('deleted_at IS NULL') }

  validates :name, :start_at, :end_at, :event_type, presence: true
  validates :event_type, inclusion: { in: EVENT_TYPES }
  validates :recurrent, inclusion: { in: RECURRENT_TYPES }
end
