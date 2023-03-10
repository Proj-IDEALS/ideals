ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)

  fixtures :all

  unless Webpacker.compiler.fresh?
    puts "== Webpack compiling =="
    Webpacker.compiler.compile
    puts "== Webpack compiled =="
  end
end
