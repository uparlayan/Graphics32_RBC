{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Statusbar.pas                                         /
 Author       : Uður PARLAYAN / uparlayan <ugurparlayan@gmail.com>                 /
 Copyright    : 2018 by Uður PARLAYAN. All rights reserved.                        /
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

unit GR32_Widgets_Statusbar;

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
  , Vcl.Forms                   //
  , Winapi.Messages
  , Winapi.Windows              //  ReleaseCapture
  ;

type
  TGR32WGStatusBar = class(TGR32CustomWG)
    type
      TGR32WGStatusBarSettings = class(TPersistent)
        private
          FOwner            : TGR32WGStatusBar;
          FBackground       : TColor;
          FBackgroundHover  : TColor;
          FBorderColor      : TColor;
          FBorderStyle      : TPenStyle;
          FBorderWidth      : Integer;
          FBracketWidth     : Integer;
          FFont             : TFont;
          FGap              : Integer;
          procedure SetBackground(const Value: TColor);
          procedure SetBackgroundHover(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetBracketWidth(const Value: Integer);
          procedure SetFont(const Value: TFont);
          procedure SetGap(const Value: Integer);
          procedure InlineChangeNotifier(Sender: TObject);
        protected
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
        published
          property Background         : TColor        read  FBackground       write SetBackground       stored True  default $0033C1FE ;
          property BackgroundHover    : TColor        read  FBackgroundHover  write SetBackgroundHover  stored True  default $0033C1FE ;
          property BorderColor        : TColor        read  FBorderColor      write SetBorderColor      stored True  default $00019ADC ;
          property BorderStyle        : TPenStyle     read  FBorderStyle      write SetBorderStyle      stored True  default psSolid   ;
          property BorderWidth        : Integer       read  FBorderWidth      write SetBorderWidth      stored True  default 1         ;
          property BracketWidth       : Integer       read  FBracketWidth     write SetBracketWidth     stored True  default 25        ;
          property Font               : TFont         read  FFont             write SetFont;
          property Gap                : Integer       read  FGap              write SetGap              stored True  default 10        ;
      end;
    private
      Bracket_Left      : TRect;
      Bracket_Right     : TRect;
      Bracket_Footer    : TRect;

      FAyarlar          : TGR32WGStatusBarSettings;
      FFooterText       : String;
      FOnMouseMove      : TNotifyEvent;

      procedure WMLMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN; // Click olaylarý burada iþlenir...
      procedure WMMouseMove (var Message: TWMMouseMove); message WM_MOUSEMOVE;

      procedure SetAyarlar(const Value: TGR32WGStatusBarSettings);
      procedure SetFooterText(const Value: String);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure Resize; override;
    published
      property Align;
      property Margins;
      property Ayarlar        : TGR32WGStatusBarSettings  read  FAyarlar      write SetAyarlar;
      property FooterText     : String                        read  FFooterText   write SetFooterText;
      property OnMouseMove    : TNotifyEvent                  read  FOnMouseMove  write FOnMouseMove;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WGStatusBar]);
end;

{ TGR32WGStatusBar.TGR32WGStatusBarSettings }

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.AfterConstruction;
begin
  inherited;
  FFont             := TFont.Create;
  FFont.OnChange    := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WGStatusBar.TGR32WGStatusBarSettings;
begin
  if (Source is TGR32WGStatusBar.TGR32WGStatusBarSettings) then begin
      aSors := TGR32WGStatusBar.TGR32WGStatusBarSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background     ;
      FBorderColor      := aSors.BorderColor    ;
      FBorderStyle      := aSors.BorderStyle    ;
      FBorderWidth      := aSors.BorderWidth    ;
      FBracketWidth     := aSors.BracketWidth   ;
      FFont             := aSors.Font           ;
      FGap              := aSors.Gap            ;
  end else inherited;
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.BeforeDestruction;
begin
  FreeAndNil(FFont);
  inherited;
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sýnýfýn alt type'lerinde bir deðiþiklik olduðunda ana sýnýfýn grafiðinin yeniden çizilmesini tetikler...
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.ResetSettings;
begin
  FBackground       := $0033C1FE;
  FBackgroundHover  := $0033C1FE;
  FBorderColor      := $00019ADC;
  FBorderStyle      := psSolid;
  FBorderWidth      := 1;
  FBracketWidth     := 25;
  FGap              := 10;
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetBackgroundHover(const Value: TColor);
begin
  FBackgroundHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetBracketWidth(const Value: Integer);
begin
  FBracketWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGStatusBar.TGR32WGStatusBarSettings.SetGap(const Value: Integer);
begin
  FGap := Value; InlineChangeNotifier(nil);
end;

{ TGR32WGStatusBar }

constructor TGR32WGStatusBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar        := TGR32WGStatusBarSettings.Create;
  FAyarlar.FOwner := Self;
end;

destructor TGR32WGStatusBar.Destroy;
begin
  FreeAndNil(FAyarlar);
  inherited;
end;

procedure TGR32WGStatusBar.SetAyarlar(const Value: TGR32WGStatusBarSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WGStatusBar.SetFooterText(const Value: String);
begin
  FFooterText := Value; Resize; Invalidate;
end;

procedure TGR32WGStatusBar.WMLMouseDown(var Message: TWMLButtonDown);
var
  Fare: TPoint;
const
  sc_SizeLeft            = $F001;  { these are the variations }
  sc_SizeRight           = $F002;  { on the SC_SIZE value }
  sc_SizeTop             = $F003;
  sc_SizeTopLeft         = $F004;
  sc_SizeTopRight        = $F005;
  sc_SizeBottom          = $F006;
  sc_SizeBottomRight     = $F008;
  sc_SizeBottomLeft      = $F007;
  sc_DragMove            = $F012;
begin
  Fare := Self.ScreenToClient(Mouse.CursorPos);
  if (PtInRect(Bracket_Left, Fare) = True) then begin
      ReleaseCapture;
      Self.Parent.Perform(WM_SYSCOMMAND, sc_SizeBottomLeft, 0);
  end else
  if (PtInRect(Bracket_Right, Fare) = True) then begin
      ReleaseCapture;
      Self.Parent.Perform(WM_SYSCOMMAND, sc_SizeBottomRight, 0);
  end;
end;

procedure TGR32WGStatusBar.WMMouseMove(var Message: TWMMouseMove);
begin
  // Nesnenin iç iþleyiþi için gerekli... Farenin nesne içindeki konumunu okutuyoruz...
  Resize;
  if (Assigned(FOnMouseMove) = True) then FOnMouseMove(Self);
end;

procedure TGR32WGStatusBar.PaintControl;
var
  Ressam          : TPolygonRenderer32VPR;
begin
  Resize;
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;
  Ressam.FillMode := pfWinding;
  Ressam.Bitmap   := Self.FBuffer;
  if  (MouseIsInside = True)
  then Ressam.Bitmap.Clear( FAyarlar.BackgroundHover.ToColor32 )
  else Ressam.Bitmap.Clear( FAyarlar.Background.ToColor32 ); // Tuvalin zemin rengi ve tam temizlik
  Ressam.YaziBas( Bracket_Footer, FFooterText   , FAyarlar.FFont , fpCenterLeft);
  Ressam.SekilBas(FAyarlar.FBorderColor.ToColor32 , Ressam.Dikdortgen(Bracket_Left.ToCenterPointFloat, Bracket_Left.Width, Bracket_Left.Height));
  Ressam.SekilBas(FAyarlar.FBorderColor.ToColor32 , Ressam.Dikdortgen(Bracket_Right.ToCenterPointFloat, Bracket_Right.Width, Bracket_Right.Height));
  Ressam.SekilBas(FAyarlar.FBorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, Width, Height, FAyarlar.FBorderWidth, FAyarlar.FBorderStyle));
  Ressam.Free;
end;

procedure TGR32WGStatusBar.Resize;
begin
  inherited;
  with  Bracket_Left do begin
        Top    := 0;
        Left   := 0;
        Width  := FAyarlar.FBracketWidth;
        Height := Self.Height;
  end;
  with  Bracket_Right do begin
        Top    := 0;
        Left   := Self.Width - FAyarlar.FBracketWidth;
        Width  := FAyarlar.FBracketWidth;
        Height := Self.Height;
  end;
  with  Bracket_Footer do begin
        Top    := 0;
        Left   := Bracket_Left.Width + FAyarlar.FGap + 1;
        Width  := Self.Width - (FAyarlar.FBracketWidth * 2) - (FAyarlar.FGap * 2);
        Height := Self.Height;
  end;
end;

end.
