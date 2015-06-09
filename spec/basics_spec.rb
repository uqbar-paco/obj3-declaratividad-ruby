require 'rspec'
require_relative '../model/facu_modelo_basico'

class Dog
  attr_accessor :name
  attr_accessor :breed
  attr_accessor :loudness

  def set_action(&acc)
    @action = acc
  end

  def action
    @action
  end

  def act
    @action.call(self) + 4
  end

  def set_name(the_name)
    @name = the_name
  end

  def set_stuff(thing1,thing2)
    @name = thing1
    @breed = thing2
  end
end

describe 'Basics' do

  it 'should obtain a class from a String' do
    expect(Object.const_get('Materia').new("Intro",true).nombre).to eq "Intro"
  end

  it 'a Dog should act' do
    # basic dog setting
    chicho = Dog.new
    chicho.name='Chicho'
    chicho.breed='caniche'
    chicho.loudness=10

    # try a lambda
    proc = lambda {|p| p.loudness * 2}
    expect(proc.call(chicho)).to eq 20

    # set action as a block
    chicho.set_action {|p| p.loudness * 2}
    expect(chicho.act).to eq 24

    # try semicolon
    chicho.set_name 'chicho_1'; chicho.set_name 'chicho_2'
    expect(chicho.name).to eq 'chicho_2'

    # try binary method without braces
    chicho.set_stuff 'chicho_3', 'perro'
    expect(chicho.breed).to eq 'perro'
  end

end

