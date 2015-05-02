require_relative 'view_annotations/annotated_class'


class Aplicacion
  def self.anio_actual
    2015
  end

  def self.anio_anterior
    Aplicacion.anio_actual - 1
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
  extend AnnotatedClass

  attr_accessor :esBasica

  def initialize(elNombre,basica)
    @nombre = elNombre
    @esBasica = basica
  end

  annotation("viewProperty")
  def nombre
    @nombre
  end

  annotation("viewProperty label='Es una materia basica'")
  def es_basica?
    @esBasica
  end
end
