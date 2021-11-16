class Train 
	attr_accessor :current_speed, :current_station
	attr_reader :count_wagons, :number, :type 
	def initialize (number, type, count_wagons) #Type: passenger or freight
		@number = number
		@type = type 
		@count_wagons = count_wagons
		@current_speed = 0
		@stations_of_route = []
	end 

	def stop 
		@current_speed = 0
	end 
	
	def change_count_wagons(count) # 1 or -1
		if @current_speed == 0 
			if count == 1
				@count_wagons +=1
			elsif count == -1	
				@count_wagons -=1
			end 
		else 
			puts ('Stop the train')		
		end 	
	end 

	def set_route(route) 
		@stations_of_route = route.stations
		@current_station = @stations_of_route[0]
		@i=0
	end 

	def gain_speed(speed)
		@current_speed = speed 
	end 

	def change_station (count) # 1 or -1
		if count == 1
				@current_station = @stations_of_route[@i +=1 ] 
			elsif count == -1	
				@current_station = @stations_of_route[@i -=1 ]
		end
	end 
	
	def get_next_station
		@stations_of_route[@i+1]
	end 
	
	def get_previous_station 
		@stations_of_route[@i-1]
	end		
end