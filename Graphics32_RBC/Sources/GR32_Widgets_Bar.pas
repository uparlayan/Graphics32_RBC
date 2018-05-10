{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Bar.pas                                               /
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

unit GR32_Widgets_Bar;

interface

uses
    GR32_Widgets_Base
  , GR32_Rubicube_Utils         //  Rubicube extensions
  , GR32                        //  TBitmap32
  , GR32_ColorGradients         //  TColor32, ColorTo
  , GR32_Polygons               //  Poligon hesaplama formülleri
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , System.Math                 //  Min
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  ;

type
  TGR32WidgetBar = class(TGR32CustomWidget)
    type
      TGR32WidgetBarSettings = class(TPersistent)
        private
          FOwner        : TGR32WidgetBar;
          FBackground   : TColor;
          FBorderColor  : TColor;
          FBorderWidth  : Integer;
          FDisplayFormat: String;
          FFont         : TFont;
          FBorderStyle  : TPenStyle;
          FBarColor     : TColor;
          FValueColor   : TColor;
          FPadding      : TPadding;
          FInvert       : Boolean;
          FHeaderHeight : Integer;
          procedure SetBackground(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetDisplayFormat(const Value: String);
          procedure SetFont(const Value: TFont);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBarColor(const Value: TColor);
          procedure SetValueColor(const Value: TColor);
          procedure SetPadding(const Value: TPadding);
          procedure SetInvert(const Value: Boolean);
          procedure InlineChangeNotifier(Sender: TObject);
          procedure SetHeaderHeight(const Value: Integer);
        protected
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
        published
          property Background   : TColor      read FBackground    write SetBackground;
          property BarColor     : TColor      read FBarColor      write SetBarColor;   //  Dairenin değer dışında kalan kısmının rengi
          property BorderColor  : TColor      read FBorderColor   write SetBorderColor;
          property BorderStyle  : TPenStyle   read FBorderStyle   write SetBorderStyle;
          property BorderWidth  : Integer     read FBorderWidth   write SetBorderWidth;
          property DisplayFormat: String      read FDisplayFormat write SetDisplayFormat;
          property Font         : TFont       read FFont          write SetFont;
          property HeaderHeight : Integer     read FHeaderHeight  write SetHeaderHeight;
          property Invert       : Boolean     read FInvert        write SetInvert;
          property Padding      : TPadding    read FPadding       write SetPadding;
          property ValueColor   : TColor      read FValueColor    write SetValueColor;  //  Dairenin değer içeren kısmının rengi
      end;
    private
      FAyarlar    : TGR32WidgetBarSettings;
      FHeader     : String;
      FYuzde      : Integer;
      procedure SetAyarlar(const Value: TGR32WidgetBarSettings);
      procedure SetHeader(const Value: String);
      procedure SetYuzde(const Value: Integer);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
    published
      property Ayarlar    : TGR32WidgetBarSettings  read  FAyarlar    write SetAyarlar;
      property Header     : String                  read  FHeader     write SetHeader;
      property Yuzde      : Integer                 read  FYuzde      write SetYuzde;
      property Height;
      property Left;
      property Top;
      property Width;
      property OnClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WidgetBar]);
end;

{ TGR32WidgetBar }

constructor TGR32WidgetBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar:= TGR32WidgetBarSettings.Create;
  FAyarlar.FOwner := Self;
  Margins.SetBounds(10, 10, 10, 10);
end;

destructor TGR32WidgetBar.Destroy;
begin
  FreeAndNil(FAyarlar);
  inherited Destroy;
end;

procedure TGR32WidgetBar.SetAyarlar(const Value: TGR32WidgetBarSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WidgetBar.SetHeader(const Value: String);
begin
  FHeader := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetYuzde(const Value: Integer);
begin
  FYuzde := Value; Invalidate;
end;

{ TGR32WidgetBar.TGR32WidgetBarSettings }

procedure TGR32WidgetBar.TGR32WidgetBarSettings.AfterConstruction;
begin
  inherited ;
  FFont             := TFont.Create;
  FPadding          := TPadding.Create(FOwner);
  FFont.OnChange    := InlineChangeNotifier;
  FPadding.OnChange := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WidgetBar.TGR32WidgetBarSettings;
begin
  if (Source is TGR32WidgetBar.TGR32WidgetBarSettings) then begin
      aSors := TGR32WidgetBar.TGR32WidgetBarSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background       ;
      FBorderColor      := aSors.BorderColor      ;
      FBorderWidth      := aSors.BorderWidth      ;
      FDisplayFormat    := aSors.DisplayFormat    ;
      FFont             := aSors.Font             ;
      FHeaderHeight     := aSors.HeaderHeight     ;
      FBorderStyle      := aSors.BorderStyle      ;
      FBarColor         := aSors.BarColor         ;
      FValueColor       := aSors.ValueColor       ;
      FPadding          := aSors.Padding          ;
      FInvert           := aSors.Invert           ;
  end else inherited;
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.BeforeDestruction;
begin
  FreeAndNil(FFont);
  FreeAndNil(FPadding);
  inherited;
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.ResetSettings;
begin
  FBackground   := clWhite;
  FBorderColor  := $00CAB9AC;
  FBorderStyle  := psSolid;
  FBorderWidth  := 2;
  FDisplayFormat:= '%%%D';
  with FFont do begin
        Color   := $00564237;
        Name    := 'Calibri';
        Size    := 24;
        Style   := [];
  end;
  FBarColor     := $00E0D4CA;
  FValueColor   := $005233DC;
  FHeaderHeight := 40;
  FPadding.SetBounds(10, 10, 10, 10);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetBarColor(const Value: TColor);
begin
  FBarColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetDisplayFormat(const Value: String);
begin
  FDisplayFormat := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetHeaderHeight(const Value: Integer);
begin
  FHeaderHeight := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetInvert(const Value: Boolean);
begin
  FInvert := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetPadding(const Value: TPadding);
begin
  FPadding.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.TGR32WidgetBarSettings.SetValueColor(const Value: TColor);
begin
  FValueColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetBar.PaintControl;
var
  BW_, TH, W,H: Integer;
  PL, PT, PR, PB  : Integer;
  FW, FH          : Single;
  TR              : TRect;
  Oran            : Single;
  FR, MR          : TFloatPoint;
  Ressam          : TPolygonRenderer32VPR;  // TPolygonRenderer32; //  Tuval
  //CA, CB          : TColor32;
begin
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil; // henüz bir gradient kullanmadık.
  Ressam.FillMode := pfWinding;// FAyarlar.StyleFill.toPolyFillMode; // pfWinding; // bu ayar, iki çizgi üst üste kesiştiğinde çizgilerin kesiştiği kısımların birbirini yok etmesini engeller...
  Ressam.Bitmap   := Self.FBuffer;
  Ressam.Bitmap.Clear( FAyarlar.Background.ToColor32 ); // Tuvalin zemin rengi ve tam temizlik

  // Genel çerçeve bilgileri hesaplanıyor.
  W := ClientWidth;
  H := ClientHeight;
  MR := Merkez;
  FR := Merkez;
  PL := FAyarlar.Padding.Left;
  PT := FAyarlar.Padding.Top;
  PR := FAyarlar.Padding.Right;
  PB := FAyarlar.Padding.Bottom;
  BW_:= FAyarlar.BorderWidth;
  //TH := Ressam.Bitmap.TextHeight(FHeader);
  TH := FAyarlar.HeaderHeight;
  TR := Rect  ( 0
              , 0
              , W - PL - PR - (BW_ * 2)
              , TH
              );
  TR.SetLocation(BW_ + PL, BW_ + PT);
  FW := W - PL - PR - (BW_*2);
  FH := H - (BW_*2) - PT - PB - TH;
  FR.X := W * 0.5;
  FR.Y := BW_ + PT + TH + (FH / 2);

  Oran := (FYuzde * FW) / 100;
  case  FAyarlar.Invert  of
        True  : begin
                  //ca := FAyarlar.BarColor.ToColor32;
                  //cb := FAyarlar.ValueColor.ToColor32;
                  //MR.X := (FW - (Oran / 2) - BW_) + BW_ + PL;
                  MR.X := (FW - (Oran / 2)) + BW_ + PR;
                end;
        False : begin
                  //ca := FAyarlar.ValueColor.ToColor32;
                  //cb := FAyarlar.BarColor.ToColor32;
                  MR.X := (Oran / 2) + BW_ + PL + 1;
                end;
  end;
  // Dış kenar çiziliyor
  Ressam.SekilBas( FAyarlar.BorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, W, H, BW_, FAyarlar.BorderStyle));
  // Frame kenarı çiziliyor
  MR.Y := FR.Y;
  Ressam.SekilBas( FAyarlar.BarColor.ToColor32,    Ressam.DikDortgen( FR, FW, FH));
  Ressam.SekilBas( FAyarlar.ValueColor.ToColor32,  Ressam.Dikdortgen( MR, Oran, FH));
  Ressam.SekilBas( FAyarlar.BorderColor.ToColor32, Ressam.DikDortgenCizgi( FR, FW, FH, 1, psSolid));

  Ressam.YaziBas( TR, FHeader, FAyarlar.Font.Color, FAyarlar.Font.Size, FAyarlar.Font.Name, fpTopLeft, FAyarlar.Font.Style);
  Ressam.YaziBas( TR, Format(FAyarlar.DisplayFormat, [FYuzde]), FAyarlar.Font.Color, FAyarlar.Font.Size, FAyarlar.Font.Name, fpTopRight, FAyarlar.Font.Style);
  Ressam.Free;
end;

end.
