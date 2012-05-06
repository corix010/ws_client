class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :vehicle_number
      t.string :location
      t.string :status
      t.string :driver

      t.timestamps
    end
  end
end
