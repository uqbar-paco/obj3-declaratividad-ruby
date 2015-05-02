require 'xmlsimple'
require_relative '../view/class_descriptor'

class ViewDescriptorFromXml

  attr_reader :xml_map

  def initialize(xml_source)
    @xml_map=XmlSimple.xml_in(xml_source)
  end

  def descriptor
    klass=Object.const_get xml_map['class']
    descriptor=ClassDescriptor.new(klass)
    prop_descriptors = xml_map['view_property'].collect { |prop_map| self.prop_descriptor_from_map prop_map }
    prop_descriptors.each { |prop| descriptor.add_property(prop) }
    descriptor
  end

  def prop_descriptor_from_map(prop_map)
    prop_descriptor=PropertyDescriptor.new(prop_map['name'])
    if !prop_map['label'].nil?
      prop_descriptor.label =prop_map['label']
    end
    prop_descriptor
  end


end