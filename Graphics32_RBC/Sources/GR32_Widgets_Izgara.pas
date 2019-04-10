{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Izgara.pas                                            /
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

unit GR32_Widgets_Izgara;

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
  TGR32WGLines = (wilTumu, wilDikey, wilYatay, wilYok); // Izgaranın hangi eksendeki çizgilerinin gösterileceğini seçmeye yarar...
  TGR32WGIzgara = class(TGR32CustomWG)
    private
      //FZone         : TGR32Region;
      FAralikDikey  : Integer;
      FAralikYatay  : Integer;
      FBackground   : TColor;
      FBorderColor  : TColor;
      FBorderStyle  : TPenStyle;
      FBorderWidth  : Integer;
      FDamaModu     : Boolean;
      FLineColor    : TColor;
      FLineStyle    : TPenStyle;
      FLineWidth    : Integer;
      FLineView     : TGR32WGLines;
      procedure SetAralikDikey(const Value: Integer);
      procedure SetAralikYatay(const Value: Integer);
      procedure SetBackground(const Value: TColor);
      procedure SetBorderColor(const Value: TColor);
      procedure SetBorderStyle(const Value: TPenStyle);
      procedure SetBorderWidth(const Value: Integer);
      procedure SetDamamModu(const Value: Boolean);
      procedure SetLineColor(const Value: TColor);
      procedure SetLineStyle(const Value: TPenStyle);
      procedure SetLineWidth(const Value: Integer);
      procedure SetLineView(const Value: TGR32WGLines);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Resize; override;
      procedure PaintControl; override;
    published
      property AralikDikey  : Integer       read  FAralikDikey  write SetAralikDikey  ;
      property AralikYatay  : Integer       read  FAralikYatay  write SetAralikYatay  ;
      property Background   : TColor        read  FBackground   write SetBackground   ;
      property BorderColor  : TColor        read  FBorderColor  write SetBorderColor  ;
      property BorderStyle  : TPenStyle     read  FBorderStyle  write SetBorderStyle  ;
      property BorderWidth  : Integer       read  FBorderWidth  write SetBorderWidth  ;
      property DamaModu     : Boolean       read  FDamaModu     write SetDamamModu    ;
      property LineColor    : TColor        read  FLineColor    write SetLineColor    ;
      property LineStyle    : TPenStyle     read  FLineStyle    write SetLineStyle    ;
      property LineWidth    : Integer       read  FLineWidth    write SetLineWidth    ;
      property LineView     : TGR32WGLines  read  FLineView     write SetLineView     ;
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
  RegisterComponents('Graphics32RBC', [TGR32WGIzgara]);
end;

{ TGR32WGIzgara }

constructor TGR32WGIzgara.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //Self.Parent   := aOwner;
  FAralikDikey  := 10;
  FAralikYatay  := 10;
  FBackground   := clWindow;
  FBorderColor  := $00CECECE;
  FBorderStyle  := psDot;
  FBorderWidth  := 1;
  FLineColor    := $00EBEBEB;
  FLineStyle    := psDot;
  FLineWidth    := 1;
end;

destructor TGR32WGIzgara.Destroy;
begin
  //
  inherited Destroy;
end;

procedure TGR32WGIzgara.SetAralikDikey(const Value: Integer);
begin
  FAralikDikey := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetAralikYatay(const Value: Integer);
begin
  FAralikYatay := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetBackground(const Value: TColor);
begin
  FBackground := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetDamamModu(const Value: Boolean);
begin
  FDamaModu := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetLineColor(const Value: TColor);
begin
  FLineColor := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetLineStyle(const Value: TPenStyle);
begin
  FLineStyle := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetLineView(const Value: TGR32WGLines);
begin
  FLineView := Value; Invalidate;
end;

procedure TGR32WGIzgara.SetLineWidth(const Value: Integer);
begin
  FLineWidth := Value; Invalidate;
end;

procedure TGR32WGIzgara.PaintControl;
var
  I, J  : Integer;
  Ressam      : TPolygonRenderer32VPR;  // TPolygonRenderer32; //  Tuval
  XY, QW      : TFloatPoint;

  CL : TColor32;
  XX, YY: Integer;
  CCheckerBoardColor: array[0..1] of TColor32;
begin
  {$REGION 'Tuval hazırlığı'}
  CCheckerBoardColor[0] := Color32(FBackground);
  CCheckerBoardColor[1] := Color32(FLineColor);
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;                         // Henüz bir gradient kullanmadık.
  Ressam.FillMode := pfWinding;                   // FAyarlar.StyleFill.toPolyFillMode; // pfWinding; // bu ayar, iki çizgi üst üste kesiştiğinde çizgilerin kesiştiği kısımların birbirini yok etmesini engeller...
  Ressam.Bitmap   := Self.FBuffer;
  Ressam.Bitmap.Clear( Color32(FBackground) );
  {$ENDREGION}
  {$REGION 'Izgara Çizimi'}
  if (FDamaModu = False) then begin
      XY.X := 0;
      XY.Y := 0;
      QW.X := FZone.Width;
      QW.Y := 0;
      repeat
        XY.X := XY.X + FAralikYatay;
        XY.Y := 0;
        QW.X := XY.X;
        QW.Y := FZone.Height;
        Ressam.SekilBas(Color32(FLineColor), Ressam.Cizgi(XY, QW, FLineWidth, FLineStyle));
      until (XY.X >= FZone.Width);

      XY.X := 0;
      XY.Y := 0;
      QW.X := FZone.Width;
      QW.Y := 0;
      repeat
        XY.X := 0;
        XY.Y := XY.Y + FAralikDikey;
        QW.X := FZone.Width;
        QW.Y := XY.Y;
        Ressam.SekilBas(Color32(FLineColor), Ressam.Cizgi(XY, QW, FLineWidth, FLineStyle));
      until (XY.Y >= FZone.Height);
  end else begin
      I := round(ClientWidth / FAralikYatay);
      J := round(ClientHeight / FAralikDikey);
      for YY := 0 to J do begin
          for XX := 0 to I do begin
              if  Odd(XX) xor Odd(YY)
              then CL := CCheckerBoardColor[ 0 ]
              else CL := CCheckerBoardColor[ 1 ];
              XY.X := (XX * FAralikYatay) + (FAralikYatay div 2) + FBorderWidth;
              XY.Y := (YY * FAralikDikey) + (FAralikDikey div 2) + FBorderWidth;
              Ressam.SekilBas(CL, Ressam.Dikdortgen(XY, FAralikYatay, FAralikDikey));
          end;
      end;

  end;
  {$ENDREGION}
  {$REGION 'Dış Kenar Çizimi'}
  Ressam.SekilBas( BorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, FZone.Width, FZone.Height, FBorderWidth, FBorderStyle));
  {$ENDREGION}
  {$REGION 'Bellek temizliği'}
  Ressam.Free;
  {$ENDREGION}
end;

procedure TGR32WGIzgara.Resize;
begin
  inherited;
  FZone       .Setup( 0
                    , 0
                    , ClientWidth
                    , ClientHeight
                    , FBorderWidth
                    , nil
                    );
  {
  FZoneHeader .Setup( FZone.IntraLeft
                    , FZone.IntraTop
                    , FZone.IntraWidth
                    , HeaderHeight
                    , 0
                    , nil);
  FZoneFrame  .Setup( FZone.IntraLeft
                    , FZone.IntraTop + FZoneHeader.Height
                    , FZone.IntraWidth
                    , FZone.IntraHeight - FZoneHeader.Height
                    , FAyarlar.FrameWidth
                    , nil);
  }
end;

end.
