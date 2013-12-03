class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :contact
      t.integer :area
      t.float :start_time
      t.float :end_time
      t.float :length
      t.string :comments
      t.float :rating

      t.timestamps
    end
  end
end
