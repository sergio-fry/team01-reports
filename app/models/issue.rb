class Issue
  def initialize(jira_issue)
    @jira_issue = jira_issue
  end

  def to_hash
    {
      remainig_working_days: remainig_working_days,
      remainig: remainig,
      key: key,
      assignee: assignee,
      url: url,
      title: title,
      details: details,
      components: components
    }
  end

  def remainig_working_days
    remainig.seconds / 8.hours
  end

  def remainig
    @jira_issue.aggregatetimeoriginalestimate || 0
  end

  def key
    @jira_issue.key
  end

  def assignee
    @jira_issue.assignee.displayName
  end

  def url
    "https://devprg.atlassian.net/browse/#{@jira_issue.key}"
  end

  def title
    @jira_issue.summary
  end

  def details
    title.match(/(\([0-9]+\))/)[1] rescue nil
  end

  def component
    @jira_issue.components[0].try(:name)
  end

  def method_missing(m)
    @jira_issue.send(m)
  end
end

