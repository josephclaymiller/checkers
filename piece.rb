class Piece

  def initialize(color, pos)
    @color = color
    @pos = pos
    @king = false
  end

  def perform_slide
    self.maybe_promote
  end

  def perform_jump
    self.maybe_promote
  end

  def maybe_promote
  end

  def to_s
    case @color
    when :black
      'b'
    when :red
      'r'
    else
      '?'
    end
  end

end