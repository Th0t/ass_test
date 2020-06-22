def rectangle(x, y, la, ra, bc, mc, reverse_last_angles)
  return puts la if (x == 1 && y == 1)

  output = []

  y.times do |index|
    if index == 0 || index == y-1
      line = bc * x
      line[0] = la
      line[-1] = ra unless x == 1
      if reverse_last_angles && index == y-1 && y != 1
        line[0] = ra
        line[-1] = la unless x == 1
      end
    else
      line = mc * x
      line[0] = bc
      line[-1] = bc unless x == 1
    end
    output << line
  end

   output.each do |line|
     puts line
   end
end

puts '------------'
rectangle(5, 4, 'o', 'o', '-', ' ', false)
puts '------------'
rectangle(5, 1, 'o', 'o', '-', ' ', false)
puts '------------'
rectangle(1, 1, 'o', 'o', '-', ' ', false)
puts '------------'
rectangle(1, 5, 'o', 'o', '-', ' ', false)
puts 'XXXXXXXXXXXX'
puts '------------'
rectangle(5, 4, 'A', 'B', '.', ' ', false)
puts '------------'
rectangle(5, 1, 'A', 'B', '.', ' ', false)
puts '------------'
rectangle(1, 1, 'A', 'B', '.', ' ', false)
puts '------------'
rectangle(1, 5, 'A', 'B', '.', ' ', false)
puts 'XXXXXXXXXXXX'
puts '------------'
rectangle(5, 4, '/', "\\", '*', ' ', true)
puts '------------'
rectangle(5, 1, '/', "\\", '*', ' ', true)
puts '------------'
rectangle(1, 1, '/', "\\", '*', ' ', true)
puts '------------'
rectangle(1, 5, '/', "\\", '*', ' ', true)
