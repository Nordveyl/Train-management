class Station 
	attr_reader :name, :type 

	def initialize(name)
		@name = name 
		@trains = []
	end 

	def add_train(train) #принимает поезда (по одному за раз)
		@trains << train
	end

	def show_trains_names #возвращает список всех поездов на станции, находящиеся в текущий момент 
		trains_name = []
    @trains.each { |train| trains_name << train.number } 
    trains_name 
  end

  def show_count_trains_types #возвращает список поездов на станции по типу 
  	trains_types = []
    @trains.each { |train| trains_types << train.type } 
    count_trains_types = { 'passenger' => trains_types.count('passenger') , 'freight' => trains_types.count('freight') }
  end

  def delete_train (train) #отправляет поезда 
  	@trains.delete(train)
  end	
end