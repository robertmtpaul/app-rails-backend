class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.text :password_digest
      t.text :profile_pic
      t.boolean :admin

      t.timestamps
    end
  end
end
