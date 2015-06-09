require_relative '../alumno'
require_relative '../alumno_agregados'
require_relative 'descriptor_dsl_support'

=begin
The addition to the model Alumno class in order to define a descriptor based in
the simple DSL defined in DesciptorDslSupport.
Cfr. descriptor_dsl_support.rb.
=end

class Alumno
  extend DesciptorDslSupport
end