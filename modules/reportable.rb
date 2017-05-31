module Reportable
  def report
    return if !placed

    puts [x, y, facing].join(",")
  end
end
