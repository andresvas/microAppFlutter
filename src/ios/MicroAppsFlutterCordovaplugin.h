//
//  microAppsFlutterCordovaplugin.h
//  pocMicroApps
//
//  Created by Andres Felipe Vasquez Saldarriaga on 27/07/21.
//
#ifndef MicroAppsFlutterCordovaplugin_h
#define MicroAppsFlutterCordovaplugin_h
#import <Cordova/CDV.h>
#import <Flutter/Flutter.h>


@interface MicroAppsFlutterCordovaplugin : CDVPlugin

- (void)openMicroApp:(CDVInvokedUrlCommand*)command;

#endif /* MicroAppsFlutterCordovaplugin_h */
@end

