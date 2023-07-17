  Copyright © 2004 by Chris Thornton, Thornsoft Development, Inc.; all rights reserved

  Purpose:
   This parser allows native import/export for Polyglot files.  Polyglot is 
   a Delphi "ini translator" by Balmsoft - www.balmsoft.com.
   The primary job of this parser is to strip/add single quotes. 
   ex:
     Polyglot:   64638_arm_R_ARM_ERROR_ACCOUNT_EXPIRED='Key Expired'
     IniTrans:   64638_arm_R_ARM_ERROR_ACCOUNT_EXPIRED=Key Expired
     Polyglot:   ShowQuickBar1.Hint='Open New Preview/Edit Window'#13#10'(Multiple instances allowed)'#13#10'While there is already one of these docked into ClipMate Explorer, '#13#10'you can open as many as you''d like.'
     IniTrans:   ShowQuickBar1.Hint=Open New Preview/Edit Window#13#10(Multiple instances allowed)#13#10While there is already one of these docked into ClipMate Explorer, #13#10you can open as many as youd like.
  
  Developer(s):
   Chris Thornton - chris at thornsoft dot com

  Based On:  Oleg Parser, OpenOffice Parser

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

  SOURCE:  In accordance with the MPL, the source (if not yet placed into sourceforge),
   is available here:
   http://www.thornsoft.com/localization/dist/polyglotparser_src.zip
   