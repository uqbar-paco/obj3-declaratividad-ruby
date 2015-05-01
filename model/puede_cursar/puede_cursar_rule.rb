require_relative '../alumno_agregados'

class Alumno
  def puede_cursar?(mat)
    [   EsRegular.new(self) ,
        NoInscriptoEnMateria.new(self, mat) ,
        NoAproboMateria.new(self, mat) ,
        CincoBasicasParaCursarNoBasica.new(self, mat)
    ].all? { |r| r.value }
  end
end





class ReglaAlumnoMateria
  attr_reader :alumno
  attr_reader :materia

  def initialize(alu, mat=nil)
    @alumno = alu
    @materia = mat
  end
end

class EsRegular < ReglaAlumnoMateria
  def value
    alumno.es_regular?
  end
end

class NoInscriptoEnMateria < ReglaAlumnoMateria
  def value
    !alumno.esta_inscripto_en?(materia)
  end
end

class NoAproboMateria < ReglaAlumnoMateria
  def value
    !alumno.tiene_aprobada?(materia)
  end
end

class CincoBasicasParaCursarNoBasica < ReglaAlumnoMateria
  def value
    materia.es_basica? ||
      alumno.materias_aprobadas.select { |m| m.es_basica? }.size >= 5
  end
end

