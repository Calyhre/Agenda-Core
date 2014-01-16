class Event < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many   :members, class_name: User

  default_scope { where('deleted_at IS NULL') }

  validates :name, :description, :start_at, :end_at, :event_type, presence: true
end
