# SwiftUIMindBlowing

SwiftUIMindBlowing is a SwiftUI sample application that shows how to integrate [Tealeaf SDK](https://github.com/acoustic-analytics/IBMTealeaf) following [docs](https://developer.goacoustic.com/acoustic-exp-analytics/docs/getting-started-with-the-acoustic-tealeaf-sdk-for-ios-using-swift).


## Getting Started

### Prerequisites

You need to have recent cocoapods version install on your Mac OS. Current version is 1.10.1. Please refer to [cocoapods](https://cocoapods.org) website for the details.

For SDK prerequisites and documentation, please refer to the SDK documentation [here](https://developer.goacoustic.com/acoustic-exp-analytics/docs/getting-started-with-the-acoustic-tealeaf-sdk-for-ios-using-swift)

### Installing

Clone the sample app code from git hub location

`git clone https://github.com/acoustic-analytics/SwiftUIMindBlowing.git`

Go to the sample app location

`cd SwiftUIMindBlowing`

Open Podfile in a text editor of your choice and note the following lines in the Podfile

Note that use_frameworks is uncommented

`use_frameworks!`

In the respective targets for your project in the Podfile add the following line if you want to use Tealeaf SDK's release version

`pod 'IBMTealeaf'`

In the respective targets for your project in the Podfile add the following line if you want to use Tealeaf SDK's debug version

`pod 'IBMTealeafDebug'`

You will notice that by default the sample application uses `pod 'IBMTealeafDebug'`

Note that you can use only one of  `pod 'IBMTealeaf'` and `pod 'IBMTealeafDebug'`. Do not use both at the same time.

Now you need to install the pods by running one of the following commands.

`pod install`

or to update

`pod update`

Above pod command (install or update) should complete with no errors. If you do see errors run the same command with `--verbose` option and share the error log with us.

Open `SwiftUIMindBlowing.xcworkspace` file and not the `SwiftUIMindBlowing.xcodeproj` file. Once you open the workspace file, please use target CXA to build the sample app and run it. There are multiple targets in the project however the only one that serves for this example is the SwiftUIMindBlowing target.

## Troubleshooting

If you are using Debug version of Tealeaf SDK. i.e. `pod 'IBMTealeafDebug'` , then you may edit your project's scheme in XCode and add environmental variable `EODebug`and set its value to 1; also add environmental variable `TLF_DEBUG` and set its value to 1. This will make the SDK to start writing debug logs to your xcode console window. If and when you want to report issues, the Tealeaf support engineers will ask you for these logs.


## Versioning

# Taken original code from [SwiftUIMindBlowing](https://github.com/antranapp/SwiftUIMindBlowing)
# SwiftUI MindBlowing 🤯

[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/Swift-5.1-blue.svg)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/Xcode-11-blue.svg)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/platforms-iOSv|%20tvOS%20|%20macOS%20|%20watchOS%20-blue.svg)](https://opensource.org/licenses/MIT)

Collections of mind-blowing SwiftUI snippets and projects.

## Why another awesome-swiftui?

SwiftUI has come with a blast during and after WWDC 2019. The technology is so exciting so that the Swift Community has quickly come up with different tutorials, sample projects and experiments showing the potential of it.

Since I am a big fan of learning by doing and from the others, I create this app for my own learning and the app serves as my effort to contribute to the community, to consolidate as many tips & tricks from the community as possible, from basic to advanced SwiftUI usages, and also to showcase many cool 🤯 projects, experiments from other developers.

The app is organized in 5 main sections:

* **Basic:** showing how to use primitive elements SwiftUI.

![Screenshot](./Docs/images/screenshot1.png)

* **Animation:** showing how to make basic animations with SwiftUI.
* **MindBlowing:** super cool, mind-blowing experiments from the community. 
* **Projects:** full-blown simple to advanced projects using SwiftUI (and Combine).
* **More:** some miscellaneous stuffs related to SwiftUI (SFSymbols, Tips & Tricks ...).

## Open and Community-driven

As SwiftUI is new and is still evolving very fast, I would welcome everyone to join me to make the app more useful to the community. PRs/New ideas are warmly welcome. 

👉 Currently, I need some help to design a logo and a banner for the repo, if you have some basic design knowledge, please don't hesitate to contact me.

## Requirements

- macOS 15 (optional to view previews)
- Xcode 11.1
- iOS 13.1+


## License

I try to integrate only MIT license friendly code. The code are copyrighted by their respective authors. I always attach the links to the original repos alongside the code.

The app itself is also licensed under MIT license as stated in [LICENSE](LICENSE) 
