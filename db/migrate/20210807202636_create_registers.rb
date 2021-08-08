class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.integer :program_id
      t.integer :fan_id
    end
  end
end
