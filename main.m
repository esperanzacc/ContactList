//
//  main.m
//  ContactList
//
//  Created by Esperanza on 2022-05-14.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int sample(ContactList *contactList) {
  NSMutableDictionary *dict =  [NSMutableDictionary dictionary];
  [dict setObject:@"111-111-1111" forKey:@"Mobile"];
  [dict setObject:@"222-222-2222" forKey:@"Work"];
  [dict setObject:@"333-333-3333" forKey:@"Home"];
  
  Contact *esperanza = [[Contact alloc]initWithName:@"esperanza" andLastName:@"chen" andEmail:@"esp@email.com"];
  Contact *brian = [[Contact alloc]initWithName:@"brian" andLastName:@"wu" andEmail:@"bri@email.com"];
  Contact *kelly = [[Contact alloc]initWithName:@"kelly" andLastName:@"chang" andEmail:@"kel@email.com"];
  Contact *ken = [[Contact alloc]initWithName:@"ken" andLastName:@"huang" andEmail:@"ken@email.com" andPhone:dict];

 
  [contactList addContact:esperanza];
  [contactList addContact:brian];
  [contactList addContact:kelly];
  [contactList addContact:ken];
  
  return 0;
}


int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *menu = @"\nWhat would you like to do next?\nnew - create a new contact\nlist - List all contacts\nshow - Display details along with an index\nfind <keyword> - Find contact with a keyword\nhistory - View last three commands\nquit - Exit Application";
    NSLog(@"%@", menu);
    
    BOOL (createContact) = YES;
    
    InputCollector *inputCollector = [[InputCollector alloc]init];
    ContactList *lists = [[ContactList alloc]init];
    sample(lists);
    NSMutableDictionary *phone = [NSMutableDictionary new];
    NSMutableArray *history = [NSMutableArray new];
    
    while (createContact) {
      NSString *optionInput = [inputCollector inputForPrompt:@""];
      
      if ([optionInput isEqualToString:@"quit"]) {
        break;
      } else if ([optionInput isEqualToString:@"new"]) {
        [history addObject:@"new"];
        // prompt the user for information
        NSLog(@"Enter your email address:");
        NSString *email = [inputCollector inputForPrompt:@""];
        [lists checkEmailExist:email];
        if ([lists checkEmailExist:email]) {
          NSLog(@"This email is already be used. Please create another email.");
          break;
        } else {
          NSLog(@"Succeed!");
          NSLog(@"Enter your firstname:");
          NSString *firstName = [inputCollector inputForPrompt:@""];
          NSLog(@"Enter your lastname:");
          NSString *lastName = [inputCollector inputForPrompt:@""];
          
          while (YES) {
            NSLog(@"Do you want to add a phone number? \n(y/n)");
            NSString *addPhone = [inputCollector inputForPrompt:@""];
            if ([addPhone isEqualToString:@"y"]) {
              NSLog(@"Select the following option(0: Mobile, 1: Work, 2: Home):");
              NSString *option = [inputCollector inputForPrompt:@""];
              if ([option isEqualToString:@"0"] || [option isEqualToString:@"1"] || [option isEqualToString:@"2"] ) {
                NSLog(@"Enter your phone number (eg. xxx-xxx-xxxx):");
                NSString *phoneNumber = [inputCollector inputForPrompt:@""];
                
                NSMutableArray *phones = [[NSMutableArray alloc]initWithObjects:@"Mobile", @"Work", @"Home", nil];
                [phone setObject:phoneNumber forKey:[phones objectAtIndex:[option intValue]]];
            }
          } else if ([addPhone isEqualToString:@"n"]) {
            break;
            }
          }
          Contact *contact = [[Contact alloc]initWithName:firstName andLastName:lastName andEmail:email andPhone:phone];
          [lists addContact:contact];
        }
      } else if ([optionInput isEqualToString:@"list"]) {
        [history addObject:@"list"];
        [lists printAllLists];
      } else if ([optionInput isEqualToString:@"show"]) {
        [history addObject:@"show"];
        NSLog(@"Enter the index:");
        NSString *index = [inputCollector inputForPrompt:@""];
        [lists showList:[index integerValue]];
      } else if ([optionInput isEqualToString:@"find"]) {
        [history addObject:@"find"];
        NSLog(@"Enter keyword (one's firstname or one's lastname or one's email)");
        NSString *keyword = [inputCollector inputForPrompt:@""];
        [lists findContact:keyword];
      } else if ([optionInput isEqualToString:@"history"]) {
        if (history.count == 0) {
          NSLog(@"no history record.");
        } else if (history.count == 1) {
          NSLog(@"history %ld \n%@", history.count, [history objectAtIndex:0]);
        } else if (history.count == 2) {
          NSLog(@"history %ld", history.count);
          for (int i = 0; i < 2; i++) {
            NSLog(@"%@", [history objectAtIndex:i]);
          }
        } else if (history.count == 3) {
          NSLog(@"history %ld", history.count);
          for (int i = 0; i <= 2; i++) {
            NSLog(@"%@", [history objectAtIndex:i]);
          }
        } else {
          NSLog(@"history %ld", history.count);
          for (long i = (history.count -2); i == 0; i++) {
            NSLog(@"%@", [history objectAtIndex:i]);
          }
        }
        
      }
      NSLog(@"%@", menu);
    }
    
    
  }
  return 0;
}
