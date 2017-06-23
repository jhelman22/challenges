# https://www.reddit.com/r/dailyprogrammer/comments/5as91q/20161102_challenge_290_intermediate_blinking_leds/

class LED
  def initialize
    @data_register = ""
    @loop_register = 0
    @loop_commands = []
    @in_loop = false
  end

  def parse_command(command)
    split = command.split(" ")
    case split[0]
    when /.*:/
      create_loop
    when "ld"
      exec_load(split[1].split(","))
    when "out"
      exec_output(split[1].split(","))
    when "rlca"
      exec_rotate_left
    when "rrca"
      exec_rotate_right
    when "djnz"
      @in_loop = false
      @loop_register -= 1
      if @loop_register > 0
        exec_loop
      else
        @loop_commands = []
      end
    end
  end

  def create_loop
    @in_loop = true
  end

  def exec_load(args)
    if args[0] == "a" # data register
      @data_register = '%08b' % args[1].to_i
    else # loop register
      @loop_register = args[1].to_i
    end
    @loop_commands.push("ld #{args.join(",")}") if @in_loop
  end

  def exec_output(args)
    puts @data_register.gsub(/1/,"*").gsub(/0/,".")
    @loop_commands.push("out #{args.join(",")}") if @in_loop
  end

  def exec_rotate_left
    @data_register = @data_register[1..-1] + @data_register[0]
    @loop_commands.push("rlca") if @in_loop
  end

  def exec_rotate_right
    @data_register = @data_register[-1] + @data_register[0...-1]
    @loop_commands.push("rrca") if @in_loop
  end

  def exec_loop
    @loop_commands.push("djnz")
    @loop_commands.each{|command| parse_command(command)}
  end

end

# INPUT FILE
input = 'reddit_dailyprogrammer/290/intermediate1.txt'

led = LED.new
File.foreach(input){|command| led.parse_command(command)}
