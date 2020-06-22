class Rectangle
  def initialize(x, y, la, ra, bc, mc, reverse_last_angles)
    @x = x
    @y = y
    @la = la
    @ra = ra
    @bc = bc
    @mc = mc
    @reverse_last_angles = reverse_last_angles
    @output = []
  end

  def make_payload
    @y.times do |index|
      if first_line?(index)
        @output << make_first_line
      elsif last_line?(index)
        @output << make_last_line
      else
        @output << make_middle_line
      end
    end
    @output
  end

  def first_line?(index)
    index == 0 ? true : false
  end

  def last_line?(index)
    index == @y-1 ? true : false
  end

  def make_first_line
    line = @bc * @x
    line[0] = @la
    line[-1] = @ra unless @x == 1
    line
  end

  def make_middle_line
    line = @mc * @x
    line[0] = @bc
    line[-1] = @bc unless @x == 1
    line
  end

  def make_last_line
    line = @bc * @x
    line[0] = @la
    line[-1] = @ra unless @x == 1
    if @reverse_last_angles
      line[0] = @ra
      line[-1] = @la unless @x == 1
    end
    line
  end

  def draw_payload
    make_payload if @output.empty?

    @output.each do |line|
      puts line
    end
  end

  def self.demo_parcours
    puts 'XXXXXXXXXXXX'
    puts '------------'
    Rectangle.new(5, 4, 'o', 'o', '-', ' ', false).draw_payload
    puts '------------'
    Rectangle.new(5, 1, 'o', 'o', '-', ' ', false).draw_payload
    puts '------------'
    Rectangle.new(1, 1, 'o', 'o', '-', ' ', false).draw_payload
    puts '------------'
    Rectangle.new(1, 5, 'o', 'o', '-', ' ', false).draw_payload
    puts 'XXXXXXXXXXXX'
    puts '------------'
    Rectangle.new(5, 4, 'A', 'B', '.', ' ', false).draw_payload
    puts '------------'
    Rectangle.new(5, 1, 'A', 'B', '.', ' ', false).draw_payload
    puts '------------'
    Rectangle.new(1, 1, 'A', 'B', '.', ' ', false).draw_payload
    puts '------------'
    Rectangle.new(1, 5, 'A', 'B', '.', ' ', false).draw_payload
    puts 'XXXXXXXXXXXX'
    puts '------------'
    Rectangle.new(5, 4, '/', "\\", '*', ' ', true).draw_payload
    puts '------------'
    Rectangle.new(5, 1, '/', "\\", '*', ' ', true).draw_payload
    puts '------------'
    Rectangle.new(1, 1, '/', "\\", '*', ' ', true).draw_payload
    puts '------------'
    Rectangle.new(1, 5, '/', "\\", '*', ' ', true).draw_payload
  end
end

Rectangle.demo_parcours
