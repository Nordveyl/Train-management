class Station 
  include InstanceCounter, Valid
  attr_reader  :name, :type, :trains_on_station 
  @@all_stations = []
  
  def self.all 
    @@all_stations
  end   

  def initialize(name)
    @name = name 
    @trains_on_station = []
    @@all_stations << self 
    register_instance
    validate!
  end 

  def delete_train (train)  
    @trains_on_station.delete(train)
  end 

  def add_train(train) 
    @trains_on_station << train
  end

  def each_train_on_staion 
    @trains_on_station.each {|train| yield(train)}
  end   

  private

  def trains_of_type(type)
    @trains_on_station.filter { |train| train.type == type }  
  end 

  def count_trains_of_type (type)  
    trains_of_type(type).size 
  end 

  def validate!
    raise "station name can't be empty" if name.empty?
  end   
end