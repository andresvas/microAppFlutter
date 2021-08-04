//
//  microAppsFlutterCordovaplugin.m
//  pocMicroApps
//
//  Created by Andres Felipe Vasquez Saldarriaga on 27/07/21.
//

#import <Foundation/Foundation.h>
#import "MicroAppsFlutterCordovaplugin.h"



@implementation MicroAppsFlutterCordovaplugin

FlutterEngine *flutterEngine;
FlutterMethodChannel *channel;
FlutterViewController *controller;



- (void)openMicroApp:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult;
    NSNumber *number = [command.arguments objectAtIndex:0];
    BOOL isModal = [number boolValue];
    NSString *route = [command.arguments objectAtIndex:1];
    NSArray *customPoint = [command.arguments objectAtIndex:2];
    FlutterViewController *flutterViewController;
        
    
    @try {
        if (flutterEngine == NULL) {
            flutterEngine = [[FlutterEngine alloc] initWithName:@"flutterEngine"];
        } else {
            flutterEngine.viewController = NULL;
        }
        
        if (![route isEqual:[NSNull null]] && route.length > 0) {
            flutterViewController = [self createEngineWithInitial:[NSString stringWithFormat:@"/%@", route] which:isModal];
        } else {
            if (![customPoint isEqual:[NSNull null]] && customPoint.count > 1) {
                flutterViewController = [self createEngine:[customPoint objectAtIndex:0] library:[customPoint objectAtIndex:1] which:isModal];
            } else {
                flutterViewController = [self createEngineFromMain:isModal];
            }
        }
        
        [self.viewController presentViewController:flutterViewController animated:YES completion:nil];
        
        // this method just run when if modulo is "album"
        [self addChannelForAlbumModule];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:route];
    } @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    } @finally {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    
    
}



-(FlutterViewController*)createEngineFromMain:(BOOL) typeModal {
    
    [flutterEngine runWithEntrypoint:NULL];
    
    controller =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:NULL bundle:NULL];
    
    [self addTypeModal:typeModal];
    
    return controller;
}

-(FlutterViewController*) createEngineWithInitial:(NSString *)route which:(BOOL)typeModal {
    
    [flutterEngine runWithEntrypoint:NULL initialRoute:route];
    
    controller = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:NULL bundle:NULL];
    
    [self addTypeModal:typeModal];
    
    return  controller;
}

- (FlutterViewController *)createEngine:(NSString *)entryPoint library:(NSString *)uri which:(BOOL)typeModal {

    [flutterEngine runWithEntrypoint:entryPoint libraryURI:uri];
    
    controller = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:NULL bundle:NULL];
    
    [self addTypeModal:typeModal];
    
    return  controller;
}

-(void) addChannelForAlbumModule {
    FlutterMethodChannel *channel = [FlutterMethodChannel  methodChannelWithName:@"test" binaryMessenger:controller.binaryMessenger];
    
    UIDevice *myDevice = [UIDevice currentDevice];
       [myDevice setBatteryMonitoringEnabled:YES];
    
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if([call.method  isEqual: @"getBatteryLevel"]) {

               int batLeft = (float)[myDevice batteryLevel] * 100;
            result(@(batLeft));
            
        } else if([call.method  isEqual: @"randomMessage"]) {
            NSDictionary *queryDictionary = call.arguments;
            
            for(id key in queryDictionary){
                NSLog(@"key=%@ value=%@", key, [queryDictionary objectForKey:key]);
               
            }
           
            [self.viewController dismissViewControllerAnimated:NULL completion:NULL];
            
        } else {
            result(FlutterMethodNotImplemented);
        }
        
    }];
}



-(void) addTypeModal: (BOOL) modal {
    if (modal) {
        controller.modalPresentationStyle = UIModalPresentationPopover;
    } else {
        controller.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
}

@end
