class AddUniqueConstraintToClassificationMonthlyAmounts < ActiveRecord::Migration[7.0]
  def change
    add_index :classification_monthlyamounts, [:month, :classification_id], unique: true, name: 'index_month_classification_id'
  end
end
