require 'spec_helper'

describe "shipments/new" do
  before(:each) do
    assign(:shipment, stub_model(Shipment).as_new_record)
  end

  it "renders new shipment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shipments_path, "post" do
    end
  end
end
