require_relative 'annotation'

=begin
The ability of processing a very simple, String-based version of annotations.
Cfr. alumno_annotated.rb.
=end

module AnnotatedClass
  attr_reader :annotations

  def annotation(text)
    @annotation_next_method = AnnotationParser.new(text).parse
  end

  def method_added(selector)
    if (!@annotation_next_method.nil?)
      @annotation_next_method.selector = selector
      add_annotation(@annotation_next_method)
      @annotation_next_method = nil
    end
  end

  def annotations
    if (@annotations.nil?)
      @annotations = []
    end
    @annotations
  end

  def add_annotation(annot)
    annotations << annot
  end
end