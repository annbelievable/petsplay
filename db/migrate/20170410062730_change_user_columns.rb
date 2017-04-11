class ChangeUserColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :available_datetimes
    add_column :pets, :available_days, :json, default: []
    add_column :pets, :available_times, :json, default: []
    
  end
end
