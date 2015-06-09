=begin
The behaviours needed to support AnnotatedClass, cfr. annotated_class.rb.
=end

class Annotation
  attr_accessor :name
  attr_reader :properties
  attr_accessor :selector

  def initialize(name)
    @name = name
    @properties = []
  end

  def add_property(property)
    @properties << property
  end
end


class AnnotationProperty
  attr_accessor :name
  attr_accessor :value

  def initialize(name,value)
    @name = name
    @value = value
  end
end


class AnnotationParser
  def initialize(text)
    @text = text
  end

  def annotation_name
    @text.split.first
  end

  def annotation_property
    if @text.split.size < 2
      return nil
    end
    AnnotationPropertyParser.new(@text.split.drop(1).join(" ")).parse
  end

  def parse
    annotation = Annotation.new(annotation_name)
    if !annotation_property.nil?
      annotation.add_property(annotation_property)
    end
    annotation
  end
end


class AnnotationPropertyParser
  def initialize(str)
    @text = str
  end

  def parse
    parts = @text.split("=")
    value = parts.last
    if value[0] == "'"
      value = value[1..-1]
    end
    if value[-1] == "'"
      value = value[0..-2]
    end
    AnnotationProperty.new(parts.first, value)
  end
end


=begin
puts 2 != 3
str = "pepe label='Cant. materias aprobadas'"
puts AnnotationParser.new("pepe label='Cant. materias aprobadas'").parse.properties.first.value
puts AnnotationParser.new("pepe label='Cant. materias aprobadas'").annotationName
puts AnnotationParser.new("pepe label='Cant. materias aprobadas'").annotationProperty.name
puts AnnotationParser.new("pepe label='Cant. materias aprobadas'").annotationProperty.value
=end

