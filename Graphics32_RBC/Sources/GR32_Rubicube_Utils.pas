{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Rubicube_Utils.pas                                            /
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

unit GR32_Rubicube_Utils;

interface

uses
    GR32
  , GR32_Polygons
  , GR32_VectorUtils
  , GR32_Math
  , VCL.Graphics                //  TColor
  , System.Classes              //  TList
  , System.Types                //  TRect,  TSize
  //, Winapi.Windows
  ;

const
  Pi     = 3.14159265358979323846;  // 270. derece
  Pi_1   = Pi   / 2;                // 1.570796326794897; // 180. derece
  Pi_3   = (Pi  / 2) * 3;           // 4.712388980384690; // 90. derece...
  Pi_4   = Pi   * 2;                // 6.283185307179586; // Bu özel hesaplamalar için kullanılan Pi'nin 2. katıdır...
  Pi_000 = Pi   * 0.01;
  Pi_001 = Pi_1 * 0.01;
  Pi_003 = Pi_3 * 0.01;
  Pi_004 = Pi_4 * 0.01;             // => 0.06283185307179586


type
  TPiOfsetTipi = (Pi_0, Pi_90, Pi_180, Pi_270);
  TPiOfsetTipi_Helper = record helper for TPiOfsetTipi
    public
      function ToSingle: Single;
  end;
const
  PiOfset : array [low(TPiOfsetTipi)..High(TPiOfsetTipi)] of Single = ( 4.71238898038469  //   0. derece (Veya 360. derece)
                                                                      , 0.000000000000001 //  90. derece
                                                                      , 1.570796326794897 // 180. derece
                                                                      , 3.141592653589793 // 270. derece
                                                                      );
type                                                                    //            0          1              0          1    //
  TGR32WGFullStyle      = (wfsWinding, wfsAlternatif ); //  TPolyFillMode; // (pfAlternate, pfWinding, pfEvenOdd = 0, pfNonZero); "= 0" ataması yapılmış dolayısıyla object inspectorde çıkmıyor, o nedenle ek bir set tanımlandı.
  TGR32WGVerticalPos    = (wvpNone, wvpTop, wvpBottom); //  Dikey konumlandırma bilgisi için...
  TGR32WGHorizontalPos  = (whpNone, whpLeft, whpRight); //  Yatay konumlandırma bilgisi için
  TGR32WGAxialPos       = (wgpNone, wgpTop, wgpLeft, wgpBottom, wgpRight); //  Ana yön konumlandırma bilgisi için

  TGR32WGBevelKinds     = (wbvLeft, wbvTop, wbvRight, wbvBottom);
  TGR32WGBevel          = set of TGR32WGBevelKinds;

  TFontPos              = (fpTopLeft, fpTopCenter, fpTopRight, fpCenterLeft, fpCenterCenter, fpCenterRight, fpBottomLeft, fpBottomCenter, fpBottomRight);
  TFloatPoint_Helper = record helper for TFloatPoint
    public
      procedure Step(toX, toY: Single);
      procedure AddX(toX: Single);
      procedure AddY(toY: Single);
  end;
  TColor_Helper = record Helper for TColor
    public
      function ToColor32: TColor32;
  end;
  TRect_Helper = record Helper for TRect
    public
      function ToCenterPointFloat: TFloatPoint;
  end;
  TListHelper = class helper for TList
    public
      procedure Flush; // Listenin içindeki TObject soyundan gelen nesneleri free etmeye yarar... Clear TList'in elemanlarını yok ederken bu bağlantı kurulan o nesnelerin kendisini de yok eder...
  end;
  TRenderHelper = class helper for TPolygonRenderer32VPR // TPolygonRenderer32
    public
      function ArrayOfFloat(Values: array of TFloat): TArrayOfFloat;
      function Kare(aMerkez: TFloatPoint; aKenar: Single): TArrayOfFloatPoint;
      function Dikdortgen(aMerkez: TFloatPoint; aWidth, aHeight: Single): TArrayOfFloatPoint;
      function DikdortgenOval(aMerkez: TFloatPoint; aWidth, aHeight: Single; YariCap: Single = 8): TArrayOfFloatPoint;
      function DikDortgenCizgi(aMerkez: TFloatPoint; aWidth, aHeight, aKalinlik: Single; aStyle: TPenStyle = psSolid): TArrayOfArrayOfFloatPoint; overload;
      function Cizgi(aXY, aWH: TFloatPoint; aKalinlik: Single; aStyle: TPenStyle = psSolid): TArrayOfArrayOfFloatPoint;
      function CizgiDama(aXY, aWH: TFloatPoint; aKalinlik: Single; aDamaSize: Single): TArrayOfArrayOfFloatPoint;
      function Daire(aMerkez: TFloatPoint; aYariCap: Single): TArrayOfFloatPoint;
      function Pasta(aMerkez: TFloatPoint; aYariCap: Single; aYuzde: Single; aOfset: TPiOfsetTipi = Pi_0): TArrayOfFloatPoint;
      function Yay(aMerkez: TFloatPoint; aYuzde, aYariCap, aKalinlik: Single; aSteps: Integer = 4000): TArrayOfFloatPoint;
      function AngleArc(aCenter: TFloatPoint; const aRadius, aThickness: TFloat; const aAngle, aOffset: TFloat; Steps: Integer = 4000): TArrayOfFloatPoint;
      procedure SekilBas(aRenk: TColor32; const aPoints: TArrayOfFloatPoint); overload; // Filler eklenecek
      procedure SekilBas(aRenk: TColor32; const aPoints: TArrayOfArrayOfFloatPoint); overload; // Filler eklenecek
      procedure YaziBas(X, Y: Integer; aString: String; aFont: TFont; aFontPos: TFontPos = fpCenterCenter; aAntiAliased: Boolean = False); overload;
      procedure YaziBas(X, Y: Integer; aString: String; aColor: TColor = cldefault; aFontSize: Integer = 0; aFontName: String = ''; aFontPos: TFontPos = fpCenterCenter; aFontStyle: TFontStyles = []; aAntiAliased: Boolean = False); overload;
      procedure YaziBas(aRect: TRect; aString: String; aColor: TColor = cldefault; aFontSize: Integer = 0; aFontName: String = ''; aFontPos: TFontPos = fpCenterCenter; aFontStyle: TFontStyles = []; aAntiAliased: Boolean = False); overload;
      procedure YaziBas(aRect: TRect; aString: String; aFont: TFont; aFontPos: TFontPos = fpCenterCenter; aAntiAliased: Boolean = False); overload;
  end;

implementation

uses
    System.SysUtils //  FreeAndNil
  , System.Math
  , System.UITypes
  , GR32_Backends
  ;

{ TRenderHelper }

function TRenderHelper.Daire(aMerkez: TFloatPoint; aYariCap: Single): TArrayOfFloatPoint;
begin
  Result := Circle(aMerkez, aYariCap);
end;

function TRenderHelper.Dikdortgen(aMerkez: TFloatPoint; aWidth, aHeight: Single): TArrayOfFloatPoint;
var
  R: TFloatRect;
begin
  R.Left   := aMerkez.X - (aWidth * 0.5);
  R.Right  := aMerkez.X + (aWidth * 0.5);
  R.Top    := aMerkez.Y - (aHeight * 0.5);
  R.Bottom := aMerkez.Y + (aHeight * 0.5);
  Result := Rectangle(R);
end;


function TRenderHelper.DikdortgenOval(aMerkez: TFloatPoint; aWidth, aHeight, YariCap: Single): TArrayOfFloatPoint;
var
  R: TFloatRect;
begin
  R.Left   := aMerkez.X - (aWidth * 0.5);
  R.Right  := aMerkez.X + (aWidth * 0.5);
  R.Top    := aMerkez.Y - (aHeight * 0.5);
  R.Bottom := aMerkez.Y + (aHeight * 0.5);
  Result := RoundRect(R, YariCap);
end;

function TRenderHelper.ArrayOfFloat(Values: array of TFloat): TArrayOfFloat;
var
  Index: Integer;
begin
  SetLength(Result, Length(Values));
  for Index := Low(Values) to High(Values) do Result[Index] := Values[Index];
end;

function TRenderHelper.DikDortgenCizgi(aMerkez: TFloatPoint; aWidth, aHeight, aKalinlik: Single; aStyle: TPenStyle): TArrayOfArrayOfFloatPoint;
var
  X, Y, W, H, Z: Single;
  Noktalar: TArrayOfFloatPoint;
  Dash, Dot: Single;
begin
  if (aKalinlik < 1)
  or (aWidth < 1)
  or (aHeight < 1)
  then begin
      Result := [];
      Exit;
  end;
  X := aMerkez.X - (aWidth  * 0.5) + (aKalinlik * 0.5);
  Y := aMerkez.Y - (aHeight * 0.5) + (aKalinlik * 0.5);;
  W := aWidth - aKalinlik;
  H := aHeight - aKalinlik;
  SetLength(Noktalar, 5);
  Noktalar[0] := FloatPoint(X, Y);
  Noktalar[1] := FloatPoint(X + W, Y);
  Noktalar[2] := FloatPoint(X + W, Y + H);
  Noktalar[3] := FloatPoint(X, Y + H);
  Noktalar[4] := FloatPoint(X, Y);
  Z := aKalinlik;
  Dash := Z * 3;
  Dot  := Z * 1;
  case aStyle of
       psClear       : Result := [];
       psSolid       : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash                             ])), False, aKalinlik, jsRound, esRound); // BuildPolyline(Noktalar, aKalinlik, jsRound, esRound);
       psDash        : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash, Dash                       ])), False, aKalinlik, jsRound, esRound);
       psDot         : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dot , Dash                       ])), False, aKalinlik, jsRound, esRound);
       psDashDot     : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash, Dash, Dot, Dash            ])), False, aKalinlik, jsRound, esRound);
       psDashDotDot  : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash, Dash, Dot, Dash, Dot, Dash ])), False, aKalinlik, jsRound, esRound);
       psInsideFrame : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash                             ])), False, aKalinlik, jsRound, esRound); // BuildPolyline(Noktalar, aKalinlik, jsBevel, esSquare);
       psUserStyle   : Result := [];
       psAlternate   : Result := [];
  end;
end;

function TRenderHelper.Cizgi(aXY, aWH: TFloatPoint; aKalinlik: Single; aStyle: TPenStyle): TArrayOfArrayOfFloatPoint;
var
  //X, Y, W, H,
  Z: Single;
  Noktalar: TArrayOfFloatPoint;
  Dash, Dot: Single;
begin
  if (aKalinlik < 1) then begin
      Result := [];
      Exit;
  end;
  SetLength(Noktalar, 2);
  Noktalar[0] := FloatPoint(aXY.X, aXY.Y);
  Noktalar[1] := FloatPoint(aWH.X, aWH.Y);
  Z := aKalinlik;
  Dash := Z * 3;
  Dot  := Z * 1;
  case aStyle of
       psClear       : Result := [];
       psSolid       : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash                             ])), False, aKalinlik, jsRound, esRound); // BuildPolyline(Noktalar, aKalinlik, jsRound, esRound);
       psDash        : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash, Dash                       ])), False, aKalinlik, jsRound, esRound);
       psDot         : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dot , Dash                       ])), False, aKalinlik, jsRound, esRound);
       psDashDot     : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash, Dash, Dot, Dash            ])), False, aKalinlik, jsRound, esRound);
       psDashDotDot  : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash, Dash, Dot, Dash, Dot, Dash ])), False, aKalinlik, jsRound, esRound);
       psInsideFrame : Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([Dash                             ])), False, aKalinlik, jsRound, esRound); // BuildPolyline(Noktalar, aKalinlik, jsBevel, esSquare);
       psUserStyle   : Result := [];
       psAlternate   : Result := [];
  end;
end;

function TRenderHelper.CizgiDama(aXY, aWH: TFloatPoint; aKalinlik, aDamaSize: Single): TArrayOfArrayOfFloatPoint;
var
  Noktalar: TArrayOfFloatPoint;
begin
  if (aKalinlik < 1)
  or (aDamaSize < 1)
  then begin
      Result := [];
      Exit;
  end;
  SetLength(Noktalar, 2);
  Noktalar[0] := FloatPoint(aXY.X, aXY.Y);
  Noktalar[1] := FloatPoint(aWH.X, aWH.Y);
  Result := BuildPolyPolyline(BuildDashedLine(Noktalar, ArrayOfFloat([aDamaSize, aDamaSize])), False, aKalinlik, jsRound, esRound); // BuildPolyline(Noktalar, aKalinlik, jsRound, esRound);
end;

function TRenderHelper.Kare(aMerkez: TFloatPoint; aKenar: Single): TArrayOfFloatPoint;
var
  R: TFloatRect;
begin
  R.Top    := aMerkez.Y - (aKenar * 0.5);
  R.Bottom := aMerkez.Y + (aKenar * 0.5);
  R.Left   := aMerkez.X - (aKenar * 0.5);
  R.Right  := aMerkez.X + (aKenar * 0.5);
  Result := Rectangle(R);
end;

procedure TRenderHelper.SekilBas(aRenk: TColor32; const aPoints: TArrayOfArrayOfFloatPoint);
begin
  Color := aRenk;
  PolyPolygonFS(aPoints, FloatRect(Self.Bitmap.ClipRect));
end;

procedure TRenderHelper.SekilBas(aRenk: TColor32; const aPoints: TArrayOfFloatPoint);
begin
  Color := aRenk;
  PolyPolygonFS(PolyPolygon(aPoints), FloatRect(Self.Bitmap.ClipRect));
end;

function TRenderHelper.Pasta(aMerkez: TFloatPoint; aYariCap, aYuzde: Single; aOfset: TPiOfsetTipi = Pi_0): TArrayOfFloatPoint;
begin
  Result  := Pie ( { P}       aMerkez          // Merkez Noktası
                 , { Radius } aYariCap         // Yarıçap
                 , { Angle }  aYuzde * Pi_004  // istenen açı... 100 üzrinden...
                 , { Offset } PiOfset[aOfset]  // Sıfırıncı açının hangi derecede başlayacağı bilgisidir. 0 = 90, Pi/2 = 180, Pi = 270 ve Pi/2*3 = 360 derecedir...
                 , { Steps }  360              // Yuvarlağın kenarındaki poligon sayısıdır...
                 );
end;

function TRenderHelper.Yay(aMerkez: TFloatPoint; aYuzde, aYariCap, aKalinlik: Single; aSteps: Integer = 4000): TArrayOfFloatPoint;
begin
  //Result  := BuildArc(aMerkez, aStartYuzde * Pi_4, aEndYuzde * Pi_004, aYariCap{, aSteps});
  Result := AngleArc( { aMerkez   } aMerkez
                    , { Radius    } aYariCap
                    , { thickness } aKalinlik
                    , { Angle     } aYuzde  * Pi_004 // (aStartYuzde + 0.000000000001) * Pi_4
                    , { Offset    } PiOfset[Pi_0] // PiOfset[Pi_270] // + ( (aStartYuzde + 0.000000000001) * Pi_4 )
                    , { Steps     } aSteps
                    );//: TArrayOfFloatPoint;

end;

procedure TRenderHelper.YaziBas(X, Y: Integer; aString: String; aFont: TFont; aFontPos: TFontPos; aAntiAliased: Boolean);
begin
  YaziBas(X, Y, aString, aFont.Color, aFont.Size, aFont.Name, aFontPos, aFont.Style, aAntiAliased);
end;

procedure TRenderHelper.YaziBas(aRect: TRect; aString: String; aFont: TFont; aFontPos: TFontPos; aAntiAliased: Boolean);
begin
  YaziBas(aRect, aString, aFont.Color, aFont.Size, aFont.Name, aFontPos, aFont.Style, aAntiAliased);
end;

function TRenderHelper.AngleArc(aCenter: TFloatPoint; const aRadius, aThickness, aAngle, aOffset: TFloat; Steps: Integer = 4000): TArrayOfFloatPoint;
var
  I, J: Integer;
  Origin, Outer, Inner: TFloatPoint;
begin
  SetLength(Result, (Steps * 2) + 1);
  // Yayın dış kenarı başlangıç noktası olarak hesaplıyoruz.
  GR32_Math.SinCos(aOffset, aRadius, Outer.Y, Outer.X);
  // Kompleks ofsetin dış kenarını hesaplıyoruz.
  GR32_Math.SinCos(aAngle / (Steps-2), Origin.Y, Origin.X);
  // Yayın iç kenarı başlangıç noktasını hesaplıyoruz.
  GR32_Math.SinCos(aOffset, aRadius - aThickness, Inner.Y, Inner.X);
  // Diğer öğeleri (noktaları) hesaplıyoruz...
  for I := 0 to Steps do begin
      J := ((Steps * 2) - I) + 1;
      Outer := FloatPoint(Outer.X * Origin.X - Outer.Y * Origin.Y, Outer.Y * Origin.X + Outer.X * Origin.Y);
      Result[I].X := Outer.X + aCenter.X;
      Result[I].Y := Outer.Y + aCenter.Y;

      Inner := FloatPoint(Inner.X * Origin.X - Inner.Y * Origin.Y, Inner.Y * Origin.X + Inner.X * Origin.Y);
      Result[J].X := Inner.X + aCenter.X;
      Result[J].Y := Inner.Y + aCenter.Y;
  end;
end;

procedure TRenderHelper.YaziBas ( aRect: TRect
                                ; aString: String
                                ; aColor: TColor
                                ; aFontSize: Integer
                                ; aFontName: String
                                ; aFontPos: TFontPos
                                ; aFontStyle: TFontStyles
                                ; aAntiAliased: Boolean);
var
  RX, RY, RW, RH, RW2, RH2: Integer;
  TX, TY, TW, TH, TW2, TH2: Integer;
begin
  with  Self.Bitmap do begin
        //if (aColor <> 0)      then
        (Self.Bitmap.Backend as IFontSupport).Font.Color := aColor;
        if (aFontSize <> 0)   then (Self.Bitmap.Backend as IFontSupport).Font.Size := aFontSize;
        if (aFontName <> '')  then (Self.Bitmap.Backend as IFontSupport).Font.Name := aFontName;
        (Self.Bitmap.Backend as IFontSupport).Font.Style := aFontStyle;

        RX := aRect.Left;
        RY := aRect.Top;
        RW := aRect.Right;         RW2 := (RW div 2) + (RX div 2);
        RH := aRect.Bottom;        RH2 := (RH div 2) + (RY div 2);

        TX := 0;
        TY := 0;
        //TW := TextWidth(aString);  TW2 := (TW div 2);
        //TH := TextHeight(aString); TH2 := (TH div 2);
        TW := (Self.Bitmap.Backend as ITextSupport).TextExtent(aString).Width;  TW2 := (TW div 2);
        TH := (Self.Bitmap.Backend as ITextSupport).TextExtent(aString).Height; TH2 := (TH div 2);

        case aFontPos of
             fpTopLeft      : begin TX := RX       ; TY := RY       ; end; // ok
             fpTopCenter    : begin TX := RW2 - TW2; TY := RY       ; end; // ok
             fpTopRight     : begin TX := RW  - TW ; TY := RY       ; end; // ok

             fpCenterLeft   : begin TX := RX       ; TY := RH2 - TH2; end; // ok
             fpCenterCenter : begin TX := RW2 - TW2; TY := RH2 - TH2; end; // ok
             fpCenterRight  : begin TX := RW  - TW ; TY := RH2 - TH2; end; // ok

             fpBottomLeft   : begin TX := RX       ; TY := RH  - TH ; end; // ok
             fpBottomCenter : begin TX := RW2 - TW2; TY := RH  - TH ; end; // ok
             fpBottomRight  : begin TX := RW  - TW ; TY := RH  - TH ; end; // ok
        end;

        if   (aAntiAliased = TRUE)
        then (Self.Bitmap.Backend as IFontSupport).Font.Quality := TFontQuality.fqAntialiased
        else (Self.Bitmap.Backend as IFontSupport).Font.Quality := TFontQuality.fqDefault;

        (Self.Bitmap.Backend as ITextSupport).Textout(TX, TY, aString);
  end;
end;

procedure TRenderHelper.YaziBas(X, Y: Integer; aString: String; aColor: TColor; aFontSize: Integer; aFontName: String; aFontPos: TFontPos; aFontStyle: TFontStyles; aAntiAliased: Boolean);
var
  W, H, W2, H2: Integer;
  Q: Integer; //  Left - Right
  R: Integer; //  Top  - Bottom
begin
  with  Self.Bitmap do begin
        //if (aColor <> 0)      then
        (Self.Bitmap.Backend as IFontSupport).Font.Color := aColor;
        if (aFontSize <> 0)   then (Self.Bitmap.Backend as IFontSupport).Font.Size := aFontSize;
        if (aFontName <> '')  then (Self.Bitmap.Backend as IFontSupport).Font.Name := aFontName;
        (Self.Bitmap.Backend as IFontSupport).Font.Style := aFontStyle;
        Q := 0;
        R := 0;
        W := (Self.Bitmap.Backend as ITextSupport).TextExtent(aString).Width;  W2 := (W div 2);
        H := (Self.Bitmap.Backend as ITextSupport).TextExtent(aString).Height; H2 := (H div 2);
        case aFontPos of
             fpTopLeft      : begin Q := X - W  ; R := Y - H  ; end; // ok
             fpTopCenter    : begin Q := X - W2 ; R := Y - H  ; end; // ok
             fpTopRight     : begin Q := X      ; R := Y - H  ; end; // ok
             fpCenterLeft   : begin Q := X - W  ; R := Y - H2 ; end; // ok
             fpCenterCenter : begin Q := X - W2 ; R := Y - H2 ; end; // ok
             fpCenterRight  : begin Q := X      ; R := Y - H2 ; end; // ok
             fpBottomLeft   : begin Q := X - W  ; R := Y      ; end; // ok
             fpBottomCenter : begin Q := X - W2 ; R := Y      ; end; // ok
             fpBottomRight  : begin Q := X      ; R := Y      ; end; // ok
        end;

        if   (aAntiAliased = TRUE)
        then (Self.Bitmap.Backend as IFontSupport).Font.Quality := TFontQuality.fqAntialiased
        else (Self.Bitmap.Backend as IFontSupport).Font.Quality := TFontQuality.fqDefault;

        (Self.Bitmap.Backend as ITextSupport).Textout(Q, R, aString);
  end;
end;

{ TPiOfsetTipi_Helper }

function TPiOfsetTipi_Helper.ToSingle: Single;
begin
  Result := PiOfset[Self];
end;

{ TColor_Helper }

{
function TColor_Helper.AsR: Byte;
begin
  Result := GetRValue(Self);
end;

function TColor_Helper.AsG: Byte;
begin
  Result := GetGValue(Self);
end;

function TColor_Helper.AsB: Byte;
begin
  Result := GetBValue(Self);
end;
}

function TColor_Helper.ToColor32: TColor32;
begin
  Result := Color32(Self);
end;

{ TListHelper }

procedure TListHelper.Flush;
begin
  while Self.Count > 0 do begin
        TObject(Self[0]).Free;
        Self.Delete(0);
  end;
end;

{ TRect_Helper }

function TRect_Helper.ToCenterPointFloat: TFloatPoint;
begin
  Result.X := Self.CenterPoint.X.ToSingle;
  Result.Y := Self.CenterPoint.Y.ToSingle;
end;

{ TFloatPoint_Helper }

{ TFloatPoint_Helper }

procedure TFloatPoint_Helper.AddX(toX: Single);
begin
  Self.X := Self.X + toX;
end;

procedure TFloatPoint_Helper.AddY(toY: Single);
begin
  Self.Y := Self.Y + toY;
end;

procedure TFloatPoint_Helper.Step(toX, toY: Single);
begin
  Self.X := Self.X + toX;
  Self.Y := Self.Y + toY;
end;

end.
