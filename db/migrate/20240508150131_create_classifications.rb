class CreateClassifications < ActiveRecord::Migration[7.0]
  def change
    create_table :classifications do |t|
      t.references :account, foreign_key: true  # 外部キーとしての 'account_id'（accountsテーブルを参照）
      t.string :name
      t.decimal :amount
      t.timestamps
    end
  end
end

