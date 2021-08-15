class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :creation
      t.string :history
      t.string :real_name
      t.string :alignment
      t.string :image_url
      t.string :wikipedia_url
    end
  end
end
