require "set"

module Analog
  class Path
    # @return [String]
    attr_reader :path

    # @return [Integer]
    attr_reader :visits

    # @param [String]
    def initialize(path)
      @path = path
      @unique_visitors = Set.new
      @visits = 0
    end

    # @param [String]
    # @return self
    def record_visit(ip_address)
      @visits += 1
      @unique_visitors.add(ip_address)

      self
    end

    # @return [Integer]
    def unique_visits
      @unique_visitors.count
    end
  end
end
