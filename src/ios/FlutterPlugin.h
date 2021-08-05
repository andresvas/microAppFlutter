//
//  microAppsFlutterCordovaplugin.h
//  pocMicroApps
//
//  Created by Andres Felipe Vasquez Saldarriaga on 27/07/21.
//
#ifndef FlutterPlugin_h
#define FlutterPlugin_h
#import <Cordova/CDV.h>
#import <Flutter/Flutter.h>


@interface FlutterPlugin : CDVPlugin

- (void)openMicroApp:(CDVInvokedUrlCommand*)command;

/*-(FlutterViewController*)createEngineFromMain: (BOOL) typeModal;
-(FlutterViewController*)createEngineWithInitial:(NSString*)route which: (BOOL) typeModal;
-(FlutterViewController*)createEngine:(NSString*) entryPoint library:(NSString*) uri which: (BOOL) typeModal;*/
#endif /* FlutterPlugin_h */
@end

