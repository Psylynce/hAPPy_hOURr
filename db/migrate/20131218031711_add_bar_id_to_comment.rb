class AddBarIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :bar_id, :integer
  end
end
