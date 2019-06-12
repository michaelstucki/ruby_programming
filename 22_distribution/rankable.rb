module Rankable
  def thumbs_up
    self.rank += 1
  end

  def thumbs_down
    self.rank -= 1
  end

  def hit?
    self.rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end

  def normalized_rank # a virtual attribute, derives from instance variables
    self.rank / 10
  end

  def <=>(other)
    other.rank <=> self.rank
  end
end