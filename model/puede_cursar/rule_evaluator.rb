class RuleEvaluator
  def initialize(*the_rule_class)
    @rule_classes = the_rule_class
  end

  def rules
    @rule_classes.collect { |klass| klass.new }
  end

  def value(ctx)
    failing_rules = rules.reject { |rule| rule.value(ctx) }
    RuleResult.new(failing_rules.empty?, failing_rules.collect { |rule| rule.msg(ctx) } )
  end

  def report(ctx)
    rules.collect { |rule| [rule.class.to_s , rule.value(ctx)] }
  end
end


class RuleResult
  attr_reader :result
  attr_reader :messages

  def initialize(theResult, theMessages)
    @result = theResult
    @messages = theMessages
  end
end


