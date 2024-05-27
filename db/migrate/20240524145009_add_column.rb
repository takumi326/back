class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :end_date, :datetime
    add_column :payments, :end_date, :datetime
    add_column :incomes, :end_date, :datetime
    add_column :transfers, :end_date, :datetime
  end
end
