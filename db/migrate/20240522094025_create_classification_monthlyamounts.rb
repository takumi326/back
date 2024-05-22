class CreateClassificationMonthlyamounts < ActiveRecord::Migration[7.0]
  def change
    create_table :classification_monthlyamounts do |t|
      t.references :classification, foreign_key: true 
      t.string :month
      t.decimal :amount

      t.timestamps
    end
  end
end
