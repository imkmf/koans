# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Koans'
  app.identifier = "com.kristianfreeman.koans"
  app.provisioning_profile = "/Users/kristian/Library/MobileDevice/Provisioning Profiles/918977A0-4B11-47E3-B393-7F475C6BB552.mobileprovision"
  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false
  app.icons = Dir.glob("resources/icon*.png").map { |icon|
    icon.split("/").last
  }
  app.device_family = [:iphone, :ipad]
end

