require_relative '../basic_additions'


module DescriptorUtils
  def label=(label)
    @label = label
    self
  end
end


class PropertyDescriptor
  include DescriptorUtils

  def initialize(field)
    @field = field
  end

  def label
    @label.if_nil(computed_label)
  end

  def computed_label
    @field.to_s.capitalize
  end

  def value(obj)
    obj.send(@field).to_s
  end

  def to_property_descriptor
    self
  end

end

class BlockDescriptor
  include DescriptorUtils

  def initialize(block, label=nil)
    @label = label
    @block = block
  end

  def label
    @label
  end

  def value(obj)
    @block.call(obj)
  end

  def to_property_descriptor
    self
  end
end


class ClassDescriptor
  include DescriptorUtils

  def initialize(klass, *props)
    @klass = klass
    @props = props.collect { |prop| prop.to_property_descriptor }
  end

  def add_property(prop)
    @props << prop
  end

  def properties
    @props
  end

  def label
    @label.if_nil(computed_label)
  end

  def computed_label
    @klass.name.to_s.capitalize
  end

  def to_class_descriptor
    self
  end

end



class Symbol
  def to_property_descriptor
    PropertyDescriptor.new(self)
  end
end



