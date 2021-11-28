class Train 
  include Company, InstanceCounter, Valid
  attr_accessor :current_speed, :current_station
  attr_reader :count_wagons, :number, :type, :wagons 
  
  def initialize (number, type) #Type: passenger or cargo
    @number = number
    @type = type 
    @current_speed = 0
    @wagons = []
    @@all_trains << self 
    register_instance
    validate!
  end 

  @@all_trains = []

  NUMBER_FORMAT = /^\w{3}-?\w{2}$/

  def self.find(number) 
    found_train =  @@all_trains.filter { |train| train.number == number } 
    if found_train == []
      found_train = nil
    end
    found_train  
  end       

  def add_wagon(wagon) 
    if @current_speed == 0 && wagon.type == type 
      @wagons << wagon    
    end   
  end 

  def delete_wagon 
    if @current_speed == 0 
      @wagons.pop   
    end   
  end 

  def set_route(route) 
    @current_route = route
    @i = 0
    @current_route.stations[@i].add_train(self)
  end 

  def go_to_next_station 
    if self.next_station 
      @current_route.stations[@i +=1].add_train(self)
      @current_route.stations[@i -1].delete_train(self)
    end  
  end

  def go_to_previous_station
    if self.previous_station  
      @current_route.stations[@i -=1 ].add_train(self)
      @current_route.stations[@i +1 ].delete_train(self)
    end
  end   

  def each_wagon 
    @wagons.each {|wagon| yield(wagon)}
  end   

  protected 
  
  def stop
    @current_speed = 0
  end 
  
  def gain_speed(speed)
    @current_speed = speed 
  end 

  def next_station
    if @current_route.stations.length - 1 != @i && @current_route  
      @current_route.stations[@i+1]
    end
  end 
  
  def previous_station 
    if @i != 0 && @current_route 
      @current_route.stations[@i-1]
    end
  end  

  def current_station
    if @current_route
      @current_route.stations[@i]
    end   
  end 

  def validate!
    raise 'Number of train must be XXXXX or XXX-XX' if number !~ NUMBER_FORMAT 
    raise "Types of train: cargo, passenger" if  type != 'cargo' && type != 'passenger'
  end   
end