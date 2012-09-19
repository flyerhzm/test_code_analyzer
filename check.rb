require 'code_analyzer'
require './class_method_checker'

filename = "test_class.rb"
content = File.read(filename)

checker = ClassMethodChecker.new
visitor = CodeAnalyzer::CheckingVisitor::Default.new(checkers: [checker])
visitor.check(filename, content)
checker.warnings.each { |warning| puts warning }
