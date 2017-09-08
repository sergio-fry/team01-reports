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
      due_date: due_date,
      component: component
    }
  end

  def due_date
    @jira_issue.duedate.to_date rescue nil
  end

  def remainig_working_days
    remainig.seconds / 8.hours
  end

  # in seconds
  def estimating
    @jira_issue.timeestimate || 0
  end

  def remainig
    estimating
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
