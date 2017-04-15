require "test_helper"

class ProcPartyTest < TestCase
  class Triple
    include ProcParty

    def call(n)
      n * 3
    end
  end

  def test_can_be_used_as_block
    assert_equal([3, 6, 9], (1..3).map(&Triple.new))
  end

  def test_it_does_something_useful
    assert true
  end
end
