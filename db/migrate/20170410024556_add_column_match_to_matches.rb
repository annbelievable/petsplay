class AddColumnMatchToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :match, :boolean
  end
end
