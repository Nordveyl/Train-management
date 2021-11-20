class Station 
  attr_reader :name, :type, :trains_on_station #последнее возвращает список всех поездов на станции, находящиеся в текущий момент

  def initialize(name)
    @name = name 
    @trains_on_station = []
  end 

  def add_train(train) #принимает поезда (по одному за раз)
    @trains_on_station << train
  end  

  def trains_of_type(type)
    @trains_on_station.select { |train| train.type == type }  
  end 

  def count_trains_of_type (type)  
    trains_of_type(type).size 
  end 

  def delete_train (train) #отправляет поезда 
    @trains_on_station.delete(train)
  end 
end