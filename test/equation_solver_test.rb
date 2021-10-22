# frozen_string_literal: true

require "test_helper"

class EquationSolverTest < Minitest::Test
  include EquationSolver

  def test_that_it_has_a_version_number
    refute_nil ::EquationSolver::VERSION
  end

  #x^2 + x - 2 = 0
  # roots are 1 and -2
  def test_that_it_solves_correctly
    roots = solve(1, 1, -2)
    assert_equal(-2, roots[0])
    assert_equal(1, roots[1])
  end

  def test_that_it_checks_params_for_nil
    assert_raises(::EquationSolver::Error) do
      solve(1, nil, -2)
    end
  end

  def test_that_it_checks_params_for_type
    assert_raises(::EquationSolver::Error) do
      solve(1, '1', -2)
    end
  end

  def test_that_it_solves_for_duplicate_roots
    #(x-2)^2=> x^2-4x+4
    roots = solve(1, -4, 4)
    assert_equal 2, roots[0]
    assert_equal 2, roots[1]
  end

  def test_that_it_handles_no_roots
    roots = solve(1, 0, 4)
    assert_empty roots
  end

  def test_that_it_handles_no_roots_linear
    roots = solve(0, 0, 4)
    assert_empty roots
  end

  def test_that_it_handles_zero_a_coefficient
    roots = solve(0, 1, 1)
    assert_equal(1, roots.length)
    assert_equal(-1, roots[0])
  end
end
