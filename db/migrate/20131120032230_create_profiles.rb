class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :id
      t.string :ratings

      t.timestamps
    end
  end
end
