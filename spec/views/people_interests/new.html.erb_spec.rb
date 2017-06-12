require 'rails_helper'

RSpec.describe "people_interests/new", type: :view do
  before(:each) do
    assign(:people_interest, PeopleInterest.new(
      :person => nil,
      :course => nil
    ))
  end

  it "renders new people_interest form" do
    render

    assert_select "form[action=?][method=?]", people_interests_path, "post" do

      assert_select "input#people_interest_person_id[name=?]", "people_interest[person_id]"

      assert_select "input#people_interest_course_id[name=?]", "people_interest[course_id]"
    end
  end
end
