class Rectangle
  def initialize(x, y, la, ra, bc, mc, reverse_last_angles)
    @x = x; @y = y
    raise 'Exepecting dimensions as Integer' unless @x.is_a?(Integer) && @y.is_a?(Integer)

    @la = la; @ra = ra; @bc = bc; @mc = mc
    raise 'Exepecting single caracters' unless @la.is_a?(String) && @ra.is_a?(String) && @bc.is_a?(String) && @mc.is_a?(String)
    raise 'Exepecting single caracters' unless @la.size == 1 && @ra.size == 1 && @bc.size == 1 && @mc.size == 1

    @reverse_last_angles = reverse_last_angles
    raise 'Expecting reverse_last_angles to be a boolean' unless !!@reverse_last_angles == @reverse_last_angles

    @output = []

    # Here I could refacto further more initializer, for exemples passing an array for dimensions and caracters
    # It would simplify guards conditions, but I don't think it worth my time
    # I should rename my parameters too, (yeah I'm a lazy person)
  end

  def make_payload
    @output = [] # Just there for several call before display
    # Managing zero case here as it does make sense to me (zero is void, not to be treated as an error)
    return if @x.zero? || @y.zero?

    # Here a single line output it dealt by design, not explicit
    # I could start the index at 1 but I prefer machine based view
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

  def draw_payload
    # Can't be broken I think, juste making payload if not already created
    make_payload if @output.empty?

    @output.each do |line|
      puts line
    end
  end

  private

  def first_line?(index)
    index == 0 ? true : false
  end

  def last_line?(index)
    # First line can also be last line when single row, not a problem in my case
    index == @y-1 ? true : false
  end

  def make_first_line
    # Single colomns management dealt here
    # (May be refactored)
    line = @bc * @x
    line[0] = @la
    line[-1] = @ra unless @x == 1
    line
  end

  def make_middle_line
    # Works great on single colomn too
    line = @mc * @x
    line[0] = @bc
    line[-1] = @bc
    line
  end

  def make_last_line
    # Single colomns management dealt here + reverse last line
    line = @bc * @x
    if @reverse_last_angles
      line[0] = @ra
      line[-1] = @la unless @x == 1
    else
      line[0] = @la
      line[-1] = @ra unless @x == 1
    end
    line
  end

  def self.demo_parcours
    # Reproducing exemples
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

# Comment this to see "true" test coverage (all non-display is covered but... can't be trusted)
Rectangle.demo_parcours
