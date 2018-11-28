module ApplicationHelper

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "#{@cart.line_items.count}".html_safe
    end
  end

  def cart_has_items
    return @cart.line_items.count > 0
  end

end
