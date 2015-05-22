function MapLauncherPlugin() {}

MapLauncherPlugin.prototype.launchMap = function(address, sourceLabel, callbackUrl) {
	cordova.exec(function() {}, function() {}, 'MapLauncher', 'launch', [address, sourceLabel, callbackUrl]);
};

MapLauncherPlugin.prototype.launchGoogleMaps = function(address, sourceLabel, callbackUrl) {
	cordova.exec(function() {}, function() {}, 'MapLauncher', 'launchGoogleMaps', [address, sourceLabel, callbackUrl]);
};

MapLauncherPlugin.prototype.launchAppleMaps = function(address) {
	cordova.exec(function() {}, function() {}, 'MapLauncher', 'launchAppleMaps', [address]);
};

MapLauncherPlugin.prototype.hasGoogleMaps = function(address) {
	cordova.exec(function() {}, function() {}, 'MapLauncher', 'hasGoogleMaps', []);
};

module.exports = new MapLauncherPlugin();
