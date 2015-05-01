require 'rspec'
require_relative '../model/facu_modelo_basico'
require_relative '../model/pequenio_metodo_misterioso'

require_relative '../spec/spec_utils'

describe 'alumno' do

  before {
    init_tpi
    init_juan
  }

  it 'el misterio deberia dar el resultado esperado' do
    expect(@juan.misterio1).to be 3
    expect(@juan.misterio2).to be 3
  end

end
