//
//  InputCollector.m
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
  self = [super init];
  if (self) {
    _history = [NSMutableArray new];
  }
  return self;
}


- (NSString *)inputForPrompt: (NSString *)promptString {
  char inputChars[255];
  NSLog(@"%@", promptString);
  fgets(inputChars, 255, stdin);

  NSString *str = [[NSString stringWithCString: inputChars encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
  [_history addObject:str];
  return str;
}

@end
