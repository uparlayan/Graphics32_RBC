unit Ana_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32_Image, Vcl.ComCtrls, GR32_ColorPicker,
  GR32_ColorSwatch, Vcl.StdCtrls, Vcl.ExtCtrls, GR32_Widgets_Base,
  GR32_Widgets_Circle, GR32_Widgets_Box, GR32_Widgets_Bar, rbcWidgetBase, rbcWidgetInfoCircle, dxPanel,
  GR32_Widgets_Izgara, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinVS2010, AdvScrollBox, cxScrollBox;

type
  TAna = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    PG: TPageControl;
    P1: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    TRA: TTrackBar;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    WGB: TGR32WidgetBox;
    GR32WidgetBox1: TGR32WidgetBox;
    WBR: TGR32WidgetBar;
    WGC: TGR32WidgetCircle;
    TabSheet1: TTabSheet;
    GP: TGridPanel;
    GR32WidgetBox6: TGR32WidgetBox;
    GR32WidgetBox3: TGR32WidgetBox;
    GR32WidgetBox7: TGR32WidgetBox;
    GR32WidgetCircle1: TGR32WidgetCircle;
    GR32WidgetCircle2: TGR32WidgetCircle;
    GR32WidgetBox2: TGR32WidgetBox;
    GR32WidgetCircle3: TGR32WidgetCircle;
    GR32WidgetCircle4: TGR32WidgetCircle;
    GR32WidgetBar1: TGR32WidgetBar;
    GR32WidgetBar2: TGR32WidgetBar;
    GR32WidgetBar3: TGR32WidgetBar;
    GR32WidgetBar4: TGR32WidgetBar;
    TabSheet2: TTabSheet;
    GR32WidgetIzgara1: TGR32WidgetIzgara;
    GR32WidgetIzgara2: TGR32WidgetIzgara;
    GR32WidgetIzgara3: TGR32WidgetIzgara;
    WGT: TGR32WidgetCircle;
    TabSheet3: TTabSheet;
    cxScrollBox1: TcxScrollBox;
    AdvScrollBox1: TAdvScrollBox;
    procedure TRAChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  System.Math;

procedure TAna.Button1Click(Sender: TObject);
begin
  Kilit := NOT Kilit;
  if (Kilit = True) then begin
      Setup;
      Timer1.Enabled := True;
  end else begin
      Timer1.Enabled := False;
  end;
end;

procedure TAna.Button4Click(Sender: TObject);
begin
  Timer2.Enabled := NOT Timer2.Enabled;
end;

procedure TAna.FormCreate(Sender: TObject);
begin
  Setup;
end;

procedure TAna.FormResize(Sender: TObject);
begin
  W := P1.Width - WGT.Width;
  H := P1.Height - WGT.Height;
end;

procedure TAna.Setup;
begin
  T := 0;
  L := 0;
  W := P1.Width - WGT.Width;
  H := P1.Height - WGT.Height;
  X := WGT.Left;
  Y := WGT.Top;
  AX := 2;
  AY := 2;
  WGT.Top := T;
  WGT.Left := L;
end;

procedure TAna.Timer1Timer(Sender: TObject);
begin
  if (Kilit = True) then begin
      if (WGT.Left < L) or (WGT.Left > W) then AX := AX * -1;
      if (WGT.Top  < T) or (WGT.Top  > H) then begin
          AY := AY * -1;
          //if AY > 0 then AY := 2;
      end;

      if AY > 0
      then AY := AY * 1.04
      else AY := AY / 1.04;

      if (AY > 0) and (AY < 1) then AY := 1;
      if (AY > -1) and (AY < -0.00000000000001) then AY := -1;


      WGT.Left := WGT.Left + Trunc(AX);
      WGT.Top  := WGT.Top  + Trunc(AY);
  end;
  Caption := Format('AX = %g, AY = %g', [AX, AY]);

end;

procedure TAna.Timer2Timer(Sender: TObject);
begin
  TRA.Position := (TRA.Position + 1) mod 101;
end;

procedure TAna.Button2Click(Sender: TObject);
var
  I: Integer;
  C: TComponent;
  X: TGR32WidgetCircle;
begin
  for I := 0 to ComponentCount - 1 do begin
      if Components[I] is TGR32WidgetCircle then begin
          X := TGR32WidgetCircle(Components[I]);
          if (X.Ayarlar.BorderWidth = 1) then begin
              X.Ayarlar.BorderWidth := 5;
              X.Ayarlar.FrameWidth  := 5;
          end else begin
              X.Ayarlar.BorderWidth := 1;
              X.Ayarlar.FrameWidth  := 1;
          end;
      end;
  end;
end;

procedure TAna.Button3Click(Sender: TObject);
var
  I: Integer;
  C: TComponent;
begin
  for I := 0 to ComponentCount - 1 do begin
      if Components[I] is TGR32WidgetCircle then begin
          TGR32WidgetCircle(Components[I]).Ayarlar.AntiAliased := NOT TGR32WidgetCircle(Components[I]).Ayarlar.AntiAliased;
      end;
  end;
end;


procedure TAna.TRAChange(Sender: TObject);
var
  I: Integer;
  C: TComponent;
begin
  for I := 0 to ComponentCount - 1 do begin
      if Components[I] is TGR32WidgetCircle then begin
          TGR32WidgetCircle(Components[I]).Yuzde := TRA.Position;
      end else
      if Components[I] is TGR32WidgetBox then begin
          TGR32WidgetBox(Components[I]).HeaderText := Format('%dK', [trunc(TRA.Position * 7.8)]);
      end else
      if Components[I] is TGR32WidgetBar then begin
          TGR32WidgetBar(Components[I]).Yuzde := TRA.Position;
      end else
      begin end;
  end;
end;

end.
