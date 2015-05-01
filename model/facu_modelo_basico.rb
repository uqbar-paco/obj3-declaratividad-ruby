class Aplicacion
  def self.anio_actual
    2015
  end

  def self.anio_anterior
    Aplicacion.anio_actual - 1
  end
end


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


class Cursada
  attr_accessor :materia
  attr_accessor :anio
  attr_accessor :nota

  def initialize(laMat,elAnio,laNota)
    @materia = laMat
    @anio = elAnio
    @nota = laNota
  end

  def esta_aprobada?
    nota >= 4
  end
end


class Materia
  attr_accessor :nombre
  attr_accessor :esBasica

  def initialize(elNombre,basica)
    @nombre = elNombre
    @esBasica = basica
  end

  def es_basica?
    @esBasica
  end
end
