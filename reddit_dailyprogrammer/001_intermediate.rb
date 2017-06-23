# https://www.reddit.com/r/dailyprogrammer/comments/pihtx/intermediate_challenge_1/

require 'date'

class Scheduler
  def initialize
    @events = []
    File.foreach('001/events.csv') do |line|
      event_arr = line.chomp.split(",")
      @events.push({name: event_arr[0], date: Date.parse(event_arr[1])}) unless event_arr.empty?
    end
  end

  def run
    puts "Welcome to Scheduler! Manage your events below."
    list_events
  end

  def list_events
    puts "\n------------------------------------"
    puts "----------List of events------------"
    puts "------------------------------------"
    if @events.empty?
      puts "No events scheduled"
    else
      @events.each_with_index{|event,i| puts "#{i+1}. #{event[:name]} happening on #{event[:date]}" }
    end
    puts "------------------------------------"
    puts "Total number of events: #{@events.count}"
    puts "------------------------------------"
    print "Type an event number to edit/delete an event, '+' to add a new event, or 'q' to quit scheduler: "
    selection = gets.chomp
    case selection
    when '+'
      add_event
    when 'q'
      exit_scheduler
    else
      edit_event(selection.to_i-1)
    end
  end

  def add_event
    puts "\n------------------------------------"
    puts "----------Add new event-------------"
    puts "------------------------------------"
    print "Enter the name of your event: "
    name = gets.chomp
    print "Enter the date of your event (yyyy-mm-dd): "
    date = gets.chomp
    @events.push({ name: name, date: Date.parse(date) })
    @events.sort_by!{|event| event[:date] }
    puts "\nEvent successfully added!"
    list_events
  end

  def edit_event(event_index)
    puts "\n------------------------------------"
    puts "--------Edit/delete event-----------"
    puts "------------------------------------"
    event = @events[event_index]
    puts "#{event_index}. #{event[:name]} happening on #{event[:date]}"
    puts "------------------------------------"
    print "Type 'e' to edit this event, 'd' to delete it, or 'c' to cancel and go back to the list of events: "
    selection = gets.chomp
    case selection
    when 'e'
      @events.slice!(event_index)
      print "\nEnter new name or press ENTER to keep the current name: "
      name = gets.chomp
      print "Enter new date or press ENTER to keep the current date (yyyy-mm-dd): "
      date = gets.chomp
      @events.push({ name: name.empty? ? event[:name] : name, date: date.empty? ? event[:date] : Date.parse(date) })
      @events.sort_by!{|e| e[:date] }
      puts "\nEvent successfully updated!"
    when 'd'
      @events.slice!(event_index)
      puts "\nEvent successfully deleted!"
    end
    list_events
  end

  def exit_scheduler
    f = File.open('001/events.csv', 'w+')
    f.puts @events.map{|event| "#{event[:name]},#{event[:date]}"}.join("\n")
    f.close

    puts "\n\nEvents automatically saved...Goodbye!"
    exit(0)
  end
end

Scheduler.new.run
