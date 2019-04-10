{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Base.pas                                              /
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

unit GR32_Widgets_Base;

interface

{ //  Uyarı ve ipucu listesi aşağıdaki linkte yer alıyor. UP.
  https://marc.durdin.net/2012/05/delphi-xe2s-hidden-hints-and-warnings-options/ }
{$WARN UNIT_PLATFORM              OFF}  //  Platfown Spesifik uyarısını kapatır
{$WARN SYMBOL_PLATFORM            OFF}  //  W1002 spesifik platform...
{$WARN SUSPICIOUS_TYPECAST        OFF}  //  W1044 spesifik platform...
{$WARN IMPLICIT_STRING_CAST       OFF}  //  W1057 kodlu uyarıyı kapatır (Örtük tip dönüştürme: String to utf8string)
{$WARN IMPLICIT_STRING_CAST_LOSS  OFF}  //  W1058 kodlu uyarıyı kapatır (örtük tip dönüştürme: utf8string to string)

uses
    GR32                        //  TBitmap32
  , GR32_Backends               //  IDeviceContextSupport
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , Winapi.Messages             //  TWMPaint
  , Winapi.Windows              //  DLGC_WANTARROWS
  , Vcl.Controls                //  TCustomControl
  ;

type
  TGR32RegionPosition = record // class
    private
      FX                    : Single;                             //  Yatay konum bilgisidir.
      FY                    : Single;                             //  Dikey konum bilgisidir.
      FDiameter             : Single;                             //  Yuvarlak nesnelerin kapladığı noktasal büyüklüğü ifade eder.
      function GetX         : Single;
      function GetY         : Single;
      function GetDiameter  : Single;
      procedure SetX        ( const Value: Single);
      procedure SetY        ( const Value: Single);
      procedure SetDiameter ( const Value: Single);
    public
      procedure Setup       ( aLeft, aTop: Single; aDiameter: Single = 0.0);
      /// <summary>
      ///   Bir koordinat sistemindeki noktanın YATAY konumudur.
      /// </summary>
      property X            : Single read GetX        write SetX;
      /// <summary>
      ///   Bir koordinat sistemindeki noktanın DİKEY konumudur.
      /// </summary>
      property Y            : Single read GetY        write SetY;
      /// <summary>
      ///   YUVARLAK veya KARE bir noktanın ÇAPI / KALINLIĞI / ENİ kastedilmektedir.
      /// </summary>
      property Diameter     : Single read GetDiameter write SetDiameter;
      function AsFloatPoint: TFloatPoint;
  end;
  /// <summary>
  ///   Bu nesne bir grafiksel bölgenin dikdörtgen dış sınır koordinatlarını, çerçeve kalınlığı payını, iç boşluk
  ///   payını tutmak için kullanılır.
  /// </summary>
  TGR32Region = class
    type
      /// <summary>
      ///  Bir dikdörtgen bölgenin İÇ BOŞLUK değerlerini tutar.
      /// </summary>
      TGR32RegionPadding = packed record
        private
          FLeft    : Integer;
          FTop     : Integer;
          FRight   : Integer;
          FBottom  : Integer;
          procedure SetLeft   (const Value: Integer);
          procedure SetTop    (const Value: Integer);
          procedure SetRight  (const Value: Integer);
          procedure SetBottom (const Value: Integer);
        public
          /// <summary>
          ///  Soldan İÇ BOŞLUK payı
          /// </summary>
          property Left    : Integer read FLeft    write SetLeft   ;
          /// <summary>
          ///  Üstten İÇ BOŞLUK payı
          /// </summary>
          property Top     : Integer read FTop     write SetTop    ;
          /// <summary>
          ///  Sağdan İÇ BOŞLUK payı
          /// </summary>
          property Right   : Integer read FRight   write SetRight  ;
          /// <summary>
          ///  Alttan İÇ BOŞLUK payı
          /// </summary>
          property Bottom  : Integer read FBottom  write SetBottom ;
          procedure Setup(aLeft, aTop, aRight, aBottom: Integer); overload;
          procedure Setup(aPadding: TPadding); overload;
      end;
    private
      FBorder                     : Single;
      FLeft                       : Single;
      FTop                        : Single;
      FWidth                      : Single;
      FHeight                     : Single;
      FCenter                     : TFloatPoint;
      FPadding                    : TGR32RegionPadding;
      FLeftTop                    : TGR32RegionPosition;
      FLeftBottom                 : TGR32RegionPosition;
      FRightTop                   : TGR32RegionPosition;
      FRightBottom                : TGR32RegionPosition;
      FIntraLeft                  : Single;
      FIntraTop                   : Single;
      FIntraWidth                 : Single;
      FIntraHeight                : Single;
      FIntraLeftTop               : TGR32RegionPosition;
      FIntraLeftBottom            : TGR32RegionPosition;
      FIntraRightTop              : TGR32RegionPosition;
      FIntraRightBottom           : TGR32RegionPosition;

      function GetBorder          : Single;
      function GetLeft            : Single;
      function GetTop             : Single;
      function GetWidth           : Single;
      function GetHeight          : Single;
      function GetCenter          : TFloatPoint;
      function GetPadding         : TGR32RegionPadding;
      function GetLeftTop         : TGR32RegionPosition;
      function GetLeftBottom      : TGR32RegionPosition;
      function GetRightTop        : TGR32RegionPosition;
      function GetRightBottom     : TGR32RegionPosition;
      function GetIntraLeft       : Single;
      function GetIntraTop        : Single;
      function GetIntraWidth      : Single;
      function GetIntraHeight     : Single;

      function GetIntraLeftBottom : TGR32RegionPosition;
      function GetIntraLeftTop    : TGR32RegionPosition;
      function GetIntraRightBottom: TGR32RegionPosition;
      function GetIntraRightTop   : TGR32RegionPosition;

      procedure SetBorder         (const Value: Single);
      procedure SetLeft           (const Value: Single);
      procedure SetTop            (const Value: Single);
      procedure SetWidth          (const Value: Single);
      procedure SetHeight         (const Value: Single);
      procedure SetPadding        (const Value: TGR32RegionPadding);
    protected
    public
      constructor Create;
      destructor Destroy; override;
      procedure Setup(aLeft, aTop, aWidth, aHeight, aBorder: Single; const aPadding: TPadding);
      /// <summary>
      ///   Hesaplamaları tüm parametreleri ele alarak yeniden yapar.
      /// </summary>
      /// <remarks>
      ///   Diğer nesnelerin Resize metodlarında veya bu nesnenin diğer parametreleri değiştiğinde çağırılmalıdır.
      /// </remarks>
      procedure CalculateZone;
      function ToRect       : TRect;
      function ToRectIntra  : TRect;
    //published
      /// <summary>
      ///   Kenar çizgisi kalınlığını ifade eder.
      /// </summary>
      property Border       : Single        read  GetBorder   write SetBorder ;
      /// <summary>
      ///   Sol (X) değerini ifade eder.
      /// </summary>
      property Left         : Single        read  GetLeft     write SetLeft   ;
      /// <summary>
      ///   Üst (Y) tarafını ifade eder
      /// </summary>
      property Top          : Single        read  GetTop      write SetTop    ;
      /// <summary>
      ///   Sol'dan sağa doğru olan uzaklığı ifade eder. Bölgenin genişliğini gösterir. En sağa doğru gidilebilecek
      ///   olan son sınırı gösterir.
      /// </summary>
      property Width        : Single        read  GetWidth    write SetWidth  ;
      /// <summary>
      ///   Üst'ten alta doğru olan irtifayı ifade eder. Bölgenin yüksekliğini gösterir. En alta doğru
      ///   gidilebilecekolan son sınırı gösterir.
      /// </summary>
      property Height       : Single        read  GetHeight   write SetHeight ;
      /// <summary>
      ///   Bir dikdörtgen bölgenin iç kenar boşluğunu tanımlamayı sağlar.
      /// </summary>
      property Padding      : TGR32RegionPadding  read  GetPadding  write SetPadding;
      /// <summary>
      ///   Bir dikdörtgen bölgenin tam orta noktasının, orijininin koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property Center       : TFloatPoint   read  GetCenter;
      /// <summary>
      ///   Bir dikdörtgen bölgenin SOL ÜST köşe noktasının koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property LeftTop      : TGR32RegionPosition    read  GetLeftTop;
      /// <summary>
      ///   Bir dikdörtgen bölgenin SOL ALT köşe noktasının koordinatlarını (X, Y cinsinden) verir. <br />
      /// </summary>
      property LeftBottom   : TGR32RegionPosition    read  GetLeftBottom;
      /// <summary>
      ///   Bir dikdörtgen bölgenin SAĞ ÜST köşe noktasının koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property RightTop     : TGR32RegionPosition    read  GetRightTop;
      /// <summary>
      ///   Bir dikdörtgen bölgenin SAĞ ALT köşe noktasının koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property RightBottom      : TGR32RegionPosition  read  GetRightBottom;
      /// <summary>
      ///   Bir dikdörtgen bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL sol (X) değerini ifade eder.
      /// </summary>
      property IntraLeft        : Single      read  GetIntraLeft;
      /// <summary>
      ///   Bir dikdörtgen bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL üst (Y) değerini ifade eder.
      /// </summary>
      property IntraTop         : Single      read  GetIntraTop;
      /// <summary>
      ///   Soldan sağa doğru olan İÇ uzaklığı ifade eder. Bir bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL iç genişliğini gösterir.
      ///   En sağa doğru gidilecek olan son noktayı gösterir.
      /// </summary>
      property IntraWidth       : Single      read  GetIntraWidth;
      /// <summary>
      ///   Üstten alta doğru olan İÇ irtifayı ifade eder. Bir bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL iç yüksekliğini gösterir.
      ///   En alta doğru gidilecek olan son sınırı gösterir.
      /// </summary>
      property IntraHeight      : Single      read  GetIntraHeight;
      /// <summary>
      ///   Bir dikdörtgen bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL SOL ÜST köşe noktasının koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property IntraLeftTop     : TGR32RegionPosition  read  GetIntraLeftTop;
      /// <summary>
      ///   Bir dikdörtgen bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL SOL ALT köşe noktasının koordinatlarını (X, Y cinsinden) verir. <br />
      /// </summary>
      property IntraLeftBottom  : TGR32RegionPosition  read  GetIntraLeftBottom;
      /// <summary>
      ///   Bir dikdörtgen bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL SAĞ ÜST köşe noktasının koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property IntraRightTop    : TGR32RegionPosition  read  GetIntraRightTop;
      /// <summary>
      ///   Bir dikdörtgen bölgenin KALINLIK ve İÇ BOŞLUKLAR DAHİL SAĞ ALT köşe noktasının koordinatlarını (X, Y cinsinden) verir.
      /// </summary>
      property IntraRightBottom : TGR32RegionPosition  read  GetIntraRightBottom;
  end;
  TWinControlHelper = class helper for TWinControl
    public
      /// <summary>
      ///   Nesnenin (Formun değil) şeffaf bir görünüm kazanmasında kullanılır.
      /// </summary>
      /// <param name="AlphaBlendValue">
      ///   0..255 arasında bir tamsayı değeri alır. Nesnenin şeffaflık derecesini ayarlamakta kullanılır.
      /// </param>
      /// <remarks>
      ///   Bu metodun yazarı Sayın Tuğrul HELVACI'ya katkılarından dolayı teşekkür ederiz.
      /// </remarks>
      procedure AlphaBlendEx(const AlphaBlendValue : Byte); overload;
    end;
  TGR32CustomWG = class(TCustomControl)
    private
      FAlphaBlend   : Byte;
      FMouseIsInside: Boolean;
      FOnMouseEnter : TNotifyEvent;
      FOnMouseLeave : TNotifyEvent;
      procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
      procedure WMGetDlgCode(var Message: TWmGetDlgCode); message WM_GETDLGCODE;
      procedure WMMouseEnter(var Message: TWMMouse); message CM_MOUSEENTER;
      procedure WMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
      function GetMouseIsInside: Boolean;
      /// <summary>
      ///   Nesnenin (Formun değil) şeffaf bir görünüm kazanmasında kullanılır.
      /// </summary>
      /// <param name="AlphaBlendValue">
      ///   0..255 arasında bir tamsayı değeri alır. Nesnenin şeffaflık
      ///   derecesini ayarlamakta kullanılır.
      /// </param>
      /// <remarks>
      ///   Bu metodun yazarı Sayın Tuğrul HELVACI'ya katkılarından dolayı
      ///   teşekkür ederiz. (UP)
      /// </remarks>
      procedure SetAlphaBlend(const Value: Byte);
      function GetAlphaBlend: Byte;
    protected
      procedure Paint; override;
      procedure CreateWnd; override;
    public
      /// <summary>
      ///   TGR32WGChart nesnesinin kapladığı alanının dış sınırlarını verir.
      /// </summary>
      /// <remarks>
      ///   Diğer ALT nesneler bu bölgenin dışına taşmamalı.
      /// </remarks>
      FZone         : TGR32Region;
      /// <summary>
      ///   Başlık bölgesinin sınırlarını verir.
      /// </summary>
      FZoneHeader   : TGR32Region;
      /// <summary>
      ///   Çizim bölgesinin sınırlarını verir.
      /// </summary>
      FZoneFrame    : TGR32Region;
      {
      /// <summary>
      ///   Cetvel bölgesinin sınırlarını verir
      /// </summary>
      /// <remarks>
      ///   İLERİDE EKLENECEK !!!
      /// </remarks>
      FZoneRuller   : TGR32Region;
      /// <summary>
      ///   Veri setlerinin isimlerinin listeleneceği bölümün sınırlarını verir.
      /// </summary>
      /// <remarks>
      ///   İLERİDE EKLENECEK
      /// </remarks>
      FZoneLegend   : TGR32Region;
      }
      FBuffer     : TBitmap32;
      FBufferValid: Boolean;
      Merkez      : TFloatPoint;
      MinWH       : Integer;
      MinRadius   : Integer;
      WidgetRect  : TRect;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy(); override;
      procedure Invalidate; override;
      procedure Resize; override;
      procedure PaintControl; virtual;                                          // Bu, yavru nesnelerde tanımlanacak. Bu noktada ise bu metod Paint metodunda çağırılacak. Böylece işleyiş ve performans düzgün ilerleyecek...
      class function iif<T>(const aValue: Boolean; const aTrue, aFalse: T): T; static; inline;
    published
      property Align;
      property AlignWithMargins;
      property AlphaBlend   : Byte          read  GetAlphaBlend write SetAlphaBlend;
      property Anchors;
      property Margins;
      property MouseIsInside: Boolean       read  GetMouseIsInside;                    // Hover olaylarını windows mesajlarını etkilemeyecek şekilde yönetebilmek için gerekir.
      property OnMouseEnter : TNotifyEvent  read  FOnMouseEnter write FOnMouseEnter;
      property OnMouseLeave : TNotifyEvent  read  FOnMouseLeave write FOnMouseLeave;
  end;

implementation

uses
    System.Math      //  Min , Max
  ;

{ TGR32_Widget_Circle }

constructor TGR32CustomWG.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FZone         := TGR32Region.Create;
  FZoneHeader   := TGR32Region.Create;
  FZoneFrame    := TGR32Region.Create;
  //FZoneRuller   := TGR32Region.Create;
  //FZoneLegend   := TGR32Region.Create;

  ControlStyle  := ControlStyle + [csOpaque];
  FBuffer       := TBitmap32.Create;
  FAlphaBlend   := 255;
end;

procedure TGR32CustomWG.CreateWnd;
begin
  inherited;
  if (FAlphaBlend <> 255) then
    if not (csDesigning in ComponentState) then begin
       Self.AlphaBlendEx(FAlphaBlend);
       Invalidate;
    end;
end;

destructor TGR32CustomWG.Destroy;
begin
  //FreeAndNil(FZoneLegend);
  //FreeAndNil(FZoneRuller);
  FreeAndNil(FZoneFrame );
  FreeAndNil(FZoneHeader);
  FreeAndNil(FZone      );

  FBuffer.Free;
  inherited Destroy;
end;

function TGR32CustomWG.GetAlphaBlend: Byte;
begin
  Result := FAlphaBlend;
end;

function TGR32CustomWG.GetMouseIsInside: Boolean;
begin
  Result := FMouseIsInside;
end;

class function TGR32CustomWG.iif<T>(const aValue: Boolean; const aTrue, aFalse: T): T;
begin
  Result := AFalse;
  if AValue then Exit(ATrue);
end;

procedure TGR32CustomWG.Invalidate;
begin
  FBufferValid := False;
  inherited;
end;

procedure TGR32CustomWG.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TGR32CustomWG.WMGetDlgCode(var Message: TWmGetDlgCode);
begin
  with Message do Result := Result or DLGC_WANTARROWS;
end;

procedure TGR32CustomWG.WMMouseEnter(var Message: TWMMouse);
begin
  FMouseIsInside := True;
  Invalidate;
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
  inherited;
end;

procedure TGR32CustomWG.WMMouseLeave(var Message: TMessage);
begin
  FMouseIsInside := False;
  Invalidate;
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
  inherited;
end;

procedure TGR32CustomWG.Paint;
begin
  if NOT Assigned(Parent) then Exit;

  if not FBufferValid then begin
     (FBuffer.Backend as IPaintSupport).ImageNeeded;
      PaintControl;                                      // Virtual metodumuzu bu noktada çağırarak yavru bileşenimizi ekrana fiilen bu noktada çizdiriyoruz...
     (FBuffer.Backend as IPaintSupport).CheckPixmap;
      FBufferValid := True;
  end;
  FBuffer.Lock;                                                               // Diğer Kanallar çizimi etkilemesin diye süreci kilit altına alıyoruz.
  with Canvas do try
    (FBuffer.Backend as IDeviceContextSupport).DrawTo(Canvas.Handle, 0, 0);
  finally
    FBuffer.Unlock;                                                           //  Kilidi kaldırıyoruz...
  end;
end;

procedure TGR32CustomWG.PaintControl;
begin
  inherited; // bu prosedürün içeriği YAVRU BİLEŞENLERDE YAZILMALIDIR. BU KISIM SADECE BU KADAR OLMAK DURUMUNDA... (UP)
end;

procedure TGR32CustomWG.Resize;
begin
  inherited;
  MinWH             := Min(Width, Height);
  MinRadius         := MinWH div 2;
  Merkez.X          := Width  * 0.5;
  Merkez.Y          := Height * 0.5;
  FBufferValid      := False;
  FBuffer.SetSize(Width, Height);
  WidgetRect.Top    := 0;
  WidgetRect.Left   := 0;
  WidgetRect.Width  := Width;
  WidgetRect.Height := Height;
end;

procedure TGR32CustomWG.SetAlphaBlend(const Value: Byte);
begin
  if Value <> FAlphaBlend then begin
     FAlphaBlend := Value;
     if HandleAllocated then begin
        Self.AlphaBlendEx(FAlphaBlend);
        Invalidate;
     end;
  end;
end;

{ TWinControlHelper }

procedure TWinControlHelper.AlphaBlendEx(const AlphaBlendValue: Byte);
var
  AHandle   : HWND;
  AExStyle  : NativeInt;
begin
  AHandle := Self.Handle;
  AExStyle := GetWindowLongPtr(AHandle, GWL_EXSTYLE);
  if AlphaBlendValue = 255
  then AExStyle := AExStyle and (not WS_EX_LAYERED)
  else AExStyle := AExStyle or WS_EX_LAYERED;

  SetWindowLongPtr(AHandle, GWL_EXSTYLE, AExStyle);
  SetLayeredWindowAttributes(AHandle, 0, AlphaBlendValue, LWA_ALPHA);
end;

{ TGR32RegionPosition }

function TGR32RegionPosition.AsFloatPoint: TFloatPoint;
begin
  Result.X := Self.FX;
  Result.Y := Self.FY;
end;

function TGR32RegionPosition.GetDiameter: Single;
begin
  Result := FDiameter;
end;

function TGR32RegionPosition.GetX: Single;
begin
  Result := FX;
end;

function TGR32RegionPosition.GetY: Single;
begin
  Result := FY;
end;

procedure TGR32RegionPosition.SetDiameter(const Value: Single);
begin

end;

procedure TGR32RegionPosition.Setup(aLeft, aTop: Single; aDiameter: Single = 0.0);
begin
  FX        := aLeft;
  FY        := aTop;
  FDiameter := aDiameter;
end;

procedure TGR32RegionPosition.SetX(const Value: Single);
begin
  FX := Value;
end;

procedure TGR32RegionPosition.SetY(const Value: Single);
begin
  FY := Value;
end;

{ TGR32Region }

constructor TGR32Region.Create;
begin
  inherited Create;
  FCenter           := TFloatPoint.Zero;
  Setup(0,0,0,0,0,nil);
  CalculateZone;
end;

destructor TGR32Region.Destroy;
begin
  inherited Destroy;
end;

function TGR32Region.GetBorder: Single;
begin
  Result := FBorder;
end;

function TGR32Region.GetHeight: Single;
begin
  Result := FHeight;
end;

function TGR32Region.GetIntraHeight: Single;
begin
  Result := FIntraHeight;
end;

function TGR32Region.GetIntraLeft: Single;
begin
  Result := FIntraLeft;
end;

function TGR32Region.GetIntraLeftBottom: TGR32RegionPosition;
begin
  Result := FIntraLeftBottom;
end;

function TGR32Region.GetIntraLeftTop: TGR32RegionPosition;
begin
  Result := FIntraLeftTop;
end;

function TGR32Region.GetIntraRightBottom: TGR32RegionPosition;
begin
  Result := FIntraRightBottom;
end;

function TGR32Region.GetIntraRightTop: TGR32RegionPosition;
begin
  Result := FIntraRightTop;
end;

function TGR32Region.GetIntraTop: Single;
begin
  Result := FIntraTop;
end;

function TGR32Region.GetIntraWidth: Single;
begin
  Result := FIntraWidth;
end;

function TGR32Region.GetLeft: Single;
begin
  Result := FLeft;
end;

function TGR32Region.GetCenter: TFloatPoint;
begin
  Result := FCenter;
end;

function TGR32Region.GetPadding: TGR32RegionPadding;
begin
  Result := FPadding;
end;

function TGR32Region.GetRightBottom: TGR32RegionPosition;
begin
  Result := FRightBottom;
end;

function TGR32Region.GetRightTop: TGR32RegionPosition;
begin
  Result := FRightTop;
end;

function TGR32Region.GetLeftBottom: TGR32RegionPosition;
begin
  Result := FLeftBottom;
end;

function TGR32Region.GetLeftTop: TGR32RegionPosition;
begin
  Result := FLeftTop;
end;

function TGR32Region.GetTop: Single;
begin
  Result := FTop;
end;

function TGR32Region.GetWidth: Single;
begin
  Result := FWidth;
end;

procedure TGR32Region.SetBorder(const Value: Single);
begin
  FBorder := Value;
end;

procedure TGR32Region.SetHeight(const Value: Single);
begin
  FHeight := Value; CalculateZone;
end;

procedure TGR32Region.SetLeft(const Value: Single);
begin
  FLeft := Value; CalculateZone;
end;

procedure TGR32Region.SetPadding(const Value: TGR32RegionPadding);
begin
  FPadding := Value; CalculateZone;
end;

procedure TGR32Region.SetTop(const Value: Single);
begin
  FTop := Value; CalculateZone;
end;

procedure TGR32Region.SetWidth(const Value: Single);
begin
  FWidth := Value;  CalculateZone;
end;

function TGR32Region.ToRect: TRect;
begin
  Result := TRect.Create(Round(Self.FLeft), Round(Self.FTop), Round(Self.FWidth), Round(Self.FHeight));
end;

function TGR32Region.ToRectIntra: TRect;
begin
  Result := TRect.Create(Round(Self.FIntraLeft), Round(Self.FIntraTop), Round(Self.FIntraWidth), Round(Self.FIntraHeight));
end;

procedure TGR32Region.Setup(aLeft, aTop, aWidth, aHeight, aBorder: Single; const aPadding: TPadding);
begin
  FBorder := aBorder;
  FLeft   := aLeft;
  FTop    := aTop;
  FWidth  := aWidth;
  FHeight := aHeight;
  if (aPadding <> nil)
  then FPadding.Setup(aPadding)
  else FPadding.Setup(0,0,0,0);
  CalculateZone;
end;

procedure TGR32Region.CalculateZone;
begin
  FLeftTop     .Setup(FLeft          , FTop            , 0);
  FLeftBottom  .Setup(FLeft          , FTop + FHeight  , 0);
  FRightTop    .Setup(FLeft + FWidth , FTop            , 0);
  FRightBottom .Setup(FLeft + FWidth , FTop + FHeight  , 0);

  FIntraLeft   := FLeft   + FBorder + FPadding.Left   ;
  FIntraTop    := FTop    + FBorder + FPadding.Top    ;
  FIntraWidth  := FWidth  - ( (FBorder * 2) + FPadding.Left + FPadding.Right  );
  FIntraHeight := FHeight - ( (FBorder * 2) + FPadding.Top  + FPadding.Bottom );

  FIntraLeftTop    .Setup(FIntraLeft               , FIntraTop               , 0);
  FIntraLeftBottom .Setup(FIntraLeft               , FIntraTop + FIntraHeight, 0);
  FIntraRightTop   .Setup(FIntraLeft + FIntraWidth , FIntraTop               , 0);
  FIntraRightBottom.Setup(FIntraLeft + FIntraWidth , FIntraTop + FIntraHeight, 0);

  FCenter.X := (FLeft + (FWidth / 2));
  FCenter.Y := (FTop + (FHeight / 2));
end;

{ TGR32Bolge.TGR32Padding }

procedure TGR32Region.TGR32RegionPadding.Setup(aLeft, aTop, aRight, aBottom: Integer);
begin
  Left  := aLeft;
  Top   := aTop;
  Right := aRight;
  Bottom:= aBottom;
end;

procedure TGR32Region.TGR32RegionPadding.SetBottom(const Value: Integer);
begin
  FBottom := Value;
end;

procedure TGR32Region.TGR32RegionPadding.SetLeft(const Value: Integer);
begin
  FLeft := Value;
end;

procedure TGR32Region.TGR32RegionPadding.SetRight(const Value: Integer);
begin
  FRight := Value;
end;

procedure TGR32Region.TGR32RegionPadding.SetTop(const Value: Integer);
begin
  FTop := Value;
end;

procedure TGR32Region.TGR32RegionPadding.Setup(aPadding: TPadding);
begin
  Left  := aPadding.Left;
  Top   := aPadding.Top;
  Right := aPadding.Right;
  Bottom:= aPadding.Bottom;
  //ShowMessage(Left.ToString);
end;

end.
