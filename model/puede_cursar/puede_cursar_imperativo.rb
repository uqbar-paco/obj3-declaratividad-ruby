class Alumno

  def puede_cursar?(mat)
    if (self.esta_inscripto_en?(mat))
      return false
    end
    cuantasAA = 0
    cuantasBasicas = 0
    max = @cursadas.length - 1
    for i in (0..max)
      if (@cursadas[i].nota >= 4)
        if (@cursadas[i].materia == mat)
          return false
        end
        if (@cursadas[i].anio == Aplicacion.anio_anterior)
          cuantasAA = cuantasAA + 1
        end
        if (@cursadas[i].materia.es_basica?)
          cuantasBasicas = cuantasBasicas + 1
        end
      end
    end
    if (cuantasAA < 2)
      return false
    end
    if ((!mat.es_basica?) && cuantasBasicas < 5)
      return false
    end
    return true
  end

end