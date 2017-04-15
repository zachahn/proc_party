require "test_helper"

class ProcPartyTest < TestCase
  class Triple
    include ProcParty

    def call(n)
      n * 3
    end
  end

  class Summer
    include ProcParty

    def call(*args)
      args.inject(:+)
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

  def test_arity_is_arity_of_call
    assert_equal(1, Triple.new.arity)
  end

  def test_curry_with_no_args
    assert_equal(3, Triple.new.curry[1])
  end

  def test_curry_with_arg
    assert_equal(10, Summer.new.curry(4)[1, 2, 3, 4])
  end
end
