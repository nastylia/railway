class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :passport_info
      t.string :name
      t.timestamps
    end
  end
end
