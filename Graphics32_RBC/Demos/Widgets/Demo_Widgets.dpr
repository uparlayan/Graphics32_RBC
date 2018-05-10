program Demo_Widgets;

uses
  Vcl.Forms,
  Ana_ in 'Ana_.pas' {Ana},
  PopupForm_ in 'PopupForm_.pas' {PopupForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAna, Ana);
  Application.Run;
end.
