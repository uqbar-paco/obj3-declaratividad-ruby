require_relative '../model/facu_modelo_basico'

# utilitary stuff
def mat(elNombre)
  @tpi.detect { |m| m.nombre == elNombre}
end

def init_tpi
  @tpi = []
  @tpi << Materia.new("Intro", true)
  @tpi << Materia.new("Orga", true)
  @tpi << Materia.new("Mate1", true)
  @tpi << Materia.new("BD", true)
  @tpi << Materia.new("EstrDatos", true)
  @tpi << Materia.new("Obj1", true)
  @tpi << Materia.new("Obj2", true)
  @tpi << Materia.new("Redes", false)
  @tpi << Materia.new("SO", false)
  @tpi << Materia.new("Conc", false)
end

def init_juan
  @juan = Alumno.new
  @juan.nombre= "Juan Darthes"
  @juan.legajo= 20401
  @juan.curso(mat("Intro"), 2012, 2)
  @juan.curso(mat("Orga"), 2012, 2)
  @juan.curso(mat("Intro"), 2013, 2)
  @juan.curso(mat("Orga"), 2013, 6)
  @juan.curso(mat("Mate1"), 2013, 8)
  @juan.curso(mat("Intro"), 2014, 10)
  @juan.curso(mat("BD"), 2014, 2)
  @juan.curso(mat("Obj1"), 2014, 7)
  @juan.inscribir_en(mat("BD"))
end

