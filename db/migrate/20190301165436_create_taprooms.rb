class CreateTaprooms < ActiveRecord::Migration[5.2]
  def change
    create_table :taprooms do |t|
      t.string :brewery
      t.string :location
      t.string :opening_times
      t.text :bio

      t.timestamps
    end
  end
end
