class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string :carriage_type
      t.integer :up_seats
      t.integer :down_seats
      t.timestamps
    end
  end
end
