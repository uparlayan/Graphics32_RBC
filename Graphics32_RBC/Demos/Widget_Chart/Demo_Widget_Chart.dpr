program Demo_Widget_Chart;

uses
  Vcl.Forms,
  Ana_ in 'Ana_.pas' {Ana};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAna, Ana);
  Application.Run;
end.
