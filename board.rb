require File.expand_path("../cell", __FILE__)

class Board
  attr_reader :cells

  def initialize
    @cells = []
    9.times do |number|
      cells << Cell.new(number + 1)
    end
  end

  def empty?
    cells.all? { |cell| cell.empty? }
  end

  def full?
    cells.all? { |cell| cell.marked? }
  end

  def display
    puts "-" * 9
    rows.each do |row|
      row.each do |cell|
        print "|#{cell.to_s}|"
      end
      puts
      puts "-" * 9
    end
  end

  def rows
    row_1 = [cells[0], cells[1], cells[2]]
    row_2 = [cells[3], cells[4], cells[5]]
    row_3 = [cells[6], cells[7], cells[8]]
    [row_1, row_2, row_3]
  end

  def columns
    column_1 = [cells[0], cells[3], cells[6]]
    column_2 = [cells[1], cells[4], cells[7]]
    column_3 = [cells[2], cells[5], cells[8]]
    [column_1, column_2, column_3]
  end

  def combinations
    diagonal_1 = [cells[0], cells[4], cells[8]]
    diagonal_2 = [cells[2], cells[4], cells[6]]
    combinations = rows + columns + [diagonal_1, diagonal_2]
  end

  def has_winning_combinations?
    combinations.any? do |combination|
      (combination[0].marker == combination[1].marker) && (combination[1].marker == combination[2].marker)
    end
  end

  def drop_marker_at(cell_number, marker)
    return false if (cell_number < 1 || cell_number > 9)
    cell = cells[cell_number - 1]
    return false if (cell.marked?)
    cell.put_marker(marker)
  end
end
