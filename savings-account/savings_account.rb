module SavingsAccount
  def self.interest_rate(balance)
    case balance
    when (-Float::INFINITY...0)
      -3.213
    when (0...1000)
      0.5
    when (1000...5000)
      1.621
    when (5000..Float::INFINITY)
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + balance.abs * interest_rate(balance) / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    until current_balance > desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end

end
