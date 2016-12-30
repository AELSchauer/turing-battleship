module GridDisplay

  def display_grid
    display_grid =
      [ outline,
        column_labels,
        row_labels_and_values,
        outline
      ]
    display_grid.flatten.join("\n")
  end

  def outline
    "=" * ((self.size * 2) + 4)
  end

  def column_labels
    "  " + (1..self.size).map { |i| " #{(i+64).chr}" }.join
  end

  def row_labels_and_values
    (1..self.size).map { |i| i.to_s.rjust(2) + display_values(i-1) }
  end

  def display_values(r)
    self.matrix[r].map { |c| " #{c.abbv}" }.join
  end

end