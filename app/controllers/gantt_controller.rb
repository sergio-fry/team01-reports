class GanttController < ApplicationController

  def show
    @issues = issues.reject { |is| is.remainig_working_days == 0 }

    @issue_sequences = []

    @issues.group_by(&:assignee).each do |assignee, issues|
      @issue_sequences << IssueSequence.new(assignee, issues)
    end
  end

  private

  def issues
    work_in_progress = jira_client.Filter.find DailyReportController::FILTER_ID
    new_issues = jira_client.Filter.find BacklogController::FILTER_ID

    (work_in_progress.issues + new_issues.issues).map { |issue| Issue.new(issue) }
  end

  def cached_issues
    Rails.cache.fetch 'GanttController#issues_data.9' do
      issues.map(&:to_hash)
    end.map { |el| OpenStruct.new(el) }
  end
end
