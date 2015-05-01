require 'rspec'
require_relative '../model/facu_modelo_basico'

require_relative '../spec/spec_utils'

describe 'Cursada' do

  before {
    init_tpi
  }

  it 'deberia decir correctamente si esta aprobada o no' do
    curs = Cursada.new(mat("Intro"), 2013, 8)
    expect(curs.esta_aprobada?).to be true
    expect(curs.nota).to eq 8
  end

end

