class AddTimestampsToMatch < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :matches
  end
end
