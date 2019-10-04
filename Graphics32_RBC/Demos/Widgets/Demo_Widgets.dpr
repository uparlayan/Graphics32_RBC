program Demo_Widgets;

uses
  Vcl.Forms,
  Winapi.Windows,
  Ana_ in 'Ana_.pas' {Ana},
  PopupForm_ in 'PopupForm_.pas' {PopupForm},
  DropDownForm_ in 'DropDownForm_.pas' {DropDownForm},
  Currencies_ in 'Currencies_.pas' {Currencies},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  //AddFontResource('fontlar\droid.ttf');
  //SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  //SendMessage(HWND_BROADCAST, $1D, 0, 0);
  //TStyleManager.TrySetStyle('Amethyst Kamri');
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAna, Ana);
  Application.Run;
end.
