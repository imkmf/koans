class HomeScreen < PM::TableScreen
  title "Koans"
  attr_accessor :koans

  def on_load
    backgroundColor = BubbleWrap.rgb_color(0, 153, 153)
    self.navigationController.navigationBar.barTintColor = backgroundColor
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor
    self.navigationController.navigationBar.translucent = false
    self.navigationController.navigationBar.titleTextAttributes = {UITextAttributeTextColor => UIColor.whiteColor}
    set_nav_bar_button :right, title: "?", action: :go_to_info
    App.notification_center.observe UIContentSizeCategoryDidChangeNotification do |notification|
      preferred_content_size_changed
    end
  end

  def preferred_content_size_changed
    self.update_table_data
  end

  def go_to_info
    App.alert("A kōan is a story, dialogue, question, or statement, which is used in Zen-practice to provoke the \"great doubt\", and test a student's progress in Zen practice.\n\nCreated with love by Kristian Freeman.")
  end

  def table_data
    [{
      cells:
        self.koans.map do |koan|
          {
            title: koan.title,
            action: :read_koan,
            arguments: { koan: koan },
            font: UIFont.preferredFontForTextStyle(UIFontTextStyleBody),
            accessory_type: UITableViewCellAccessoryDisclosureIndicator
          }
        end
    }]
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    label ||= nil
    if (!label)
      label = UILabel.alloc.initWithFrame(CGRectMake(0, 0, Float::MAX, Float::MAX))
      label.text = "test"
    end

    label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    label.sizeToFit
    label.frame.size.height * 1.7
  end

  def read_koan(args={})
    open KoanScreen.new(koan: args[:koan])
  end
end
