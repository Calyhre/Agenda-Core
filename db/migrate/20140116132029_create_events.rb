class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer   :user_id

      t.string    :name
      t.text      :description
      t.string    :place
      t.datetime  :start_at
      t.datetime  :end_at
      t.string    :event_type
      t.boolean   :recurrent

      t.datetime  :deleted_at
      t.timestamps
    end

    create_table :events_users do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end
end
