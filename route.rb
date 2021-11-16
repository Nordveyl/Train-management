class Route
	attr_reader :stations

	def initialize (first, last)
		@stations = []
		@stations << first 
		@stations << last
	end 

	def add_station (station)
		@stations.insert(-2, station)
	end 

	def delete_station (station)
		@stations.delete(station)
	end 	

	def show_stations 
		stations.each { |station| puts station.name }
	end	
end	