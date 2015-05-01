require 'rspec'
require_relative '../../model/facu_modelo_basico'
require_relative '../../model/alumno'
require_relative '../../model/puede_cursar/puede_cursar_imperativo'

require_relative '../../spec/spec_utils'
require_relative '../puede_cursar/alumno_spec_utils'

describe 'Alumno' do

  before {
    init_alumno_test
  }

  it 'deberia decir bien quien puede cursar que' do
    puede_cursar_tests
  end

end

