class GanttController < ApplicationController
  before_action :check_authentication

  FILTER_ID = 26802

  def show
    @issues = cached_issues.reject { |is| is.remainig_working_days == 0 }

    @issue_sequences = []

    @issues.group_by(&:assignee).each do |assignee, issues|
      @issue_sequences << IssueSequence.new(assignee, issues)
    end
  end

  private

  def issues
    jira_client.Filter.find(FILTER_ID).issues.map { |issue| Issue.new(issue) }
  end

  def cached_issues
    Rails.cache.fetch 'GanttController#issues_data.9' do
      issues.map(&:to_hash)
    end.map { |el| OpenStruct.new(el) }
  end
end
