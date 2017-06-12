require 'rails_helper'

RSpec.describe "people_interests/edit", type: :view do
  before(:each) do
    @people_interest = assign(:people_interest, PeopleInterest.create!(
      :person => nil,
      :course => nil
    ))
  end

  it "renders the edit people_interest form" do
    render

    assert_select "form[action=?][method=?]", people_interest_path(@people_interest), "post" do

      assert_select "input#people_interest_person_id[name=?]", "people_interest[person_id]"

      assert_select "input#people_interest_course_id[name=?]", "people_interest[course_id]"
    end
  end
end
