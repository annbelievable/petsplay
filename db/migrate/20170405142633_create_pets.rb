class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :types
      t.text :description
      t.integer :age
      t.string :gender
      t.text :breed
      t.timestamps :available_datetimes
      t.json  :photos, default: []
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
