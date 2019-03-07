class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :taproom_id
      t.string :img_url

      t.timestamps
    end
  end
end
