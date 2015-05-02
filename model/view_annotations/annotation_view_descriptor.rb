require_relative '../view/class_descriptor'

class ViewDescriptorFromAnnotation
  def initialize(klass)
    @klass = klass
  end

  def descriptor
    descriptor = ClassDescriptor.new(@klass)
    viewAnnotations = @klass.annotations.select { |annot| annot.name == "viewProperty" }
    propDescriptors = viewAnnotations.collect { |annot| self.propDescriptorFromAnnotation(annot) }
    propDescriptors.each { |prop| descriptor.add_property(prop) }
    descriptor
  end

  def propDescriptorFromAnnotation(annot)
    descr = PropertyDescriptor.new(annot.selector)
    labelProp = annot.properties.detect { |prop| prop.name == "label"}
    if (!labelProp.nil?)
      descr.label = labelProp.value
    end
    descr
  end
end