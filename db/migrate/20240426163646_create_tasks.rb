class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true  # 外部キーとしての 'user_id'（usersテーブルを参照）
      t.references :purpose, foreign_key: true # 外部キーとしての 'purpose_id'（purposesテーブルを参照）
      t.string :title
      t.datetime :schedule
      t.time :time
      t.boolean :repetition, default: false
      t.string :repetition_type  # 繰り返しの種類を保持するカラム
      t.jsonb :repetition_settings  # 繰り返しの設定を JSONB データ型で保持するカラム
      t.boolean :completed, default: false
      t.text :body
      t.timestamps
    end
  end
end
