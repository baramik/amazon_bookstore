require 'spec_helper'

describe "shipments/index" do
  before(:each) do
    assign(:shipments, [
      stub_model(Shipment),
      stub_model(Shipment)
    ])
  end

  it "renders a list of shipments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
