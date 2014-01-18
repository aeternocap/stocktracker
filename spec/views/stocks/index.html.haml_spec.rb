require 'spec_helper'

describe "stocks/index" do
  before(:each) do
    assign(:stocks, [
      stub_model(Stock,
        :name => "Name",
        :symbol => "Symbol",
        :sector => "Sector",
        :price => "9.99",
        :market_cap => "Market Cap",
        :stock_exchange => "Stock Exchange"
      ),
      stub_model(Stock,
        :name => "Name",
        :symbol => "Symbol",
        :sector => "Sector",
        :price => "9.99",
        :market_cap => "Market Cap",
        :stock_exchange => "Stock Exchange"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => "Sector".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Market Cap".to_s, :count => 2
    assert_select "tr>td", :text => "Stock Exchange".to_s, :count => 2
  end
end
