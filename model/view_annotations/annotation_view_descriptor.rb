require_relative '../view/class_descriptor'

class ViewDescriptorFromAnnotation
  def initialize(klass)
    @klass = klass
  end

  def descriptor
    descriptor = ClassDescriptor.new(@klass)
    view_annotations = @klass.annotations.select { |annot| annot.name == "viewProperty" }
    prop_descriptors = view_annotations.collect { |annot| self.prop_descriptor_from_annotation(annot) }
    prop_descriptors.each { |prop| descriptor.add_property(prop) }
    descriptor
  end

  def prop_descriptor_from_annotation(annot)
    descr = PropertyDescriptor.new(annot.selector)
    label_prop = annot.properties.detect { |prop| prop.name == "label"}
    if (!label_prop.nil?)
      descr.label = label_prop.value
    end
    descr
  end
end