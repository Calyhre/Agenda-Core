class User < ActiveRecord::Base
  has_secure_password
  has_many :events

  validates_presence_of :password, on: :create
  validates :last_name, :first_name, :email, presence: true
  validates :email, uniqueness: true, case_sensitive: false
end
