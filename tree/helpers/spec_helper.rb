require_relative '../exceptions/assertion_error'

module SpecHelper
  
    def self.assert_equals? output, expected_output
      (output == expected_output)? true : (raise AssertionError.new("Assertion mismatch expected: #{expected_output} but actual_output: #{output.inspect}"))
    end

end
