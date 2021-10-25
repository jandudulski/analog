module Analog
  class Client
    def initialize(filename)
      @filename = filename
    end

    # @return [Hash<String, Integer>]
    def visits
      report
        .map { |path, entry| [path, entry.visits] }
        .sort_by(&:last)
        .reverse!
    end

    # @return [Hash<String, Integer>]
    def unique_visits
      report
        .map { |path, entry| [path, entry.unique_visits] }
        .sort_by(&:last)
        .reverse!
    end

    private

    attr_reader :filename

    def report
      @report ||= File.open(filename, "r") do |stream|
        Parser.new.parse(stream)
      end
    end
  end
end
