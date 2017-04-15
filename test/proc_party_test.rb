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

  def test_includers_dont_have_version
    assert_equal(false, Triple.const_defined?(:VERSION))
  end

  def test_square_brackets_to_call
    assert_equal(9, Triple.new[3])
  end

  def test_case_equality_operator
    assert_equal(12, Triple.new === 4)
  end
end
