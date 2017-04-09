class AddForeignKeyToMatches < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :matches, :users, column: :owner_id, primary_key: "id"
    add_foreign_key :matches, :users, column: :borrower_id, primary_key: "id"
  end
end
