module Validation  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    def validations
      @validations ||= {}
    end  

    def validate(name, type_of_validation, additionally = nil) 
      if self.validations.keys.filter {|x| x == name } == []
        self.validations[name] = [type_of_validation, additionally]
      else 
        self.validations.each do |key,value|
          if key == name 
            value << type_of_validation
            value << additionally
          end 
        end    
      end       
    end 
  end  

  module InstanceMethods
    def validate!
      self.class.validations.each do |key,value|
        varname = "@#{key}".to_sym
        key = instance_variable_get(varname)
        i = 0
        value.each do |x|
          if x == :presence  
            raise 'Name can not be empry' if key.empty?
            raise 'Name can not be nil' if key == nil 
          elsif x == :format 
            raise 'Format error'if key !~ value[i+1] 
          elsif x == :type  
            raise 'Type error' if key.class != value[i+1] 
          end 
          i +=1
        end 
      end       
    end 

    def valid? 
      validate!
      true
    rescue
      false
    end  
  end  
end    