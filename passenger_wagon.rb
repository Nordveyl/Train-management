class PassengerWagon < Wagon 
  attr_reader :taken_seats, :free_seats
  def initialize (seats, type = 'passenger')
    @type = type
    @free_seats = seats 
    @taken_seats = 0
  end 

  def take_seat 
    if @free_seats != 0
      @free_seats -= 1
      @taken_seats +=1
    end 
  end 
end 