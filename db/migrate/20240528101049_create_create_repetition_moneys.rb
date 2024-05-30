class CreateCreateRepetitionMoneys < ActiveRecord::Migration[7.0]
  def change
    create_table :repetition_moneys do |t|
      t.references :payment, foreign_key: true
      t.references :income, foreign_key: true
      t.references :transfer, foreign_key: true
      t.string :transaction_type, null: false
      t.decimal :amount
      t.date :repetition_schedule
      t.timestamps
    end
  end
end
