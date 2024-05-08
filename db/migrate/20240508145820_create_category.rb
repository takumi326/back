class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :user, foreign_key: true  # 外部キーとしての 'user_id'（usersテーブルを参照）
      t.string :name
      t.timestamps
    end
  end
end
