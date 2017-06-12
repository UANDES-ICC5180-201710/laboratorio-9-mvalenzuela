require 'rails_helper'

RSpec.describe "people_interests/index", type: :view do
  before(:each) do
    assign(:people_interests, [
      PeopleInterest.create!(
        :person => nil,
        :course => nil
      ),
      PeopleInterest.create!(
        :person => nil,
        :course => nil
      )
    ])
  end

  it "renders a list of people_interests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
