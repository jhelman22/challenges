# https://www.reddit.com/r/dailyprogrammer/comments/pjsdx/difficult_challenge_2/

class Stopwatch
  def initialize
    @startTime = nil
    @stopTime = nil
    @laps = []
  end

  def start
    @startTime ||= Time.now
    @stopTime = nil
  end

  def stop
    @stopTime = Time.now
  end

  def lap
    @laps.push(Time.now)
  end

  def reset
    @startTime = nil
    @stopTime = nil
    @laps = nil
  end

  def print
    if @startTime
      currTimer = (@stopTime || Time.now) - @startTime
      puts "\n\n--------STOPWATCH-------------"
      puts "%02d:%02d" % [(currTimer / 60).to_i, (currTimer % 60).to_i]
      puts "------------------------------"
      @laps.each_with_index do |lap, i|
        lapTimer = lap - @startTime
        puts "Lap #{i+1}: %02d:%02d" % [(lapTimer / 60).to_i, (lapTimer % 60).to_i]
      end 
    else
      puts "\n\nYou need to start it first..."
    end
  end
end

stop_watch = Stopwatch.new
while true
  puts "Stopwatch v1. Enter start, stop, lap, reset, print or quit"
  print ">"
  input = gets.chomp
  
  break if input == "quit"
  stop_watch.send(input)
end
