//
//  ContactList.m
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype)init
{
  self = [super init];
  if (self) {
    _lists = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void) addContact:(Contact *)newContact{
  [_lists addObject:newContact];
  
}

- (void) printAllLists {
  NSInteger num = 0;
  for (Contact *list in _lists) {
    NSString *print = [NSString stringWithFormat:@"%ld: <%@ %@> (%@)",num,[list firstName],[list lastName],[list email]];
    NSLog(@"%@",print);
    num += 1;
  }
}

- (void) showList: (NSInteger) index {
  if (index >= 0 && index <_lists.count) {
    Contact *list = [_lists objectAtIndex:index];
    NSLog(@"%@",[NSString stringWithFormat:@"\nFirstname: %@ Lastname: %@ Email: %@ Phone: Mobile: %@, Work: %@, Home: %@", [list firstName],[list lastName],[list email], [[list phone] objectForKey:@"Mobile"], [[list phone] objectForKey:@"Work"], [[list phone] objectForKey:@"Home"]]);
  } else {
    NSLog(@"not found");
  }
}
  
- (void) findContact: (NSString *) userSearch {
  for (Contact *list in _lists) {
    if (([userSearch isEqualToString: [list firstName]]) || ([userSearch isEqualToString: [list firstName]]) ||([userSearch isEqualToString: [list firstName]])) {
      NSLog(@"%@",[NSString stringWithFormat:@"\nFirstname: %@ Lastname: %@ Email: %@", [list firstName],[list lastName],[list email]]);
    }
  }
}

- (BOOL) checkEmailExist: (NSString *) userEmail {
  BOOL (exist) = NO;
  for (Contact *list in _lists) {
    if ([userEmail isEqualToString: [list email]]) {
      exist = YES;
      break;
    }
  }
  return exist;
}
  
@end
