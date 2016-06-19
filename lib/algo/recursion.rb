class Recursive
  class << self
    def iter_factorial(n)
      (1..n).reduce(:*)
    end

    def recur_factorial(n)
      return 1 if n == 0
      return n * recur_factorial(n - 1)
    end

    def palindrome(word)
      return true if (word.length <= 1)
      if word[0] != word[-1]
        return false
      else
        return palindrome(word[1..-2])
      end
    end

    def power(x, n)
      return 1 if n == 0
      if (n > 0 && n.even?)
        y = power(x, n/2)
        return y * y
      elsif (n > 0) # n is odd
        m = n - 1
        return x * power(x, m)
      else # n is negegative
        return Rational(1, power(x, -n))
      end
    end
  end
end
