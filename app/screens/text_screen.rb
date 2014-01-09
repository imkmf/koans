class TextScreen < PM::Screen
  attr_accessor :model_for_text

  def on_load
    self.title = model_for_text.title
    self.view.backgroundColor = UIColor.whiteColor
    App.notification_center.observe UIContentSizeCategoryDidChangeNotification do |notification|
      preferred_content_size_changed
    end
  end

  def preferred_content_size_changed
    @textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
  end

  def will_appear
    @view_setup ||= set_up_view
    nav_setup if Device.ipad?
  end

  def set_up_view
    if Device.iphone?
      add @textView = UITextView.new,
        resize: [ :left, :right, :top ],
        frame: CGRectMake(10, 10,
                          self.view.bounds.size.width - 15,
                          self.view.bounds.size.height - 10)
    elsif Device.ipad?
      add @textView = UITextView.new,
        resize: [ :left, :right, :top ],
        frame: CGRectMake(10, 80,
                          self.view.bounds.size.width - 15,
                          self.view.bounds.size.height - 10)
    end

    @textView.editable = false
    @textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    @textView.text = model_for_text.text

    true
  end

  def nav_setup
    backgroundColor = BubbleWrap.rgb_color(0, 153, 153)
    self.navigationController.navigationBar.barTintColor = backgroundColor
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor
    self.navigationController.navigationBar.translucent = false
    self.navigationController.navigationBar.titleTextAttributes = {UITextAttributeTextColor => UIColor.whiteColor}
  end
end
