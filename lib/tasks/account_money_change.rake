namespace :account_money do
    desc "毎日accountテーブルのお金を適切に変更する"
    task change: :environment do
      today = Date.today
  
      # paymentの処理
      Classification.joins(:classification_monthly_amounts).where(classification_type: 'payment').each do |classification|
        classification.classification_monthly_amounts.each do |cma|
          date = (cma.month.next_month).change(day: cma.date.day)
          if date == today
            account = Account.find_by(id: classification.account_id)
            next unless account
            account.update(amount: account.amount - cma.amount)
            puts "Payment processed for account #{account.id}: -#{cma.amount}"
          end
        end
      end
  
      # incomeの処理
      Classification.joins(:income).where(classification_type: 'income').each do |classification|
        classification.incomes.each do |income|
          if income.repetition == false
            if income.schedule == today
              account = Account.find_by(id: classification.account_id)
              next unless account
              account.update(amount: account.amount + income.amount)
              puts "Income processed for account #{account.id}: +#{income.amount}"
            end
          else
            income.repetition_money.each do |rep_money|
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
      Transfer.where(repetition: false).where(schedule: today).each do |transfer|
        account = Account.find_by(id: transfer.before_account_id)
        next unless account
        account.update(amount: account.amount - transfer.amount)
        puts "Transfer processed (before) for account #{account.id}: -#{transfer.amount}"
      end
  
      Transfer.where(repetition: true).each do |transfer|
        transfer.repetition_money.where(repetition_schedule: today).each do |rep_money|
          account = Account.find_by(id: transfer.before_account_id)
          next unless account
          account.update(amount: account.amount - rep_money.amount)
          puts "Repetitive Transfer processed (before) for account #{account.id}: -#{rep_money.amount}"
        end
      end
  
      # transferの処理（after_account_id）
      Transfer.where(repetition: false).where(schedule: today).each do |transfer|
        account = Account.find_by(id: transfer.after_account_id)
        next unless account
        account.update(amount: account.amount + transfer.amount)
        puts "Transfer processed (after) for account #{account.id}: +#{transfer.amount}"
      end
  
      Transfer.where(repetition: true).each do |transfer|
        transfer.repetition_money.where(repetition_schedule: today).each do |rep_money|
          account = Account.find_by(id: transfer.after_account_id)
          next unless account
          account.update(amount: account.amount + rep_money.amount)
          puts "Repetitive Transfer processed (after) for account #{account.id}: +#{rep_money.amount}"
        end
      end
  
      puts "Account amounts updated successfully."
    end
  end