unit Ana_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32_Widgets_Breadcrumb, GR32_Widgets_Statusbar, GR32_Widgets_Base,
  GR32_Widgets_Title, GR32_Widgets_Izgara, GR32_Widgets_PopupForm, GR32_Widgets_Chart, GR32_Widgets_Bar,
  GR32_Widgets_Box, GR32_Widgets_Circle, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    GR32WGHeader1: TGR32WGHeader;
    GR32WGStatusBar1: TGR32WGStatusBar;
    GR32WGBreadcrumb1: TGR32WGBreadcrumb;
    GR32WGBar1: TGR32WGBar;
    TrackBar1: TTrackBar;
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.TrackBar1Change(Sender: TObject);
begin
GR32WGBar1.AlphaBlend := TTrackBar(Sender).Position;
end;

end.
