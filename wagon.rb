class Wagon
  include Company, Valid
  attr_reader :type 

  def initialize(type) #Type: passenger or cargo
    @type = type 
    validate!
  end 

  protected

  def validate! 
    raise "Type of wagon can't be empty" if type.empty?
  end   
end 