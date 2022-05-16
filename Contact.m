//
//  Contact.m
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName: (NSString *) firstName andLastName: (NSString *) lastName andEmail: (NSString *) email
{
  self = [super init];
  if (self) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
  }
  return self;
}
@end
