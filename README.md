# Google Primer Mock

Google Primer Mock app for iOS platform.

Architecture :- MVVM  
IDE :- Xcode 11
Language :- Swift 5
Design :- Inspired by android Google Primer App

# Functionality Walkthrough

The application performs very simple functionality of showing user bite-sized data in swipeable cards.

![](assets/swipe-demo.gif)

On launch, app performs a network request to fetch bite-sized card data. Once card data is received app populates the cards and displays them. App also sets up the page control view to track progress of cards and card navigation arrow keys.

![](assets/load-demo.gif)

Once this setup is done, user can drag and move around the card in any direction. When the card is dragged to the any edge of the screen then that card gets discarded in that direction.

![](assets/drag-demo.gif)

To revert or go to the previous card, user can perform swipe down gesture on the card. If the intial drag of the card is in bottom direction then it is supposed as revert action. But if the inital drag direction was not in bottom then user can move around the card even taking it to the bottom edge of the screen and discard it. The App decides on the initial drag direction whether the user wants to drag and discard or revert card. Google Primer Android App provides the same behaviour.

![](assets/revert-demo.gif)

Cards can also be navigated through the left and right arrow buttons.

![](assets/arrow-keys-demo.gif)

The bottom page control view shows the current progress.

The restart botton resets everything and allows user to start from the beginning.

![](assets/restart-demo.gif)

# Building and Running

1. Clone this repo
1. Open shell window and navigate to project folder
1. Run `pod install`
1. Open `Google Primer Mock.xcworkspace`
1. Change bundle identifier and select account to generate certificates
1. Run the project on selected device or simulator

# Libraries used

### SwiftLint

It is a tool to enforce Swift style and conventions, loosely based on [GitHub's Swift Style Guide](https://github.com/github/swift-style-guide).

### SwiftGen

SwiftGen is a tool to auto-generate Swift code for resources of your projects, to make them type-safe to use.

### Koloda

KolodaView is a class designed to simplify the implementation of Tinder like cards on iOS. It adds convenient functionality such as a UITableView-style dataSource/delegate interface for loading views dynamically, and efficient view loading, unloading .

In this project, Koloda is not installed via CocoaPods but via directly adding source files in project's Frameworks group because some of the source had to edited to support revert on swipe down gesture.

Alternative to directly adding source files was to either open a PR in the repo or fork it and install via cocoapods but both were time consuming so that was not appropriate for the given scenario.

### Pop

Pop is an extensible animation engine for iOS, tvOS, and OS X.

Koloda has dependency on Pop.

### FlexiblePageControl

It is a flexible UIPageControl like Instagram.

# Testing

Project has one unit test case to verify API returns expected data.

# Source Control

Project follows git-flow pattern.

Master <- Develop <- Feature/*
                     Enhancement/*
                     BugFix/*

For every sub-branch a PR is raised to be merged in develop branch. Every PR should be reviewed by other contributors but in this scenario as there were no other contributors, PR were not reviewed.

# Todo

- Handle cases with network changes
