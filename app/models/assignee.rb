class Assignee < ApplicationRecord
  has_many :issue_timeslips, inverse_of: :assignee
end
