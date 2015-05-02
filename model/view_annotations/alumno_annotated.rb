require_relative 'annotated_class'

class Alumno
  extend AnnotatedClass

  def initialize
    @cursadas = []
    @inscripciones = []
  end

  annotation("viewProperty")
  def nombre
    @nombre
  end

  def nombre=(elNombre)
    @nombre = elNombre
  end

  annotation("viewProperty")
  def legajo
    @legajo
  end

  def legajo=(elLegajo)
    @legajo = elLegajo
  end

  def curso(materia,anio,nota)
    @cursadas << Cursada.new(materia,anio,nota)
  end

  def inscribir_en(mat)
    @inscripciones << mat
  end

  annotation("viewProperty label='Cant. materias aprobadas'")
  def cantidad_materias_aprobadas
    @cursadas.count { |c| c.nota >= 4 }
  end

  def cursadas
    @cursadas
  end

  def esta_inscripto_en?(mat)
    @inscripciones.include?(mat)
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
