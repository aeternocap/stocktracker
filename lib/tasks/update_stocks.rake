namespace :stocks do
  desc 'Update stock details'
  task :populate_details => :environment do

    @stocks = Stock.all

    @stocks.each do |stock|
      quote = StockQuote::Stock.quote(stock.symbol)
      stock.name = quote.name if stock.name.empty?
      stock.market_cap = quote.market_capitalization if stock.market_cap.empty?
      stock.stock_exchange = quote.stock_exchange if stock.stock_exchange.empty?

      stock.save
    end
    puts "Updated stock details"
  end

  desc 'Update stock price'
  task :update_price => :environment do

    @stocks = Stock.all

    @stocks.each do |stock|
      quote = StockQuote::Stock.quote(stock.symbol)

      formatted_last_trade_date = Date.strptime(quote.last_trade_date.to_s, '%m/%d/%Y')

      if (stock.last_trade_date and formatted_last_trade_date > stock.last_trade_date) or stock.last_trade_date.blank?
        stock.price = quote.last_trade_price_only

        stock.previous_last_trade_date = stock.last_trade_date
        stock.last_trade_date = formatted_last_trade_date

        stock.fiftyday_moving_average = quote.fiftyday_moving_average
        stock.two_hundredday_moving_average = quote.two_hundredday_moving_average

        stock.previous_change_from_fiftyday_moving_average = stock.change_from_fiftyday_moving_average
        stock.change_from_fiftyday_moving_average = quote.change_from_fiftyday_moving_average

        stock.previous_change_from_two_hundredday_moving_average = stock.change_from_two_hundredday_moving_average
        stock.change_from_two_hundredday_moving_average = quote.change_from_two_hundredday_moving_average

        if !stock.change_from_fiftyday_moving_average.blank? and !stock.previous_change_from_fiftyday_moving_average.blank?
          # what to do if one of these equals zero?
          if stock.change_from_fiftyday_moving_average > 0 and stock.previous_change_from_fiftyday_moving_average > 0
            stock.fiftyday_moving_average_inversion = false
          elsif stock.change_from_fiftyday_moving_average < 0 and stock.previous_change_from_fiftyday_moving_average < 0
            stock.fiftyday_moving_average_inversion = false
          else
            stock.fiftyday_moving_average_inversion = true
          end
        end

        if !stock.change_from_two_hundredday_moving_average.blank? and !stock.previous_change_from_two_hundredday_moving_average.blank?
          # what to do if one of these equals zero?
          if stock.change_from_two_hundredday_moving_average > 0 and stock.previous_change_from_two_hundredday_moving_average > 0
            stock.two_hundredday_moving_average_inversion = false
          elsif stock.change_from_two_hundredday_moving_average < 0 and stock.previous_change_from_two_hundredday_moving_average < 0
            stock.two_hundredday_moving_average_inversion = false
          else
            stock.two_hundredday_moving_average_inversion = true
          end
        end

        stock.save
      end
    end
    puts "Updated stock prices"
  end
end
