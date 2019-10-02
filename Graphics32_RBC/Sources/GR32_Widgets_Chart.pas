{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Chart.pas                                             /
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

unit GR32_Widgets_Chart;

interface

uses
    GR32_Widgets_Base
  , GR32_Rubicube_Utils         //  Rubicube extensions
  , GR32                        //  TBitmap32
  , GR32_Polygons               //  Poligon hesaplama formülleri
  , WinAPI.Windows
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  , Generics.Collections        //  TList<>
  , Generics.Defaults
  ;

type
  TGR32WGChartTypes = (wctAlan, wctCizgi, wctCubuk);
  TGR32WGChartRulerPos = (wrpLeft, wrpTop, wrpRight, wrpBottom);
  TGR32WGChartItem = class
    public
      Grup : String;
      Value: Single;
      Constructor Ekle(const aGrup: String; aValue: Single);
  end;
  TGR32WGChart = class(TGR32CustomWG)
    type
      TShowValueType = (svtEveryValue, svtOdd, svtEven, svtPick);
      TGR32WGChartSettings = class(TPersistent)
        private
          FOwner                : TGR32WGChart;
          FBackground           : TColor;
          FBackgroundHover      : TColor;
          FBorderColor          : TColor;
          FBorderStyle          : TPenStyle;
          FBorderWidth          : Integer;
          FChartType            : TGR32WGChartTypes;
          FCizgi_Cember         : TColor;
          FCizgi_Dolgusu        : TColor;
          FCizgi_Kalinlik       : Single;
          FCizgi_Renk           : TColor;
          FCizgi_YariCap        : Single;
          FCizgi_CemberEkle     : Boolean;
          FFrameBG              : TColor;
          FFrameBGHover         : TColor;
          FFrameColor           : TColor;
          FFrameStyle           : TPenStyle;
          FFrameWidth           : Integer;
          FHeader               : TFont;
          FHeaderHeight         : Integer;
          FHeaderPos            : TFontPos;
          FPadding              : TPadding;

          FLineColor            : TColor;
          FLineStyle            : TPenStyle;
          FLineWidth            : Single;

          FAralikDikey          : Integer;
          FAralikYatay          : Integer;
          FChartAreaColor       : TColor;
          FChartAreaColorAlpha  : Byte;
          FShowValues           : Boolean;
          FShowValueType        : TShowValueType;
          FAutoScroll           : Boolean;

          FAxis               : TFont;
          FAxisYCount          : Byte;
          FAxisLineColor      : TColor;
          FAxisLineColorAlpha : Byte;
          FAxisLineStyle      : TPenStyle;
          FAxisLineWidth      : Single;
          FAxisTextPos        : TFontPos;
          FAxisYVisible        : Boolean;

          procedure SetBackground(const Value: TColor);
          procedure SetBackgroundHover(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetChartType(const Value: TGR32WGChartTypes);
          procedure SetCizgi_Cember(const Value: TColor);
          procedure SetCizgi_Dolgusu(const Value: TColor);
          procedure SetCizgi_Kalinlik(const Value: Single);
          procedure SetCizgi_Renk(const Value: TColor);
          procedure SetCizgi_YariCap(const Value: Single);
          procedure SetCizgi_CemberEkle(const Value: Boolean);
          procedure SetFrameBG(const Value: TColor);
          procedure SetFrameBGHover(const Value: TColor);
          procedure SetFrameColor(const Value: TColor);
          procedure SetFrameStyle(const Value: TPenStyle);
          procedure SetFrameWidth(const Value: Integer);
          procedure SetHeader(const Value: TFont);
          procedure SetHeaderHeight(const Value: Integer);
          procedure SetHeaderPos(const Value: TFontPos);
          procedure SetPadding(const Value: TPadding);
          procedure SetLineColor(const Value: TColor);
          procedure SetLineStyle(const Value: TPenStyle);
          procedure SetLineWidth(const Value: Single);
          procedure SetAralikDikey(const Value: Integer);
          procedure SetAralikYatay(const Value: Integer);

          procedure SetChartAreaColor(const Value : TColor);
          procedure SetChartAreaColorAlpha(const Value : Byte);
          procedure SetShowValues(const Value : Boolean);
          procedure SetShowValueType(const Value : TShowValueType);
          procedure SetAxis(const Value: TFont);
          procedure SetAxisYCount(const Value : Byte);
          procedure SetAxisLineColor(const Value : TColor);
          procedure SetAxisLineColorAlpha(const Value : Byte);
          procedure SetAxisLineStyle(const Value: TPenStyle);
          procedure SetAxisLineWidth(const Value: Single);
          procedure SetAxisTextPos(const Value: TFontPos);
          procedure SetAxisYVisible(const Value : Boolean);
        protected
          procedure InlineChangeNotifier(Sender: TObject);
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;

          constructor Create;
        published
          property Background           : TColor            read  FBackground           write SetBackground           ;
          property BackgroundHover      : TColor            read  FBackgroundHover      write SetBackgroundHover      ;
          property BorderColor          : TColor            read  FBorderColor          write SetBorderColor          ;
          property BorderStyle          : TPenStyle         read  FBorderStyle          write SetBorderStyle          ;
          property BorderWidth          : Integer           read  FBorderWidth          write SetBorderWidth          ;
          property ChartType            : TGR32WGChartTypes read  FChartType            write SetChartType            ;
          property Cizgi_Cember         : TColor            read  FCizgi_Cember         write SetCizgi_Cember         ;
          property Cizgi_Dolgusu        : TColor            read  FCizgi_Dolgusu        write SetCizgi_Dolgusu        ;
          property Cizgi_Kalinlik       : Single            read  FCizgi_Kalinlik       write SetCizgi_Kalinlik       ;
          property Cizgi_Renk           : TColor            read  FCizgi_Renk           write SetCizgi_Renk           ;
          property Cizgi_YariCap        : Single            read  FCizgi_YariCap        write SetCizgi_YariCap        ;
          property Cizgi_CemberEkle     : Boolean           read  FCizgi_CemberEkle     write SetCizgi_CemberEkle     ;
          property FrameBG              : TColor            read  FFrameBG              write SetFrameBG              ;
          property FrameBGHover         : TColor            read  FFrameBGHover         write SetFrameBGHover         ;
          property FrameColor           : TColor            read  FFrameColor           write SetFrameColor           ;
          property FrameStyle           : TPenStyle         read  FFrameStyle           write SetFrameStyle           ;
          property FrameWidth           : Integer           read  FFrameWidth           write SetFrameWidth           ;
          property Header               : TFont             read  FHeader               write SetHeader               ;
          property HeaderHeight         : Integer           read  FHeaderHeight         write SetHeaderHeight         ;
          property HeaderPos            : TFontPos          read  FHeaderPos            write SetHeaderPos            ;
          property Padding              : TPadding          read  FPadding              write SetPadding              ;

          property LineColor            : TColor            read  FLineColor            write SetLineColor            ;
          property LineStyle            : TPenStyle         read  FLineStyle            write SetLineStyle            ;
          property LineWidth            : Single            read  FLineWidth            write SetLineWidth            ;

          property AralikDikey          : Integer           read  FAralikDikey          write SetAralikDikey          ;
          property AralikYatay          : Integer           read  FAralikYatay          write SetAralikYatay          ;

          property ChartAreaColor       : TColor            read  FChartAreaColor       write SetChartAreaColor       ;
          property ChartAreaColorAlpha  : Byte              read  FChartAreaColorAlpha  write SetChartAreaColorAlpha  ;
          property ShowValues           : Boolean           read  FShowValues           write SetShowValues           ;
          property ShowValueType        : TShowValueType    read  FShowValueType        write SetShowValueType        ;
          property AutoScroll           : Boolean           read  FAutoScroll           write FAutoScroll             ;
          property Axis                 : TFont             read  FAxis                 write SetAxis                 ;
          property AxisYCount           : Byte              read  FAxisYCount           write SetAxisYCount           ;
          property AxisLineStyle        : TPenStyle         read  FAxisLineStyle        write SetAxisLineStyle        ;
          property AxisLineColor        : TColor            read  FAxisLineColor        write SetAxisLineColor        ;
          property AxisLineColorAlpha   : Byte              read  FAxisLineColorAlpha   write SetAxisLineColorAlpha   ;
          property AxisLineWidth        : Single            read  FAxisLineWidth        write SetAxisLineWidth        ;
          property AxisTextPos          : TFontPos          read  FAxisTextPos          write SetAxisTextPos          ;
          property AxisYVisible         : Boolean           read  FAxisYVisible         write SetAxisYVisible         ;
      end;
      TGR32WGChartRuler = class(TPersistent)
        private
          FOwner            : TGR32WGChart;
          FPosition         : TGR32WGChartRulerPos;
          FRulerWidth       : Integer;
          FRulerHeight      : Integer;
          FVisible          : Boolean;
          procedure SetPosition(const Value: TGR32WGChartRulerPos);
          procedure SetRulerHeight(const Value: Integer);
          procedure SetRulerWidth(const Value: Integer);
          procedure SetVisible(const Value: Boolean);
        protected
          procedure InlineChangeNotifier(Sender: TObject);
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
          procedure SetSize(aWidth, aHeight: Integer);
        published
          property Position     : TGR32WGChartRulerPos  read  FPosition     write SetPosition;
          property RulerWidth   : Integer               read  FRulerWidth   write SetRulerWidth;
          property RulerHeight  : Integer               read  FRulerHeight  write SetRulerHeight;
          property Visible      : Boolean               read  FVisible      write SetVisible;
      end;
    private
      FItems        : TList<TGR32WGChartItem>;
      FAyarlar      : TGR32WGChartSettings;
      FAntiAliased  : Boolean;
      FHeader       : String;
      FUpdating     : Boolean;
      procedure SetAyarlar(const Value: TGR32WGChartSettings);
      procedure SetAntiAliased(const Value: Boolean);
      procedure SetHeader(const Value: String);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Resize; override;
      procedure PaintControl; override;
      procedure DemoData;
      procedure Add(aGrup: string; aValue: Single);
      procedure Delete(aGrup: String); overload;
      procedure Delete(aValue: Single); overload;
      procedure Delete(aIndex: Integer); overload;
      procedure Edit(aIndex: Integer; aGrup: String; aValue: Single);
      procedure ClearItems;
      procedure RemoveItem(const AIndex : Integer = 0);
      procedure BeginUpdate;
      procedure EndUpdate;
      function MaxValue: Single;
      function MinValue: Single;
      function ItemCount: Integer;
      function Item(const aIndex: Integer): TGR32WGChartItem;
      function Max : Single;
      function Min : Single;
      property Items        : TList<TGR32WGChartItem> read FItems;  //property Items        : TList                   read FItems        write FItems;
    published
      property Ayarlar      : TGR32WGChartSettings    read FAyarlar      write SetAyarlar  ;
      property AntiAliased  : Boolean                 read FAntiAliased  write SetAntiAliased;
      property Header       : String                  read FHeader       write SetHeader   ;
      property Margins;
      property Left;
      property Top;
      property Width;
      property Height;
  end;

procedure Register;

implementation

uses
    System.UITypes
  , System.Math
  , GR32_VectorUtils;

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WGChart]);
end;

{ TGR32WGChartObject }

constructor TGR32WGChartItem.Ekle(const aGrup: String; aValue: Single);
begin
  Grup  := aGrup;
  Value := aValue;
end;

{ TGR32WGChart.TGR32WGChartSettings }

procedure TGR32WGChart.TGR32WGChartSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WGChart.TGR32WGChartSettings;
begin
  if (Source is TGR32WGChart.TGR32WGChartSettings) then begin
      aSors := TGR32WGChart.TGR32WGChartSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background       ;
      FBackgroundHover  := aSors.BackgroundHover  ;
      FBorderColor      := aSors.BorderColor      ;
      FBorderStyle      := aSors.BorderStyle      ;
      FBorderWidth      := aSors.BorderWidth      ;
      FChartType        := aSors.ChartType        ;
      FCizgi_Cember     := aSors.Cizgi_Cember     ;
      FCizgi_Dolgusu    := aSors.Cizgi_Dolgusu    ;
      FCizgi_Kalinlik   := aSors.Cizgi_Kalinlik   ;
      FCizgi_Renk       := aSors.Cizgi_Renk       ;
      FCizgi_YariCap    := aSors.Cizgi_YariCap    ;
      FCizgi_CemberEkle := aSors.Cizgi_CemberEkle ;
      FFrameBG          := aSors.FrameBG          ;
      FFrameBGHover     := aSors.FrameBGHover     ;
      FFrameColor       := aSors.FrameColor       ;
      FFrameStyle       := aSors.FrameStyle       ;
      FFrameWidth       := aSors.FrameWidth       ;
      FHeader           := aSors.Header           ;
      FHeaderHeight     := aSors.HeaderHeight     ;
      FHeaderPos        := aSors.HeaderPos        ;
      FPadding          := aSors.Padding          ;

      FChartAreaColor       := aSors.ChartAreaColor         ;
      FChartAreaColorAlpha  := aSors.ChartAreaColorAlpha    ;
      FShowValues           := aSors.ShowValues             ;
      FShowValueType        := aSors.ShowValueType          ;
      FAutoScroll           := aSors.AutoScroll             ;
      FAxis                 := aSors.Axis                   ;
      FAxisYCount           := aSors.AxisYCount             ;
      FAxisLineColor        := aSors.AxisLineColor          ;
      FAxisLineColorAlpha   := aSors.AxisLineColorAlpha     ;
      FAxisYVisible         := aSors.AxisYVisible           ;
  end else inherited;
end;

procedure TGR32WGChart.TGR32WGChartSettings.AfterConstruction;
begin
  inherited;
  FHeader             := TFont.Create;
  FHeader.OnChange    := InlineChangeNotifier;
  FPadding            := TPadding.Create(FOwner);
  FPadding.OnChange   := InlineChangeNotifier;
  FAxis             := TFont.Create;
  ResetSettings;
end;

procedure TGR32WGChart.TGR32WGChartSettings.BeforeDestruction;
begin
  FreeAndNil(FAxis);
  FreeAndNil(FHeader);
  FreeAndNil(FPadding);
  inherited;
end;

constructor TGR32WGChart.TGR32WGChartSettings.Create;
begin
  inherited Create;
end;

procedure TGR32WGChart.TGR32WGChartSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  // "Sender" parametresi bu noktada işimize yaramadığı için prosedürü çağırırken NIL değerini vermekte herhangi bir sakınca yoktur.
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WGChart.TGR32WGChartSettings.ResetSettings;
begin
  FBackground       := clWindow;
  FBorderColor      := clBtnShadow;
  FBorderStyle      := psSolid;
  FBorderWidth      := 1;
  FChartType        := wctCizgi;
  FCizgi_Cember     := clWindow;
  FCizgi_Dolgusu    := clRed;
  FCizgi_Kalinlik   := 2;
  FCizgi_Renk       := clPurple;
  FCizgi_YariCap    := 5;
  Cizgi_CemberEkle  := True;
  FFrameBG          := clWindow;
  FFrameBGHover     := clWindow;
  FFrameColor       := clWindowFrame;
  FFrameStyle       := psDot;
  FFrameWidth       := 1;
  with  FHeader  do begin
        Name  := 'Tahoma';
        Size  := 11;
        Style := [];
        Color := clHotLight;
  end;
  FHeaderHeight     := 30;
  FHeaderPos        := fpCenterCenter;
  FPadding.SetBounds(5, 5, 5, 5);

  FLineColor    := clBtnShadow;
  FLineStyle    := psDot;
  FLineWidth    := 1;

  FAralikYatay  := 40;
  FAralikDikey  := 30;


  FChartAreaColorAlpha  := 255;
  FShowValues           := true;
  FShowValueType        := svtEveryValue;
  FAutoScroll           := true;
  FAxisYCount          := 10;
  FAxisLineColor      := clRed;
  FChartAreaColor       := $00FFCE9D;
  FAxisYVisible           := true;
  FAxisLineColorAlpha := 255;
  with  FAxis  do begin
        Name  := 'Tahoma';
        Size  := 11;
        Style := [];
        Color := clHotLight;
  end;
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAralikDikey(const Value: Integer);
begin
  FAralikDikey := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAralikYatay(const Value: Integer);
begin
  FAralikYatay := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetBackgroundHover(const Value: TColor);
begin
  FBackgroundHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetChartAreaColor(const Value : TColor);
begin
  FChartAreaColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetChartAreaColorAlpha(const Value : Byte);
begin
  FChartAreaColorAlpha := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetChartType(const Value: TGR32WGChartTypes);
begin
  FChartType := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetCizgi_Cember(const Value: TColor);
begin
  FCizgi_Cember := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetCizgi_CemberEkle(const Value: Boolean);
begin
  FCizgi_CemberEkle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetCizgi_Dolgusu(const Value: TColor);
begin
  FCizgi_Dolgusu := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetCizgi_Kalinlik(const Value: Single);
begin
  FCizgi_Kalinlik := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetCizgi_Renk(const Value: TColor);
begin
  FCizgi_Renk := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetCizgi_YariCap(const Value: Single);
begin
  FCizgi_YariCap := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetFrameBG(const Value: TColor);
begin
  FFrameBG := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetFrameBGHover(const Value: TColor);
begin
  FFrameBGHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetFrameColor(const Value: TColor);
begin
  FFrameColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetFrameStyle(const Value: TPenStyle);
begin
  FFrameStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetFrameWidth(const Value: Integer);
begin
  FFrameWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetHeader(const Value: TFont);
begin
  FHeader := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetHeaderHeight(const Value: Integer);
begin
  FHeaderHeight := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetHeaderPos(const Value: TFontPos);
begin
  FHeaderPos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxis(const Value: TFont);
begin
  FAxis := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisYCount(const Value: Byte);
begin
  FAxisYCount := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisLineColor(const Value: TColor);
begin
  FAxisLineColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisLineColorAlpha(const Value: Byte);
begin
  FAxisLineColorAlpha := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisLineStyle(const Value: TPenStyle);
begin
  FAxisLineStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisLineWidth(const Value: Single);
begin
  FAxisLineWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisTextPos(const Value: TFontPos);
begin
  FAxisTextPos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetLineColor(const Value: TColor);
begin
  FLineColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetLineStyle(const Value: TPenStyle);
begin
  FLineStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetLineWidth(const Value: Single);
begin
  FLineWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetPadding(const Value: TPadding);
begin
  FPadding := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetAxisYVisible(const Value: Boolean);
begin
  FAxisYVisible := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetShowValues(const Value: Boolean);
begin
  FShowValues := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartSettings.SetShowValueType(const Value: TShowValueType);
begin
  FShowValueType := Value; InlineChangeNotifier(nil);
end;

{ TGR32WGChart }

procedure TGR32WGChart.SetAntiAliased(const Value: Boolean);
begin
  FAntiAliased := Value; Invalidate;
end;

procedure TGR32WGChart.SetAyarlar(const Value: TGR32WGChartSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WGChart.SetHeader(const Value: String);
begin
  FHeader := Value; Invalidate;
end;

procedure TGR32WGChart.Add(aGrup: string; aValue: Single);
begin
  FItems.Add( TGR32WGChartItem.Ekle(aGrup, aValue) );
  // if (FAyarlar.FAutoScroll) and (FItems.Count >= 50) then RemoveItem;
  Invalidate;
  {TODO -oUğur -cSıralama : Sort metodu eklenecek. Metod seçimlik olacak.}
end;

procedure TGR32WGChart.BeginUpdate;
begin
  FUpdating := true;
end;

procedure TGR32WGChart.ClearItems;
begin
  BeginUpdate;
  try
    while FItems.Count > 0 do begin
          FItems.Items[0].Free;
          FItems.Delete(0);
    end;
  finally
    EndUpdate;
  end;
end;

constructor TGR32WGChart.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar          := TGR32WGChartSettings.Create;
  FAyarlar.FOwner   := Self;
  FItems            := TList<TGR32WGChartItem>.Create;
  FAntiAliased      := False;
  FHeader           := 'Header Text';
  FUpdating         := false;
  DemoData;
end;

destructor TGR32WGChart.Destroy;
begin
  ClearItems;
  FreeAndNil(FItems);
  FreeAndNil(FAyarlar);
  inherited Destroy;
end;

procedure TGR32WGChart.Delete(aGrup: String);
var
  I: Integer;
begin
  for I := FItems.Count - 1 downto 0 do begin
      if (TGR32WGChartItem(FItems[I]).Grup = aGrup) then begin
          TGR32WGChartItem(FItems[I]).Free;
          FItems.Delete(I);
      end;
  end;
end;

procedure TGR32WGChart.Delete(aValue: Single);
var
  I: Integer;
begin
  for I := FItems.Count - 1 downto 0 do begin
      if (TGR32WGChartItem(FItems[I]).Value = aValue) then begin
          TGR32WGChartItem(FItems[I]).Free;
          FItems.Delete(I);
      end;
  end;
end;

procedure TGR32WGChart.Delete(aIndex: Integer);
begin
  if (aIndex > -1) and (aIndex < FItems.Count) then FItems.Delete(aIndex);
end;

procedure TGR32WGChart.DemoData;
begin
  ClearItems;

  Self.Add('Dolar',  0);
  Self.Add('Dolar',  5);
  Self.Add('Dolar', 10);
  Self.Add('Dolar',  8);
  Self.Add('Dolar', 20);
  Self.Add('Dolar', 18);
  Self.Add('Dolar', 30);
  Self.Add('Dolar', 26);
  Self.Add('Dolar', 40);
  Self.Add('Dolar', 35);
  Self.Add('Dolar', 50);
  Self.Add('Dolar', 44);
  Self.Add('Dolar', 60);
  Self.Add('Dolar', 53);
  Self.Add('Dolar', 70);
  Self.Add('Dolar', 62);
  Self.Add('Dolar', 80);
  Self.Add('Dolar', 70);
  Self.Add('Dolar', 90);
  Self.Add('Dolar', 80);
  Self.Add('Dolar',100);
end;

procedure TGR32WGChart.Edit(aIndex: Integer; aGrup: String; aValue: Single);
begin
  if (aIndex < FItems.Count) and (aIndex > -1) then begin
      with TGR32WGChartItem(FItems[aIndex]) do begin
            Grup  := aGrup;
            Value := aValue;
      end;
  end;
end;

procedure TGR32WGChart.EndUpdate;
begin
  FUpdating := false;
  Invalidate;
end;

function TGR32WGChart.Item(const aIndex: Integer): TGR32WGChartItem;
begin
  Result := nil;
  if (AIndex in [0..FItems.Count - 1]) then Result := FItems.Items[aIndex];
  //Result := TGR32WGChartItem(FItems[aIndex]);
end;

function TGR32WGChart.ItemCount: Integer;
begin
  Result := FItems.Count;
end;

function TGR32WGChart.Max: Single;
var
  AItem: TGR32WGChartItem;
begin
  Result := 0;
  if FItems.Count > 0 then
     for AItem in FItems do
         Result := System.Math.Max(Result, AItem.Value);
end;

function TGR32WGChart.MaxValue: Single;
var
  I: Integer;
begin
  if (ItemCount > -1) then begin
      Result := Item(0).Value;
      for I := 0 to FItems.Count - 1
       do if Result < Item(I).Value then Result := Item(I).Value;
  end else Result := 0;
end;

function TGR32WGChart.Min: Single;
var
  AItem: TGR32WGChartItem;
begin
  Result := 0;
  if FItems.Count > 0 then
     for AItem in FItems do
         Result := System.Math.Min(Result, AItem.Value);
end;

function TGR32WGChart.MinValue: Single;
var
  I: Integer;
begin
  if (ItemCount > -1) then begin
      Result := Item(0).Value;
      for I := 0 to FItems.Count - 1
       do if Result > Item(I).Value then Result := Item(I).Value;
  end else Result := 0;
end;

procedure TGR32WGChart.PaintControl;
var
  Ressam          : TPolygonRenderer32VPR;  //  TPolygonRenderer32;
  I               : Integer;                //  Genel sayaç değişkeni
  HR              : TRect;                  //  Header Rect
  Aralik          : Single;                 //  Frekans aralığı kastediliyor...
  XY, QW          : TFloatPoint;            //  Bir çizginin başlangıç ve bitiş koordinatları
  MXV, ValY       : Single;                 //  Max Value ve Sıradaki verinin Y pozisyonu
  AlanPoint       : TArrayOfFloatPoint;     //  Alan Grafiği için kullanılan nokta dizisi

  _R, _G, _B      : Byte;                   //  Red Green Blue / Kırmızı Yeşil Mavi

  PrevItem,
  NextItem        : TGR32WGChartItem;

  aLegendTop,
  aLegendNext,
  aLegendStep,
  aCurrValue,
  PrevValue,
  NextValue       : Single;
  bCanShowValue   : Boolean;
begin
  if (FUpdating = True)  then Exit;
  if (FItems.Count <= 0) then Exit;
  Aralik := 0;
  // Ölçüler resize metodunda hesaplanıyor.
  {$REGION 'Tuval hazırlığı'}
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;
  Ressam.FillMode := pfWinding;
  Ressam.Bitmap   := Self.FBuffer;
  if  (MouseIsInside = True)
  then Ressam.Bitmap.Clear( FAyarlar.BackgroundHover.ToColor32 )
  else Ressam.Bitmap.Clear( FAyarlar.Background.ToColor32 );
  // Chart alanının zemini boyanıyor
  Ressam.SekilBas ( iif(MouseIsInside = True, FAyarlar.FrameBGHover, FAyarlar.FrameBG).ToColor32, Ressam.DikDortgen( FZoneFrame.Center, FZoneFrame.Width, FZoneFrame.Height ));
  {$ENDREGION}
  {$REGION 'Izgara'}
  XY.Zero;
  QW.Create(FZone.Width, 0);
  repeat
         XY.AddX(FAyarlar.FAralikYatay);
         QW.X := XY.X;
         QW.Y := FZone.Height;
         Ressam.SekilBas(FAyarlar.FLineColor.ToColor32, Ressam.Cizgi(XY, QW, FAyarlar.FLineWidth, FAyarlar.FLineStyle));
  until (XY.X >= FZone.Width);
  XY.Zero;
  QW.Create(FZone.Width, 0);
  repeat
         XY.X := 0;
         XY.Y := XY.Y + FAyarlar.AralikDikey;
         //XY.AddY(FAyarlar.AralikDikey);
         QW.X := FZone.Width;
         QW.Y := XY.Y;
         Ressam.SekilBas(FAyarlar.FLineColor.ToColor32, Ressam.Cizgi(XY, QW, FAyarlar.FLineWidth, FAyarlar.FLineStyle));
  until (XY.Y >= FZone.Height);
  {$ENDREGION}
  {$REGION 'Bölgesel Çerçeveler çiziliyor'}
  // Dış kenarın çizilmesi
  Ressam.SekilBas( FAyarlar.BorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, FZone.Width, FZone.Height, FAyarlar.BorderWidth, FAyarlar.BorderStyle));
  // Chart alanının çerçevesi çiziliyor.
  Ressam.SekilBas ( FAyarlar.FrameColor.ToColor32, Ressam.DikDortgenCizgi( FZoneFrame.Center, FZoneFrame.Width, FZoneFrame.Height, FZoneFrame.Border, FAyarlar.FrameStyle));
  // Header yazısının yazdırılması
  Ressam.YaziBas( FZoneHeader.ToRect, FHeader, FAyarlar.Header.Color, FAyarlar.Header.Size, FAyarlar.Header.Name, FAyarlar.HeaderPos, FAyarlar.Header.Style, FAntiAliased);
  {$ENDREGION}
  {$REGION 'Grafikler çiziliyor'}
  if (FItems.Count > 0) then begin
      MXV := Self.MaxValue;
      //MNV := Self.MinValue;
      if (MXV <= 0) then MXV := 1;
      case  FAyarlar.FChartType  of
            wctAlan : begin
                        SetLength(AlanPoint, FItems.Count + 2);                           //  +2'nin 1'i sağ alt köşe için, diğeri de ClosePolygon için kullanılacak !!! }

                        if ((FItems.Count - 1) <= 0)
                        then Aralik := FZoneFrame.IntraWidth
                        else Aralik := FZoneFrame.IntraWidth / (FItems.Count - 1);

                        QW := FZoneFrame.IntraLeftBottom.AsFloatPoint;
                        AlanPoint[0] := QW;
                        for I := 0 to FItems.Count - 1 do begin
                            XY   := QW;                                                   // Bir önceki nokta konumu
                            ValY := (FZoneFrame.IntraHeight * Item(I).Value) / MXV;       // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                            QW.X := iif<single> ( (I > 0)                                 // İlk eleman değil ise
                                                , QW.X + Aralik                           // Araya boşluk ekle, değilse (yani ilk eleman ise)
                                                , FZoneFrame.IntraLeftBottom.X            // En sol taraftan başla...
                                                );
                            QW.Y := (FZoneFrame.IntraLeftBottom.Y - ValY);
                            if (I = 0) then XY := QW;
                            Ressam.SekilBas(FAyarlar.Cizgi_Renk.ToColor32, Ressam.Cizgi(XY, QW, FAyarlar.Cizgi_Kalinlik, psSolid)); // Çizgiyi çiz
                            AlanPoint[I + 1] := QW;
                        end;

                        AlanPoint[Length(AlanPoint) - 1] := FZoneFrame.IntraRightBottom.AsFloatPoint;
                        _R := GetRValue(FAyarlar.ChartAreaColor);
                        _G := GetGValue(FAyarlar.ChartAreaColor);
                        _B := GetBValue(FAyarlar.ChartAreaColor);

                        PolygonFS(Self.FBuffer, ClosePolygon(AlanPoint), Color32(_R, _G, _B, FAyarlar.ChartAreaColorAlpha)); // !!! > ClosePolygon fonksiyonu APoints[Length(APoints)]'in son elemanını ilk eleman ile eşitliyor...

                        if (FAyarlar.Cizgi_CemberEkle = True) then begin
                            QW := FZoneFrame.IntraLeftBottom.AsFloatPoint;
                            for I := 0 to FItems.Count - 1 do begin
                                XY   := QW;                                               // Bir önceki nokta konumu
                                ValY := FZoneFrame.IntraHeight * Item(I).Value / MXV;     // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                                QW.X := iif<single> ( (I > 0)                             // İlk eleman değil ise
                                                    , QW.X + Aralik                       // Araya boşluk ekle, değilse (yani ilk eleman ise)
                                                    , FZoneFrame.IntraLeftBottom.X        // En sol taraftan başla...
                                                    );
                                QW.Y := (FZoneFrame.IntraLeftBottom.Y - ValY);
                                if (I = 0) then XY := QW;
                                Ressam.SekilBas(FAyarlar.Cizgi_Cember.ToColor32, Ressam.Daire(QW, FAyarlar.Cizgi_YariCap));                               // noktayı bas
                                Ressam.SekilBas(FAyarlar.Cizgi_Dolgusu.ToColor32, Ressam.Daire(QW, FAyarlar.Cizgi_YariCap - FAyarlar.Cizgi_Kalinlik));   //  Noktanın iç kısmını boşalt
                            end;
                        end;
                      end;
            wctCizgi: begin
                        if ((FItems.Count - 1) <= 0)
                        then Aralik := FZoneFrame.IntraWidth / 1
                        else Aralik := FZoneFrame.IntraWidth / (FItems.Count - 1);

                        QW := FZoneFrame.IntraLeftBottom.AsFloatPoint;
                        for I := 0 to FItems.Count - 1 do begin
                            XY   := QW;                                                   // Bir önceki nokta konumu
                            ValY := (FZoneFrame.IntraHeight * Item(I).Value) / MXV;       // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                            QW.X := iif<single> ( (I > 0)                                 // İlk eleman değil ise
                                                , QW.X + Aralik                           // Araya boşluk ekle, değilse (yani ilk eleman ise)
                                                , FZoneFrame.IntraLeftBottom.X            // En sol taraftan başla...
                                                );
                            QW.Y := (FZoneFrame.IntraLeftBottom.Y - ValY);
                            if (I = 0) then XY := QW;
                            Ressam.SekilBas(FAyarlar.Cizgi_Renk.ToColor32, Ressam.Cizgi(XY, QW, FAyarlar.Cizgi_Kalinlik, psSolid)); // Çizgiyi çiz
                        end;

                        if (FAyarlar.Cizgi_CemberEkle = True) then begin
                            QW := FZoneFrame.IntraLeftBottom.AsFloatPoint;
                            for I := 0 to FItems.Count - 1 do begin
                                XY   := QW;                                               // Bir önceki nokta konumu
                                ValY := FZoneFrame.IntraHeight * Item(I).Value / MXV;     // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                                QW.X := iif<single> ( (I > 0)                             // İlk eleman değil ise
                                                    , QW.X + Aralik                       // Araya boşluk ekle, değilse (yani ilk eleman ise)
                                                    , FZoneFrame.IntraLeftBottom.X        // En sol taraftan başla...
                                                    );
                                QW.Y := (FZoneFrame.IntraLeftBottom.Y - ValY);
                                if (I = 0) then XY := QW;
                                Ressam.SekilBas(FAyarlar.Cizgi_Cember.ToColor32, Ressam.Daire(QW, FAyarlar.Cizgi_YariCap));                               // noktayı bas
                                Ressam.SekilBas(FAyarlar.Cizgi_Dolgusu.ToColor32, Ressam.Daire(QW, FAyarlar.Cizgi_YariCap - FAyarlar.Cizgi_Kalinlik));   //  Noktanın iç kısmını boşalt
                            end;
                        end;
                      end;
            wctCubuk: begin
                        Aralik := FZoneFrame.IntraWidth / FItems.Count;
                        //ZeroY  := FZoneFrame.IntraLeftBottom.Y;
                        XY.X   := FZoneFrame.IntraLeftBottom.X + (Aralik * 0.5);
                        XY.Y   := FZoneFrame.IntraLeftBottom.Y + 2;
                        for I := 0 to FItems.Count - 1 do begin
                            ValY := (FZoneFrame.IntraHeight * Item(I).Value) / MXV;      // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                            if (I > 0) then
                            XY.X := XY.X + Aralik;
                            XY.Y := FZoneFrame.IntraLeftBottom.Y - (ValY * 0.5);
                            Ressam.SekilBas(FAyarlar.Cizgi_Dolgusu.ToColor32, Ressam.Dikdortgen(XY, Aralik * 0.8, ValY));                   // Çizgiyi çiz
                            Ressam.SekilBas(FAyarlar.Cizgi_Renk   .ToColor32, Ressam.DikDortgenCizgi(XY, Aralik * 0.8, ValY, 1, psSolid));  // Çizgiyi çiz
                        end;
                      end;
      end;
      {$REGION 'Veri Etiketleri grafiğe çiziliyor'}
      QW := FZoneFrame.IntraLeftBottom.AsFloatPoint;
      for I := 0 to FItems.Count - 1 do begin
          XY   := QW;                                               // Bir önceki nokta konumu
          ValY := FZoneFrame.IntraHeight * Item(I).Value / MXV;     // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
          QW.X := iif<single> ( (I > 0)                             // İlk eleman değil ise
                              , QW.X + Aralik                       // Araya boşluk ekle, değilse (yani ilk eleman ise)
                              , FZoneFrame.IntraLeftBottom.X        // En sol taraftan başla...
                              );
          QW.Y := (FZoneFrame.IntraLeftBottom.Y - ValY);
          if (I = 0) then XY := QW;

          bCanShowValue := false;

          if (FAyarlar.FShowValues = True) then begin
              case FAyarlar.FShowValueType of
                   svtEveryValue : bCanShowValue := True;
                   svtOdd        : bCanShowValue := ((I mod 2)  = 0);
                   svtEven       : bCanShowValue := ((I mod 2) <> 0);
                   svtPick       : begin
                                     PrevValue := 0;
                                     NextValue := 0;
                                     PrevItem := Item(I - 1);
                                     if Assigned(PrevItem) then PrevValue := PrevItem.Value;
                                     NextItem := Item(I + 1);
                                     if Assigned(NextItem) then NextValue := NextItem.Value;
                                     bCanShowValue := (Item(I).Value > PrevValue) and (Item(I).Value > NextValue);
                                   end;
              end;
              if bCanShowValue then begin
                 HR := TRect.Create( Round(
                                              QW.X
                                            + iif<single>( FAyarlar.ChartType = wctCubuk
                                                         , 1 // Aralik
                                                         , 0
                                                         )
                                          ), Round(QW.Y-10), Round(QW.X), Round(QW.Y-10));
                 Ressam.YaziBas( HR, Item(I).Value.ToString, FAyarlar.Header.Color, 8, FAyarlar.Header.Name, FAyarlar.HeaderPos, FAyarlar.Header.Style, FAntiAliased);
              end;
          end;
      end;
      {$ENDREGION}
      {$REGION 'AxisY'}
      if (FAyarlar.FAxisYVisible = TRUE) then begin
          if (FAyarlar.FAxisYCount > 0) then begin
              aLegendNext := 0;
              ACurrValue  := Self.MinValue;
              aLegendTop  := FZoneFrame.IntraHeight / (FAyarlar.AxisYCount + 1);
              aLegendStep := (Self.MaxValue - Self.MinValue) / (FAyarlar.AxisYCount + 1);
              for I := 1 to FAyarlar.FAxisYCount do begin
                  ACurrValue := ACurrValue  + aLegendTop;
                  aLegendNext:= aLegendNext + aLegendStep;
                  XY.X := FZoneFrame.IntraLeftBottom.X;
                  XY.Y := FZoneFrame.IntraLeftBottom.Y - ACurrValue;
                  QW.X := FZoneFrame.IntraRightBottom.X;
                  QW.Y := FZoneFrame.IntraLeftBottom.Y - ACurrValue;

                  Ressam.SekilBas(FAyarlar.FAxisLineColor.ToColor32, Ressam.Cizgi(XY, QW, FAyarlar.FAxisLineWidth, FAyarlar.FAxisLineStyle));
                  Ressam.YaziBas( Round(FZoneFrame.IntraLeftBottom.X)
                                , Round(XY.Y)
                                , Round(aLegendNext).ToString
                                , FAyarlar.Axis
                                , FAyarlar.AxisTextPos
                                , FAntiAliased
                                );
              end;
          end;
      end;
      {$ENDREGION}
  end;
  {$ENDREGION}
  Ressam.Free; // FreeAndNil(Ressam) kullanıldığında ALPHA BLEND ayarı işlemez hale geliyor.
end;

procedure TGR32WGChart.RemoveItem(const AIndex : Integer = 0);
begin
  if (AIndex in [0..FItems.Count - 1]) and (Assigned(FItems.Items[AIndex])) then begin
     TObject(FItems.Items[AIndex]).Free;
     FItems.Delete(AIndex);
  end;
end;

procedure TGR32WGChart.Resize;
begin
  inherited;
  FZone       .Setup( 0
                    , 0
                    , ClientWidth
                    , ClientHeight
                    , FAyarlar.BorderWidth
                    , FAyarlar.Padding);
  FZoneHeader .Setup( FZone.IntraLeft
                    , FZone.IntraTop
                    , FZone.IntraWidth
                    , FAyarlar.HeaderHeight
                    , 0
                    , nil);
  FZoneFrame  .Setup( FZone.IntraLeft
                    , FZone.IntraTop + FZoneHeader.Height
                    , FZone.IntraWidth
                    , FZone.IntraHeight - FZoneHeader.Height
                    , FAyarlar.FrameWidth
                    , nil);
  //FZoneFrame.Padding.Setup(Round(FAyarlar.Cizgi_YariCap), Round(FAyarlar.Cizgi_YariCap), Round(FAyarlar.Cizgi_YariCap), Round(FAyarlar.Cizgi_YariCap));
  //FZoneLegend //FZoneRuller // eklenecek...
end;

{ TGR32WGChart.TGR32WGChartRuler }

procedure TGR32WGChart.TGR32WGChartRuler.AfterConstruction;
begin
  inherited;
  ResetSettings;
end;

procedure TGR32WGChart.TGR32WGChartRuler.Assign(Source: TPersistent);
var
  aSors: TGR32WGChart.TGR32WGChartRuler;
begin
  if (Source is TGR32WGChart.TGR32WGChartRuler) then begin
      aSors := TGR32WGChart.TGR32WGChartRuler(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FPosition       := aSors.Position      ;
      FRulerWidth     := aSors.RulerWidth   ;
      FRulerHeight    := aSors.RulerHeight  ;
      FVisible        := aSors.Visible      ;
  end else inherited;
end;

procedure TGR32WGChart.TGR32WGChartRuler.BeforeDestruction;
begin
  //
  inherited;
end;

procedure TGR32WGChart.TGR32WGChartRuler.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  // "Sender" parametresi bu noktada işimize yaramadığı için prosedürü çağırırken NIL değerini vermekte herhangi bir sakınca yoktur.
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WGChart.TGR32WGChartRuler.ResetSettings;
begin
  FPosition := wrpLeft;
  FVisible  := True;
  InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartRuler.SetPosition(const Value: TGR32WGChartRulerPos);
begin
  FPosition := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartRuler.SetRulerHeight(const Value: Integer);
begin
  FRulerHeight := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartRuler.SetRulerWidth(const Value: Integer);
begin
  FRulerWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartRuler.SetSize(aWidth, aHeight: Integer);
begin
  FRulerHeight := aWidth;
  FRulerWidth  := aHeight;
  InlineChangeNotifier(nil);
end;

procedure TGR32WGChart.TGR32WGChartRuler.SetVisible(const Value: Boolean);
begin
  FVisible := Value; InlineChangeNotifier(nil);
end;

end.

