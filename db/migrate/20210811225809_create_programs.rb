class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :desc
      t.string :sponsor
      t.integer :quantity_fan
      t.integer :sits_available
      t.integer :room
      t.date :date
      t.time :startTime
      t.time :endTime
      t.string :image_url
      t.boolean :status
    end
  end
end
