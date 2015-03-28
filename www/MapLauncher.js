var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

function MapLauncherPlugin() {
    this.hasGoogleMaps = false;

    var that = this
    that.getGoogleMapsAccess(function(result) {
        that.hasGoogleMaps = result;
        console.log("Google Maps Found:" + result);
    }, function(e) {
        utils.alert("[ERROR] Error initializing Cordova: " + e);
    });
}

MapLauncherPlugin.prototype.getGoogleMapsAccess = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'MapLauncher', 'getGoogleMapsAccess', []);
};

MapLauncherPlugin.prototype.launchGoogleMap = function(address, sourceLabel, callbackUrl) {
    exec(function() {}, function() {}, 'MapLauncher', 'launchGoogleMap', [address, sourceLabel, callbackUrl]);
};

MapLauncherPlugin.prototype.launchAppleMap = function(address, sourceLabel, callbackUrl) {
    window.open('maps:daddr=' + address.replace(/\s/g, '%20'), '_system')
};

module.exports = new MapLauncherPlugin();