require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :author => "MyText",
      :content => "MyText",
      :rating => 1,
      :user => nil
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "textarea#review_author[name=?]", "review[author]"
      assert_select "textarea#review_content[name=?]", "review[content]"
      assert_select "input#review_rating[name=?]", "review[rating]"
      assert_select "input#review_user[name=?]", "review[user]"
    end
  end
end
