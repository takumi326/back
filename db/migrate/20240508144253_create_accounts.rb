class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true  # 外部キーとしての 'user_id'（usersテーブルを参照）
      t.string :name
      t.decimal :amount
      t.text :body
      t.timestamps
    end
  end
end
