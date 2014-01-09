# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Koans'
  app.identifier = "com.kristianfreeman.koans"
  app.version = '1.0'
  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false
  app.icons = Dir.glob("resources/icon*.png").map { |icon|
    icon.split("/").last
  }
  app.device_family = [:iphone, :ipad]

  app.development do
    # app.codesign_certificate = "iPhone Distribution: Kristian Freeman (5SBY45UWAH)"
    app.provisioning_profile = "/Users/kristian/Library/MobileDevice/Provisioning Profiles/D67F5244-35A4-4842-9337-A3257696CE44.mobileprovision"
  end

  app.release do
    app.codesign_certificate = "iPhone Distribution: Kristian Freeman (5SBY45UWAH)"
    app.provisioning_profile = "/Users/kristian/Library/MobileDevice/Provisioning Profiles/E5D9F749-7973-4DFC-9E4D-99FB994E6469.mobileprovision"
  end
end

