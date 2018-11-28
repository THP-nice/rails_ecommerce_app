module ApplicationHelper

    def cart_has_items
      total = @cart.line_items.map { |item| item.quantity }.sum
      return total if total > 0
    end

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "#{@cart.line_items.count}".html_safe
    end
  end

end
