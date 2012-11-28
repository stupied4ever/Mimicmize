//
//  LocalizeHelper.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocalizeHelper.h"

@implementation LocalizeHelper

+(BOOL) is_pt_br {
  
  NSString *locale = [LocalizeHelper get_local_language];
  return [locale isEqualToString:pt_BR];
}

+(NSString *) get_cancel_button {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  if (is_pt_br) {
    
    return @"Cancelar";
  }
  else {
    return @"Cancel";
  }
}
+(NSString *) get_buying_message {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  if (is_pt_br) {
    
    return @"Voce será cobrado por $0.99 (ou equivalente em seu país) por adiquirir as cartas";
  }
  else {
    return @"You will be charged for $0.99 (or equivalent in your country) for getting cards of";
  }
}

+(NSString *) get_buying_title {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  if (is_pt_br) {
    
    return @"Deseja comprar?";
  }
  else {
    return @"Would you like to buy?";
  }
}

+(NSString *) get_compradas_string {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  if (is_pt_br) {
    
    return @"Comprados";
  }
  else {
    return @"Already have";
  }
  
}

+(NSString *) get_nao_compradas_string {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  if (is_pt_br) {
    
    return @"Não comprados ainda";
  }
  else {
    return @"Don't have yet";
  }
  
}

+(NSString *) get_local_language {
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
  NSString *currentLanguage = [languages objectAtIndex:0];
  
  if ([currentLanguage isEqualToString:@"pt"]) {
    return pt_BR;
  }
  return en_US;
}

+(NSString *) get_text_to_group_box_with_index : (NSInteger) index {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  
  if (index == 1) {
    if (is_pt_br) {
      return @"Nome do seu grupo";
    }
    else {
      return @"Name of your group";
    }
    
  }
  else {
    
    if (is_pt_br) {
      return @"Nome do grupo adversário";
    }
    else {
      return @"Oppnent`s group name";
    }
  }
  
  return @"";
}

+(NSString *) get_seconds_string {
  
  NSString *local_language = [LocalizeHelper get_local_language];
  if ([local_language isEqualToString:pt_BR]) {
    return @"segs";
  }
  else {
    return @"secs";
  }
}

+(NSString *) convert_value_to_minutes : (float)value {
  
  int valor = value;
  
  valor /=5;
  valor *= 5;
  
  int mins = valor / 60;
  int segs = valor % 60;
  
  
  NSString *string_segs = @"";
  NSString *string_valor = @"";
  NSString *unidade_medida = @"mins";
  
  if (segs < 10) {
    string_segs = [NSString stringWithFormat:@"0%d",segs];
  }
  else {
    string_segs = [NSString stringWithFormat:@"%d",segs];
  }
  
  
  if (mins < 1) {
    unidade_medida = [LocalizeHelper get_seconds_string];
    string_valor = [NSString stringWithFormat:@"%@",string_segs];
  }
  else {
    string_valor = [NSString stringWithFormat:@"0%d:%@",mins,string_segs];
  }
  
  return [NSString stringWithFormat:@"%@ %@",string_valor, unidade_medida];
  
}

@end
