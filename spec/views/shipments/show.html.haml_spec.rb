require 'spec_helper'

describe "shipments/show" do
  before(:each) do
    @shipment = assign(:shipment, stub_model(Shipment))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
