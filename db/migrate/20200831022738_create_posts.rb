class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :user_post
      t.integer :user_id
      t.integer :likes
      t.integer :dislike

      t.timestamps
    end
  end
end
