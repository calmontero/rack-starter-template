class AddPublisherToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :publisher, foreign_key: true
  end
end
