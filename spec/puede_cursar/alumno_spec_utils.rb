def init_alumno_test
  init_tpi
  init_juan
end

def puede_cursar_tests
  expect(@juan.puede_cursar?(mat("Intro"))).to be false
  expect(@juan.puede_cursar?(mat("BD"))).to be false
  expect(@juan.puede_cursar?(mat("Redes"))).to be false
  expect(@juan.puede_cursar?(mat("Obj2"))).to be true
  expect(Alumno.new.puede_cursar?(mat("Obj1"))).to be false
end