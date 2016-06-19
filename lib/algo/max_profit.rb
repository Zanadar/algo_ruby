class MaxProfit
  attr_accessor :this, :that

  def initialize(prices)
    if prices.length < 2
      raise IndexError, "You have to buy AND sell!"
    end
    @stocks = prices
  end

  def get
    local_min = @stocks[0]
    max_profit = calc_profit(@stocks[1], @stocks[0])
    (1...@stocks.length).each do |x|
      if @stocks[x] - local_min > max_profit
        max_profit = calc_profit(@stocks[x], local_min)
      end
      if @stocks[x] < local_min
        local_min = @stocks[x]
      end
    end

    max_profit
  end

  private
  def calc_profit(price2, price1)
    price2 - price1
  end
end
