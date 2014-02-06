require 'spec_helper'

describe "raitings/new" do
  before(:each) do
    assign(:raiting, stub_model(Raiting).as_new_record)
  end

  it "renders new raiting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", raitings_path, "post" do
    end
  end
end
