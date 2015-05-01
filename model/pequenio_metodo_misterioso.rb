require_relative "../model/facu_modelo_basico"

#"que hace" vs "que devuelve"
class Alumno
  def misterio1
    result = 0
    max = @cursadas.length - 1
    for i in (0..max)
      if (@cursadas[i].materia.nombre == 'Intro') then
        result = result + 1
      end
    end
    result
  end


# sigue abajo












  def misterio2
    @cursadas.count { |c| c.materia.nombre == "Intro" }
  end
end
