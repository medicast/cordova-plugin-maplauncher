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

    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
    NSString *directionsRequest;
    if ([[UIApplication sharedApplication] canOpenURL:testURL]) {
        directionsRequest =
        [NSString stringWithFormat:@"comgooglemaps-x-callback:////x-callback-url/open/?url=daddr=%@&x-success=medicast://&x-source=Medicast", address];
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