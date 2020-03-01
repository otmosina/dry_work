require 'pry'

namespace :app do
    desc 'Check stock price'
    task :check_price, %i[ticker price] do |_task_name, args|
      require_relative './system/boot'
      

      ticker = args[:ticker]
      price = BigDecimal(args[:price])

      #почему-то это дерьмо не работает
      #Notifier.monitor('notifier.main') do |event|
      #  payload = event.payload
      #  Notifier.logger.info "Price checked with args: #{payload[:args]} in #{payload[:time]}ms"
      #end
      loop do 
        Notifier['notifier.main'].call(ticker, price)
        sleep 1
      end
    end

    task :migrate_all do
      require_relative './system/boot'

      CreatePageviewsTable.migrate(:up)
      CreateVisitsTable.migrate(:up)
    end

    task :rollback_all do
      require_relative './system/boot'
      CreateVisitsTable.migrate(:down)
      CreatePageviewsTable.migrate(:down)
      
    end

    desc 'Exec test task'
    task :shastic do
      require_relative './system/boot'
      Collector['collector.main'].call()
    end    
end
