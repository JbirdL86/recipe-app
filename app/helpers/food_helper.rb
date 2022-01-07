module FoodHelper
  def bg_color_selector(index)
    return if index == 0;

    @bg_index -= 1
    @bg_index = @bg_index * @bg_index
    
  end
end
