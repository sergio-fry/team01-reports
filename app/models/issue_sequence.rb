class IssueSequence
  attr_reader :assignee
  def initialize(assignee, issues)
    @issues = issues
    @assignee = assignee
  end

  class IssueWithDates
    attr_reader :start_date, :issue
    delegate :key, to: :issue

    def initialize(issue, start_date)
      @issue = issue
      @start_date = next_working_day_from start_date
    end

    def end_date
      start_date + issue.remainig_working_days.day
    end

    private

    def next_working_day_from(date)
      return date + 2.days if date.wday == 5
      return date + 1.days if date.wday == 6

      date
    end
  end

  def issues
    next_free_day = Time.now

    @issues.map do |el|
      issue = IssueWithDates.new(el, next_free_day)
      next_free_day = issue.end_date

      issue
    end
  end
end
