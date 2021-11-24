class Station 
  attr_reader :name, :type, :trains_on_station #последнее возвращает список всех поездов на станции, находящиеся в текущий момент

  def initialize(name)
    @name = name 
    @trains_on_station = []
  end 

  def delete_train (train)  
    @trains_on_station.delete(train)
  end 

  def add_train(train) 
    @trains_on_station << train
  end

  private #Внёс эти методы в pivate, так как классов потомков нету, а пользователю эти методы недоступны
  
  def trains_of_type(type)
    @trains_on_station.filter { |train| train.type == type }  
  end 

  def count_trains_of_type (type)  
    trains_of_type(type).size 
  end 
end
