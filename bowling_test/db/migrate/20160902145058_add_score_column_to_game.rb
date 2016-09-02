class AddScoreColumnToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :score, :integer
  end
end
