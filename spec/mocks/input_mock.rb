class InputMock
  def initialize(return_value)
    @return_value = return_value
  end

  def get_key
    @return_value
  end
end
