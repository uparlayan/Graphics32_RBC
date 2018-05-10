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
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  , GR32_Rubicube_Consts        //  clRBC renk kodları
  ;

type
  TGR32WidgetChartTypes = (wctAlan, wctCizgi, wctCubuk);
  TGR32WidgetChartRulerPos = (wrpLeft, wrpTop, wrpRight, wrpBottom);
  TGR32WidgetChartItem = class
    public
      Grup: String;
      Value: Single;
      Constructor Ekle(const aGrup: String; aValue: Single);
  end;
  TGR32WidgetChart = class(TGR32CustomWidget)
    type
      TGR32WidgetChartSettings = class(TPersistent)
        private
          FOwner            : TGR32WidgetChart;
          FBackground       : TColor;
          FBorderColor      : TColor;
          FBorderStyle      : TPenStyle;
          FBorderWidth      : Integer;
          FChartType        : TGR32WidgetChartTypes;
          FCizgi_Cember     : TColor;
          FCizgi_Dolgusu    : TColor;
          FCizgi_Kalinlik   : Single;
          FCizgi_Renk       : TColor;
          FCizgi_YariCap    : Single;
          FFrameBG          : TColor;
          FFrameColor       : TColor;
          FFrameStyle       : TPenStyle;
          FFrameWidth       : Integer;
          FHeader           : TFont;
          FHeaderHeight     : Integer;
          FHeaderPos        : TFontPos;
          FPadding          : TPadding;
          procedure SetBackground(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetChartType(const Value: TGR32WidgetChartTypes);
          procedure SetCizgi_Cember(const Value: TColor);
          procedure SetCizgi_Dolgusu(const Value: TColor);
          procedure SetCizgi_Kalinlik(const Value: Single);
          procedure SetCizgi_Renk(const Value: TColor);
          procedure SetCizgi_YariCap(const Value: Single);
          procedure SetFrameBG(const Value: TColor);
          procedure SetFrameColor(const Value: TColor);
          procedure SetFrameStyle(const Value: TPenStyle);
          procedure SetFrameWidth(const Value: Integer);
          procedure SetHeader(const Value: TFont);
          procedure SetHeaderHeight(const Value: Integer);
          procedure SetHeaderPos(const Value: TFontPos);
          procedure SetPadding(const Value: TPadding);
        protected
          procedure InlineChangeNotifier(Sender: TObject);
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
        published
          property Background     : TColor                read  FBackground       write SetBackground     ;
          property BorderColor    : TColor                read  FBorderColor      write SetBorderColor    ;
          property BorderStyle    : TPenStyle             read  FBorderStyle      write SetBorderStyle    ;
          property BorderWidth    : Integer               read  FBorderWidth      write SetBorderWidth    ;
          property ChartType      : TGR32WidgetChartTypes read  FChartType        write SetChartType      ;
          property Cizgi_Cember   : TColor                read  FCizgi_Cember     write SetCizgi_Cember   ;
          property Cizgi_Dolgusu  : TColor                read  FCizgi_Dolgusu    write SetCizgi_Dolgusu  ;
          property Cizgi_Kalinlik : Single                read  FCizgi_Kalinlik   write SetCizgi_Kalinlik ;
          property Cizgi_Renk     : TColor                read  FCizgi_Renk       write SetCizgi_Renk     ;
          property Cizgi_YariCap  : Single                read  FCizgi_YariCap    write SetCizgi_YariCap  ;
          property FrameBG        : TColor                read  FFrameBG          write SetFrameBG        ;
          property FrameColor     : TColor                read  FFrameColor       write SetFrameColor     ;
          property FrameStyle     : TPenStyle             read  FFrameStyle       write SetFrameStyle     ;
          property FrameWidth     : Integer               read  FFrameWidth       write SetFrameWidth     ;
          property Header         : TFont                 read  FHeader           write SetHeader         ;
          property HeaderHeight   : Integer               read  FHeaderHeight     write SetHeaderHeight   ;
          property HeaderPos      : TFontPos              read  FHeaderPos        write SetHeaderPos      ;
          property Padding        : TPadding              read  FPadding          write SetPadding        ;
      end;
      TGR32WidgetChartRuler = class(TPersistent)
        private
          FOwner            : TGR32WidgetChart;
          FPosition         : TGR32WidgetChartRulerPos;
          FRulerWidth       : Integer;
          FRulerHeight      : Integer;
          FVisible          : Boolean;
          procedure SetPostion(const Value: TGR32WidgetChartRulerPos);
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
          property Postion      : TGR32WidgetChartRulerPos  read  FPosition     write SetPostion;
          property RulerWidth   : Integer                   read  FRulerWidth   write SetRulerWidth;
          property RulerHeight  : Integer                   read  FRulerHeight  write SetRulerHeight;
          property Visible      : Boolean                   read  FVisible      write SetVisible;
      end;
    private
      FItems      : TList;
      FAyarlar    : TGR32WidgetChartSettings;
      FAntiAliased: Boolean;
      FHeader     : String;
      procedure SetAyarlar(const Value: TGR32WidgetChartSettings);
      procedure SetAntiAliased(const Value: Boolean);
      procedure SetHeader(const Value: String);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure DemoData;
      procedure Add(aGrup: string; aValue: Single);
      procedure Delete(aGrup: String); overload;
      procedure Delete(aValue: Single); overload;
      procedure Delete(aIndex: Integer); overload;
      procedure Edit(aIndex: Integer; aGrup: String; aValue: Single);
      procedure ClearItems;
      function MaxValue: Single;
      function MinValue: Single;
      function ItemCount: Integer;
      function Item(aIndex: Integer): TGR32WidgetChartItem;
      property Items        : TList                     read FItems        write FItems;
    published
      property Ayarlar      : TGR32WidgetChartSettings  read FAyarlar      write SetAyarlar  ;
      property AntiAliased  : Boolean                   read FAntiAliased  write SetAntiAliased;
      property Header       : String                    read FHeader       write SetHeader   ;
      property Margins;
      property Left;
      property Top;
      property Width;
      property Height;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WidgetChart]);
end;

{ TGR32WidgetChartObject }

constructor TGR32WidgetChartItem.Ekle(const aGrup: String; aValue: Single);
begin
  Grup := aGrup;
  Value  := aValue;
end;

{ TGR32WidgetChart.TGR32WidgetChartSettings }

procedure TGR32WidgetChart.TGR32WidgetChartSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WidgetChart.TGR32WidgetChartSettings;
begin
  if (Source is TGR32WidgetChart.TGR32WidgetChartSettings) then begin
      aSors := TGR32WidgetChart.TGR32WidgetChartSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background     ;
      FBorderColor      := aSors.BorderColor    ;
      FBorderStyle      := aSors.BorderStyle    ;
      FBorderWidth      := aSors.BorderWidth    ;
      FChartType        := aSors.ChartType      ;
      FCizgi_Cember     := aSors.Cizgi_Cember   ;
      FCizgi_Dolgusu    := aSors.Cizgi_Dolgusu  ;
      FCizgi_Kalinlik   := aSors.Cizgi_Kalinlik ;
      FCizgi_Renk       := aSors.Cizgi_Renk     ;
      FCizgi_YariCap    := aSors.Cizgi_YariCap  ;
      FFrameBG          := aSors.FrameBG        ;
      FFrameColor       := aSors.FrameColor     ;
      FFrameStyle       := aSors.FrameStyle     ;
      FFrameWidth       := aSors.FrameWidth     ;
      FHeader           := aSors.Header         ;
      FHeaderHeight     := aSors.HeaderHeight   ;
      FHeaderPos        := aSors.HeaderPos      ;
      FPadding          := aSors.Padding        ;
  end else inherited;
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.AfterConstruction;
begin
  inherited;
  FHeader             := TFont.Create;
  FHeader.OnChange    := InlineChangeNotifier;
  FPadding            := TPadding.Create(FOwner);
  FPadding.OnChange   := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.BeforeDestruction;
begin
  FreeAndNil(FHeader);
  FreeAndNil(FPadding);
  inherited;
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sýnýfýn alt type'lerinde bir deðiþiklik olduðunda ana sýnýfýn grafiðinin yeniden çizilmesini tetikler...
  // "Sender" parametresi bu noktada işimize yaramadıðı için prosedürü çağırırken NIL değerini vermekte herhangi bir sakınca yoktur.
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.ResetSettings;
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
  FFrameBG          := clWindow;
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
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetChartType(const Value: TGR32WidgetChartTypes);
begin
  FChartType := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetCizgi_Cember(const Value: TColor);
begin
  FCizgi_Cember := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetCizgi_Dolgusu(const Value: TColor);
begin
  FCizgi_Dolgusu := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetCizgi_Kalinlik(const Value: Single);
begin
  FCizgi_Kalinlik := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetCizgi_Renk(const Value: TColor);
begin
  FCizgi_Renk := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetCizgi_YariCap(const Value: Single);
begin
  FCizgi_YariCap := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetFrameBG(const Value: TColor);
begin
  FFrameBG := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetFrameColor(const Value: TColor);
begin
  FFrameColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetFrameStyle(const Value: TPenStyle);
begin
  FFrameStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetFrameWidth(const Value: Integer);
begin
  FFrameWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetHeader(const Value: TFont);
begin
  FHeader := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetHeaderHeight(const Value: Integer);
begin
  FHeaderHeight := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetHeaderPos(const Value: TFontPos);
begin
  FHeaderPos := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartSettings.SetPadding(const Value: TPadding);
begin
  FPadding := Value; InlineChangeNotifier(nil);
end;

{ TGR32WidgetChart }

procedure TGR32WidgetChart.SetAntiAliased(const Value: Boolean);
begin
  FAntiAliased := Value; Invalidate;
end;

procedure TGR32WidgetChart.SetAyarlar(const Value: TGR32WidgetChartSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WidgetChart.SetHeader(const Value: String);
begin
  FHeader := Value; Invalidate;
end;

procedure TGR32WidgetChart.Add(aGrup: string; aValue: Single);
begin
  FItems.Add( TGR32WidgetChartItem.Ekle(aGrup, aValue) );
  // Sort prosedürü eklenecek...
end;

procedure TGR32WidgetChart.ClearItems;
begin
  FItems.Flush;
end;

constructor TGR32WidgetChart.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar          := TGR32WidgetChartSettings.Create;
  FAyarlar.FOwner   := Self;
  FItems             := TList.Create;
  FAntiAliased      := False;
  FHeader           := 'Header Text';
  DemoData;
end;

procedure TGR32WidgetChart.Delete(aGrup: String);
var
  I: Integer;
begin
  for I := FItems.Count - 1 downto 0 do begin
      if (TGR32WidgetChartItem(FItems[I]).Grup = aGrup) then begin
          TGR32WidgetChartItem(FItems[I]).Free;
          FItems.Delete(I);
      end;
  end;
end;

procedure TGR32WidgetChart.Delete(aValue: Single);
var
  I: Integer;
begin
  for I := FItems.Count - 1 downto 0 do begin
      if (TGR32WidgetChartItem(FItems[I]).Value = aValue) then begin
          TGR32WidgetChartItem(FItems[I]).Free;
          FItems.Delete(I);
      end;
  end;
end;

procedure TGR32WidgetChart.Delete(aIndex: Integer);
begin
  if (aIndex > -1) and (aIndex < FItems.Count) then FItems.Delete(aIndex);
end;

procedure TGR32WidgetChart.DemoData;
begin
  Self.FItems.Flush;
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

destructor TGR32WidgetChart.Destroy;
begin
  FItems.Flush; FreeAndNil(FItems);
  FreeAndNil(FAyarlar);
  inherited Destroy;
end;

procedure TGR32WidgetChart.Edit(aIndex: Integer; aGrup: String; aValue: Single);
begin
  if (aIndex < FItems.Count) and (aIndex > -1) then begin
      with TGR32WidgetChartItem(FItems[aIndex]) do begin
            Grup  := aGrup;
            Value := aValue;
      end;
  end;
end;

function TGR32WidgetChart.Item(aIndex: Integer): TGR32WidgetChartItem;
begin
  Result := TGR32WidgetChartItem(FItems[aIndex]);
end;

function TGR32WidgetChart.ItemCount: Integer;
begin
  Result := FItems.Count;
end;

function TGR32WidgetChart.MaxValue: Single;
var
  I: Integer;
begin
  if (ItemCount > -1) then begin
      Result := Item(0).Value;
      for I := 0 to FItems.Count - 1
       do if Result < Item(I).Value then Result := Item(I).Value;
  end else Result := 0;
end;

function TGR32WidgetChart.MinValue: Single;
var
  I: Integer;
begin
  if (ItemCount > -1) then begin
      Result := Item(0).Value;
      for I := 0 to FItems.Count - 1
       do if Result > Item(I).Value then Result := Item(I).Value;
  end else Result := 0;
end;

procedure TGR32WidgetChart.PaintControl;
var
  I: Integer;
  En, Boy     : Integer;
  W, H  : Integer;                // Genel çerçeve bilgisi
  PL, PT, PR, PB: Integer;
  HM, FM        : TFloatPoint;
  BW_, FW_      : Integer;
  Ressam        : TPolygonRenderer32VPR;  // TPolygonRenderer32;
  HR            : TRect;                  //  Header Rect
  Aralik        : Single; // frekans aralığı kastediliyor...
  XY, QW        : TFloatPoint;
  MXV, ZeroX, ZeroY, ValY: Single;
begin
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;
  Ressam.FillMode := pfWinding;
  Ressam.Bitmap   := Self.FBuffer;
  // Tuval temizliği
  Ressam.Bitmap.Clear( FAyarlar.FBackground.ToColor32 );
  // Genel geçer ölçü ve boyutların hesaplanması
  W  := ClientWidth ;
  H  := ClientHeight;
  // Dış kenarın çizilmesi
  Ressam.SekilBas( FAyarlar.BorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, W, H, FAyarlar.BorderWidth, FAyarlar.BorderStyle));
  PL := FAyarlar.Padding.Left;
  PT := FAyarlar.Padding.Top;
  PR := FAyarlar.Padding.Right;
  PB := FAyarlar.Padding.Bottom;
  BW_:= FAyarlar.BorderWidth;
  FW_:= FAyarlar.FrameWidth;
  // Header kenarının hesaplanması
  HM.X := Merkez.X;
  HM.Y := (FAyarlar.HeaderHeight * 0.5) + BW_ + PT;
  En := W - (PL + PR + ((BW_+FW_)*2) );
  // Header yazısının yazdırılması
  //HR := TRect.Create( 0, 0, W - ( (BW_ * 2) + (FW_ * 2) + PL + PR ), FAyarlar.HeaderHeight);
  HR := TRect.Create( 0, 0, En, FAyarlar.HeaderHeight);
  HR.Offset( BW_ + FAyarlar.Padding.Left, BW_ + FAyarlar.Padding.Top);
  Ressam.YaziBas( HR, FHeader, FAyarlar.Header.Color, FAyarlar.Header.Size, FAyarlar.Header.Name, FAyarlar.HeaderPos, FAyarlar.Header.Style, FAntiAliased);
  // Chart alanının çerçevesi çiziliyor.
  FM := Merkez;
  Boy := H - BW_ - PT - FW_ - FAyarlar.HeaderHeight - FW_ - PB - BW_;
  FM.Y := Merkez.Y + (FAyarlar.HeaderHeight div 2);
  Ressam.SekilBas ( FAyarlar.FrameBG.ToColor32, Ressam.DikDortgen( FM, En, Boy));
  Ressam.SekilBas ( FAyarlar.FrameColor.ToColor32, Ressam.DikDortgenCizgi( FM, En, Boy, FW_, FAyarlar.FrameStyle));
  MXV := Self.MaxValue;
  // Chart'ın içindeki çizim bölgesinin ölçüleri alınıyor...
  // Chart tipine göre chart tipi çiziliyor...
  case  FAyarlar.FChartType  of
        wctCizgi: begin
                    // Değerleri birbirine bağlayan bir çizgi çizer.
                    Boy := Boy - (Round(FAyarlar.Cizgi_YariCap) * 2) - (FW_ * 2);
                    En  := En  - (Round(FAyarlar.Cizgi_YariCap) * 2) - (FW_ * 2);
                    ZeroX := (BW_ + FW_ + FW_ + PL)    + FAyarlar.Cizgi_YariCap;
                    ZeroY := H - (BW_ + (FW_ * 3) + PB + FAyarlar.Cizgi_YariCap + 1); // + FAyarlar.Cizgi_Kalinlik );
                    Aralik := En / (FItems.Count - 1);
                    QW.X  := ZeroX;
                    QW.Y  := ZeroY;
                    for I := 0 to FItems.Count - 1 do begin
                        XY := QW;                               // Bir önceki nokta konumu
                        ValY  := Boy * Item(I).Value / MXV;      // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                        if  (I > 0)                             // İlk eleman değil ise
                        then QW.X := QW.X + Aralik              // Araya boşluk ekle, değilse (yani ilk eleman ise)
                        else QW.X := ZeroX;                     // En sol taraftan başla...
                        QW.Y := (ZeroY - ValY) + BW_ + FW_;
                        if (I = 0) then XY := QW;
                        Ressam.SekilBas(FAyarlar.Cizgi_Renk.ToColor32, Ressam.Cizgi(XY, QW, FAyarlar.Cizgi_Kalinlik, psSolid));                 // Çizgiyi çiz
                    end;
                    QW.X  := ZeroX;
                    QW.Y  := ZeroY;
                    for I := 0 to FItems.Count - 1 do begin
                        XY := QW;                               // Bir önceki nokta konumu
                        ValY  := Boy * Item(I).Value / MXV;      // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                        if  (I > 0)                             // İlk eleman değil ise
                        then QW.X := QW.X + Aralik              // Araya boşluk ekle, değilse (yani ilk eleman ise)
                        else QW.X := ZeroX;                     // En sol taraftan başla...
                        QW.Y := (ZeroY - ValY) + BW_ + FW_;
                        if (I = 0) then XY := QW;
                        Ressam.SekilBas(FAyarlar.Cizgi_Cember.ToColor32, Ressam.Daire(QW, FAyarlar.Cizgi_YariCap));                               // noktayı bas
                        Ressam.SekilBas(FAyarlar.Cizgi_Dolgusu.ToColor32, Ressam.Daire(QW, FAyarlar.Cizgi_YariCap - FAyarlar.Cizgi_Kalinlik));   //  Noktanın iç kısmını boşalt
                    end;
                  end;
        wctCubuk: begin
                    // Değerleri görselleştirmek için tabandan değere kadar bir çubuk çizer...
                    En := W - (PL + PR + ((BW_+FW_)*2) );
                    En := En - ((En div FItems.Count) div 4);
                    Boy := H - BW_ - PT - FW_ - FAyarlar.HeaderHeight - (FW_*4) - PB - (BW_*2);
                    Aralik := En / FItems.Count;
                    ZeroX := (BW_ + (FW_ * 2) + PL) + 1;
                    ZeroY := H - (BW_ + (FW_ * 3) + PB + 1); // + FAyarlar.Cizgi_Kalinlik );
                    XY.X  := ZeroX + (Aralik * 0.5);
                    XY.Y  := ZeroY + 2;
                    for I := 0 to FItems.Count - 1 do begin
                        ValY := Boy * Item(I).Value / MXV;      // Sayısal değerin grafik alanındaki taban noktaya orantısal uzaklığı
                        if (I > 0) then
                        XY.X := XY.X + Aralik;
                        XY.Y := ZeroY - (ValY * 0.5);
                        Ressam.SekilBas(FAyarlar.Cizgi_Dolgusu.ToColor32, Ressam.Dikdortgen(XY, Aralik * 0.8, ValY));                 // Çizgiyi çiz
                        Ressam.SekilBas(FAyarlar.Cizgi_Renk   .ToColor32, Ressam.DikDortgenCizgi(XY, Aralik * 0.8, ValY, 1, psSolid));                 // Çizgiyi çiz
                    end;
                  end;
        wctAlan : begin
                    // wctCizgi ile aynıdır, çizginin altında kalan kısmı farklı bir renk ile doldurur...
                  end;
  end;
  Ressam.Free;
end;

{ TGR32WidgetChart.TGR32WidgetChartRuler }

procedure TGR32WidgetChart.TGR32WidgetChartRuler.AfterConstruction;
begin
  inherited;
  ResetSettings;
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.Assign(Source: TPersistent);
var
  aSors: TGR32WidgetChart.TGR32WidgetChartRuler;
begin
  if (Source is TGR32WidgetChart.TGR32WidgetChartRuler) then begin
      aSors := TGR32WidgetChart.TGR32WidgetChartRuler(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FPosition       := aSors.Postion      ;
      FRulerWidth     := aSors.RulerWidth   ;
      FRulerHeight    := aSors.RulerHeight  ;
      FVisible        := aSors.Visible      ;
  end else inherited;
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.BeforeDestruction;
begin
  //
  inherited;
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  // "Sender" parametresi bu noktada işimize yaramadığı için prosedürü çağırırken NIL değerini vermekte herhangi bir sakınca yoktur.
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.ResetSettings;
begin
  FPosition := wrpLeft;
  FVisible  := True;
  InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.SetPostion(const Value: TGR32WidgetChartRulerPos);
begin
  FPosition := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.SetRulerHeight(const Value: Integer);
begin
  FRulerHeight := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.SetRulerWidth(const Value: Integer);
begin
  FRulerWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.SetSize(aWidth, aHeight: Integer);
begin
  FRulerHeight := aWidth;
  FRulerWidth  := aHeight;
  InlineChangeNotifier(nil);
end;

procedure TGR32WidgetChart.TGR32WidgetChartRuler.SetVisible(const Value: Boolean);
begin
  FVisible := Value; InlineChangeNotifier(nil);
end;

end.
