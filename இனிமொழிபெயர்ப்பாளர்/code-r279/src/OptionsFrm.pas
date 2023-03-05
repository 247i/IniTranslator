{@abstract(Options dialog) }
{

  Copyright © 2003-2006 by Peter Thornqvist; all rights reserved

  Developer(s):
    p3 - peter3 att users dott sourceforge dott net

  Status:
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with the
   License. You may obtain a copy of the License at http://www.mozilla.org/MPL/MPL-1.1.html

   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
}

// $Id: OptionsFrm.pas 269 2007-10-21 15:49:52Z peter3 $

unit OptionsFrm;

{$I TRANSLATOR.INC}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CheckLst,
  AppOptions, BaseForm,
  TntClasses, TntStdCtrls, TntExtCtrls, TntComCtrls, TntCheckLst;

type
  TfrmOptions = class(TfrmBase)
    btnOK:TTntButton;
    btnCancel:TTntButton;
    Bevel2:TBevel;
    btnColors:TTntButton;
    pcSettings:TTntPageControl;
    tsGeneral:TTntTabSheet;
    tsAdvanced:TTntTabSheet;
    Label1:TTntLabel;
    Label2:TTntLabel;
    Bevel1:TBevel;
    chkShowQuotes:TTntCheckBox;
    chkShowDetails:TTntCheckBox;
    chkShowToolTips:TTntCheckBox;
    chkShowShortCuts:TTntCheckBox;
    chkReturnToSave:TTntCheckBox;
    chkMoveToNext:TTntCheckBox;
    edLanguage:TTntEdit;
    btnLanguage:TTntButton;
    edHelp:TTntEdit;
    btnHelp:TTntButton;
    pnlFontPreview:TTntPanel;
    chkUseTranslationEverywhere:TTntCheckBox;
    chkAutoFocusTranslation:TTntCheckBox;
    TntLabel1:TTntLabel;
    cbDefaultTransEncoding:TTntComboBox;
    chkGlobalPath:TTntCheckBox;
    chkShowFullNames:TTntCheckBox;
    chkMonitorFiles:TTntCheckBox;
    chkInvertDictionary:TTntCheckBox;
    chkDictIgnoreSpeedKey:TTntCheckBox;
    chkDictIgnoreNonEmpty:TTntCheckBox;
    chkSavePosition:TTntCheckBox;
    chkSaveMinMax:TTntCheckBox;
    TntLabel2:TTntLabel;
    TntLabel3:TTntLabel;
    reHeader:TTntRichEdit;
    reFooter:TTntRichEdit;
    Bevel3:TBevel;
    Bevel4:TBevel;
    Bevel5:TBevel;
    cbFonts:TTntComboBox;
    TntLabel4:TTntLabel;
    TntLabel5:TTntLabel;
    cbFontSizes:TTntComboBox;
    TntLabel6:TTntLabel;
    edPreview: TTntEdit;
    procedure chkShowToolTipsClick(Sender:TObject);
    procedure chkReturnToSaveClick(Sender:TObject);
    procedure btnLanguageClick(Sender:TObject);
    procedure btnHelpClick(Sender:TObject);
    procedure chkSavePositionClick(Sender:TObject);
    procedure btnColorsClick(Sender:TObject);
    procedure cbFontsChange(Sender:TObject);
    procedure cbFontSizesChange(Sender:TObject);
    procedure pnlFontPreviewClick(Sender: TObject);
    procedure edPreviewClick(Sender: TObject);
    procedure edPreviewExit(Sender: TObject);
  private
    { Private declarations }

    FOptions:TAppOptions;
    procedure GetFonts(Strings:TTntStrings);
    procedure UpdatePreview;
    procedure UpdateFontList;
    procedure UpdateFontSizes;
    procedure LoadOptions(Options:TAppOptions);
    procedure SaveOptions(Options:TAppOptions);
    procedure GetFontSizes(const FontName:WideString; Items:Tlist);
  public
    { Public declarations }
    class function Execute(Options:TAppOptions):boolean;
  end;

implementation
uses
  AppConsts, AppUtils, CommonUtils, TntDialogs, ColorsFrm;

{$R *.dfm}

procedure TfrmOptions.chkShowToolTipsClick(Sender:TObject);
begin
  chkShowShortCuts.Enabled := chkShowToolTips.Checked;
end;

procedure TfrmOptions.chkReturnToSaveClick(Sender:TObject);
begin
  chkMoveToNext.Enabled := chkReturnToSave.Checked;
end;

procedure TfrmOptions.btnLanguageClick(Sender:TObject);
begin
  with TTntOpenDialog.Create(nil) do
  try
    InitialDir := '.';
    Title := SSelectLanguageFile;
    Filename := edLanguage.Text;
    if Execute then
      edLanguage.Text := Filename;
  finally
    Free;
  end;
end;

procedure TfrmOptions.btnHelpClick(Sender:TObject);
begin
  with TTntOpenDialog.Create(nil) do
  try
    Title := SSelectHelpFile;
    InitialDir := '.';
    Filename := edHelp.Text;
    if Execute then
      edHelp.Text := Filename;
  finally
    Free;
  end;
end;

procedure TfrmOptions.chkSavePositionClick(Sender:TObject);
begin
  chkSaveMinMax.Enabled := chkSavePosition.Checked;
end;

class function TfrmOptions.Execute(Options:TAppOptions):boolean;
var
  frm:TfrmOptions;
begin
  frm := self.Create(Application);
  try

    // load options
    frm.LoadOptions(Options);
    frm.pcSettings.ActivePageIndex := 0;
    Result := frm.ShowModal = mrOk;
    if Result then
    begin
      // save options
      if AnsiCompareFilename(frm.edLanguage.Text, Options.LanguageFile) <> 0 then
        InfoMsg(_(Application.MainForm.ClassName, SLanguageNotChangedUntilRestart), _(Application.MainForm.ClassName, SInfoCaption));
      frm.SaveOptions(Options);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmOptions.UpdatePreview;
begin
  edPreview.Visible := false;
  pnlFontPreview.Font.Name := cbFonts.Text;
  pnlFontPreview.Font.Size := StrToIntDef(cbFontSizes.Text, pnlFontPreview.Font.Size);
  with pnlFontPreview do
    if edPreview.Text <> '' then
      Caption := edPreview.Text
    else
      Caption := WideFormat('%s, %dpt', [Font.Name, Font.Size]);
end;

procedure TfrmOptions.btnColorsClick(Sender:TObject);
begin
  TfrmColors.Edit(FOptions);
end;

procedure TfrmOptions.LoadOptions(Options:TAppOptions);
begin
  FOptions := Options;
  chkShowQuotes.Checked := Options.ShowQuotes;
  chkInvertDictionary.Checked := Options.InvertDictionary;
  chkShowDetails.Checked := Options.ShowDetails;
  chkShowToolTips.Checked := Options.ShowToolTips;
  chkShowShortCuts.Checked := Options.ShowToolTipShortCuts;
  chkDictIgnoreSpeedKey.Checked := Options.DictIgnoreSpeedKeys;
  chkReturnToSave.Checked := Options.SaveOnReturn;
  chkMoveToNext.Checked := Options.AutoMoveToNext;
  chkSavePosition.Checked := Options.SaveFormPos;
  chkSaveMinMax.Checked := Options.SaveMinMaxState;
  chkGlobalPath.Checked := Options.GlobalPath;
  chkMonitorFiles.Checked := Options.MonitorFiles;
  chkShowFullNames.Checked := Options.ShowFullNameInColumns;
  chkUseTranslationEverywhere.Checked := Options.UseTranslationEverywhere;
  chkAutoFocusTranslation.Checked := Options.AutoFocusTranslation;
  chkDictIgnoreNonEmpty.Checked := Options.DictIgnoreNonEmpty;
  cbDefaultTransEncoding.ItemIndex := Options.DefaultTransEncoding;
  edLanguage.Text := Options.LanguageFile;
  edHelp.Text := Options.HelpFile;
  pnlFontPreview.Font.Name := Options.FontName;
  pnlFontPreview.Font.Size := Options.FontSize;
  edPreview.Text           := Options.PreviewText;
  reHeader.Lines := Options.Header;
  reFooter.Lines := Options.Footer;

{
  edSeparatorChars.Text := Options.SeparatorChars;
  edSectionStart.Text := Options.SectionStart;
  edSectionEnd.Text := Options.SectionEnd;
}
  UpdateFontList;
end;

procedure TfrmOptions.SaveOptions(Options:TAppOptions);
begin
  FOptions := Options;
  Options.ShowQuotes := chkShowQuotes.Checked;
  Options.InvertDictionary := chkInvertDictionary.Checked;
  Options.ShowDetails := chkShowDetails.Checked;
  Options.ShowToolTips := chkShowToolTips.Checked;
  Options.ShowToolTipShortCuts := chkShowShortCuts.Checked;
  Options.DictIgnoreSpeedKeys := chkDictIgnoreSpeedKey.Checked;
  Options.SaveOnReturn := chkReturnToSave.Checked;
  Options.AutoMoveToNext := chkMoveToNext.Checked;
  Options.SaveFormPos := chkSavePosition.Checked;
  Options.SaveMinMaxState := chkSaveMinMax.Checked;
  Options.GlobalPath := chkGlobalPath.Checked;
  Options.MonitorFiles := chkMonitorFiles.Checked;
  Options.UseTranslationEverywhere := chkUseTranslationEverywhere.Checked;
  Options.AutoFocusTranslation := chkAutoFocusTranslation.Checked;
  Options.DictIgnoreNonEmpty := chkDictIgnoreNonEmpty.Checked;
  Options.DefaultTransEncoding := cbDefaultTransEncoding.ItemIndex;
  Options.ShowFullNameInColumns := chkShowFullNames.Checked;
  Options.LanguageFile := edLanguage.Text;
  Options.HelpFile := edHelp.Text;
  Options.FontName := pnlFontPreview.Font.Name;
  Options.FontSize := pnlFontPreview.Font.Size;
  Options.PreviewText := edPreview.Text;


  Options.Header := reHeader.Lines;
  Options.Footer := reFooter.Lines;

{
  Options.SeparatorChars := edSeparatorChars.Text;
  Options.SectionStart := edSectionStart.Text;
  Options.SectionEnd := edSectionEnd.Text;
}  
end;

procedure TfrmOptions.GetFonts(Strings:TTntStrings);
begin
  Strings.Assign(Screen.Fonts);
end;

procedure AddDefaultSizes(Items:Tlist);
begin
  Items.Add(Pointer(8));
  Items.Add(Pointer(9));
  Items.Add(Pointer(10));
  Items.Add(Pointer(11));
  Items.Add(Pointer(12));
  Items.Add(Pointer(14));
  Items.Add(Pointer(16));
  Items.Add(Pointer(18));
  Items.Add(Pointer(20));
  Items.Add(Pointer(22));
  Items.Add(Pointer(24));
  Items.Add(Pointer(26));
  Items.Add(Pointer(28));
  Items.Add(Pointer(36));
  Items.Add(Pointer(48));
  Items.Add(Pointer(72));
end;

function EnumProc(var elf:TEnumLogFont;
  var ntm:TNewTextMetric; FontType:Integer; Items:TList):Integer; stdcall;
var
  Size:integer;
begin
  if FontType = TRUETYPE_FONTTYPE then
  begin
    AddDefaultSizes(Items);
    Result := 0;
  end
  else
  begin
    Size := elf.elfLogFont.lfHeight;
    if Items.IndexOf(Pointer(Size)) < 0 then
      Items.Add(Pointer(Size));
    Result := 1;
  end;
end;

procedure TfrmOptions.GetFontSizes(const FontName:WideString; Items:TList);
begin
  Items.Clear;
  EnumFontFamilies(Canvas.Handle, PChar(string(FontName)),
    @EnumProc, integer(Items));
  if Items.Count < 1 then
    AddDefaultSizes(Items);
end;

procedure TfrmOptions.cbFontsChange(Sender:TObject);
begin
  inherited;
  UpdateFontSizes;
end;

procedure TfrmOptions.cbFontSizesChange(Sender:TObject);
begin
  inherited;
  UpdatePreview;
end;

procedure TfrmOptions.UpdateFontList;
begin
  GetFonts(cbFonts.Items);
  cbFonts.Items.Add('MS Shell Dlg');
  cbFonts.Items.Add('MS Shell Dlg 2');
  if cbFonts.Items.IndexOf(pnlFontPreview.Font.Name) < 0 then
    cbFonts.Items.Add(pnlFontPreview.Font.Name);
  cbFonts.ItemIndex := cbFonts.Items.IndexOf(pnlFontPreview.Font.Name);
  UpdateFontSizes;
end;

function IntCompare(Item1, Item2:Pointer):integer;
begin
  Result := integer(Item1) - integer(Item2);
end;

procedure TfrmOptions.UpdateFontSizes;
var
  S:string;
  L:TList;
  i:integer;
begin
  S := cbFontSizes.Text;
  if S = '' then
    S := IntToStr(pnlFontPreview.Font.Size);
  L := TList.Create;
  try
    cbFontSizes.Items.BeginUpdate;
    try
      GetFontSizes(cbFonts.Text, L);
      L.Sort(IntCompare);
      cbFontSizes.Items.Clear;
      for i := 0 to L.Count - 1 do
        cbFontSizes.Items.Add(IntToStr(integer(L[i])));
    finally
      cbFontSizes.Items.EndUpdate;
    end;
    cbFontSizes.ItemIndex := cbFontSizes.Items.IndexOf(S);
    if cbFontSizes.ItemIndex < 0 then
      cbFontSizes.Text := S;
  finally
    L.Free;
  end;
  UpdatePreview;
end;

procedure TfrmOptions.pnlFontPreviewClick(Sender: TObject);
begin
  edPreview.Text := pnlFontPreview.Caption;
  edPreview.Visible := true;
  Windows.SetFocus(edPreview.Handle);
end;

procedure TfrmOptions.edPreviewClick(Sender: TObject);
begin
  UpdatePreview;
end;

procedure TfrmOptions.edPreviewExit(Sender: TObject);
begin
  UpdatePreview;
end;

end.
