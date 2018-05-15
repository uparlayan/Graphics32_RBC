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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, GR32_Widgets_PopupForm,
  Vcl.ExtCtrls, Vcl.StdCtrls, GR32_Widgets_Bar, GR32_Widgets_Chart, GR32_Widgets_Circle,
  GR32_Widgets_Box, GR32_Widgets_Title, GR32_Widgets_Base, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinVS2010, cxButtons, GR32_Widgets_Button, GR32_Widgets_Statusbar, dxPanel, GR32_Image;

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
    Spli: TSplitter;
    BRO: TGR32WidgetChart;
    GRO: TGR32WidgetChart;
    GR32WidgetBar2: TGR32WidgetBar;
    Panel2: TPanel;
    GR32WidgetBar4: TGR32WidgetBar;
    GR32WidgetBar5: TGR32WidgetBar;
    GR32WidgetBar6: TGR32WidgetBar;
    GR32WidgetBar7: TGR32WidgetBar;
    GR32WidgetPopupForm1: TGR32WidgetPopupForm;
    GR32WidgetBar1: TGR32WidgetBar;
    GR32WidgetBar3: TGR32WidgetBar;
    GR32WidgetPopupForm2: TGR32WidgetPopupForm;
    GR32WidgetTitle1: TGR32WidgetTitle;
    GR32WidgetStatusBar1: TGR32WidgetStatusBar;
    Menu: TPanel;
    GR32WidgetBox2: TGR32WidgetBox;
    GR32WidgetBox1: TGR32WidgetBox;
    GR32WidgetBox4: TGR32WidgetBox;
    Logo: TImage32;
    GR32WidgetBox5: TGR32WidgetBox;
    GR32WidgetBox7: TGR32WidgetBox;
    GR32WidgetBox8: TGR32WidgetBox;
    Panel1: TPanel;
    GR32WidgetButton1: TGR32WidgetButton;
    GR32WidgetButton2: TGR32WidgetButton;
    TRA: TTrackBar;
    FREQ: TTrackBar;
    GR32WidgetButton3: TGR32WidgetButton;
    procedure TRAChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BT_AnimasyonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FREQChange(Sender: TObject);
    procedure GR32WidgetBar2Click(Sender: TObject);
    procedure GR32WidgetPopupForm1BeforePopup(Sender: TObject);
    procedure GR32WidgetTitle1CloseClick(Sender: TObject);
    procedure GR32WidgetBox3Click(Sender: TObject);
    procedure GR32WidgetPopupForm2BeforePopup(Sender: TObject);
    procedure GR32WidgetTitle1MenuClick(Sender: TObject);
    procedure GR32WidgetTitle1DblClick(Sender: TObject);
    procedure PNL_2Resize(Sender: TObject);
    procedure GR32WidgetBox2MouseEnter(Sender: TObject);
    procedure GR32WidgetBox2MouseLeave(Sender: TObject);
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
    PopupForm_
  , DropDownForm_
  , GR32_PNG
  , GR32_PortableNetworkGraphic
  , System.Math
  ;

procedure TAna.BT_AnimasyonClick(Sender: TObject);
begin
  Timer2.Enabled := NOT Timer2.Enabled;
  if (GR32WidgetButton1.Checked = True) then begin
      GR32WidgetButton1.ButtonText := 'o'
  end else begin
      GR32WidgetButton1.ButtonText := 'n';
  end;
  if (GR32WidgetButton2.Checked = True) then begin
      GR32WidgetButton2.ButtonText := 'o'
  end else begin
      GR32WidgetButton2.ButtonText := 'n';
  end;
  GR32WidgetButton2.Checked := NOT GR32WidgetButton2.Checked;
end;

procedure TAna.FormCreate(Sender: TObject);
begin
  Setup;
  if FileExists('User.png') then
    with TPortableNetworkGraphic32.Create do
      try
        LoadFromFile('User.png');
        AssignTo(Logo.Bitmap);
      finally
        Free;
      end
  else
    raise Exception.Create('File not found: Logo.png');
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
  //M := GRO.Height;
  //GRO.ClearItems;
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

procedure TAna.GR32WidgetBar2Click(Sender: TObject);
begin
  GR32WidgetPopupForm1.DoPopupForm;
end;

procedure TAna.GR32WidgetBox2MouseEnter(Sender: TObject);
begin
  // enter
  GR32WidgetTitle1.HeaderCenter := TGR32WidgetBox(Sender).HeaderText;
end;

procedure TAna.GR32WidgetBox2MouseLeave(Sender: TObject);
begin
  //  leave
  GR32WidgetTitle1.HeaderCenter := '';// TGR32WidgetBox(Sender).HeaderText;
end;

procedure TAna.GR32WidgetBox3Click(Sender: TObject);
begin
  GR32WidgetPopupForm2.DoPopupForm;
end;

procedure TAna.GR32WidgetPopupForm1BeforePopup(Sender: TObject);
begin
  // Atamayý Popup olayýndan hemen önce yapýyoruz.
  GR32WidgetPopupForm1.PopupForm := PopupForm_.CreatePopupForm(Self);
end;

procedure TAna.GR32WidgetPopupForm2BeforePopup(Sender: TObject);
begin
  // Atamayý Popup olayýndan hemen önce yapýyoruz.
  GR32WidgetPopupForm2.PopupForm := DropDownForm_.TDropDownForm.CreateDropDownForm(Self);
end;

procedure TAna.GR32WidgetTitle1CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TAna.GR32WidgetTitle1DblClick(Sender: TObject);
begin
  case Self.WindowState of
        TWindowState.wsNormal   : Self.WindowState := wsMaximized;
        TWindowState.wsMaximized: Self.WindowState := wsNormal;
  end;
end;

procedure TAna.GR32WidgetTitle1MenuClick(Sender: TObject);
begin
  //GR32WidgetPopupForm1.DoPopupForm;
  case Menu.Width of
      56 : Menu.Width := 200;
      else Menu.Width := 56;
  end;
  Logo.Height := Min(Logo.Width, Logo.Height);
  //ShowMessage('Menu Click');
end;

procedure TAna.PNL_2Resize(Sender: TObject);
var
  HE: Integer;
begin
  HE := ((PNL_2.Height - 30) + Spli.Height) div 2;
  GRO.Height := HE;
  BRO.Height := HE;
end;

procedure TAna.Timer2Timer(Sender: TObject);
begin
  TRA.Position := (TRA.Position + 1) mod 101;
end;

procedure TAna.TRAChange(Sender: TObject);
var
  I, J, K, Z: Integer;
  // '{301EE6C6-56EC-403A-9E20-663F0D09316D}'
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
                //Z := ItemCount - 1;
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
