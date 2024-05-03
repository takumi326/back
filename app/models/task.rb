class Task < ApplicationRecord
    belongs_to :purpose, optional: true

    def calculate_next_schedule(task)
        return nil unless task.repetition # 繰り返し設定がオフの場合はnilを返す
    
        date = task.schedule
        current_date = date.to_time.to_i # 予定の日時をUNIX時間で取得
        current_day_of_week = date.wday # 予定の曜日を取得（0: 日曜日, 1: 月曜日, ..., 6: 土曜日）
        next_schedule = current_date # 次の予定日の初期値を現在の日時とする
    
        case task.repetition_type
        when "daily"
          next_schedule += task.repetition_settings[0] * 24 * 60 * 60 # 日単位で1日後に設定
    
        when "weekly"
          target_days_of_week = task.repetition_settings[1..].map { |day| map_day_of_week_to_int(day) }.compact
          days_until_next_schedule = 1
    
          # 現在の曜日が次の予定日の曜日リストに含まれていない場合、次の予定日を計算
          (1..7).each do |i|
            next_day_of_week = (current_day_of_week + i) % 7 # 翌日の曜日を計算
            if target_days_of_week.include?(next_day_of_week)
              days_until_next_schedule = i
              break
            end
          end
    
          # 現在の曜日と次の予定日の曜日が同じ場合、次の予定日を1日進めてから計算
          if days_until_next_schedule == 0
            date += 1.day
            days_until_next_schedule = 7
          end
    
          next_schedule += days_until_next_schedule * 24 * 60 * 60
    
        when "monthly"
          next_schedule = date.beginning_of_month + task.repetition_settings[0].months # 指定された月数後の月初めに設定
        end
    
        # 次の予定日をTimeオブジェクトに変換して返す
        Time.at(next_schedule)
      end
    
      private
    
      def map_day_of_week_to_int(day_of_week)
        case day_of_week
        when "月"
          return 1
        when "火"
          return 2
        when "水"
          return 3
        when "木"
          return 4
        when "金"
          return 5
        when "土"
          return 6
        when "日"
          return 0
        else
          return nil # 不正な曜日名の場合はnilを返す
        end
    end
end
