require_relative '../alumno_agregados'

class Alumno

  def puede_cursar?(mat)
    #condiciones iniciales
    if (self.es_regular? && !self.esta_inscripto_en?(mat) &&
        !self.tiene_aprobada?(mat))
      # si la materia no es basica, el alumno debe tener al menos 5 basicas aprobadas
      if (mat.es_basica?)
        true
      else
        self.materias_aprobadas.select { |m| m.es_basica? }.size >= 5
      end
    else
      false
    end
  end

end