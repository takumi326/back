class AddColumnCompletedRepetitionTask < ActiveRecord::Migration[7.0]
  def change
    add_column :completed_repetition_tasks, :completed, :boolean, default: false 
  end
end
