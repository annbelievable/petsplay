class CreateMatch < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :owner_id, index: true
      t.integer :borrower_id, index: true
    end

  end
end
