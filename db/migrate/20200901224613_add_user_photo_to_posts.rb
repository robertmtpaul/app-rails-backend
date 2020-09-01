class AddUserPhotoToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_photo, :text
  end
end
