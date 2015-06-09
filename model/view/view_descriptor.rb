require_relative '../view/HtmlView'
require_relative 'class_descriptor'
require_relative 'basic_view_descriptor'

=begin
console or HTML views of an object, based on a descriptor.
Shows a combination of inheritance and mixin-based composition.
Cfr. basic_class_descriptor.rb
=end

class DescriptorView
  include BasicDescriptorView

  def initialize(the_model, the_descriptor)
    @model = the_model
    @descriptor = the_descriptor
  end

end

class DescriptorHtmlView < DescriptorView
  include BasicDescriptorHtmlView
end


class DescriptorConsoleView < DescriptorView
  include BasicDescriptorConsoleView
end
