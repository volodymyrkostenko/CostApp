module ApplicationHelper
  def last_line(n, item)
    "last_line_#{n.first.category.id}" if n.last.id == item.id

  end
end
