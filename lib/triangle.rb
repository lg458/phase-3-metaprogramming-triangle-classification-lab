class Triangle
  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3) 
    @s1 = s1
    @s2 = s2 
    @s3 = s3
  end

  def kind
    validate_triangle
    if s1 == s2 && s2 == s3
      :equilateral
    elsif s1 == s2 || s2 == s3 || s1 == s3
      :isosceles 
    else 
      :scalene 
    end
  end 

  def sides_greater_than_zero?
    [s1,s2,s3].all?(&:positive?)
  end

  def triangle_inequality_satisfied?
    s1 + s2 > s3 && s2 + s3 > s1 && s1 + s3 > s2
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && triangle_inequality_satisfied?
  end

  class TriangleError < StandardError
  end

end

# puts tri = Triangle.new(5,3,4) 
# puts tri.kind