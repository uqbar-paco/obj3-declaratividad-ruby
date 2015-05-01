require 'rspec'
require_relative '../../model/facu_modelo_basico'
require_relative '../../model/puede_cursar/puede_cursar_rule_msg'

require_relative '../spec_utils'
require_relative '../puede_cursar/alumno_spec_utils'

describe 'Alumno' do

  before {
    init_alumno_test
  }

  it 'deberia decir bien quien puede cursar que' do
     puts RuleEvaluator.new(
        # Object.const_get('EsRegularCtx') ,
        EsRegularCtx ,
        NoInscriptoEnMateriaCtx ,
        NoAproboMateriaCtx ,
        CincoBasicasParaCursarNoBasicaCtx
    ).report(PuedeCursarContext.new(@juan, mat("Intro")))
  end

end

