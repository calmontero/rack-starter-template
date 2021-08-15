class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :history
      t.integer :founded
      t.string :country
      t.string :image_url
      t.string :wikipedia_url
    end
  end
end
