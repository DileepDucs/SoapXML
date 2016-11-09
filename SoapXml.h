//
//  SoapXml.h
//  XmlParseExample
//
//  Created by Taj Ahmed on 16/10/15.
//  Copyright © 2015 Taj Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>

/// SoapXml to represent soapXml message as object
@interface SoapXml : NSObject

@property(atomic,strong) NSString * soapXmlAsString;

+ (id)initWithXmlString:(NSString*)xmlString;
- (NSString*) getSoapXmlAsString;

@end
