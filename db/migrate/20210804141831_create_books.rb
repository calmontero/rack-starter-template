class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.integer :pages
      t.integer :rating
      t.boolean :read
      t.belongs_to :author, foreign_key: true
    end
  end
end
