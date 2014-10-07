require "minitest/autorun"
require "barlow"

class TestBarlow < MiniTest::Unit::TestCase
  def test_harmonicity
    assert_in_delta 0.0717, Barlow.harmonicity(6, 7)
  end

  def test_indigestibility
    assert_in_delta 5.3333, Barlow.indigestibility(9)
  end
end

