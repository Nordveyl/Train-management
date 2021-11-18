class Train 
  attr_accessor :current_speed, :current_station
  attr_reader :count_wagons, :number, :type 
  def initialize (number, type, count_wagons) #Type: passenger or freight
    @number = number
    @type = type 
    @count_wagons = count_wagons
    @current_speed = 0
  end 

  def stop 
    @current_speed = 0
  end 
  
  def add_wagon 
    if @current_speed == 0
      @count_wagons +=1   
    end   
  end 

  def delete_wagon 
    if @current_speed == 0
      @count_wagons -=1   
    end   
  end 

  def set_route(route) 
    @current_route = route
    @i = 0
    @current_route.stations[@i].add_train(self)
  end 

  def gain_speed(speed)
    @current_speed = speed 
  end 

  def go_to_next_station 
    if self.next_station 
      @current_route.stations[@i +=1 ].add_train(self)
      @current_route.stations[@i -1 ].delete_train(self)
    end  
  end

  def go_to_previous_station
    if self.previous_station  
        @current_route.stations[@i -=1 ].add_train(self)
        @current_route.stations[@i +1 ].delete_train(self)
    end
  end 
  
  def next_station
    if @current_route.stations.length - 1 != @i and @current_route  
      @current_route.stations[@i+1]
    end
  end 
  
  def previous_station 
    if @i != 0 and @current_route 
      @current_route.stations[@i-1]
    end
  end  

  def current_station
    if @current_route
      @current_route.stations[@i]
    end   
  end     
end