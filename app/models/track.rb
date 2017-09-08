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

    def key
      @row[3].strip
    end

    def url
      "https://devprg.atlassian.net/browse/#{key}"
    end

    def component
    end

    def duration
      @row[5].to_f
    end

    def date
      Date.parse @row[1]
    end
  end
