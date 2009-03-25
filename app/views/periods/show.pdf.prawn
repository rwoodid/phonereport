pdf.text "#{@period.month}", :size=>30

pdf.move_down(15)

items = @cost_centres.map do |item|
  [
    item.name,
    item.total_cost_for_period(@period.id),
  ]
end

pdf.table items, :border_style => :grid,
	:font_size => 6,
  :row_colors => ["FFFFFF","DDDDDD"],
  :vertical_padding   => 2,
  :horizontal_padding => 2,
  :headers => ["Cost Centre", "Total Call Cost"],
  :align => { 0 => :left, 1 => :right}

