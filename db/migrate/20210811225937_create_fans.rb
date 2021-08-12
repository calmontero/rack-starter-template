class CreateFans < ActiveRecord::Migration[5.2]
  def change
    create_table :fans do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
    end
  end
end
