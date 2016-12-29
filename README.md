Digipolitan fastlane-ios
================

Create iOS actions used by sub Digipolitan fastlane-repositories

## Installation
To install fastlane, simply use gem:

```
[sudo] gem install fastlane
```

# Available Fastlane Lanes
All lanes available are described [here](fastlane/README.md)

# Available Fastlane actions

## [get_project_info](fastlane/actions/get_project_info.rb)

Retrieves project informations, such as info_plist path, project name, ...

```Ruby
project_info = get_project_info(xcodeproj: "/example/test.xcodeproj")
print project_info[:name]
```
