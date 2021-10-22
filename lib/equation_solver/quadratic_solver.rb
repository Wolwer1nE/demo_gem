# frozen_string_literal: true

module EquationSolver
  # a*x^2+b*x+c
  def solve(a, b, c)
    raise Error unless correct_params?(a,b,c)
    return [] if a.zero? && b.zero?
    return solve_linear(b, c) if a.zero?
    solve_quadratic(a, b, c)
  end

  def correct_params?(*params)
    params.all? {|x| x.is_a? Numeric}
  end

  def solve_linear(b, c)
    [-b/c]
  end

  def solve_quadratic(a, b, c)
    d = discriminant(a,b,c)
    return [] if d < 0
    [(-b-Math.sqrt(d))/(2*a), (-b+Math.sqrt(d))/(2*a)].sort
  end

  def discriminant(a, b, c)
    b**2-4*a*c
  end
end