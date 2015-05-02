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

  def initialize(la_mat,el_anio,la_nota)
    @materia = la_mat
    @anio = el_anio
    @nota = la_nota
  end

  def esta_aprobada?
    nota >= 4
  end
end


class Materia
  extend AnnotatedClass

  attr_accessor :es_basica

  def initialize(el_nombre,basica)
    @nombre = el_nombre
    @es_basica = basica
  end

  annotation("view_property")
  def nombre
    @nombre
  end

  annotation("view_property label='Es una materia basica'")
  def es_basica?
    @es_basica
  end
end
