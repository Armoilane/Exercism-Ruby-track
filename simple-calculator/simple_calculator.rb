class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation
    raise ArgumentError unless first_operand.is_a?(Numeric) &&
                               second_operand.is_a?(Numeric)

    begin
      result = first_operand.send(operation,second_operand)
      '%<first_operand>s %<operation>s %<second_operand>s = %<result>s' % {
                                          first_operand: first_operand,
                                          operation: operation,
                                          second_operand: second_operand,
                                          result: result
                                        }
    rescue ZeroDivisionError => e
      'Division by zero is not allowed.'
    end
  end

end
