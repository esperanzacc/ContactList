//
//  InputCollector.m
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import "InputCollector.h"

@implementation InputCollector


- (NSString *)inputForPrompt: (NSString *)promptString {
    char inputChars[255];
  
    fgets(inputChars, 255, stdin);
  
    NSString *str = [NSString stringWithUTF8String:inputChars];
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  
}

@end
