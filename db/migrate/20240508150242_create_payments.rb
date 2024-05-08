class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true  # 外部キーとしての 'user_id'（usersテーブルを参照）
      t.references :classification, foreign_key: true # 外部キーとしての 'classification_id'（classificationsテーブルを参照）
      t.references :category, foreign_key: true # 外部キーとしての 'category_id'（categoriesテーブルを参照）
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
