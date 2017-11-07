class Cell
  attr_accessor :marker, :placeholder

  def initialize(placeholder)
    @placeholder = placeholder
  end

  def put_marker(marker)
    return false if marked?
    @marker = marker
    self
  end

  def marked?
    marker || false
  end

  def empty?
    !marked?
  end

  def to_s
    if marked?
      marker
    else
      placeholder
    end
  end
end
