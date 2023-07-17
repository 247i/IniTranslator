; ISPP required!
#include "IniTransCommon.iss"
#define AppVerName AppName + " " + AppVersion + " (without plugins)"

[_ISTool]
EnableISX=true

[Setup]
AppCopyright={#AppCopyright}
AppName={#AppName}
AppVerName={#AppVerName}
DefaultGroupName={#GroupName}
DefaultDirName={pf}\{#GroupName}
DisableStartupPrompt=true
DisableFinishedPage=false
DisableReadyMemo=false
UninstallLogMode=overwrite
AppPublisher={#AppPublisher}
AppPublisherURL={#URL}
AppSupportURL={#URL}
AppUpdatesURL={#URL}
AppVersion={#AppVersion}
AppID={#AppID}
UpdateUninstallLogAppName=true
SourceDir=.
ChangesAssociations=true
ShowTasksTreeLines=true
UninstallRestartComputer=true
RestartIfNeededByRun=false
UsePreviousSetupType=true
UsePreviousTasks=true
OutputBaseFilename=initrans{#AppShortVersion}_noplugins
AllowNoIcons=true
InfoAfterFile=..\Changelog.txt
InfoBeforeFile=..\releasenote.txt
LicenseFile=..\MPL-1.1.rtf
Compression=bzip
; DisableAppendDir=true
AppendDefaultDirName=false

[Dirs]
Name: {app}\help
Name: {app}\languages; Components: LANGUAGEFILES
Name: {app}\dictionaries; Components: DICTIONARIES
Name: {app}\help\images; Components: HTMLSOURCEHELP
Name: {app}\help\styles; Components: HTMLSOURCEHELP
Name: {userappdata}\IniTranslator

[Files]
Source: ..\bin\translator.exe; DestDir: {app}; Flags: comparetimestamp ignoreversion; Components: MAINAPPLICATION
Source: ..\bin\MsDictBuild.exe; DestDir: {app}; Components: MSDICTBUILDINSTALL
Source: ..\Changelog.txt; DestDir: {app}; Components: MAINAPPLICATION
Source: ..\description.txt; DestDir: {app}; Components: MAINAPPLICATION
Source: ..\releasenote.txt; DestDir: {app}; Components: MAINAPPLICATION

Source: ..\languages\*.lng; DestDir: {app}\languages\; Components: LANGUAGEFILES; Flags: comparetimestamp
Source: ..\dictionaries\*.dct; DestDir: {app}\dictionaries\; Components: DICTIONARIES

Source: ..\help\*.chm; DestDir: {app}\help; Components: HTMLBINARYHELP
Source: ..\help\*.html; DestDir: {app}\help; Components: HTMLSOURCEHELP
Source: ..\help\images\*.jpg; DestDir: {app}\help\images; Components: HTMLSOURCEHELP
Source: ..\help\styles\*.css; DestDir: {app}\help\styles; Components: HTMLSOURCEHELP

Source: ..\bin\translator.map; DestDir: {app}; Components: DEBUGFILES
Source: ..\bin\MsDictBuild.map; DestDir: {app}; Components: DEBUGFILES and MSDICTBUILDINSTALL

[Registry]
Root: HKCR; SubKey: .LNG; ValueType: string; ValueData: LNGFILE; Flags: uninsdeletekey; Tasks: LNGASSOCIATE
Root: HKCR; SubKey: LNGFILE; ValueType: string; ValueData: Language Files; Flags: uninsdeletekey; Tasks: LNGASSOCIATE
Root: HKCR; SubKey: LNGFILE\Shell\Open\Command; ValueType: string; ValueData: """{app}\translator.exe"" ""%1"""; Flags: uninsdeletevalue; Tasks: LNGASSOCIATE
Root: HKCR; Subkey: LNGFILE\DefaultIcon; ValueType: string; ValueData: {app}\translator.exe,0; Flags: uninsdeletevalue; Tasks: LNGASSOCIATE

Root: HKCR; SubKey: .ISL; ValueType: string; ValueData: ISLFILES; Flags: uninsdeletekey; Tasks: ISLASSOCIATE
Root: HKCR; SubKey: ISLFILES; ValueType: string; ValueData: Inno Setup Language Files; Flags: uninsdeletekey; Tasks: ISLASSOCIATE
Root: HKCR; SubKey: ISLFILES\Shell\Open\Command; ValueType: string; ValueData: """{app}\translator.exe"" ""%1"""; Flags: uninsdeletevalue; Tasks: ISLASSOCIATE
Root: HKCR; Subkey: ISLFILES\DefaultIcon; ValueType: string; ValueData: {app}\translator.exe,0; Flags: uninsdeletevalue; Tasks: ISLASSOCIATE

Root: HKCR; SubKey: .INI; ValueType: string; ValueData: INIFILES; Flags: uninsdeletekey; Tasks: INIASSOCIATE
Root: HKCR; SubKey: INIFILES; ValueType: string; ValueData: Settings Files; Flags: uninsdeletekey; Tasks: INIASSOCIATE
Root: HKCR; SubKey: INIFILES\Shell\Open\Command; ValueType: string; ValueData: """{app}\translator.exe"" ""%1"""; Flags: uninsdeletevalue; Tasks: INIASSOCIATE
Root: HKCR; Subkey: INIFILES\DefaultIcon; ValueType: string; ValueData: {app}\translator.exe,0; Flags: uninsdeletevalue; Tasks: INIASSOCIATE


[Tasks]
Name: LNGASSOCIATE; Description: Associate with LNG files; GroupDescription: File-associations; Flags: unchecked
Name: ISLASSOCIATE; Description: Associate with ISL files; GroupDescription: File-associations; Flags: unchecked
Name: INIASSOCIATE; Description: Associate with INI files; GroupDescription: File-associations; Flags: unchecked

[INI]
Filename: {app}\Ini Translator Home Page.url; Section: InternetShortcut; Key: URL; String: {#URL}
Filename: {app}\Browse CVS Repository.url; Section: InternetShortcut; Key: URL; String: http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/initranslator/translator
Filename: {app}\Download Daily Sources.url; Section: InternetShortcut; Key: URL; String: {#URL}/daily
Filename: {app}\MPL 1.1 License.url; Section: InternetShortcut; Key: URL; String: http://www.mozilla.org/MPL/MPL-1.1.html
Filename: {app}\Latest Release.url; Section: InternetShortcut; Key: URL; String: http://sourceforge.net/project/showfiles.php?group_id=78744
; add some default tool menu entries
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 0; String: """Character Map"",$(SysDir)\CharMap.exe,,$(SysDir),False,False,False,False"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 1; String: -,,,,False,False,False,False; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 2; String: """View Original in Notepad"",$(SysDir)\Notepad.exe,$(OrigPath),$(OrigDir),False,False,False,True"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 3; String: """View Translation in Notepad"",$(SysDir)\notepad.exe,$(TransPath),$(TransDir),False,False,False,True"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 4; String: """View Dictionary in Notepad"",$(SysDir)\notepad.exe,$(DictPath),$(DictDir),False,False,False,True"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 5; String: -,,,,False,False,False,False; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 6; String: """Word Web Online"",iexplore.exe,http://www.wordwebonline.com/search.pl?w=$(TransText),,False,False,True,True"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 7; String: -,,,,False,False,False,False; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 8; String: """View in Explorer (Original)"",$(WinDir)\explorer.exe,""/e,/root,, /select, $(OrigPath)"",,False,False,False,False"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS
Filename: {userappdata}\IniTranslator\translator.ini; Section: External Tools; Key: 9; String: """View in Explorer (Translation)"",$(WinDir)\explorer.exe,""/e, /root,, /select, $(TransPath)"",,False,False,False,False"; Flags: createkeyifdoesntexist; Components: DEFAULT_TOOLS

[UninstallDelete]
Name: {app}\*.*; Type: filesandordirs
Name: {userappdata}\IniTranslator; Type: filesandordirs


[Run]
Filename: {app}\translator.exe; WorkingDir: {app}; Description: Run program now; Flags: nowait postinstall

[Icons]
Name: {group}\Ini Translator; Filename: {app}\translator.exe; WorkingDir: {app}; IconFilename: {app}\translator.exe; IconIndex: 0
Name: {group}\MS Dictionary Converter; Filename: {app}\MsDictBuild.exe; WorkingDir: {app}; IconIndex: 0; IconFilename: {app}\MsDictBuild.exe; Flags: createonlyiffileexists
Name: {group}\Ini Translator Help; Filename: {app}\help\translator.html; WorkingDir: {app}\help; IconFilename: {app}\help\translator.html
Name: {group}\Internet\Ini Translator Homepage; Filename: {app}\Ini Translator Home Page.url; WorkingDir: {app}
Name: {group}\Internet\Browse CVS Repository; Filename: {app}\Browse CVS Repository.url; WorkingDir: {app}
Name: {group}\Internet\MPL 1.1 License; Filename: {app}\MPL 1.1 License.url; WorkingDir: {app}
Name: {group}\Internet\Latest Release; Filename: {app}\Latest Release.url; WorkingDir: {app}

[Messages]
BeveledLabel=Ini Translator Install {#AppVersion} (without plugins)

[Components]
Name: MAINAPPLICATION; Description: Main application; Flags: fixed; Types: full compact custom
Name: LANGUAGEFILES; Description: Language Files; Types: full
Name: DICTIONARIES; Description: Dictionaries; Types: full
Name: HTMLBINARYHELP; Description: CHM based Help; Types: full compact
Name: HTMLSOURCEHELP; Description: HTML based Help; Types: full
Name: DEBUGFILES; Description: Debug map file; Types: custom full
Name: MSDICTBUILDINSTALL; Description: MS Dictionary Converter; Types: custom full
Name: DEFAULT_TOOLS; Description: Install default tools; Types: custom full compact
