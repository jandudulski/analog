# frozen_string_literal: true

require "test_helper"

class Analog::ParserTest < Minitest::Test
  def test_empty_stream
    result = Analog::Parser.new.parse(StringIO.new("")).result

    assert_equal result, {}
  end

  def test_counting_visits
    stream = StringIO.new([
      "/foo 1.2.3.4",
      "/bar 1.2.3.4",
      "/foo 1.2.3.4"
    ].join("\n"))

    parser = Analog::Parser.new
    parser.parse(stream)

    assert_equal parser["/foo"].visits, 2
    assert_equal parser["/bar"].visits, 1
  end

  def test_counting_unique_visits
    stream = StringIO.new([
      "/foo 1.2.3.4",
      "/bar 1.2.3.4",
      "/foo 1.2.3.4",
      "/bar 4.3.2.1"
    ].join("\n"))

    parser = Analog::Parser.new
    parser.parse(stream)

    assert_equal parser["/foo"].unique_visits, 1
    assert_equal parser["/bar"].unique_visits, 2
  end
end
