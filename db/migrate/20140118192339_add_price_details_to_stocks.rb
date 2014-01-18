class AddPriceDetailsToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :last_trade_date, :date
    add_column :stocks, :previous_last_trade_date, :date
    add_column :stocks, :fiftyday_moving_average, :decimal
    add_column :stocks, :two_hundredday_moving_average, :decimal
    add_column :stocks, :change_from_fiftyday_moving_average, :decimal
    add_column :stocks, :previous_change_from_fiftyday_moving_average, :decimal
    add_column :stocks, :change_from_two_hundredday_moving_average, :decimal
    add_column :stocks, :previous_change_from_two_hundredday_moving_average, :decimal
    add_column :stocks, :fiftyday_moving_average_inversion, :boolean
    add_column :stocks, :two_hundredday_moving_average_inversion, :boolean
  end
end
