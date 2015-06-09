require_relative '../view/class_descriptor'

=begin
Implementation of a very simple DSL to define a ClassDescriptor.
Cfr. class_descriptor.rb, and the spec in view_dsl_descriptor_exec.rb.
=end

module DesciptorDslSupport

  def build_descriptor(&block)
    d = DescriptorDslBuilder.new(self)
    d.eval_definition(&block)
    d.class_descriptor
  end

end


class DescriptorDslBuilder
  def initialize(klass)
    @class_descriptor = ClassDescriptor.new(klass)
    @current_property = nil
  end

  def eval_definition(&block)
    self.instance_eval(&block)
  end

  def class_descriptor
    self.change_property
    @class_descriptor
  end

  def change_property
    @class_descriptor.add_property(@current_property) unless @current_property.nil?
    @current_property = nil
  end

  def property(prop)
    self.change_property
    @current_property = PropertyDescriptor.new(prop)
  end

  def block(&blk)
    self.change_property
    @current_property = BlockDescriptor.new(blk)
  end

  def label(a_label)
    @current_property.label=a_label
  end
end