//
//  SoapXml.m
//  XmlParseExample
//
//  Created by Taj Ahmed on 16/10/15.
//  Copyright © 2015 Taj Ahmed. All rights reserved.
//

#import "SoapXml.h"

@implementation SoapXml

+ (id)initWithXmlString:(NSString*)xmlString{
    SoapXml *soapXml = [[SoapXml alloc] init];
    [soapXml setSoapXmlAsString:xmlString];
    return soapXml;
}

-(NSString*)getSoapXmlAsString{
    return self.soapXmlAsString;
}

@end
