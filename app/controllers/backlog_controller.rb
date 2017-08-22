class BacklogController < ApplicationController
  FILTER_ID = 26000

  def show
    work_in_progress = jira_client.Filter.find FILTER_ID

    @issues = work_in_progress.issues.map { |issue| Issue.new(issue) }
  end
end
