require "forwardable"

module Analog
  class Parser
    extend Forwardable

    # @return [Hash<String, Analog::Path>]
    attr_reader :result

    def_delegators :@result, :[], :map

    def initialize
      @result = Hash.new do |hash, path|
        hash[path] = Path.new(path)
      end
    end

    # Parse the stream
    #
    # @param [Enumerable]
    # @return self
    def parse(stream)
      stream.each(chomp: true) do |entry|
        path, ip_address = entry.split(" ")

        result[path] = result[path].record_visit(ip_address)
      end

      self
    end
  end
end
