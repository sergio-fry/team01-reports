class WeekReportController < ApplicationController
  helper_method :jira_client
  
  TRACK_CSV_URL = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTkSa1fS8Q0PwZ6Xu19QsFLcCnRsLgteYVck4h_YiHaSJFuDMkH_IHWyWZkHDApQHUcQysJDkd06PSc/pub?gid=509721696&single=true&output=csv'

  class Report < TrackerReport
    attr_accessor :jira_client

    class TrackWrapper < Track
      attr_accessor :jira_client

      def estimating
        #issue.estimating.seconds / 1.hour
      end

      private

      def issue
        @issue ||= Issue.new jira_client.Issue.find(key)
      end
    end

    def tracks
      super.find_all { |r| r.date.cweek == Date.today.cweek }
    end

    def issue_total_time(key)
      tracks.find_all { |tr| tr.key == key }.map(&:duration).sum
    end
  end

  def show
    @report = Report.new TRACK_CSV_URL
    #@report.jira_client = jira_client
  end
end
