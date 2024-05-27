class ChangeColumnDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :payments, :end_date, :date
    change_column :payments, :schedule, :date

    change_column :incomes, :end_date, :date
    change_column :incomes, :schedule, :date

    change_column :transfers, :end_date, :date
    change_column :transfers, :schedule, :date

    change_column :tasks, :end_date, :date
    change_column :tasks, :schedule, :date

    change_column :purposes, :deadline, :date
  end
end
