//
//  SoapAttribute.m
// IUVCONNECT
//
//  Created by Taj Ahmed on 27/10/15.
//  Copyright © 2015 MOBINEERS. All rights reserved.
//

#import "SoapParameter.h"

@interface SoapParameter ()

@property(nonatomic,strong) NSMutableDictionary *soapAttributes;
@property(nonatomic,strong) NSMutableArray<SoapParameter*> *innerParameters;

@end

@implementation SoapParameter

-(id)init{
    self = [super init];
    if (self) {
        self.soapAttributes = [[NSMutableDictionary alloc] init];
        self.innerParameters = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id)initWithName:(NSString*)name{
    self = [self init];
    if (self) {
        self.parameterName = name;
    }
    return self;
}

@synthesize parameterName,soapAttributes;

-(void)addSoapAttribute:(NSString*)name withValue:(NSString*)value{
    if (value) {
        [soapAttributes setValue:value forKey:name];
    }
}

-(void)addInnerParameterWithName:(NSString*)name value:(NSString*)value{
    SoapParameter* innerParameter = [[SoapParameter alloc] initWithName:name];
    [innerParameter setParameterValue:value];
    [self.innerParameters addObject:innerParameter];
}

-(NSString*)description{
    NSMutableString *soapParameter = [[NSMutableString alloc] initWithFormat:@"<%@",self.parameterName];
    [soapAttributes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [soapParameter appendFormat:@" %@=\"%@\" ",key,obj];
    }];
    if (self.parameterValue) {
        [soapParameter appendString:@">"];
        [soapParameter appendString:self.parameterValue];
        [soapParameter appendFormat:@"</%@>",self.parameterName];
    } else if ([self.innerParameters count] > 0) {
        [soapParameter appendString:@">"];
        for (SoapParameter* innerParameter in self.innerParameters) {
            [soapParameter appendString:[innerParameter description]];
        }
        [soapParameter appendFormat:@"</%@>",self.parameterName];
    }else {
        [soapParameter appendString:@"/>"];
    }
    return soapParameter;
}

@end
