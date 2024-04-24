class CreatePurposes < ActiveRecord::Migration[7.0]
  def change
    create_table :purposes do |t|
      t.string :title      
      t.string :result     
      t.datetime :deadline 
      t.text :body         
      t.references :user, foreign_key: true  # 外部キーとしての 'user_id'（usersテーブルを参照）
  
      t.timestamps
    end
  end
end
