class IssueTimeslip < ApplicationRecord
  belongs_to :assignee
  belongs_to :working_day
end
