class Annotation
  attr_accessor :name
  attr_reader :properties
  attr_accessor :selector

  def initialize(name)
    @name = name
    @properties = []
  end

  def addProperty(property)
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

  def annotationName
    @text.split.first
  end

  def annotationProperty
    if (@text.split.size < 2)
      return nil
    end
    AnnotationPropertyParser.new(@text.split.drop(1).join(" ")).parse
  end

  def parse
    annotation = Annotation.new(annotationName)
    if (!annotationProperty.nil?)
      annotation.addProperty(annotationProperty)
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
    if (value[0] == "'")
      value = value[1..-1]
    end
    if (value[-1] == "'")
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

