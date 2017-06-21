# INPUT FILE
input = 'reddit_dailyprogrammer/291_easy/sample.txt'

goldie_weight = nil
goldie_temp = nil
seats = []

File.foreach(input) do |line|
  seat = line.chomp.split(" ")
  unless goldie_weight && goldie_temp
    goldie_weight = seat[0].to_i
    goldie_temp = seat[1].to_i
  else
    seats << seat.map(&:to_i)
  end
end

puts seats.each_with_index.map{|seat,i| seat[0] >= goldie_weight && seat[1] <= goldie_temp ? i+1 : nil }.reject(&:nil?).join(" ")
