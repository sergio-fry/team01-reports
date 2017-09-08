require 'csv'

class TrackerReport
  def initialize(url)
    @url = url
  end

  def tracks
    data.map { |row| Track.new(row) }
  end

  private

  def data
    result = []

    open @url do |f|
      result = CSV.parse f, headers: true
    end

    result
  end
end
