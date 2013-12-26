class KoanScreen < PM::Screen
  attr_accessor :koan

  def on_load
    self.title = koan.title
    self.view.backgroundColor = UIColor.whiteColor
  end

  def will_appear
    @view_setup ||= set_up_view
  end

  def set_up_view
    add text = UITextView.new,
      resize: [ :left, :right, :top ],
      frame: CGRectMake(10, 10,
                        self.view.bounds.size.width - 10,
                        self.view.bounds.size.height)

    text.editable = false
    text.font = UIFont.fontWithName("Avenir", size: get_text_size)
    text.text = koan.text

    true
  end

  def get_text_size
    contentSize = UIApplication.sharedApplication.preferredContentSizeCategory
    if contentSize == UIContentSizeCategoryExtraSmall
      font_size = 12.0
    elsif contentSize == UIContentSizeCategorySmall
      font_size = 14.0
    elsif contentSize == UIContentSizeCategoryMedium
      font_size = 16.0
    elsif contentSize == UIContentSizeCategoryLarge
      font_size = 18.0
    elsif contentSize == UIContentSizeCategoryExtraLarge
      font_size = 20.0
    elsif contentSize == UIContentSizeCategoryExtraExtraLarge
      font_size = 22.0
    elsif contentSize == UIContentSizeCategoryExtraExtraExtraLarge
      font_size = 24.0
    end
    font_size
  end
end
