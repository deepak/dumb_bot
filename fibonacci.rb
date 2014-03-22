class Fibonacci
  attr_accessor :n, :result

  def initialize
    @i = 0
    @result = {}
  end

  def result(n)
    @result[n] || generate(n)
  end

  private

  def generate(n)
  end
end
