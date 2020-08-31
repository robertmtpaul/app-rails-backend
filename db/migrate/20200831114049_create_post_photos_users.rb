class CreatePostPhotosUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :post_photos_users do |t|
      t.integer :user_id
      t.integer :post_photo_id
      t.integer :vote_photos

      t.timestamps
    end
  end
end
