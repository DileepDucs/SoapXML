//
//  SoapAttribute.h
// IUVCONNECT
//
//  Created by Taj Ahmed on 27/10/15.
//  Copyright © 2015 MOBINEERS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoapParameter : NSObject

@property NSString* parameterName;
@property NSString* parameterValue;

-(id)initWithName:(NSString*)name;
-(void)addSoapAttribute:(NSString*)name withValue:(NSString*)value;
-(void)addInnerParameterWithName:(NSString*)name value:(NSString*)value;

@end
