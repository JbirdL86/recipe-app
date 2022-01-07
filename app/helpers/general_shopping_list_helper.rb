module GeneralShoppingListHelper
  def bg_color_selector(index)
    return if index.zero?

    @bg_index -= 1
    @bg_index *= @bg_index
  end
end