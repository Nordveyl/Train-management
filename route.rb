class Route
  include InstanceCounter
  attr_reader :stations

  def initialize (first, last)
    @stations = []
    @stations << first 
    @stations << last
    register_instance
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
end