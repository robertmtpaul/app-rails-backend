class CreatePostsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_users do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :vote_post

      t.timestamps
    end
  end
end
