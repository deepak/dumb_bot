class Fibonacci
  attr_accessor :n, :results

  def initialize
    @n = 0
    @results = {}
  end

  def result(n)
    @n = n
    @results[n] ||= generate(n)
  end

  private

  def generate(n)
    return n if (0..1).include? n
    result(n - 1) + result(n - 2)
  end
end
