//
//  microAppsFlutterCordovaplugin.h
//  pocMicroApps
//
//  Created by Andres Felipe Vasquez Saldarriaga on 27/07/21.
//

#import <Cordova/CDV.h>
@import Flutter;

NS_ASSUME_NONNULL_BEGIN

@interface MicroAppsFlutterCordovaplugin : CDVPlugin

- (void)openMicroApp:(CDVInvokedUrlCommand*)command;

-(FlutterViewController*)createEngineFromMain: (BOOL) typeModal;
-(FlutterViewController*)createEngineWithInitial:(NSString*)route which: (BOOL) typeModal;
-(FlutterViewController*)createEngine:(NSString*) entryPoint library:(NSString*) uri which: (BOOL) typeModal;



@end

NS_ASSUME_NONNULL_END
