# -*- coding: utf-8 -*-
class HomeScreen < PM::GroupedTableScreen
  title "Home"

  def on_load
    backgroundColor = BubbleWrap.rgb_color(0, 153, 153)
    self.navigationController.navigationBar.barTintColor = backgroundColor
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor
    self.navigationController.navigationBar.translucent = false
    self.navigationController.navigationBar.titleTextAttributes = {
      UITextAttributeTextColor => UIColor.whiteColor
    }
    set_nav_bar_button :right, title: "?", action: :go_to_info
    App.notification_center.observe UIContentSizeCategoryDidChangeNotification do |notification|
      preferred_content_size_changed
    end

    # Fix grouped table headers
    # gh/clearsightstudio/ProMotion/issues/334
    self.view.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
  end


  def preferred_content_size_changed
    self.update_table_data
  end

  def go_to_info
    App.alert("A kōan is a story, dialogue, question, or statement, which is used in Zen-practice to provoke the \"great doubt\", and test a student's progress in Zen practice.\n\nCreated with love by Kristian Freeman.")
  end

  def table_data
    [
      {
        title: "History",
        cells: [
          {
            title: "Timeline",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("timeline") }
          },
          {
            title: "Siddhartha Gautama (Buddha)",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("buddha") }
          }
        ]
      },
      {
        title: "Principles",
        cells: [
          {
            title: "The Noble Eightfold Path",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("noble_eightfold") }
          },
          {
            title: "The Four Noble Truths",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("noble_truths") }
          },
          {
            title: "The Seven Points of Posture",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("points_of_posture") }
          },
          {
            title: "The Six Wholesome and Unwholesome Roots of Mind",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("wholesome") }
          },
          {
            title: "The Six Sense Doors and Three Feeling Tones",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("doors") }
          },
          {
            title: "The Four Metta Phrases",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("metta") }
          },
          {
            title: "The Eight Vicissitudes",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("vicissitudes") }
          },
          {
            title: "The Five Precepts",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("precepts") }
          },
          {
            title: "The Four Brahma-Viharas",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("viharas") }
          },
          {
            title: "The Three Kinds of Suffering",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("suffering") }
          },
          {
            title: "The Five Hindrances",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("hindrances") }
          },
          {
            title: "The Six Stages of Metta",
            action: :open_text_screen,
            arguments: { model_for_text: find_document("metta_stages") }
          }
        ]
      },
      {
        title: "Resources",
        cells: [
          {
            title: "Koans",
            action: :open_koans_screen
          }
        ]
      }
    ]
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

  def find_document(keyword)
    Document.where(:category).eq(keyword).first
  end

  def open_text_screen(args={})
    open TextScreen.new(model_for_text: args[:model_for_text], nav_bar: true)
  end

  def open_koans_screen
    open KoansScreen.new(koans: Document.where(:category).eq('koan').all)
  end
end
