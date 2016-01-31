def stock_picker prices

  # this array changes every time a better match is found 
  best_prices = [0,0]
  best_days = [0,0]
  prices.map.with_index do |price, index|
    # it's used to iterate through the remanescent days 
    days_passed = 1
    
    buy_day = index + 1
    # iterate through the remanescent days lookin for a best buy//sell match
    (prices.length - 1 - index).times do
      sell_day = buy_day + days_passed

      if ( (prices[sell_day - 1] - price) >  (best_prices[1] - best_prices[0]) )
        best_prices[0] = price
        best_prices[1] = prices[sell_day - 1]
        best_days[0] = buy_day
        best_days[1] = sell_day
      end
      days_passed += 1
    end
  
  end

  puts "Buying Day: " + best_days[0].to_s 
  puts "Selling Day: " + best_days[1].to_s
  puts "Buying Price: " + best_prices[0].to_s 
  puts "Selling Price: " + best_prices[1].to_s 

end