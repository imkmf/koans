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
            arguments: { koan: koan }
          }
        end
    }]
  end

  def read_koan(args={})
    open KoanScreen.new(koan: args[:koan])
  end
end
