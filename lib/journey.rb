class Journey
  PENALTY_FARE = 6

  def initialize(entry_station = nil) 
    @entry_station = entry_station
  end

  def complete?

  end

  def fare
    PENALTY_FARE
  end

  def finish(station)
    self
  end

  def entry_station
    @entry_station
  end

end