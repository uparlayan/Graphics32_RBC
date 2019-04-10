{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Box.pas                                               /
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

unit GR32_Widgets_Box;

interface

uses
    GR32                        //  TBitmap32
  , GR32_Polygons               //  Poligon hesaplama formülleri
  , GR32_Widgets_Base
  , GR32_Rubicube_Utils         //  Rubicube extensions
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  ;

type
  TGR32WGBox = class(TGR32CustomWG)
    type
      TGR32WGBoxSettings = class(TPersistent)
        private
          FOwner            : TGR32WGBox;
          FBackground       : TColor;
          FBackgroundHover  : TColor;
          FBorderColor      : TColor;
          FBorderStyle      : TPenStyle;
          FBorderWidth      : Integer;
          FFrameColor       : TColor;
          FFrameStyle       : TPenStyle;
          FFrameWidth       : Integer;
          FHeader           : TFont;
          FHeaderPos        : TFontPos;
          FFooter           : TFont;
          FFooterPos        : TFontPos;
          FPadding          : TPadding;
          FSimge            : TFont;
          FFiligran         : TFont;
          FFiligranPos      : TFontPos;
          FSimgeKenar       : Integer;
          FSimgePos         : TFontPos;
          procedure InlineChangeNotifier(Sender: TObject);
          procedure SetBackground(const Value: TColor);
          procedure SetBackgroundHover(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetFrameColor(const Value: TColor);
          procedure SetFrameStyle(const Value: TPenStyle);
          procedure SetFrameWidth(const Value: Integer);
          procedure SetHeader(const Value: TFont);
          procedure SetHeaderPos(const Value: TFontPos);
          procedure SetFooter(const Value: TFont);
          procedure SetFooterPos(const Value: TFontPos);
          procedure SetPadding(const Value: TPadding);
          procedure SetFiligran(const Value: TFont);
          procedure SetFiligranPos(const Value: TFontPos);
          procedure SetSimge(const Value: TFont);
          procedure SetSimgeKenar(const Value: Integer);
          procedure SetSimgePos(const Value: TFontPos);
        protected
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
        published
          property Background     : TColor                read  FBackground       write SetBackground     ;
          property BackgroundHover: TColor                read  FBackgroundHover  write SetBackgroundHover;
          property BorderColor    : TColor                read  FBorderColor      write SetBorderColor    ;
          property BorderStyle    : TPenStyle             read  FBorderStyle      write SetBorderStyle    ;
          property BorderWidth    : Integer               read  FBorderWidth      write SetBorderWidth    ;
          property FrameColor     : TColor                read  FFrameColor       write SetFrameColor     ;
          property FrameStyle     : TPenStyle             read  FFrameStyle       write SetFrameStyle     ;
          property FrameWidth     : Integer               read  FFrameWidth       write SetFrameWidth     ;
          property Header         : TFont                 read  FHeader           write SetHeader         ;
          property HeaderPos      : TFontPos              read  FHeaderPos        write SetHeaderPos      ;
          property Footer         : TFont                 read  FFooter           write SetFooter         ;
          property FooterPos      : TFontPos              read  FFooterPos        write SetFooterPos      ;
          property Padding        : TPadding              read  FPadding          write SetPadding        ;
          property Simge          : TFont                 read  FSimge            write SetSimge          ;
          property Filigran       : TFont                 read  FFiligran         write SetFiligran       ;
          property FiligranPos    : TFontPos              read  FFiligranPos      write SetFiligranPos    ;
          property SimgeWidth     : Integer               read  FSimgeKenar       write SetSimgeKenar     ;
          property SimgePos       : TFontPos              read  FSimgePos         write SetSimgePos       ;
      end;
    private
      FAyarlar      : TGR32WGBoxSettings;
      FHeaderText   : String;
      FFooterText   : String;
      FSimgeChar    : Char;
      FFiligranChar : Char;
      procedure SetAyarlar(const Value: TGR32WGBoxSettings);
      procedure SetHeaderText(const Value: String);
      procedure SetFooterText(const Value: String);
      procedure SetSimgeChar(const Value: Char);
      procedure SetFiligranChar(const Value: Char);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
    published
      property Ayarlar      : TGR32WGBoxSettings  read FAyarlar       write SetAyarlar;
      property HeaderText   : String                  read FHeaderText    write SetHeaderText;
      property FooterText   : String                  read FFooterText    write SetFooterText;
      property SimgeChar    : Char                    read FSimgeChar     write SetSimgeChar;
      property FiligranChar : Char                    read FFiligranChar  write SetFiligranChar;
      property OnClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WGBox]);
end;

{ TGR32WGBox.TGR32WGBoxSettings }

procedure TGR32WGBox.TGR32WGBoxSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WGBox.TGR32WGBoxSettings;
begin
  if (Source is TGR32WGBox.TGR32WGBoxSettings) then begin
      aSors := TGR32WGBox.TGR32WGBoxSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background       ;
      FBackgroundHover  := aSors.BackgroundHover  ;
      FBorderColor      := aSors.BorderColor      ;
      FBorderWidth      := aSors.BorderWidth      ;
      FBorderStyle      := aSors.BorderStyle      ;
      FFrameColor       := aSors.FrameColor       ;
      FFrameWidth       := aSors.FrameWidth       ;
      FFrameStyle       := aSors.FrameStyle       ;
      FHeader           := aSors.Header           ;
      FHeaderPos        := aSors.HeaderPos        ;
      FFooter           := aSors.Footer           ;
      FFooterPos        := aSors.FooterPos        ;
      FPadding          := aSors.Padding          ;
      FFiligran         := aSors.Filigran         ;
      FFiligranPos      := aSors.FiligranPos      ;
      FSimge            := aSors.Simge            ;
      FSimgeKenar       := aSors.SimgeWidth       ;
  end else inherited;
end;

procedure TGR32WGBox.TGR32WGBoxSettings.AfterConstruction;
begin
  inherited;
  FHeader             := TFont.Create;
  FHeader.OnChange    := InlineChangeNotifier;
  FFooter             := TFont.Create;
  FFooter.OnChange    := InlineChangeNotifier;
  FPadding            := TPadding.Create(FOwner);
  FPadding.OnChange   := InlineChangeNotifier;
  FSimge              := TFont.Create;
  FSimge.OnChange     := InlineChangeNotifier;
  FFiligran           := TFont.Create;
  FFiligran.OnChange  := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WGBox.TGR32WGBoxSettings.BeforeDestruction;
begin
  FreeAndNil(FFiligran);
  FreeAndNil(FSimge);
  FreeAndNil(FPadding);
  FreeAndNil(FFooter);
  FreeAndNil(FHeader);
  inherited;
end;

procedure TGR32WGBox.TGR32WGBoxSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  // "Sender" parametresi bu noktada işimize yaramadığı için prosedürü çağırırken NIL değerini vermekte herhangi bir sakınca yoktur.
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetBackgroundHover(const Value: TColor);
begin
  FBackgroundHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFiligran(const Value: TFont);
begin
  FFiligran.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFiligranPos(const Value: TFontPos);
begin
  FFiligranPos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFooter(const Value: TFont);
begin
  FFooter.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFooterPos(const Value: TFontPos);
begin
  FFooterPos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFrameColor(const Value: TColor);
begin
  FFrameColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFrameStyle(const Value: TPenStyle);
begin
  FFrameStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetFrameWidth(const Value: Integer);
begin
  FFrameWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetHeader(const Value: TFont);
begin
  FHeader.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetHeaderPos(const Value: TFontPos);
begin
  FHeaderPos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetPadding(const Value: TPadding);
begin
  FPadding.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetSimge(const Value: TFont);
begin
  FSimge.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetSimgeKenar(const Value: Integer);
begin
  FSimgeKenar := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.SetSimgePos(const Value: TFontPos);
begin
  FSimgePos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBox.TGR32WGBoxSettings.ResetSettings;
begin
  FBackground   := clWindow;
  FBorderColor  := clBtnShadow;
  FBorderStyle  := psDashDot;// wfsWinding;
  FBorderWidth  := 1;
  FFrameColor   := clBtnShadow;
  FFrameStyle   := psDashDotDot;// wfsWinding;
  FFrameWidth   := 1;
  with FHeader do begin
        Color   := clHotLight;
        Name    := 'Calibri';
        Size    := 24;
        Style   := [];
  end;
  FHeaderPos    := fpTopLeft;
  with FFooter do begin
        Color   := clGrayText;
        Name    := 'Calibri';
        Size    := 16;
        Style   := [];
  end;
  FFooterPos    := fpBottomRight;
  with FFiligran do begin
        Color   := $00F2EEEA;
        Name    := 'Webdings';
        Size    := 72;
        Style   := [];
  end;
  FFiligranPos    := fpCenterRight;
  FPadding.SetBounds(10,10,10,10);
  with FSimge do begin
        Color   := $00473929;
        Name    := 'Webdings';
        Size    := 36;
        Style   := [];
  end;
  FSimgeKenar   := 100;
  FSimgePos     := fpCenterCenter;
end;

{ TGR32WGBox }

constructor TGR32WGBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar      := TGR32WGBoxSettings.Create;
  FAyarlar.FOwner := Self;
  FHeaderText   := 'Header';
  FFooterText   := 'Footer';
  FSimgeChar    := '@';
  FFiligranChar := 'ü';
end;

destructor TGR32WGBox.Destroy;
begin
  FreeAndNil(FAyarlar);
  inherited Destroy;
end;

procedure TGR32WGBox.SetAyarlar(const Value: TGR32WGBoxSettings);
begin
  FAyarlar.Assign(Value);
  Invalidate;
end;

procedure TGR32WGBox.SetHeaderText(const Value: String);
begin
  FHeaderText := Value;
  Invalidate;
end;

procedure TGR32WGBox.SetFiligranChar(const Value: Char);
begin
  FFiligranChar := Value;
  Invalidate;
end;

procedure TGR32WGBox.SetSimgeChar(const Value: Char);
begin
  FSimgeChar := Value;
  Invalidate;
end;

procedure TGR32WGBox.SetFooterText(const Value: String);
begin
  FFooterText := Value;
  Invalidate;
end;

procedure TGR32WGBox.PaintControl;
var
  W, H, BW_, FW_  : Integer;                // Border ve Frame çizgi kalınlığı
  SM        : TFloatPoint;            // Simge Merkezi
  SR        : TRect;                  // Simge Dörtgeni
  SWH       : Integer;
  Ressam    : TPolygonRenderer32VPR;  // TPolygonRenderer32; //  Tuval
  PL, PT, PR, PB: Integer;            // Paddings
begin
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil; // henüz bir gradient kullanmadık.
  Ressam.FillMode := pfWinding;// FAyarlar.StyleFill.toPolyFillMode; // pfWinding; // bu ayar, iki çizgi üst üste kesiştiğinde çizgilerin kesiştiği kısımların birbirini yok etmesini engeller...
  Ressam.Bitmap   := Self.FBuffer;
  if  (MouseIsInside = True)
  then Ressam.Bitmap.Clear( FAyarlar.BackgroundHover.ToColor32 )
  else Ressam.Bitmap.Clear( FAyarlar.Background.ToColor32 ); // Tuvalin zemin rengi ve tam temizlik

  // Genel çerçeve bilgileri hesaplanıyor.
  //T  := 0;
  //L  := 0;
  W  := ClientWidth ;
  H  := ClientHeight;
  //W2 := W div 2;
  //H2 := H div 2;

  PL := FAyarlar.Padding.Left;
  PT := FAyarlar.Padding.Top;
  PR := FAyarlar.Padding.Right;
  PB := FAyarlar.Padding.Bottom;

  BW_:= FAyarlar.BorderWidth;
  FW_:= FAyarlar.FrameWidth;

  SR := TRect.Create( PL + BW_
                    , PT + BW_
                    , W - (PR + PL + BW_)
                    , H - (PB + PT + BW_)
                    );

  // Filigran yazılıyor
  Ressam.YaziBas( SR, FFiligranChar, FAyarlar.Filigran.Color, FAyarlar.Filigran.Size, FAyarlar.Filigran.Name, FAyarlar.FiligranPos, FAyarlar.Filigran.Style);

  // Border çiziliyor
  if (FAyarlar.BorderWidth >= 1) and (FAyarlar.BorderColor <> FAyarlar.FBackground) then
  Ressam.SekilBas( FAyarlar.BorderColor.ToColor32, Ressam.DikDortgenCizgi(Merkez, W, H, FAyarlar.BorderWidth, FAyarlar.BorderStyle));
  SWH := FAyarlar.SimgeWidth;

  // Simge çiziliyor
  SM.X := PL + BW_ + (SWH div 2);
  SM.Y := PT + BW_ + (SWH div 2);
  //Ressam.SekilBas( clBlue32, Ressam.DikDortgenCizgi(SM, SWH, SWH, 1, FAyarlar.BorderStyle));
  SR := TRect.Create( BW_
                    , BW_
                    , SWH - BW_
                    , SWH - BW_
                    );
  SR.Offset(PL + BW_, PT + BW_);
  Ressam.YaziBas( SR, FSimgeChar, FAyarlar.Simge.Color, FAyarlar.Simge.Size, FAyarlar.Simge.Name, FAyarlar.SimgePos, FAyarlar.Simge.Style);

  // Header ve Footer bölümü
  SR := TRect.Create( BW_ + FW_
                    , BW_ + FW_
                    , W - BW_ - FW_ - PL - PR - SWH
                    , H - BW_ - FW_ - PT - PB
                    );
  SR.Offset(PL + SWH, PT);
  SM.X := SR.CenterPoint.X;
  SM.Y := SR.CenterPoint.Y;

  // Frame
  Ressam.SekilBas( FAyarlar.FrameColor.ToColor32, Ressam.DikDortgenCizgi(SM, Trunc(SR.Width), Trunc(SR.Height), FW_, FAyarlar.FrameStyle));
  // Header
  Ressam.YaziBas( SR, FHeaderText, FAyarlar.Header.Color, FAyarlar.Header.Size, FAyarlar.Header.Name, FAyarlar.HeaderPos, FAyarlar.Header.Style);
  // Footer
  Ressam.YaziBas( SR, FFooterText, FAyarlar.Footer.Color, FAyarlar.Footer.Size, FAyarlar.Footer.Name, FAyarlar.FooterPos, FAyarlar.Footer.Style);

  Ressam.Free;
end;

end.
