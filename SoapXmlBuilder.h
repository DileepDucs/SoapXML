//
//  SoapXmlBuilder.h
// IUVCONNECT
//
//  Created by MOBINEERS on 13/10/15.
//  Copyright © 2015 MOBINEERS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoapXml.h"
#import "SoapParameter.h"

@interface SoapXmlBuilder : NSObject{
    NSMutableString *soapString;
    NSString *requestMethod;
    NSString *soapTemplate;
}

- (SoapXml*)build;
- (void)reset;
- (instancetype)addRequestMethod:(NSString*) requestMethodName;
- (instancetype)addParameter:(NSString*) name withValue:(NSString*)value;
- (instancetype)addParameter:(NSString*) name withValue:(NSString*)value xmlEncoded:(BOOL)xmlEncoded;
- (instancetype)addParameter:(NSString*) name withIntegerValue:(int)value;
- (instancetype)addParameter:(NSString*) name withDoubleValue:(double)value;

@end
