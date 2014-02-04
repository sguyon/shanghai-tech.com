class CreateEventsEventTypesJoinTable < ActiveRecord::Migration
  def change
    create_table :event_types_events, :id => false do |t|
      t.integer :event_type_id
      t.integer :event_id
    end
  end
end
