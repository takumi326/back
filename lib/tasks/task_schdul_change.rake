namespace :task_schedule_change do
  desc "タスクの繰り返しが設定されているときのスケジュールの変更"
  task task_schedule_nextchange: :environment do
    Task.where(repetition: true, completed: false).find_each do |task|
      next unless task.schedule.present?

      # 現在の日時を取得
      current_time = Time.current

      # 予定日が現在の日時より前の場合は再計算して更新
      while task.schedule < current_time
        new_schedule = calculate_next_schedule(task)
        if new_schedule.present?
          task.update(schedule: new_schedule)
        else
          # 新しいスケジュールが計算できない場合はループを抜ける
          break
        end
      end
    end
  end
end
