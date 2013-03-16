class AddPointsToLink < ActiveRecord::Migration
  def change
    add_column :links, :points, :integer, default: 0, null: false
  end
end
