require 'rspec'
require_relative '../model/facu_modelo_basico'

describe 'Basics' do

  it 'should obtain a class from a String' do
    expect(Object.const_get('Materia').new("Intro",true).nombre).to eq "Intro"
  end

end

