//
//  Example
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var player:WebPlayerView?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.player?.load(url: "https://www.youtube.com/embed/tgOtacfk8Yc?playsinline=1&rel=0&amp;showinfo=0")
    //self.player?.load(url: "https://player.vimeo.com/video/256386290?title=0&byline=0&portrait=0")
    //self.player?.load(url: "https://www.dailymotion.com/embed/video/x6i3gch")
    //self.player?.load(url: "https://streamable.com/s/fwx72/zwvivx")
    //self.player?.load(url: "https://player.twitch.tv/?volume=0.5&!muted&channel=dreamhackcs&autoplay=false")
    //self.player?.load(url: "https://www.facebook.com/video/embed?video_id=10153231379946729&playsinline=1")
    
  }

}

