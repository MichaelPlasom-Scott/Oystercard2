class Journey
  PENALTY_FARE = 6

  def initialize(entry_station = nil) 
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    @entry_station && @exit_station 
  end

  def fare
    if complete?
      return 1
    else PENALTY_FARE
    end
  end

  def finish(station)
    @exit_station = station
    self
  end

  def entry_station
    @entry_station[:entry_station]
  end

end