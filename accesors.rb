module Accesors 

  def attr_accessor_with_history(*names)
    names.each do |name|
      history = []
      var_name = "@#{name}".to_sym
      define_method(name) {instance_variable_get(var_name)} 
      define_method("#{name}=".to_sym) do |value| 
        instance_variable_set(var_name, value)
        history << value  
      end
      define_method("#{name}_history".to_sym) {history} 
    end
  end  

  def strong_attr_accessor (name, class_of_name) 
    var_name = "@#{name}".to_sym
    define_method(name) {instance_variable_get(var_name)} 
    define_method("#{name}=".to_sym) do |value|
      raise if name.class != class_of_name 
      instance_variable_set(var_name, value)
    end 
  end 
end   