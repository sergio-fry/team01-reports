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
      to = start_date + issue.remainig_working_days.days

      to + number_of_weekends_in_a_range(start_date, to).days
    end

    private

    def number_of_weekends_in_a_range(from, to)
      count = 0
      d = from

      while d < to
        count += 1 if [6, 0].include? d.wday
        d += 1.day
      end

      count
    end

    def next_working_day_from(date)
      return date + 2.days if date.wday == 6
      return date + 1.days if date.wday == 0

      date
    end
  end

  def issues
    next_free_day = Date.today

    @issues.map do |el|
      issue = IssueWithDates.new(el, next_free_day)
      next_free_day = issue.end_date

      issue
    end
  end
end
