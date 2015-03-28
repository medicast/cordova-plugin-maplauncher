//
//  MapLauncherPlugin.h
//  Medicast
//
//  Created by Nafis Zebarjadi on 2/20/14.
//
//

#ifndef Medicast_MapLauncherPlugin_h
#define Medicast_MapLauncherPlugin_h

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface MapLauncherPlugin : CDVPlugin {

}

- (void) getGoogleMapsAccess: (CDVInvokedUrlCommand*)command;
- (void) launchGoogleMap: (CDVInvokedUrlCommand*)command;

@end


#endif
