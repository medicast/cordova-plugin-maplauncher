function MapLauncherPlugin() {}

MapLauncherPlugin.prototype.launchMap = function(address, sourceLabel, callbackUrl) {
	cordova.exec(function() {}, function() {}, 'MapLauncher', 'launch', [address, sourceLabel, callbackUrl]);
};

module.exports = new MapLauncherPlugin();
