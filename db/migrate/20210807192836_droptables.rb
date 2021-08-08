class Droptables < ActiveRecord::Migration[5.2]
  def change
    drop_table :registers
    drop_table :fans
    drop_table :programs
  end
end
