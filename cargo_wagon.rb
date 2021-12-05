class CargoWagon < Wagon 
  attr_reader :taken_volume, :free_volume
  def initialize (volume, type = 'cargo')
    @type = type 
    @free_volume = volume
    @taken_volume = 0
  end 

  def take_volume(volume)
    if @free_volume - volume >= 0 
      @free_volume -= volume
      @taken_volume += volume
    end 
  end 
end   