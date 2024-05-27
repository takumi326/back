class CreateCompletedRepetitionTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_repetition_tasks do |t|
      t.references :task, foreign_key: true 
      t.date :completed_date
      t.time :time
      t.timestamps
    end
  end
end
