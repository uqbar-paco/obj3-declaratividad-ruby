require 'rspec'
require_relative '../../model/facu_modelo_basico'
require_relative '../../model/alumno'
require_relative '../../model/puede_cursar/puede_cursar_rule_msg'

require_relative '../spec_utils'
require_relative '../puede_cursar/alumno_spec_utils'

describe 'Alumno' do

  before {
    init_alumno_test
  }

  it 'deberia decir bien quien puede cursar que' do
    expect(@juan.puede_cursar(mat("Intro")).result).to be false
    expect(@juan.puede_cursar(mat("Intro")).messages).to eq ["El alumno #{@juan.nombre} ya tiene aprobada Intro."]
    expect(@juan.puede_cursar(mat("BD")).result).to be false
    expect(@juan.puede_cursar(mat("BD")).messages).to eq ["El alumno #{@juan.nombre} ya esta inscripto en BD."]
    expect(@juan.puede_cursar(mat("Redes")).result).to be false
    expect(@juan.puede_cursar(mat("Redes")).messages).to eq ["El alumno #{@juan.nombre} no llega a cinco materias basicas aprobadas."]
    expect(@juan.puede_cursar(mat("Obj2")).result).to be true
    pepe = Alumno.new
    pepe.nombre = "Pepe"
    pepe.curso(mat("Intro"), 2014, 6)
    expect(pepe.puede_cursar(mat("Intro")).result).to be false
    expect(pepe.puede_cursar(mat("Intro")).messages.sort).to eq (
        ["El alumno #{pepe.nombre} no es regular." , "El alumno #{pepe.nombre} ya tiene aprobada Intro."].sort
    )
  end

end

