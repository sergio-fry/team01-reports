require 'digest'

class IssueSequence
  attr_reader :assignee
  def initialize(assignee, issues)
    @issues = issues
    @assignee = assignee
  end

  class IssueWithDates
    attr_reader :start_date, :issue
    delegate :key, :title, :due_date, to: :issue

    def initialize(issue, start_date)
      @issue = issue
      @start_date = next_working_day_from start_date
    end

    def end_date
      to = start_date + issue.remainig_working_days.days

      to + number_of_weekends_in_a_range(start_date, to).days
    end

    def color
      return unknown_color if due_date.nil?
      return good_color if overdue.blank?
      return good_color if overdue < 0 

      bad_color
    end

    def overdue
      return nil if due_date.blank?

      (end_date.to_time - due_date.to_time).seconds
    end

    def overdue?
      return false if overdue.blank?
      overdue > 0
    end

    private

    def unknown_color
      '#EEEEEE'
    end

    def good_color
      '#33AA55'
    end

    def bad_color
      '#AA3355'
    end

    def color_with_mask(color)
      color[0] += color_mask[0]
      color[1] += color_mask[1]
      color[2] += color_mask[2]

      color = color.map { |n| n % 255 }

      color.map { |n| n.to_s(16).ljust(2, '0') }.join
    end

    def color_mask
      [
        '0',
        issue_digest[2..3],
        issue_digest[4..5],
      ].map { |n| n.to_i(16) % 70 }
    end

    def issue_digest
      Digest::SHA256.hexdigest issue.component || 'SVP'
    end

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
