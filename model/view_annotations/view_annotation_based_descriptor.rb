require_relative '../view/basic_view_descriptor'
require_relative '../../model/view_annotations/annotation_view_descriptor'

=begin
Annotation-based console and HTML view.
Notice that they only differ from DescriptorHtmlView / DescriptorConsoleView
in the initialization.
Cfr. view_descriptor.rb
=end

class DescriptorFromAnnotationView
  include BasicDescriptorView

  def initialize(the_model)
    @model = the_model
    @descriptor = ViewDescriptorFromAnnotation.new(the_model.class).descriptor
  end

end

class DescriptorFromAnnotationHtmlView < DescriptorFromAnnotationView
  include BasicDescriptorHtmlView
end


class DescriptorFromAnnotationConsoleView < DescriptorFromAnnotationView
  include BasicDescriptorConsoleView
end