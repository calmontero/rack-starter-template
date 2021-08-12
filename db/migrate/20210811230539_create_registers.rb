class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.integer :program_id
      t.integer :fan_id
      t.date :register_date
    end
  end
end
