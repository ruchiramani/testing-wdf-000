class RemoveColumnPinsFromGame < ActiveRecord::Migration[5.0]
  def change
  	remove_column :games, :pins
  end
end
