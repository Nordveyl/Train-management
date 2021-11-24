module InstanceCounter 
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
    def instances
      @instances  
    end
  end

  module InstanceMethods
    protected 
    def register_instance
      if self.class.instances == nil 
        self.class.instances = 0
      end   
      self.class.instances += 1
    end
  end
end