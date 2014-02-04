class AddEventTypes < ActiveRecord::Migration
  def change
  	 rename_column :events, :event_type, :event_type1
  	 add_column :events, :event_type2, :string
  	 add_column :events, :event_type3, :string
  end
end
