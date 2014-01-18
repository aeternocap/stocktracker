json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :symbol, :sector, :price, :market_cap, :stock_exchange
  json.url stock_url(stock, format: :json)
end
