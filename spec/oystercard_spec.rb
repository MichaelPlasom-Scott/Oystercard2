require 'oystercard'

describe Oystercard do

  let(:station){ double :station }

  it 'should have a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it "should top up oystercard" do
    expect {subject.top_up(5)}.to change { subject.balance }.by(5)
  end

  it "should throw error if =>£90" do
    max_limit = Oystercard::MAX_LIMIT
    subject.top_up(max_limit)
    expect{ subject.top_up 1 }.to raise_error "Reached max limit of £90"
  end

  it 'should deduct spending' do
    max_limit = Oystercard::MAX_LIMIT
    subject.top_up(max_limit)
    expect(subject.deduct 10).to eq(80)
  end 

  it 'is in journey' do
    expect(subject).not_to be_in_journey
  end 

  it 'can touch in' do
    subject.top_up(1)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'will require £1 to touch in' do
    expect{subject.touch_in(station)}.to raise_error "Insufficient funds to touch in"
  end 

  it 'will deduct fare' do
    min_fare = Oystercard::MIN_FARE
    subject.top_up(1)
    subject.touch_in(station)
    expect {subject.touch_out}.to change{subject.balance}.by(-min_fare)
  end 

  it 'saves entry station' do
    subject.top_up(1)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

end
