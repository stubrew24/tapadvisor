class AddPublishedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :published, :boolean
  end
end
