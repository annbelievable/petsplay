class CreateMatch < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :owner_id, index: true
      t.integer :borrower_id, index: true
    end

    add_foreign_key :owner_id, :users
    add_foreign_key :borrower_id, :users
  end
end
