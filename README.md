# MapLauncher Cordova Plugin

## Installation

```
    cordova plugin add co.medicast.plugins.MapLauncher
```

## Usage

This Cordova/PhoneGap plugin lets you launch into Google Maps from your app for navigation.  If the user doesn't have Google Maps installed, the plugin falls back to using Apple Maps.

At the moment, the address or coordinates you provide will be used to set the destination address for navigation purposes.  That's what I needed so that's what I built, but it's trivial to modify the iOS source to do a search or any other behavior that the Google Maps URL scheme supports (see [https://developers.google.com/maps/documentation/ios/urlscheme]).  Pull requests appreciated!

### Launch best map available

The ```launch``` method will first try to use Google Maps, then fallback to Apple Maps:

```
	MapLauncher.launch("123 Main Street, Anytown USA");

```

You can also specify a source name and URL scheme if you want Google Maps to display a "Return to Foo App" button bar at the top of the map screen:

```
	MapLauncher.launch('123 Main Street, Anytown USA', 'Foo App', 'fooapp://?dosomething');

```

For more on how this works, check out [https://developers.google.com/maps/documentation/ios/urlscheme#specify_a_callback_url].

### Specific Map Launchers

There are also a few methods for anyone who wants more control:

```
	MapLauncher.launchGoogleMaps(...);

	MapLauncher.launchAppleMaps(...);

	MapLauncher.hasGoogleMaps(function(hasGoogleMaps) {
		console.log('Google Maps ' + (hasGoogleMaps ? 'is' + 'is not') + ' installed!');
	});
```

## Platform Support

This plugin is designed to run on iOS 7+.

## Version Requirements

This plugin works with PhoneGap 3.0.0+, iOS 7+, and recent versions of Google Maps.

## Contributing Code

Feel free to submit pull requests.

## License

MIT License.  Not much here anyway!