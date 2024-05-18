class ChangeTransfers < ActiveRecord::Migration[7.0]
  def change
    add_column :transfers, :transfer_type, :string
  end
end
