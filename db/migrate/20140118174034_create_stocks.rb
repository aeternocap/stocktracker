class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.string :sector
      t.decimal :price
      t.string :market_cap
      t.string :stock_exchange

      t.timestamps
    end
  end
end
