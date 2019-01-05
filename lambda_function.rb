require 'json'
require_relative './evaler'

def lambda_handler(event:, context:)
  begin
    statement = event["statement"].to_s
    result = Evaler.evaluate(statement)

    {
      statusCode: 200,
      return: result[:return],
      stdout: result[:stdout]
    }
  rescue => err
    {
      statusCode: 500,
      return: nil,
      stdout: err.backtrace,
      error: err.message
    }
  end
end
