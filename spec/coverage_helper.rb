if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start
  SimpleCov.minimum_coverage 90
end
