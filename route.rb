class Route
  include InstanceCounter, Validation
  attr_reader :stations
  validate :first, :type, Station 
  validate :last, :type, Station

  def initialize (first, last)
    @stations = []
    @first = first
    @last = last
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
end