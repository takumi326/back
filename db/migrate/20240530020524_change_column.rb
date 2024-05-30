class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :classifications, :amount, :decimal
    add_column :classifications, :date, :string
  end
end
