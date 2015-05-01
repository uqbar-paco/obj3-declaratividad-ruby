class Alumno
  attr_accessor :nombre
  attr_accessor :legajo

  def initialize
    @cursadas = []
    @inscripciones = []
  end

  def curso(materia,anio,nota)
    @cursadas << Cursada.new(materia,anio,nota)
  end

  def inscribir_en(mat)
    @inscripciones << mat
  end

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


