require 'jira-ruby'

class DailyReportController < ApplicationController
  before_action :check_authentication

  FILTER_ID = 25807

  def show
    work_in_progress = jira_client.Filter.find FILTER_ID

    @issues = work_in_progress.issues.map { |issue| Issue.new(issue) }
  end
end
