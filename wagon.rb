class Wagon
  include Company, Validation
  attr_reader :type 
  validate :type, :presence

  def initialize(type) #Type: passenger or cargo
    @type = type 
    validate!
  end 
end 