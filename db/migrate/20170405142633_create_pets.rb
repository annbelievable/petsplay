class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :age
      t.string :gender
      t.text :breed
      t.date :available_dates
      t.time :available_time

      t.timestamps
    end
  end
end
