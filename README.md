# KeyboardProtocol: ViewController Extension for ScrollView

![License](https://img.shields.io/github/license/gali8/KeyboardProtocol.svg)
![Language](https://img.shields.io/badge/Swift-5.0-red.svg)

KeyboardProtocol is ready to be used with your UIViewController.
Scrollview inset and offset, are automatically calculated on the first responder.

## How to use:

Import the **KeyboardExtension.swift** file into your Swift project.

Implement **KeyboardProtocol**:

```swift
class ViewController: UIViewController, KeyboardProtocol {
...
}
```


Add and connect the ScrollView:

```swift
@IBOutlet var scrollView: UIScrollView!
```

Then register for keyboard notifications:

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    self.registerForKeyboardNotification()
}
```

and run. :)

![Demo](https://github.com/gali8/KeyboardProtocol/blob/master/Demo.png?raw=true)

## License

KeyboardProtocol is distributed under the MIT
license (see LICENSE.md).

Buy me a beer
=================
#### If you like my work, please buy me a beer (tap the beer):
<p align="left">
<a href="http://www.g8production.com/Beer#_=_" alt="If you like my work, please buy me a beer ">
<img style="-webkit-user-select: none;" 
src="http://68.media.tumblr.com/3243ca9030c3fa14ca3042344ae3d510/tumblr_inline_ng26w7z8SG1qmlajm.png">
</a>
</p>

## Contributors

Daniele Galiotto (founder) - Co-Founder at Nexor Technology srl -
**[www.nexor.it](http://www.nexor.it)**
