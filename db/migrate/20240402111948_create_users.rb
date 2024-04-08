class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :mail_address

      t.timestamps
    end
  end
end
