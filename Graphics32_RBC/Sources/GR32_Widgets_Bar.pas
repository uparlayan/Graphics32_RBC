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
  , GR32_Polygons               //  Poligon hesaplama formülleri
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  ;

type
  TGR32WGBar = class(TGR32CustomWG)
    type
      TGR32WGBarSettings = class(TPersistent)
        private
          FOwner            : TGR32WGBar;
          FBackground       : TColor;
          FBackgroundHover  : TColor;
          FBorderColor      : TColor;
          FBorderWidth      : Integer;
          FDisplayFormat    : String;
          FFont             : TFont;
          FBorderStyle      : TPenStyle;
          FBarColor         : TColor;
          FValueColor       : TColor;
          FPadding          : TPadding;
          FInvert           : Boolean;
          FHeaderHeight     : Integer;
          procedure SetBackground(const Value: TColor);
          procedure SetBackgroundHover(const Value: TColor);
          procedure SetBarColor(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetDisplayFormat(const Value: String);
          procedure SetFont(const Value: TFont);
          procedure SetHeaderHeight(const Value: Integer);
          procedure SetInvert(const Value: Boolean);
          procedure SetPadding(const Value: TPadding);
          procedure SetValueColor(const Value: TColor);
          procedure InlineChangeNotifier(Sender: TObject);
        protected
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
        published
          property Background       : TColor      read FBackground        write SetBackground;
          property BackgroundHover  : TColor      read FBackgroundHover   write SetBackgroundHover;
          property BarColor         : TColor      read FBarColor          write SetBarColor;   //  Dairenin değer dışında kalan kısmının rengi
          property BorderColor      : TColor      read FBorderColor       write SetBorderColor;
          property BorderStyle      : TPenStyle   read FBorderStyle       write SetBorderStyle;
          property BorderWidth      : Integer     read FBorderWidth       write SetBorderWidth;
          property DisplayFormat    : String      read FDisplayFormat     write SetDisplayFormat;
          property Font             : TFont       read FFont              write SetFont;
          property HeaderHeight     : Integer     read FHeaderHeight      write SetHeaderHeight;
          property Invert           : Boolean     read FInvert            write SetInvert;
          property Padding          : TPadding    read FPadding           write SetPadding;
          property ValueColor       : TColor      read FValueColor        write SetValueColor;  //  Dairenin değer içeren kısmının rengi
      end;
    private
      FAyarlar    : TGR32WGBarSettings;
      FHeader     : String;
      FYuzde      : Integer;
      procedure SetAyarlar(const Value: TGR32WGBarSettings);
      procedure SetHeader(const Value: String);
      procedure SetYuzde(const Value: Integer);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
    published
      property Ayarlar    : TGR32WGBarSettings  read  FAyarlar    write SetAyarlar;
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
  RegisterComponents('Graphics32RBC', [TGR32WGBar]);
end;

{ TGR32WGBar }

constructor TGR32WGBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar:= TGR32WGBarSettings.Create;
  FAyarlar.FOwner := Self;
  Margins.SetBounds(10, 10, 10, 10);
end;

destructor TGR32WGBar.Destroy;
begin
  FreeAndNil(FAyarlar);
  inherited Destroy;
end;

procedure TGR32WGBar.SetAyarlar(const Value: TGR32WGBarSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WGBar.SetHeader(const Value: String);
begin
  FHeader := Value; Invalidate;
end;

procedure TGR32WGBar.SetYuzde(const Value: Integer);
begin
  FYuzde := Value; Invalidate;
end;

{ TGR32WGBar.TGR32WGBarSettings }

procedure TGR32WGBar.TGR32WGBarSettings.AfterConstruction;
begin
  inherited ;
  FFont             := TFont.Create;
  FPadding          := TPadding.Create(FOwner);
  FFont.OnChange    := InlineChangeNotifier;
  FPadding.OnChange := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WGBar.TGR32WGBarSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WGBar.TGR32WGBarSettings;
begin
  if (Source is TGR32WGBar.TGR32WGBarSettings) then begin
      aSors := TGR32WGBar.TGR32WGBarSettings(Source);
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

procedure TGR32WGBar.TGR32WGBarSettings.BeforeDestruction;
begin
  FreeAndNil(FFont);
  FreeAndNil(FPadding);
  inherited;
end;

procedure TGR32WGBar.TGR32WGBarSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WGBar.TGR32WGBarSettings.ResetSettings;
begin
  FBackground       := clWhite;
  FBackgroundHover  := FBackground;

  FBorderColor      := $00CAB9AC;
  FBorderStyle      := psSolid;
  FBorderWidth      := 2;
  FDisplayFormat    := '%%%D';
  with FFont do begin
        Color       := $00564237;
        Name        := 'Calibri';
        Size        := 24;
        Style       := [];
  end;
  FBarColor         := $00E0D4CA;
  FValueColor       := $005233DC;
  FHeaderHeight     := 40;
  FPadding.SetBounds(10, 10, 10, 10);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetBackgroundHover(const Value: TColor);
begin
  FBackgroundHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetBarColor(const Value: TColor);
begin
  FBarColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetDisplayFormat(const Value: String);
begin
  FDisplayFormat := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetHeaderHeight(const Value: Integer);
begin
  FHeaderHeight := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetInvert(const Value: Boolean);
begin
  FInvert := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetPadding(const Value: TPadding);
begin
  FPadding.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.TGR32WGBarSettings.SetValueColor(const Value: TColor);
begin
  FValueColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBar.PaintControl;
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
  if  (MouseIsInside = True)
  then Ressam.Bitmap.Clear( FAyarlar.BackgroundHover.ToColor32 )
  else Ressam.Bitmap.Clear( FAyarlar.Background.ToColor32 ); // Tuvalin zemin rengi ve tam temizlik


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
