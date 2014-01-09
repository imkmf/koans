# -*- coding: utf-8 -*-
class AppDelegate < PM::Delegate
  def on_load(app, options)
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleLightContent)
    Document.deserialize_from_file("documents.dat")
    if Document.count == 0
      path = NSBundle.mainBundle.pathForResource("documents", ofType:"dat")
      fileManager = NSFileManager.defaultManager
      paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)
      documents = paths.objectAtIndex(0)
      document = documents.stringByAppendingPathComponent("documents.dat")
      fileManager.copyItemAtPath(path, toPath: document, error: nil)
      Document.deserialize_from_file("documents.dat")
    end
    open HomeScreen.new(nav_bar: true)

    # Koan.serialize_to_file("koans.dat")
    # if Device.iphone?
    #   open KoansScreen.new(koans: @koans, nav_bar: true)
    # elsif Device.ipad?
    #   open_split_screen KoansScreen.new(koans: @koans, nav_bar: true),
    #     KoanScreen.new(koan: Koan.first, nav_bar: true)
    # end
  end
end
