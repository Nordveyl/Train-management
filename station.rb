class Station 
  attr_reader :name, :type, :trains_on_station #последнее возвращает список всех поездов на станции, находящиеся в текущий момент

  def initialize(name)
    @name = name 
    @trains_on_station = []
  end 

  def add_train(train) #принимает поезда (по одному за раз)
    @trains_on_station << train
  end

  def count_trains_of_type (type)  
    k = 0
    @trains_on_station.each do |train| 
      if train.type == type 
        k += 1
      end   
    end
    k
  end  

  def trains_of_type(type)
    trains_type = []
    @trains_on_station.each do |train| 
      if train.type == type 
        trains_type << train 
      end 
    end 
    trains_type  
  end  

  def delete_train (train) #отправляет поезда 
    @trains_on_station.delete(train)
  end 
end