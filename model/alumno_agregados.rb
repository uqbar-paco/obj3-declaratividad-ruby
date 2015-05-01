class Alumno

  def cursadas_aprobadas
    self.cursadas.select { |c| c.esta_aprobada? }
  end

  def materias_aprobadas
    self.cursadas_aprobadas.collect { |c| c.materia }
  end

  def tiene_aprobada?(mat)
    self.materias_aprobadas.include?(mat)
  end

  def es_regular?
    self.cursadas_aprobadas.select { |c| c.anio == Aplicacion.anio_anterior }.size >= 2
  end

end