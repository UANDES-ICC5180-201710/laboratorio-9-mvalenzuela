class PeopleInterest < ApplicationRecord
  belongs_to :person
  belongs_to :interest_course, class_name: 'Course', foreign_key: 'course_id'

  validates :person, uniqueness: { scope: :interest_course}
end
