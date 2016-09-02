class AlterColumnScore < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :score, :integer, default: 0
  end
end
