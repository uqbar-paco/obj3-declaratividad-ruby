require_relative '../view/basic_view_descriptor'
require_relative '../../model/view_annotations/annotation_view_descriptor'

class DescriptorFromAnnotationView
  include BasicDescriptorView

  def initialize(theModel)
    @model = theModel
    @descriptor = ViewDescriptorFromAnnotation.new(theModel.class).descriptor
  end

end

class DescriptorFromAnnotationHtmlView < DescriptorFromAnnotationView
  include BasicDescriptorHtmlView
end


class DescriptorFromAnnotationConsoleView < DescriptorFromAnnotationView
  include BasicDescriptorConsoleView
end