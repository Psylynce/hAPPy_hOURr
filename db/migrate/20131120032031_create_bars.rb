class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.integer :id
      t.string :name
      t.string :contact
      t.integer :area
      t.string :comments

      t.timestamps
    end
  end
end
