class AddColumnImgUrlToTaprooms < ActiveRecord::Migration[5.2]
  def change
    add_column :taprooms, :img_url, :string
  end
end
