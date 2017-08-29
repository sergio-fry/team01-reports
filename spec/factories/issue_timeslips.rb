FactoryGirl.define do
  factory :issue_timeslip do
    assignee
    working_day
    issue_key "MyString"
    component "MyString"
    description "MyString"
  end
end
