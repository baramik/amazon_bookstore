require 'spec_helper'

describe "raitings/edit" do
  before(:each) do
    @raiting = assign(:raiting, stub_model(Raiting))
  end

  it "renders the edit raiting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", raiting_path(@raiting), "post" do
    end
  end
end
