class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_at, :end_at, :event_type
  has_one :user
  has_many :members
end
