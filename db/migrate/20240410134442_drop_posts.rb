class DropPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :posts
    drop_table :users
  end
end
