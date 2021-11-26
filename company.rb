module Company 
attr_reader :company 
  def add_company(company) 
    if not company.empty?
      @company = company
    end 
  end 
end 