require_relative '../alumno_agregados'
require_relative '../puede_cursar/rule_evaluator'

class Alumno
  def puede_cursar(mat)
    RuleEvaluator.new(
        # Object.const_get('EsRegularCtx') ,
        EsRegularCtx ,
        NoInscriptoEnMateriaCtx ,
        NoAproboMateriaCtx ,
        CincoBasicasParaCursarNoBasicaCtx
    ).value(PuedeCursarContext.new(self, mat))
  end
end





class PuedeCursarContext
  attr_reader :alumno
  attr_reader :materia

  def initialize(alu,mat)
    @alumno = alu
    @materia = mat
  end
end

class EsRegularCtx
  def value(ctx)
    ctx.alumno.es_regular?
  end

  def msg(ctx)
    "El alumno #{ctx.alumno.nombre} no es regular."
  end
end

class NoInscriptoEnMateriaCtx
  def value(ctx)
    !ctx.alumno.esta_inscripto_en?(ctx.materia)
  end

  def msg(ctx)
    "El alumno #{ctx.alumno.nombre} ya esta inscripto en #{ctx.materia.nombre}."
  end
end

class NoAproboMateriaCtx
  def value(ctx)
    !ctx.alumno.tiene_aprobada?(ctx.materia)
  end

  def msg(ctx)
    "El alumno #{ctx.alumno.nombre} ya tiene aprobada #{ctx.materia.nombre}."
  end
end

class CincoBasicasParaCursarNoBasicaCtx
  def value(ctx)
    ctx.materia.es_basica? ||
      ctx.alumno.materias_aprobadas.select { |m| m.es_basica? }.size >= 5
  end

  def msg(ctx)
    "El alumno #{ctx.alumno.nombre} no llega a cinco materias basicas aprobadas."
  end
end

