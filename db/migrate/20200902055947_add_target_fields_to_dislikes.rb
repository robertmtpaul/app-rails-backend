class AddTargetFieldsToDislikes < ActiveRecord::Migration[5.2]
  def change
    add_column :dislikes, :target_id, :integer
    add_column :dislikes, :target_type, :integer
  end
end
