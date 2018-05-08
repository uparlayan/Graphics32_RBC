{-----------------------------------------------------------------------------------
 Unit Name    : Ana_.pas                                                           /
 Author       : Uður PARLAYAN / uparlayan <ugurparlayan@gmail.com>                 /
 Copyright    : 2018 by Uður PARLAYAN. All rights reserved.                        /
 Component Set: Graphics32_RBC                                                     /
                                                                                   /
 Purpose      : Visual graphics for Business Intelligence applications on VCL      /
 Created      : 2018-05-01                                                         /
 Version      : 1.0.0.0 beta                                                       /
 Required     : https://github.com/graphics32/graphics32                           /
 Source Codes : https://github.com/uparlayan/Graphics32_RBC                        /
 Overview     : This Component Kit provides visual graphics for business           /
                intelligence applications. Allows you to create Dashboard objects  /
                for your applications. The codes contained here include a light    /
                version of the actual component set. Please contact the author for /
                more advanced options.                                             /
-----------------------------------------------------------------------------------}

unit Ana_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32_Image, Vcl.ComCtrls, GR32_ColorPicker,
  GR32_ColorSwatch, Vcl.StdCtrls, Vcl.ExtCtrls, GR32_Widgets_Base,
  GR32_Widgets_Circle, GR32_Widgets_Box, GR32_Widgets_Bar, rbcWidgetBase, rbcWidgetInfoCircle, dxPanel,
  GR32_Widgets_Izgara, GR32_Widgets_Chart;

type
  TAna = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    GP: TGridPanel;
    GR32WidgetBox6: TGR32WidgetBox;
    GR32WidgetBox3: TGR32WidgetBox;
    GR32WidgetCircle1: TGR32WidgetCircle;
    GR32WidgetCircle2: TGR32WidgetCircle;
    PNL_2: TPanel;
    Splitter1: TSplitter;
    BRO: TGR32WidgetChart;
    GRO: TGR32WidgetChart;
    GR32WidgetBar1: TGR32WidgetBar;
    GR32WidgetBar2: TGR32WidgetBar;
    GR32WidgetBar3: TGR32WidgetBar;
    Panel2: TPanel;
    GR32WidgetBar4: TGR32WidgetBar;
    GR32WidgetBar5: TGR32WidgetBar;
    GR32WidgetBar6: TGR32WidgetBar;
    GR32WidgetBar7: TGR32WidgetBar;
    Panel1: TPanel;
    FREQ: TTrackBar;
    TRA: TTrackBar;
    BT_Animasyon: TButton;
    procedure TRAChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BT_AnimasyonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FREQChange(Sender: TObject);
  private
    { Private declarations }
    procedure Setup;

  public
    { Public declarations }
    Kilit: Boolean;
    L, T, W, H, X, Y: Integer;
    AX, AY: Single;
  end;

var
  Ana: TAna;

implementation

{$R *.dfm}

uses
    System.Math
  , GR32_Rubicube_Utils
  ;

procedure TAna.BT_AnimasyonClick(Sender: TObject);
begin
  Timer2.Enabled := NOT Timer2.Enabled;
end;

procedure TAna.FormCreate(Sender: TObject);
begin
  Setup;
end;

procedure TAna.Setup;
var
  I: Integer;
  M: Single;
begin
  T := 0;
  L := 0;
  AX := 2;
  AY := 2;
  M := GRO.Height;
  for I := 0 to 20 do begin
      M := Random(100);
      GRO.Add('Test', M);
      BRO.Add('Test', M);
  end;
end;

procedure TAna.FREQChange(Sender: TObject);
begin
  Timer1.Interval := FREQ.Position;
  Timer2.Interval := FREQ.Position;
end;

procedure TAna.Timer2Timer(Sender: TObject);
begin
  TRA.Position := (TRA.Position + 1) mod 101;
end;

procedure TAna.TRAChange(Sender: TObject);
var
  I, J, K, Z: Integer;
  C: TComponent;
  V: Single;
begin
  for I := 0 to ComponentCount - 1 do begin
      if Components[I] is TGR32WidgetCircle then begin
          TGR32WidgetCircle(Components[I]).Yuzde := TRA.Position;
      end else
      if Components[I] is TGR32WidgetBox then begin
          TGR32WidgetBox(Components[I]).HeaderText := Format('%d$', [trunc(TRA.Position * 7.8)]);
      end else
      if Components[I] is TGR32WidgetBar then begin
          TGR32WidgetBar(Components[I]).Yuzde := TRA.Position;
      end else
      if Components[I] is TGR32WidgetChart then begin

          with  TGR32WidgetChart(Components[I]) do begin
                K := 1;
                Z := ItemCount - 1;
                for J := 0 to ItemCount - 1 do begin
                    K := (K + 1) mod ItemCount;
                    Item(J).Value := Item(K).Value;
                end;
                Invalidate;
          end;
      end else
      begin end;
  end;
end;

end.
