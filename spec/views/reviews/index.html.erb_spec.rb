require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :author => "MyText",
        :content => "MyText",
        :rating => 1,
        :user => nil
      ),
      stub_model(Review,
        :author => "MyText",
        :content => "MyText",
        :rating => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
