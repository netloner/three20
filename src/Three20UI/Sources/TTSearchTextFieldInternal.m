//
// Copyright 2009-2010 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "Three20UI/private/TTSearchTextFieldInternal.h"

// UI
#import "Three20UI/TTSearchTextField.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTSearchTextFieldInternal

@synthesize delegate = _delegate;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTextField:(TTSearchTextField*)textField {
  if (self = [super init]) {
    _textField = textField;
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITextFieldDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField {
	//NSLog(@"TTsearch=> textFieldShouldBeginEditing => text: %@", textField.text);
  if ([_delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
    return [_delegate textFieldShouldBeginEditing:textField];
  } else {
    return YES;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)textFieldDidBeginEditing:(UITextField*)textField {
	//NSLog(@"TTsearch=> textFieldDidBeginEditing => text: %@", textField.text);
  if ([_delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
    [_delegate textFieldDidBeginEditing:textField];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldEndEditing:(UITextField*)textField {
	//NSLog(@"TTsearch=> textFieldShouldEndEditing => text: %@", textField.text);
  if ([_delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
    return [_delegate textFieldShouldEndEditing:textField];
  } else {
    return YES;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)textFieldDidEndEditing:(UITextField*)textField {
	//NSLog(@"TTsearch=> textFieldDidEndEditing => text: %@", textField.text);			
  if ([_delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
    [_delegate textFieldDidEndEditing:textField];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)                textField: (UITextField*)textField
    shouldChangeCharactersInRange: (NSRange)range
                replacementString: (NSString*)string {
	//NSLog(@"in ttsearch shouldChangeCharactersInRange replace=> _%@_ , and currently got string => %@", string, textField.text);
  //WTF!! Edit by Edward , Need to check if it's Chinese

  if (![_textField shouldUpdate:(!string.length && range.length == 1)]) {
    return NO;
  }

  SEL sel = @selector(textField:shouldChangeCharactersInRange:replacementString:);
  if ([_delegate respondsToSelector:sel]) {
    return [_delegate textField:textField shouldChangeCharactersInRange:range
              replacementString:string];
  } else {
    return YES;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldClear:(UITextField*)textField {
  [_textField shouldUpdate:YES];

  if ([_delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
    return [_delegate textFieldShouldClear:textField];
  } else {
    return YES;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  BOOL shouldReturn = YES;
  if ([_delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
    shouldReturn = [_delegate textFieldShouldReturn:textField];
  }

  if (shouldReturn) {
    if (!_textField.searchesAutomatically) {
      [_textField search];
    } else {
      [_textField performSelector:@selector(doneAction)];
    }
  }
  return shouldReturn;
}


@end
