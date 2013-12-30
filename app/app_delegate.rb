class AppDelegate < PM::Delegate
  def on_load(app, options)
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleLightContent)
    Koan.deserialize_from_file("koans.dat")
    if Koan.count == 0
      path = NSBundle.mainBundle.pathForResource("koans", ofType:"json")
      data = NSData.dataWithContentsOfFile(path)
      json = BW::JSON.parse(data)
      json.each do |koan|
        Koan.create(title: koan[:title], text: koan[:text])
      end
      Koan.serialize_to_file("koans.dat")
    end
    @koans = Koan.all.sort_by(&:title)
    if Device.iphone?
      open HomeScreen.new(koans: @koans, nav_bar: true)
    elsif Device.ipad?
      open_split_screen HomeScreen.new(koans: @koans, nav_bar: true),
        KoanScreen.new(koan: Koan.first, nav_bar: true)
    end
  end
end
