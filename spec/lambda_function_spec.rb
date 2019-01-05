require "spec_helper"
require_relative "../lambda_function"

RSpec.describe "#lambda_handler" do
  context "when no line of code is provided" do
    it "fails gracefully" do
      resp = lambda_handler(event: {}, context: {})

      expect(resp).to eq(statusCode: 200, stdout: "", return: nil)
    end
  end

  context "when a line of code is provided" do
    let(:statement) {'puts "howdy"' }

    subject { lambda_handler(event: { 'statement' => statement }, context: {}) }

    it "runs said statement" do
      expect(subject).to include(statusCode: 200)
      expect(subject).to include(stdout: "howdy\n")
      expect(subject).to include(return: nil)
    end

    context "when statement is invalid" do
      let(:statement) { 'a_variable_or_method_that_does_not_exist' }
      let(:error_message) do
        "undefined local variable or method `a_variable_or_method_that_does_not_exist'"
      end

      it "returns a descriptive error" do
        expect(subject).to include(statusCode: 500)
        expect(subject).to include(return: nil)
        expect(subject[:error]).to include(error_message)
      end
    end
  end
end
