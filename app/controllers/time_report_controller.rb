require 'open-uri'
require 'csv'

class TimeReportController < ApplicationController
  TRACK_CSV_URL = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTkSa1fS8Q0PwZ6Xu19QsFLcCnRsLgteYVck4h_YiHaSJFuDMkH_IHWyWZkHDApQHUcQysJDkd06PSc/pub?gid=509721696&single=true&output=csv'

  class Report < TrackerReport
    def tracks
      super.find_all { |r| r.date.today? }
    end
  end

  def show
    @report = Report.new TRACK_CSV_URL
  end
end
