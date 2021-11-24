class Wagon
  include Company
  attr_reader :type 

  def initialize(type) #Type: passenger or cargo
    @type = type 
  end 
end 