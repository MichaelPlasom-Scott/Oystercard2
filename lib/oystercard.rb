class Oystercard
attr_reader :balance, :entry_station, :exit_station, :journeys

MAX_LIMIT = 90
MIN_LIMIT = 1
MIN_FARE = 0

  def initialize(balance=0, journeys = Array.new)
    @balance = balance
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = journeys
  end

  def top_up(amount)
    fail "Reached max limit of £90" if full?
    @balance += amount
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Insufficient funds to touch in" if underfare?
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct (MIN_FARE)
    @in_journey = false
    @exit_station = station
    @journeys.push( {entry_station: @entry_station, exit_station: @exit_station} )
    @entry_station = nil
  end

  private
  def full?
    @balance >= MAX_LIMIT
  end

  def underfare?
    @balance < MIN_LIMIT
  end

end
