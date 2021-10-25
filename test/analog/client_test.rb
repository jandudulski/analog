# frozen_string_literal: true

require "test_helper"

class Analog::ClientTest < Minitest::Test
  EXAMPLE_PATH = "test/fixtures/example.log"

  def test_sum_of_visits
    result = Analog::Client.new(EXAMPLE_PATH).visits

    assert_equal result, [["/foo", 3], ["/bar", 2], ["/baz", 1]]
  end

  def test_sum_of_unique_visits
    result = Analog::Client.new(EXAMPLE_PATH).unique_visits

    assert_equal result, [["/bar", 2], ["/foo", 2], ["/baz", 1]]
  end
end
