class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.references :user, foreign_key: true, null: false
      t.references :before_account, foreign_key: { to_table: :accounts }
      t.references :after_account, foreign_key: { to_table: :accounts }
      t.decimal :amount
      t.datetime :schedule
      t.boolean :repetition, default: false
      t.string :repetition_type  # 繰り返しの種類を保持するカラム
      t.jsonb :repetition_settings  # 繰り返しの設定を JSONB データ型で保持するカラム
      t.text :body
      t.timestamps
    end
  end
end
