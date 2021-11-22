require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Interface 
  attr_reader :trains, :stations, :routes  
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @index_train = 0
    @index_statuin = 0
    @index_route = 0

  end  
  def main_menu 
    puts" Введите цифру объекта, с которым вы хотите взаимодействовать:\n
    1 Станции\n
    2 Поезда\n
    3 Маршруты\n
    0 Выйти"

    point = gets.chomp.to_i

    case point 
    when 1
      station_menu
    when 2
      train_menu
    when 3 
      route_menu
    when 0
      exit 
    end           
  end
private #поместил эти методы в private, так как пользователь может вызвать только главное меню, а через него уже пользоваться программой 
  def station_menu
    puts "    1 Создать станцию\n 
    2 Просматреть список станций\n 
    3 Просматреть список поездов на станции\n
    0 Назад в меню"
    point = gets.chomp.to_i
    case point 
    when 1 
      create_station
      station_menu
    when 2
      @stations.each { |station| puts station.name } 
      station_menu
    when 3
      index_of_station
      @stations[@index_station].trains_on_station.each {|train| puts train.number}
      station_menu
    when 0
      main_menu
    end
  end 

  def train_menu
    puts "    1 Создать поезд\n 
          2 Добавить вагон к поезду\n
          3 Отцепить вагон от поезда\n
          4 Переместить поезд по маршруту\n 
          0 Назад в меню"

    point = gets.chomp.to_i  

    case point 
    when 1 
      create_train
      train_menu
    when 2
      index_of_train 
      add_wagon_to_train(@trains[@index_train])
      train_menu
    when 3 
      index_of_train  
      delete_wagon_to_train(@trains[@index_train])
      train_menu
    when 4 
      index_of_train
      move_train(@trains[@index_train])
      train_menu
    when 0
      main_menu
    end 
  end

  def route_menu 
    puts "    1 Создать маршрут\n
          2 Добавить станцию на маршрут\n
          3 Удалить станцию с маршрута\n
          4 Добавить поезд на маршрут\n
          0 Назад в меню"

    point = gets.chomp.to_i

    case point
    when 1
      create_route
      route_menu 
    when 2
      index_of_route
      index_of_station
      add_station_on_route(@routes[@index_route], @stations[@index_station]) 
      route_menu 
    when 3
      index_of_route
      index_of_station
      delete_station_on_route(@routes[@index_route], @stations[@index_station])
      route_menu 
    when 4
      index_of_route
      index_of_train
      set_route_to_train(@routes[@index_route], @trains[@index_train]) 
      route_menu 
    when 0
      main_menu  
    end 
  end    

  def create_station
    puts 'Введите название станции'
    name_of_station = gets.chomp
    if not name_of_station.empty?  
      station = Station.new (name_of_station)
      @stations << station
    end
  end    

  def create_train 
    puts 'Введите номер поезда и тип (passenger или cargo)'
    number_of_train = gets.chomp
    type_of_train = gets.chomp 
    if number_of_train != '' and type_of_train!= ''
      if type_of_train == 'cargo'
        train = CargoTrain.new(number_of_train) 
      elsif type_of_train == 'passenger'
        train = PassengerTrain.new(number_of_train) 
      end
      @trains << train
    end     
  end 
  
  def index_of_train 
    puts 'Выберите поезд по индексу'
    @trains.each { |train| puts "#{@trains.index(train)} <<< #{train.number}" }
    @index_train = gets.chomp.to_i
  end 

  def index_of_station 
    puts 'Выберите станцию по индексу'
    @stations.each { |station| puts "#{@stations.index(station)} <<< #{station.name}" }
    @index_station = gets.chomp.to_i
  end  
  
  def index_of_route 
    puts 'Выберите маршрут'
    @routes.each { |route| puts "#{@routes.index(route)} <<< #{route}" }
    @index_route = gets.chomp.to_i
  end  

  def create_route 
    puts 'Введите индекс начальной и конечной станции из списка:'
    index_of_station
    index_of_last_station = gets.chomp.to_i   
    route = Route.new(@stations[@index_station], [index_of_last_station])
    @routes << route
  end  

  def add_station_on_route(route, station) 
    route.add_station(station) 
  end 

  def delete_station_on_route(route, station) 
    route.delete_station(station) 
  end 
  
  def set_route_to_train(route, train) 
    train.set_route(route)
  end
  
  def add_wagon_to_train(train)
    if train.type == 'cargo'
      wagon = CargoWagon.new 
      train.add_wagon(wagon)
    elsif train.type == 'passenger'
      wagon = PassengerWagon.new 
      train.add_wagon(wagon)
    end   
  end 

  def delete_wagon_to_train(train) 
    if train.wagons.length-1 !=0
      train.delete_wagon 
    end
  end  

  def move_train(train) 
    puts 'Вперёд(1) или Назад(2)'
    point = gets.chomp.to_i 
    if point == 1 
    train.go_to_next_station
    elsif point == 2
      train.go_to_previous_station 
    end 
  end 

end