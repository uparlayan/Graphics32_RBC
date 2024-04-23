{-----------------------------------------------------------------------------------
 Unit Name    : Ana_.pas                                                           /
 Author       : Uğur PARLAYAN / uparlayan <ugurparlayan@gmail.com>                 /
 Copyright    : 2018 by Uğur PARLAYAN. All rights reserved.                        /
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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, GR32_Widgets_PopupForm, GR32_Widgets_Bar,
  GR32_Widgets_Chart, GR32_Widgets_Circle, GR32_Widgets_Box, GR32_Widgets_Title, GR32_Widgets_Base, GR32_Widgets_Button,
  GR32_Widgets_Statusbar, GR32_Widgets_Breadcrumb, GR32_Image, GR32_Png, Vcl.Menus,
  dxGDIPlusClasses;

type
  TGezici = record
    private
      Yon: Boolean; // True ise art, False ise azal...
      Min: Integer;
      Max: Integer;
      CRS: Integer; // Cursor / İmleç
      Step: Integer;
    public
      procedure Setup(aMin, aMax, aStep: Integer);
      function Sonraki: Integer;
  end;
  TAna = class(TForm)
    Frekans: TTimer;
    GR32WidgetPopupForm1: TGR32WGPopupForm;
    GR32WidgetPopupForm2: TGR32WGPopupForm;
    TTL: TGR32WGHeader;
    FB: TGR32WGStatusBar;
    Panel3: TPanel;
    CRUMB: TGR32WGBreadcrumb;
    GP: TGridPanel;
    GR32WidgetBox6: TGR32WGBox;
    GR32WidgetBox3: TGR32WGBox;
    CRC2: TGR32WGCircle;
    CRC1: TGR32WGCircle;
    PNL_2: TPanel;
    BRO: TGR32WGChart;
    GRO: TGR32WGChart;
    GR32WidgetBar2: TGR32WGBar;
    Panel2: TPanel;
    GR32WidgetBar4: TGR32WGBar;
    GR32WidgetBar5: TGR32WGBar;
    GR32WidgetBar6: TGR32WGBar;
    GR32WidgetBar7: TGR32WGBar;
    GR32WidgetPopupForm3: TGR32WGPopupForm;
    Menu: TScrollBox;
    Panel4: TPanel;
    BT_Currencies: TGR32WGBox;
    BT_Mentions: TGR32WGBox;
    BT_Drops: TGR32WGBox;
    BT_Shipping: TGR32WGBox;
    BT_Sales: TGR32WGBox;
    BT_Settings: TGR32WGBox;
    GR32WidgetButton3: TGR32WGButton;
    Logo: TImage32;
    Splitter1: TSplitter;
    GR32WidgetButton2: TGR32WGButton;
    GR32WidgetButton1: TGR32WGButton;
    Panel1: TPanel;
    TRA: TTrackBar;
    FREQ: TTrackBar;
    ALF: TTrackBar;
    Image1: TImage;
    FAL: TTrackBar;
    Splitter2: TSplitter;
    CX_Form: TCheckBox;
    CX_Graf: TCheckBox;
    Splitter3: TSplitter;
    KRO: TGR32WGChart;
    procedure FormCreate(Sender: TObject);
    procedure TRAChange(Sender: TObject);
    procedure FrekansTimer(Sender: TObject);
    procedure BT_AnimasyonClick(Sender: TObject);
    procedure FREQChange(Sender: TObject);
    procedure GR32WidgetBar2Click(Sender: TObject);
    procedure GR32WidgetPopupForm1BeforePopup(Sender: TObject);
    procedure TTLCloseClick(Sender: TObject);
    procedure GR32WidgetBox3Click(Sender: TObject);
    procedure GR32WidgetPopupForm2BeforePopup(Sender: TObject);
    procedure TTLMenuClick(Sender: TObject);
    procedure TTLDblClick(Sender: TObject);
    procedure PNL_2Resize(Sender: TObject);
    procedure BT_CurrenciesMouseEnter(Sender: TObject);
    procedure BT_CurrenciesMouseLeave(Sender: TObject);
    procedure CRUMBItemClick(Sender: TObject; aItemIndex: Integer);
    procedure BT_CurrenciesClick(Sender: TObject);
    procedure GR32WidgetPopupForm3BeforePopup(Sender: TObject);
    procedure FALChange(Sender: TObject);
    procedure ALFChange(Sender: TObject);
  private
    { Private declarations }
    Gezici : TGezici;
    Alfa   : TGezici;
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
  , Currencies_
  , System.Math
  , GR32_Rubicube_Utils
  , GR32                  //  dmBlend
  ;

procedure TAna.ALFChange(Sender: TObject);
begin
  if (CX_Graf.Checked = True) then begin
       BRO.AlphaBlend  := ALF.Position;
       GRO.AlphaBlend  := ALF.Position;
       KRO.AlphaBlend  := ALF.Position;
       CRC1.AlphaBlend := ALF.Position;
       CRC2.AlphaBlend := ALF.Position;
  end;
end;

procedure TAna.BT_AnimasyonClick(Sender: TObject);
begin
  Frekans.Enabled := NOT Frekans.Enabled;
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

procedure TAna.CRUMBItemClick(Sender: TObject; aItemIndex: Integer);
var
  Aytem: TGR32WGBreadcrumbItem;
begin
  Aytem := CRUMB.Item(aItemIndex);
  Aytem.Tag := Aytem.Tag * -1;
  if Aytem.Tag >= 0
  then Aytem.Edit(UpperCase(Aytem.Text), Aytem.Tag)
  else Aytem.Edit(LowerCase(Aytem.Text), Aytem.Tag);

  TTL.HeaderCenter := Aytem.Text;
end;

procedure TAna.FALChange(Sender: TObject);
begin
  if (CX_Form.Checked = True) then Self.AlphaBlendValue := FAL.Position;
end;

procedure TAna.FormCreate(Sender: TObject);
const
  png = 'Logo.png';
begin
  Setup;
  if FileExists(png) then
     with TPortableNetworkGraphic32.Create do
          try
            LoadFromFile(png);
            //AssignTo(Logo.Bitmap);
          finally
            Free;
          end
  else
    raise Exception.Create('File not found: ' + png);

  with  CRUMB  do begin
        Items.Flush;
        Add('Company', 1);
        Add('Departments', 2);
        Add('Sales', 3);
        Add('Uğur PARLAYAN', 4);
  end;

  With  Logo  do begin
        BitmapAlign := baCenter;
        Bitmap.CombineMode := cmBlend;
        Bitmap.DrawMode    := dmBlend;
  end;
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
  Gezici.Setup(128,255,10);
  Alfa  .Setup(0,255,20);
  //M := GRO.Height;
  GRO.ClearItems;
  BRO.ClearItems;
  KRO.ClearItems;
  for I := -1 to 100 do begin
      M := RandomRange(15, 45);
      GRO.Add('Test', M);
      BRO.Add('Test', M);
      KRO.Add('Test', M);
  end;
      M := RandomRange(45, 75);
      GRO.Add('Test', M);
      BRO.Add('Test', M);
      KRO.Add('Test', M);
end;

procedure TAna.FREQChange(Sender: TObject);
begin
  //Timer1.Interval := FREQ.Position;
  Frekans.Interval := FREQ.Position;
end;

procedure TAna.GR32WidgetBar2Click(Sender: TObject);
begin
  GR32WidgetPopupForm1.DoPopupForm;
end;

procedure TAna.BT_CurrenciesClick(Sender: TObject);
begin
  //CreateCurrencies
  GR32WidgetPopupForm3.DoPopupForm;
end;

procedure TAna.BT_CurrenciesMouseEnter(Sender: TObject);
begin
  // enter
  TTL.HeaderCenter := TGR32WGBox(Sender).HeaderText;
end;

procedure TAna.BT_CurrenciesMouseLeave(Sender: TObject);
begin
  //  leave
  TTL.HeaderCenter := '';// TGR32WGBox(Sender).HeaderText;
end;

procedure TAna.GR32WidgetBox3Click(Sender: TObject);
begin
  GR32WidgetPopupForm2.DoPopupForm;
end;

procedure TAna.GR32WidgetPopupForm1BeforePopup(Sender: TObject);
begin
  // Atamayı Popup olayından hemen önce yapıyoruz.
  GR32WidgetPopupForm1.PopupForm := TPopupForm.CreatePopupForm(Self);
end;

procedure TAna.GR32WidgetPopupForm2BeforePopup(Sender: TObject);
begin
  // Atamayı Popup olayından hemen önce yapıyoruz.
  GR32WidgetPopupForm2.PopupForm := DropDownForm_.TDropDownForm.CreateDropDownForm(Self);
end;

procedure TAna.GR32WidgetPopupForm3BeforePopup(Sender: TObject);
begin
  GR32WidgetPopupForm3.PopupForm := TCurrencies.CreateCurrencies(Self);
end;

procedure TAna.TTLCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TAna.TTLDblClick(Sender: TObject);
begin
  case Self.WindowState of
        TWindowState.wsNormal   : Self.WindowState := wsMaximized;
        TWindowState.wsMaximized: Self.WindowState := wsNormal;
  end;
end;

procedure TAna.TTLMenuClick(Sender: TObject);
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
  HE := ((PNL_2.Height - 30) + Splitter2.Height + Splitter3.Height) div 3;
  GRO.Height := HE;
  BRO.Height := HE;
  KRO.Height := HE;
end;

procedure TAna.FrekansTimer(Sender: TObject);
begin
  TRA.Position := (TRA.Position + 1) mod 101;
  FAL.Position := Gezici.Sonraki;
  ALF.Position := Alfa.Sonraki;
end;

procedure TAna.TRAChange(Sender: TObject);
var
  I, J, K, Z: Integer;
begin
  for I := 0 to ComponentCount - 1 do begin
      if Components[I] is TGR32WGCircle then begin
          TGR32WGCircle(Components[I]).Yuzde := TRA.Position;
      end else
      if Components[I] is TGR32WGBox then begin
          if  (TGR32WGBox(Components[I]).Tag = 0)
          then TGR32WGBox(Components[I]).HeaderText := Format('%d$', [trunc(TRA.Position * 7.8)]);
      end else
      if Components[I] is TGR32WGBar then begin
          TGR32WGBar(Components[I]).Yuzde := TRA.Position;
      end else
      if Components[I] is TGR32WGChart then begin

          with  TGR32WGChart(Components[I]) do begin
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

{ TAlfa }

procedure TGezici.Setup(aMin, aMax, aStep: Integer);
begin
  Yon := True;
  Min := aMin;
  Max := aMax;
  CRS := aMin;
  Step:= aStep;
end;

function TGezici.Sonraki: Integer;
begin
  case Yon of
    True:  begin
             if (CRS + Step >= Max - 1)
             then Yon := False
             else CRS := CRS + Step;
           end;
    False: begin
             if (CRS - Step <= Min + 1)
             then Yon := True
             else CRS := CRS - Step;
           end;
  end;
  Result := CRS;
end;

end.
