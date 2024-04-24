class AddPurposeCompletedColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :purposes, :completed, :boolean, default: false
  end
end
