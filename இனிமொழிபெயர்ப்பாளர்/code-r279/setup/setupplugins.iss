; ISPP required!
#include "IniTransCommon.iss"
#define AppName "Ini Translator Plugin Package"
#define AppVerName AppName + " " + AppVersion

[_ISTool]
EnableISX=true

[Setup]
AppCopyright={#AppCopyright}
AppName={#AppName}
AppVerName={#AppVerName}
DefaultGroupName={#GroupName}
DefaultDirName={pf}\{#GroupName}\plugins
DisableStartupPrompt=true
DisableFinishedPage=false
DisableReadyMemo=false
UninstallLogMode=append
AppPublisher={#AppPublisher}
AppPublisherURL={#URL}
AppSupportURL={#URL}
AppUpdatesURL={#URL}
AppVersion={#AppVersion}
AppID={#AppID}
UpdateUninstallLogAppName=true
SourceDir=.
ChangesAssociations=false
ShowTasksTreeLines=true
UninstallRestartComputer=false
RestartIfNeededByRun=true
UsePreviousSetupType=true
UsePreviousTasks=true
OutputBaseFilename=initrans{#AppShortVersion}_pluginsonly
AllowNoIcons=true
LicenseFile=..\MPL-1.1.rtf
Compression=bzip
;DisableAppendDir=true
AppendDefaultDirName=false

CreateAppDir=true
ShowLanguageDialog=false
[Dirs]
Name: {app}\plugins

[Files]
Source: ..\bin\plugins\*.dll; DestDir: {app}\plugins; Flags: ignoreversion comparetimestamp; Components: PLUGINS
Source: ..\bin\plugins\*.map; DestDir: {app}\plugins; Flags: comparetimestamp; Components: DEBUGFILES

[UninstallDelete]
Name: {app}\plugins\*.*; Type: filesandordirs

[Messages]
BeveledLabel=IniTranslator {#AppVersion} Plugin Install

[Components]
Name: PLUGINS; Description: Plugin files; Flags: fixed; Types: custom compact full
Name: DEBUGFILES; Description: Debug map files; Types: custom full
