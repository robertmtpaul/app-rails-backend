class AddTargetFieldsToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :target_id, :integer
    add_column :likes, :target_type, :integer
  end
end
