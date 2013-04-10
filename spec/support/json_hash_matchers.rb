module JsonHashMatchers
  class AbstractJsonPathMatcher
    def initialize(expected)
      @expected = expected
    end

    def at_path(path)
      @path=path.split '/'
      self
    end

    def matches?(subject)
      @subject = subject
      false
    end

    protected
    def subject_at_path
      return @subject unless @path
      @path.reduce(@subject) do |subset, key|
        if subset.kind_of? String or not subset.responds_to? :[] then raise "path #{@path.join('/')} does not exist at #{key}" end
        begin
          key=Integer(key)
        rescue ArgumentError
        end
        subset[key]
      end
    end
  end

  class HaveValue < AbstractJsonPathMatcher

    def matches?(subject)
      super
      # Satisfy expectation here. Return false or raise an error if it's not met.
      subject_at_path.should == @expected
      true
    end

    def failure_message
      "expected #{@subject.inspect} to have value #{@expected.inspect} at path #{@path.join '/'}, but it didn't"
    end

    def negative_failure_message
      "expected #{@subject.inspect} not to have value #{@expected.inspect} at path #{@path.join '/'}, but it did"
    end
  end

  class HaveLength < AbstractJsonPathMatcher

    def matches?(subject)
      super
      # Satisfy expectation here. Return false or raise an error if it's not met.
      subject_at_path.should be_size @expected
      true
    end

    def failure_message
      "expected #{@subject.inspect} to have length #{@expected.inspect} at path #{@path.join '/'}, but it didn't"
    end

    def negative_failure_message
      "expected #{@subject.inspect} not to have length #{@expected.inspect} at path #{@path.join '/'}, but it did"
    end
  end

  def have_value(expected)
    HaveValue.new(expected)
  end
  def have_length(expected)
    HaveLength.new(expected)
  end
end
