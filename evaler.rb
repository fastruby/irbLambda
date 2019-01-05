class Evaler
  def self.evaluate(statement)
    result = {}

    original_stdout = $stdout
    $stdout = StringIO.new

    result[:return] = eval(statement)
    result[:stdout] = $stdout.string

    result
  ensure
    $stdout = original_stdout
    result
  end

  def self.with_captured_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end
