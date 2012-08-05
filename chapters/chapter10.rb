# encoding: utf-8
require 'active_support/all'

class GrandFatherClock
  def at_the_hour
    how_many_times = (Time.now.hour % 12)
    (how_many_times.zero? ? 12 : how_many_times).times do
      yield
    end
  end
end
clock = GrandFatherClock.new
clock.at_the_hour do
  puts "ボーン"
end



class ProgramLogger
  def log(description)
    puts %|Beginning "#{description} block"...|
    results = yield
    puts %|..."#{description} block" finished, returning:  #{results}|
  end
end
logger = ProgramLogger.new
logger.log("outer") do
  logger.log("some little"){ 5 }
  logger.log("yet another"){ "I like Thai food!" }
  false
end


class BetterLogger
  def log(description, nesting_level = 0)
    indent = "    " * nesting_level
    puts %|#{indent}Beginning "#{description} block"...|
    results = yield nesting_level + 1
    puts %|#{indent}..."#{description} block" finished, returning:  #{results}|
  end
end
logger = BetterLogger.new
logger.log("outer") do |level|
  logger.log("some little", level) do |level|
    logger.log("teeny-tiny", level) do
      "lots of love"
    end
    42
  end
  logger.log("yet another", level) do 
    "I love Indian food!"
  end
  true
end