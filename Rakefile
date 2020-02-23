namespace :app do
    desc 'Check stock price'
    task :check_price, %i[ticker price] do |_task_name, args|
      require_relative './system/boot'

      ticker = args[:ticker]
      price = BigDecimal(args[:price])

      Notifier['notifier.main'].call(ticker, price)
    end
end