require 'rails_helper'

RSpec.describe "people_interests/show", type: :view do
  before(:each) do
    @people_interest = assign(:people_interest, PeopleInterest.create!(
      :person => nil,
      :course => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
