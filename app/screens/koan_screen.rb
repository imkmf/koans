class KoanScreen < PM::Screen
  attr_accessor :koan

  def on_load
    self.title = koan.title
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
  end

  def set_up_view
    add @textView = UITextView.new,
      resize: [ :left, :right, :top ],
      frame: CGRectMake(10, 10,
                        self.view.bounds.size.width - 15,
                        self.view.bounds.size.height - 10)

    @textView.editable = false
    @textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    @textView.text = koan.text

    true
  end
end
