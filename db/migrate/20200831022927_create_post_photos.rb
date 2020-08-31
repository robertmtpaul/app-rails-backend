class CreatePostPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :post_photos do |t|
      t.text :photo

      t.timestamps
    end
  end
end
