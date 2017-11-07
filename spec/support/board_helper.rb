module BoardHelper
  # Extend a board with this module in a test example to print some debug messages
  def has_winning_combinations?
    combinations.any? do |combination|
      p combination.map { |cell| cell.to_s  }
      result = (combination[0].marked? && combination[0].marker == combination[1].marker &&
            combination[1].marker == combination[2].marker)
      puts result
      result
    end
  end
end
