class AddPostIdToPostPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :post_photos, :post_id, :integer
  end
end
