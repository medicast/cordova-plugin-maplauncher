# MapLauncher Cordova Plugin

### Installation

```
    cordova plugin add co.medicast.plugins.MapLauncher
```

### Usage

This Cordova/PhoneGap plugin lets you launch into Google Maps from your app for navigation.  If the user doesn't have Google Maps installed, the plugin falls back to using Apple Maps.

At the moment, the address or coordinates you provide will be used to set the destination address for navigation purposes.  That's what I needed so that's what I built, but it's trivial to modify the iOS source to do a search or any other behavior that the Google Maps URL scheme supports (see [https://developers.google.com/maps/documentation/ios/urlscheme]).  Pull requests appreciated!

To launch Google Maps from your Cordova code:

```
	MapLauncher.launchGoogleMap("123 Main Street, Anytown USA");

```

You can also specify a source name and URL scheme if you want Google Maps to display a "Return to Foo App" bar at the top of the app:

```
	MapLauncher.launchGoogleMap('123 Main Street, Anytown USA', 'Foo App', 'fooapp://?dosomething');

```

You can check from js is google maps is supported before proceeding to launch strictly in Google Maps

```
	MapLauncher.hasGoogleMaps
```

For more on how this works, check out [https://developers.google.com/maps/documentation/ios/urlscheme#specify_a_callback_url].

### Platform Support

This plugin is designed to run on iOS 7+.

### Version Requirements

This plugin works with PhoneGap 3.0.0+, iOS 7+, and recent versions of Google Maps.

### Contributing Code

Feel free to submit pull requests.


### License

MIT License.  Not much here anyway!