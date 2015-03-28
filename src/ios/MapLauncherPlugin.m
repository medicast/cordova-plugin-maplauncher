//
//  MapLauncherPlugin.m
//  Medicast
//
//  Created by Nafis Zebarjadi on 2/20/14.
//  Last updated 8/29/2014
//
//

#import "MapLauncherPlugin.h"

@implementation MapLauncherPlugin

- (void) getGoogleMapsAccess: (CDVInvokedUrlCommand*)command
{
    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:NO];
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    }

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void) launchGoogleMap: (CDVInvokedUrlCommand*)command
{
    NSString* address = [command.arguments objectAtIndex:0];
    NSString* source = [command.arguments objectAtIndex:1];
    NSString* callbackUrl = [command.arguments objectAtIndex:2];

    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    NSString *directionsRequest;
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        directionsRequest =
        [NSString stringWithFormat:@"comgooglemaps-x-callback://?daddr=%@&directionsmode=driving&x-success=%@&x-source=%@", address, callbackUrl, source];
    } else {
        NSLog(@"Can't use Google Maps on this device.");
        directionsRequest =
        [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@", address];
    }
    NSString *safeString = [directionsRequest stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *directionsURL = [NSURL URLWithString:safeString];

    [[UIApplication sharedApplication] openURL:directionsURL];

}

@end