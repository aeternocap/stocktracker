require 'spec_helper'

describe "stocks/show" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :name => "Name",
      :symbol => "Symbol",
      :sector => "Sector",
      :price => "9.99",
      :market_cap => "Market Cap",
      :stock_exchange => "Stock Exchange"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Symbol/)
    expect(rendered).to match(/Sector/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Market Cap/)
    expect(rendered).to match(/Stock Exchange/)
  end
end
