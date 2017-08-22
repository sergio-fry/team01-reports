require 'jira-ruby'

class DailyReportController < ApplicationController
  before_action :check_authentication

  def show
    work_in_progress = jira_client.Filter.find 25807

    @issues = work_in_progress.issues.map { |issue| Issue.new(issue) }
  end
end
