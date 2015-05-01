class BasicObject
  def if_nil(alt_value)
    self
  end
end

class NilClass
  def if_nil(alt_value)
    alt_value
  end
end

