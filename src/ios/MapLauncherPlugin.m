//
//  MapLauncherPlugin.m
//  Medicast
//
//  Created by Nafis Zebarjadi on 2/20/14.
// 
//

#import "MapLauncherPlugin.h"

@implementation MapLauncherPlugin

- (void) launch: (CDVInvokedUrlCommand*)command
{
	NSString* address = [command.arguments objectAtIndex:0];
    NSString* source = [command.arguments objectAtIndex:1];
    NSString* callbackUrl = [command.arguments objectAtIndex:2];

    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    NSString *directionsRequest;
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        directionsRequest =
        [NSString stringWithFormat:@"comgooglemaps-x-callback://?daddr=%@&x-success=%@&x-source=%@", address, callbackUrl, source];
    } else {
        NSLog(@"Can't use Google Maps on this device.");
        directionsRequest =
        [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@", address];
    }
    NSString *safeString = [directionsRequest stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *directionsURL = [NSURL URLWithString:safeString];

    [[UIApplication sharedApplication] openURL:directionsURL];
    
}

- (void) launchGoogleMaps: (CDVInvokedUrlCommand*)command
{
    NSString* address = [command.arguments objectAtIndex:0];
    NSString* source = [command.arguments objectAtIndex:1];
    NSString* callbackUrl = [command.arguments objectAtIndex:2];

    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    NSString *directionsRequest;
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        directionsRequest =
        [NSString stringWithFormat:@"comgooglemaps-x-callback://?daddr=%@&x-success=%@&x-source=%@", address, callbackUrl, source];
    } else {
        NSLog(@"Can't use Google Maps on this device.");
    }
    NSString *safeString = [directionsRequest stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *directionsURL = [NSURL URLWithString:safeString];

    [[UIApplication sharedApplication] openURL:directionsURL];
}

- (void) launchAppleMaps: (CDVInvokedUrlCommand*)command
{
    NSString* address = [command.arguments objectAtIndex:0];

    NSString *directionsRequest;
    directionsRequest = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@", address];
    NSString *safeString = [directionsRequest stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *directionsURL = [NSURL URLWithString:safeString];

    [[UIApplication sharedApplication] openURL:directionsURL];
}

- (void) hasGoogleMaps: (CDVInvokedUrlCommand*)command
{
    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:NO];
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    }
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end