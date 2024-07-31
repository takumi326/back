namespace :account_money do
    desc "毎日accountテーブルのお金を適切に変更する"
    task :change => :environment do
    # task :change => :production do
      today = Date.today
      puts "Task started at #{Time.now}"
  
      # paymentの処理
      Classification.joins(:classification_monthlyamounts).where(classification_type: 'payment').each do |classification|
        classification.classification_monthlyamounts.each do |cma|
          puts "cma.date value: #{cma.date.inspect}"
  
          # cma.monthが "20245" のように年月が連結された文字列であると仮定する
          year = cma.month[0, 4].to_i
          month = cma.month[4, 2].to_i
          day = cma.date.to_i
  
          begin
            # 年月の情報を使ってDateオブジェクトを作成し、1ヶ月進めて日付を取得する
            date = Date.new(year, month, 1).next_month.change(day: day)
  
            # 今日の日付と比較するために今日の日付を取得する
            today = Date.today
  
            if date.year == today.year && date.month == today.month && date.day == today.day
              account = Account.find_by(id: classification.account_id)
              next unless account
  
              new_amount = [account.amount - cma.amount, 0].max
              account.update(amount: new_amount)
              puts "Payment processed for account #{account.id}: -#{cma.amount}"
            end
          rescue ArgumentError => e
            puts "Error: Invalid date format - #{e.message}"
            # 例外処理を追加する場合の具体的な対応
          end
        end
      end

      # incomeの処理
      Classification.joins(:incomes).where(classification_type: 'income').each do |classification|
        classification.incomes.each do |income|
          if income.repetition == false
            if income.schedule == today
              account = Account.find_by(id: classification.account_id)
              next unless account
              account.update(amount: account.amount + income.amount)
              puts "Income processed for account #{account.id}: +#{income.amount}"
            end
          else
            income.repetition_moneies.each do |rep_money|
              if rep_money.repetition_schedule == today
                account = Account.find_by(id: classification.account_id)
                next unless account
                account.update(amount: account.amount + rep_money.amount)
                puts "Repetitive Income processed for account #{account.id}: +#{rep_money.amount}"
              end
            end
          end
        end
      end
  
      # transferの処理（before_account_id）
      Transfer.where(repetition: false, schedule: today).each do |transfer|
        account = Account.find_by(id: transfer.before_account_id)
        next unless account
        new_amount = [account.amount - transfer.amount, 0].max
        account.update(amount: new_amount)
        puts "Transfer processed (before) for account #{account.id}: -#{transfer.amount}"
      end
  
      Transfer.where(repetition: true).each do |transfer|
        transfer.repetition_moneies.where(repetition_schedule: today).each do |rep_money|
          account = Account.find_by(id: transfer.before_account_id)
          next unless account
          new_amount = [account.amount - rep_money.amount, 0].max
          account.update(amount: new_amount)
          puts "Repetitive Transfer processed (before) for account #{account.id}: -#{rep_money.amount}"
        end
      end
  
      # transferの処理（after_account_id）
      Transfer.where(repetition: false, schedule: today).each do |transfer|
        account = Account.find_by(id: transfer.after_account_id)
        next unless account
        account.update(amount: account.amount + transfer.amount)
        puts "Transfer processed (after) for account #{account.id}: +#{transfer.amount}"
      end
  
      Transfer.where(repetition: true).each do |transfer|
        transfer.repetition_moneies.where(repetition_schedule: today).each do |rep_money|
          account = Account.find_by(id: transfer.after_account_id)
          next unless account
          account.update(amount: account.amount + rep_money.amount)
          puts "Repetitive Transfer processed (after) for account #{account.id}: +#{rep_money.amount}"
        end
      end
    end
  end