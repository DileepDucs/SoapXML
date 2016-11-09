//
//  SoapXmlBuilder.m
// IUVCONNECT
//
//  Created by MOBINEERS on 13/10/15.
//  Copyright © 2015 MOBINEERS. All rights reserved.
//
#import "SoapXmlBuilder.h"
@implementation SoapXmlBuilder
#define USERNAME @"Ahmed"
#define PASSWORD @"1234"

-(id)init{
    self = [super init];
    if (self) {
        soapTemplate = [[NSMutableString alloc] initWithString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                        "xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                        "<soap:Header>"
                        "<UserCredentials xmlns=\"http://tempuri.org/\">"
                        "<userName>Ahmed</userName>"
                        "<password>1234</password>"
                        "</UserCredentials>"
                        "</soap:Header>"
                        "<soap:Body>%@</soap:Body>"
                        "</soap:Envelope>"];
        soapString = [[NSMutableString alloc] init];
    }
    return self;
}

- (instancetype)addRequestMethod:(NSString*) requestMethodName{
    requestMethod = [NSString stringWithFormat:@"<%@ xmlns=\"http://tempuri.org/\">%@</%@>",requestMethodName,@"%@",requestMethodName];
    return self;
}

- (instancetype)addParameter:(NSString*) name withValue:(NSString*)value{
    [soapString appendString:[NSString stringWithFormat:@"<%@>%@</%@>",name,value,name]];
    return self;
}

- (instancetype)addParameter:(NSString*) name withValue:(NSString*)value xmlEncoded:(BOOL)xmlEncoded{
    NSString* xmlValue = [value copy];
    if (xmlEncoded) {
//        xmlValue = [xmlValue stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
//        xmlValue = [xmlValue stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
        xmlValue = [self xmlSimpleEscape:xmlValue];
    }
    [soapString appendString:[NSString stringWithFormat:@"<%@>%@</%@>",name,xmlValue,name]];
    return self;
}

- (instancetype)addParameter:(NSString*) name withIntegerValue:(int)value{
    [soapString appendString:[NSString stringWithFormat:@"<%@>%d</%@>",name,value,name]];
    return self;
}

- (instancetype)addParameter:(NSString*) name withDoubleValue:(double)value{
    [soapString appendString:[NSString stringWithFormat:@"<%@>%f</%@>",name,value,name]];
    return self;
}

- (instancetype)addAttributedParameter:(SoapParameter*)parameter{
    [soapString appendString:[NSString stringWithFormat:@"%@",parameter]];
    return self;
}

- (SoapXml*)build{
    NSString *soapStringWithParameters = [NSString stringWithFormat:requestMethod,soapString];
    NSString *completeSoapMessage = [NSString stringWithFormat:soapTemplate,soapStringWithParameters];
    return [SoapXml initWithXmlString:completeSoapMessage];
}

- (void)reset{
    [soapString setString:@""];
    requestMethod = nil;
}

#pragma mark - private

- (NSString *)xmlSimpleEscape:(NSString*)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&"  withString:@"&amp;"  options:NSLiteralSearch range:NSMakeRange(0, [string length])];
    string = [string stringByReplacingOccurrencesOfString:@">"  withString:@"&gt;"  options:NSLiteralSearch range:NSMakeRange(0, [string length])];
    string = [string stringByReplacingOccurrencesOfString:@"<"  withString:@"&lt;"  options:NSLiteralSearch range:NSMakeRange(0, [string length])];
    return string;
}


@end
