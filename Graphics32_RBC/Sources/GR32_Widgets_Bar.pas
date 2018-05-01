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
  TGR32WidgetBarDirection = (wbdYatay, wbdDikey);
  TGR32WidgetBar = class(TGR32CustomWidget)
    private
      FBackground : TColor;
      FBarColor   : TColor;
      FYuzde      : Integer;
      FYuzdeColor : TColor;
      FDirection  : TGR32WidgetBarDirection;
      FOval       : Integer;
      FInvert     : Boolean;
      procedure SetBackground(const Value: TColor);
      procedure SetBarColor(const Value: TColor);
      procedure SetYuzde(const Value: Integer);
      procedure SetYuzdeColor(const Value: TColor);
      procedure SetDirection(const Value: TGR32WidgetBarDirection);
      procedure SetOval(const Value: Integer);
      procedure SetInvert(const Value: Boolean);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
    published
      property Background : TColor                  read  FBackground write SetBackground;
      property BarColor   : TColor                  read  FBarColor   write SetBarColor;
      property Yuzde      : Integer                 read  FYuzde      write SetYuzde;
      property YuzdeColor : TColor                  read  FYuzdeColor write SetYuzdeColor;
      property Direction  : TGR32WidgetBarDirection read  FDirection  write SetDirection;
      property Oval       : Integer                 read  FOval       write SetOval;
      property Invert     : Boolean                 read  FInvert     write SetInvert;
      property Height;
      property Left;
      property Top;
      property Width;
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
  //
end;

destructor TGR32WidgetBar.Destroy;
begin
  //
  inherited Destroy;
end;

procedure TGR32WidgetBar.SetBackground(const Value: TColor);
begin
  FBackground := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetBarColor(const Value: TColor);
begin
  FBarColor := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetDirection(const Value: TGR32WidgetBarDirection);
begin
  FDirection := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetInvert(const Value: Boolean);
begin
  FInvert := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetOval(const Value: Integer);
begin
  FOval := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetYuzde(const Value: Integer);
begin
  FYuzde := Value; Invalidate;
end;

procedure TGR32WidgetBar.SetYuzdeColor(const Value: TColor);
begin
  FYuzdeColor := Value; Invalidate;
end;

procedure TGR32WidgetBar.PaintControl;
var
  T, L, W, H: Integer;                // Genel çerçeve bilgisi
  WH        : Single;
  MR        : TFloatPoint;
  Ressam    : TPolygonRenderer32VPR;  // TPolygonRenderer32; //  Tuval
  CA, CB    : TColor32;
begin
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil; // henüz bir gradient kullanmadýk.
  Ressam.FillMode := pfWinding;// FAyarlar.StyleFill.toPolyFillMode; // pfWinding; // bu ayar, iki çizgi üst üste kesiþtiðinde çizgilerin kesiþtiði kýsýmlarýn birbirini yok etmesini engeller...
  Ressam.Bitmap   := Self.FBuffer;
  Ressam.Bitmap.Clear( Color32(FBackground) ); // Tuvalin zemin rengi ve tam temizlik

  // Genel çerçeve bilgileri hesaplanýyor.
  T  := 0;
  L  := 0;
  W  := Width;// ClientWidth ;
  H  := Height;// ClientHeight;
  MR := Merkez;

  case FInvert of
    True  : begin
              ca := Color32(FBarColor);
              cb := Color32(FYuzdeColor);
            end;
    False : begin
              ca := Color32(FYuzdeColor);
              cb := Color32(FBarColor);
            end;
  end;

  // Border çiziliyor
  Ressam.SekilBas( ca, Ressam.DikdortgenOval( Merkez, W, H, FOval));

  case  FDirection  of
        wbdYatay: begin
                    WH   := (FYuzde * W) / 100;
                    if Invert
                    then MR.X := W - (WH / 2)
                    else MR.X := (WH / 2);
                    Ressam.SekilBas( cb, Ressam.DikdortgenOval( MR, WH, H, FOval));
                  end;
        wbdDikey: begin
                    WH   := (FYuzde * H) / 100;
                    if Invert
                    then MR.Y := H - (WH / 2)
                    else MR.Y := (WH / 2);
                    Ressam.SekilBas( cb, Ressam.DikdortgenOval( MR, W, WH, FOval));
                  end;
  end;
  Ressam.Free;
end;

end.
