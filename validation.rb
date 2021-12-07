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
        loop do
          send("validate_#{value[i].to_s}".to_sym, key, value, i)
          i +=2
          break if value[i] == nil    
        end 
      end     
    end 

    def validate_type(key, value,i)
      raise 'Type error' if key.class != value[i+1]
    end 

    def validate_format(key, value, i) 
      raise 'Format error'if key !~ value[i+1]
    end 
    
    def validate_presence(key, value, i= nil )
      raise 'Name can not be empry' if key.empty?
      raise 'Name can not be nil' if key == nil    
    end   

    def valid? 
      validate!
      true
    rescue
      false
    end  
  end  
end    