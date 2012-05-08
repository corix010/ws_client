class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.integer :vehicle_id
      t.string :location
      t.string :status
      t.string :driver

      t.timestamps
    end
  end
end
