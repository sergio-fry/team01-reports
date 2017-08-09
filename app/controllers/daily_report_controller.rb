require 'jira-ruby'

class DailyReportController < ApplicationController
  before_action :check_authentication

  class Issue
    def initialize(jira_issue)
      @jira_issue = jira_issue
    end

    def assignee
      @jira_issue.assignee.displayName
    end

    def url
      "https://devprg.atlassian.net/browse/#{@jira_issue.key}"
    end

    def title
      'Issue title'
    end

    def component
      @jira_issue.components[0].try(:name)
    end

    def method_missing(m)
      @jira_issue.send(m)
    end
  end

  def show
    options = {
      :username     => current_user.login,
      :password     => current_user.password,
      :site         => 'https://devprg.atlassian.net',
      :context_path => '',
      :auth_type    => :basic

    }

    client = JIRA::Client.new(options)

    project = client.Project.find('SVP')


    work_in_progress = client.Filter.find 25807

    @issues = work_in_progress.issues.map { |issue| Issue.new(issue) }
  end
end
