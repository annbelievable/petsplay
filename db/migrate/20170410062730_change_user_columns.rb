class ChangeUserColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :available_datetimes
    add_column :pets, :available_days, :json, default: []
    add_column :pets, :available_times, :json, default: []
    create_table :favourites do |t|
      t.references :user, foreign_key: true, index: true
      t.references :pet, foreign_key: true, index: true
    end
  end
end
