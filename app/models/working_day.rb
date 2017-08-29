class WorkingDay < ApplicationRecord
  has_many :issue_timeslips, inverse_of: :working_day
  accepts_nested_attributes_for :issue_timeslips, reject_if: :all_blank, allow_destroy: true
end
