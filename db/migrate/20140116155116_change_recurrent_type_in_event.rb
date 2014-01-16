class ChangeRecurrentTypeInEvent < ActiveRecord::Migration
  def self.up
    change_column :events, :recurrent, :string
  end

  def self.down
    change_column :events, :recurrent, :boolean
  end
end
