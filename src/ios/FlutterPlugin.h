//
//  microAppsFlutterCordovaplugin.h
//  pocMicroApps
//
//  Created by Andres Felipe Vasquez Saldarriaga on 27/07/21.
//
#ifndef FlutterPlugin_h
#define FlutterPlugin_h
#import <Cordova/CDV.h>



@interface FlutterPlugin : CDVPlugin

- (void)openMicroApp:(CDVInvokedUrlCommand*)command;


#endif /* FlutterPlugin_h */
@end

