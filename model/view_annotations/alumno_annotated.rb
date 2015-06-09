require_relative 'annotated_class'

class Alumno
  extend AnnotatedClass

  def initialize
    @cursadas = []
    @inscripciones = []
  end

  # por que no directamente
  # view_property
  annotation("view_property")
  def nombre
    @nombre
  end

  def nombre=(el_nombre)
    @nombre = el_nombre
  end

  annotation("view_property")
  def legajo
    @legajo
  end

  def legajo=(el_legajo)
    @legajo = el_legajo
  end

  def curso(materia,anio,nota)
    @cursadas << Cursada.new(materia,anio,nota)
  end

  def inscribir_en(mat)
    @inscripciones << mat
  end

  annotation("view_property label='Cant. materias aprobadas'")
  # annotation(:view_property, #{label: 'Cant. materias aprobadas'})
  # view_property.label 'Cant. materias aprobadas'
  def cantidad_materias_aprobadas
    @cursadas.count { |c| c.nota >= 4 }
  end

  def cursadas
    @cursadas
  end

  def esta_inscripto_en?(mat)
    @inscripciones.include?(mat)
  end

  annotation("view_property label='Aprobo Intro a la Programacion'")
  def aprobo_intro
    #...
  end
end


=begin
Alumno.annotations.each { |annot|
  puts "#{annot.selector} tiene annotation #{annot.name}"
  if (!annot.properties.empty?)
    puts "     con atributo #{annot.properties[0].name} que tiene valor #{annot.properties[0].value}"
  end
}
=end
