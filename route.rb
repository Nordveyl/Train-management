class Route
  include InstanceCounter, Valid
  attr_reader :stations

  def initialize (first, last)
    @stations = []
    @stations << first 
    @stations << last
    register_instance
    validate!
  end 

  def add_station (station)
    @stations.insert(-2, station)
  end 

  def delete_station (station)
    @stations.delete(station)
  end   

  private 

  def show_stations 
    stations.each { |station| puts station.name }
  end 

  def validate! 
    raise "The first station must be an object of class Station " if stations[0].class != Station
    raise "The last station must be an object of class Station " if stations[1].class != Station
  end  
end