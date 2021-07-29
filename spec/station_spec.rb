require 'station'

describe Station do
  describe "#name" do
    it "returns station name" do
      station = Station.new("Oxford Road", 1)
      expect(station.name).to eq "Oxford Road"
    end
  end

  describe "#zone" do
    it "returns zone" do
      station = Station.new("Oxford Road", 1)
      expect(station.zone).to eq 1
    end
  end
  
end