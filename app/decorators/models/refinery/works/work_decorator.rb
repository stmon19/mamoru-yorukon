Refinery::Works::Work.class_eval do
  def size
    depth.present? ? size_with_depth : size_without_depth
  end

  def size_without_depth
    "#{width}Wx#{height}H"
  end

  def size_with_depth
    "#{width}Wx#{depth}Dx#{height}H"
  end
end
