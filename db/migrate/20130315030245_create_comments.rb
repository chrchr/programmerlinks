class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :link_id, null: false
      t.text :comment, null: false
      t.string :username, null: false
      t.timestamps

      # There are a lot of caveats in SQLite's
      # foreign key support so I'm not going to
      # attempt that right now
     end
  end
end
