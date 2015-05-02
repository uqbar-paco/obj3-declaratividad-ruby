require_relative '../view/HtmlView'
require_relative 'class_descriptor'
require_relative 'basic_view_descriptor'

class DescriptorView
  include BasicDescriptorView

  def initialize(theModel, theDescriptor)
    @model = theModel
    @descriptor = theDescriptor
  end

end

class DescriptorHtmlView < DescriptorView
  include BasicDescriptorHtmlView
end


class DescriptorConsoleView < DescriptorView
  include BasicDescriptorConsoleView
end