program GramAltin;

uses
  Vcl.Forms,
  Ana_ in 'Ana_.pas' {Form3};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
