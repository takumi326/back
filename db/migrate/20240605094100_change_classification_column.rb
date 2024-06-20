class ChangeClassificationColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :classifications, :date, :string
    add_column :classification_monthlyamounts, :date, :string
  end
end
