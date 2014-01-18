require 'spec_helper'

describe "stocks/edit" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :name => "MyString",
      :symbol => "MyString",
      :sector => "MyString",
      :price => "9.99",
      :market_cap => "MyString",
      :stock_exchange => "MyString"
    ))
  end

  it "renders the edit stock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do
      assert_select "input#stock_name[name=?]", "stock[name]"
      assert_select "input#stock_symbol[name=?]", "stock[symbol]"
      assert_select "input#stock_sector[name=?]", "stock[sector]"
      assert_select "input#stock_price[name=?]", "stock[price]"
      assert_select "input#stock_market_cap[name=?]", "stock[market_cap]"
      assert_select "input#stock_stock_exchange[name=?]", "stock[stock_exchange]"
    end
  end
end
