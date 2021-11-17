class Train 
  attr_accessor :current_speed, :current_station
  attr_reader :count_wagons, :number, :type 
  def initialize (number, type, count_wagons) #Type: passenger or freight
    @number = number
    @type = type 
    @count_wagons = count_wagons
    @current_speed = 0
    @stations_of_route = []
  end 

  def stop 
    @current_speed = 0
  end 
  
  def add_wagon 
    if @current_speed == 0
      @count_wagons +=1
    else 
      puts ('Stop the train')   
    end   
  end 

  def delete_wagon 
    if @current_speed == 0
      @count_wagons -=1
    else 
      puts ('Stop the train')   
    end   
  end 

  def set_route(route) 
    @current_route = route
     if @current_station != nil 
      @current_station.delete_train(self)
     end 
    @current_station = route.stations[0]
    @current_station.add_train(self)
    @i=0
  end 

  def gain_speed(speed)
    @current_speed = speed 
  end 

  def go_to_next_station 
    if @current_route.stations.length - 1 == @i 
      puts ('You are on the last station')
    else   
      @current_station = @current_route.stations[@i +=1 ]
      @current_station.add_train(self)
      @current_route.stations[@i -=1 ].delete_train(self)
    end  
  end

  def go_to_previous_station
    if @i == 0 
      puts ('You are on the first station')
    else
        @current_station = @current_route.stations[@i -=1 ]
        @current_station.add_train(self)
        @current_route.stations[@i +=1 ].delete_train(self)
    end
  end 
  
  def get_next_station
    if @current_route.stations.length - 1 == @i 
      puts ('You are on the last station')
    else   
    @current_route.stations[@i+1]
    end
  end 
  
  def get_previous_station 
    if @i == 0 
      puts ('You are on the first station')
    else
    @current_route.stations[@i-1]
    end
  end   
end