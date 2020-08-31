class CreatePostPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :post_photos do |t|
      t.text :photo
      t.integer :user_id
      t.timestamps
    end
  end
end
