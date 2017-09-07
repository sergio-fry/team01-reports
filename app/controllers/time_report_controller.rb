require 'open-uri'
require 'csv'


class TimeReportController < ApplicationController

  class Track
    def initialize(row)
      @row = row
    end

    def assignee
      @row[2]
    end

    def details
      @row[4]
    end

    def url
      "https://devprg.atlassian.net/browse/#{@row[3]}"
    end

    def component
    end

    def date
      Date.parse @row[1]
    end
  end

  class Report
    def initialize(url)
      @url = url
    end

    def tracks
      data = []

      open @url do |f|
        data = CSV.parse f, headers: true
      end

      data.map { |row| Track.new(row) }.find_all { |r| r.date.today? }
    end
  end

  def show
    @report = Report.new ENV['TRACK_CSV_URL']
  end
end
