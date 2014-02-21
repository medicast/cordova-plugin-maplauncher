function MapLauncherPlugin() {}

MapLauncherPlugin.prototype.launchMap = function(address) {
	cordova.exec(function() {}, function() {}, 'MapLauncher', 'launch', [address]);
};

module.exports = new MapLauncherPlugin();
