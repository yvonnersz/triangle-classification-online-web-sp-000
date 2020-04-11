require 'pry'

class Triangle
  attr_accessor :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
    @lengths = [a,b,c]
  end

  def kind
    @lengths.sort
    raise TriangleError if @lengths.any? {|length| length <= 0}
    raise TriangleError if (@lengths.sort[0] + @lengths.sort[1] <= @lengths.sort[2])

    if @lengths.uniq.count == 1
      :equilateral
    elsif @lengths.uniq.count == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
