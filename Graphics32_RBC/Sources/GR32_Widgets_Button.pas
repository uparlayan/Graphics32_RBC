{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Button.pas                                            /
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

unit GR32_Widgets_Button;

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
  TGR32WGButtonTypes = (wbtNormal, wbtIsaretli);
  TGR32WGButtonStyle = (wbsDiktortgen, wbsOval, wbsDaire);
  TGR32WGButton = class(TGR32CustomWG)
    private
      Zone_Top                : TRect;
      Zone_Left               : TRect;
      Zone_Right              : TRect;
      Zone_Bottom             : TRect;

      FOnMouseMove            : TNotifyEvent;
      FBackground             : TColor;
      FBorderColor            : TColor;
      FBorderStyle            : TPenStyle;
      FBorderWidth            : Integer;
      FButtonColor            : TColor;
      FButtonHover            : TColor;
      FButtonChecked          : TColor;
      FButtonRound            : Integer;
      FButtonStyle            : TGR32WGButtonStyle;
      FButtonType             : TGR32WGButtonTypes;
      FButtonText             : String;
      FChecked                : Boolean;
      FFont                   : TFont;
      FFontHover              : TColor;
      FFontChecked            : TColor;
      FSymbol                 : Char;
      FSymbolHover            : TColor;
      FSymbolGap              : Integer;
      FSymbolFont             : TFont;
      FSymbolPos              : TGR32WGAxialPos;
      FSymbolChecked          : TColor;
      procedure SetBackground(const Value: TColor);
      procedure SetBorderColor(const Value: TColor);
      procedure SetBorderStyle(const Value: TPenStyle);
      procedure SetBorderWidth(const Value: Integer);
      procedure SetButtonColor(const Value: TColor);
      procedure SetButtonHover(const Value: TColor);
      procedure SetButtonChecked(const Value: TColor);
      procedure SetButtonRound(const Value: Integer);
      procedure SetButtonStyle(const Value: TGR32WGButtonStyle);
      procedure SetButtonType(const Value: TGR32WGButtonTypes);
      procedure SetButtonText(const Value: String);
      procedure SetChecked(const Value: Boolean);
      procedure SetFont(const Value: TFont);
      procedure SetFontHover(const Value: TColor);
      procedure SetFontChecked(const Value: TColor);
      procedure SetSymbol(const Value: Char);
      procedure SetSymbolChecked(const Value: TColor);
      procedure SetSymbolFont(const Value: TFont);
      procedure SetSymbolGap(const Value: Integer);
      procedure SetSymbolHover(const Value: TColor);
      procedure SetSymbolPos(const Value: TGR32WGAxialPos); // Click olaylarý burada iþlenir...
      procedure InlineChangeNotifier(Sender: TObject);
      procedure WMMouseMove (var Message: TWMMouseMove); message WM_MOUSEMOVE;
      procedure WMLMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure Resize; override;
      procedure ResetSettings;
    published
      property OnClick;
      property OnMouseMove    : TNotifyEvent              read  FOnMouseMove    write FOnMouseMove;
      property Background     : TColor                    read  FBackground     write SetBackground     stored True default clBtnFace ; // Zemin rengini ifade eder, butonun deðil,i butonun yerleþtiði zemin anlaþýlmalýdýr...
      property BorderColor    : TColor                    read  FBorderColor    write SetBorderColor    stored True default $00019ADC ;
      property BorderStyle    : TPenStyle                 read  FBorderStyle    write SetBorderStyle    stored True default psSolid   ;
      property BorderWidth    : Integer                   read  FBorderWidth    write SetBorderWidth    stored True default 2         ;
      property ButtonColor    : TColor                    read  FButtonColor    write SetButtonColor    stored True default $0033C1FE ;
      property ButtonHover    : TColor                    read  FButtonHover    write SetButtonHover    stored True;
      property ButtonRound    : Integer                   read  FButtonRound    write SetButtonRound    stored True default 10        ;
      property ButtonChecked  : TColor                    read  FButtonChecked  write SetButtonChecked  stored True;
      property ButtonStyle    : TGR32WGButtonStyle    read  FButtonStyle    write SetButtonStyle;
      property ButtonType     : TGR32WGButtonTypes    read  FButtonType     write SetButtonType;
      property ButtonText     : String                    read  FButtonText     write SetButtonText;
      property Checked        : Boolean                   read  FChecked        write SetChecked        stored True default False     ;
      property Font           : TFont                     read  FFont           write SetFont;
      property FontHover      : TColor                    read  FFontHover      write SetFontHover      stored True;
      property FontChecked    : TColor                    read  FFontChecked    write SetFontChecked    stored True;
      property Symbol         : Char                      read  FSymbol         write SetSymbol;
      property SymbolFont     : TFont                     read  FSymbolFont     write SetSymbolFont;
      property SymbolHover    : TColor                    read  FSymbolHover    write SetSymbolHover    stored True;
      property SymbolChecked  : TColor                    read  FSymbolChecked  write SetSymbolChecked  stored True;
      property SymbolPos      : TGR32WGAxialPos       read  FSymbolPos      write SetSymbolPos;
      property SymbolGap      : Integer                   read  FSymbolGap      write SetSymbolGap      stored True  default 10        ;
      property Left;
      property Top;
      property Width;
      property Height;
  end;

procedure Register;

implementation

uses
    System.Math     //  Min
  ;

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WGButton]);
end;

{ TGR32WGButton }

constructor TGR32WGButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  FFont.OnChange := InlineChangeNotifier;
  FSymbolFont := TFont.Create;
  FSymbolFont.OnChange := InlineChangeNotifier;
  ResetSettings;
end;

destructor TGR32WGButton.Destroy;
begin
  FreeAndNil(FSymbolFont);
  FreeAndNil(FFont);
  inherited;
end;

procedure TGR32WGButton.InlineChangeNotifier(Sender: TObject);
begin
  Invalidate;
end;

procedure TGR32WGButton.SetBackground(const Value: TColor);
begin
  FBackground := Value; Invalidate;
end;

procedure TGR32WGButton.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; Invalidate;
end;

procedure TGR32WGButton.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; Invalidate;
end;

procedure TGR32WGButton.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonColor(const Value: TColor);
begin
  FButtonColor := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonHover(const Value: TColor);
begin
  FButtonHover := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonRound(const Value: Integer);
begin
  FButtonRound := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonStyle(const Value: TGR32WGButtonStyle);
begin
  FButtonStyle := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonChecked(const Value: TColor);
begin
  FButtonChecked := Value; Invalidate;
end;

procedure TGR32WGButton.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); Invalidate;
end;

procedure TGR32WGButton.SetFontHover(const Value: TColor);
begin
  FFontHover := Value; Invalidate;
end;

procedure TGR32WGButton.SetSymbol(const Value: Char);
begin
  FSymbol := Value; Invalidate;
end;

procedure TGR32WGButton.SetSymbolChecked(const Value: TColor);
begin
  FSymbolChecked := Value; Invalidate;
end;

procedure TGR32WGButton.SetSymbolFont(const Value: TFont);
begin
  FSymbolFont.Assign(Value); Invalidate;
end;

procedure TGR32WGButton.SetSymbolGap(const Value: Integer);
begin
  FSymbolGap := Value; Invalidate;
end;

procedure TGR32WGButton.SetSymbolHover(const Value: TColor);
begin
  FSymbolHover := Value; Invalidate;
end;

procedure TGR32WGButton.SetSymbolPos(const Value: TGR32WGAxialPos);
begin
  FSymbolPos := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonText(const Value: String);
begin
  FButtonText := Value; Invalidate;
end;

procedure TGR32WGButton.SetButtonType(const Value: TGR32WGButtonTypes);
begin
  FButtonType := Value; Invalidate;
end;

procedure TGR32WGButton.SetChecked(const Value: Boolean);
begin
  FChecked := Value; Invalidate;
end;

procedure TGR32WGButton.SetFontChecked(const Value: TColor);
begin
  FFontChecked := Value; Invalidate;
end;

procedure TGR32WGButton.WMLMouseDown(var Message: TWMLButtonDown);
begin
  if (FButtonType = wbtIsaretli) then begin
      SetChecked(NOT FChecked);
      Invalidate;
  end;
  if Assigned(OnClick) then OnClick(Self);
end;

procedure TGR32WGButton.WMMouseMove(var Message: TWMMouseMove);
begin
  // Nesnenin iç iþleyiþi için gerekli... Farenin nesne içindeki konumunu okutuyoruz...
  Resize;
  Invalidate;
  if (Assigned(FOnMouseMove) = True) then FOnMouseMove(Self);
end;

procedure TGR32WGButton.ResetSettings;
begin
  FBackground     := clBtnFace;
  FBorderColor    := $00019ADC;
  FBorderStyle    := psSolid;
  FBorderWidth    := 2;
  FButtonColor    := $0033C1FE;
  FButtonHover    := clRed;
  FButtonChecked  := clBlue;
  FButtonRound    := 10;
  FButtonStyle    := wbsDiktortgen;
  FButtonType     := wbtNormal;
  FButtonText     := Self.Name;
  FChecked        := False;
  FFont.Color     := clWhite;
  FFontHover      := clLime;
  FFontChecked    := clYellow;
end;

procedure TGR32WGButton.PaintControl;
var
  Ressam          : TPolygonRenderer32VPR;
  HC              : TColor32;
  FNT, SYM        : TFont;
  RCT             : TRect;
begin
  Resize;
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;
  Ressam.FillMode := pfWinding;
  Ressam.Bitmap   := Self.FBuffer;
  Ressam.Bitmap.Clear( FBackground.ToColor32 ); // Nesnenin yerleþtiði zeminin rengi kastedilmektedir.
  HC := 0;
  FNT := TFont.Create;
  FNT.Assign(FFont);
  case FButtonType of
      wbtNormal : begin
                    HC        := iif(MouseIsInside = True, FButtonHover, FButtonColor).ToColor32;
                    FNT.Color := iif(MouseIsInside = True, FFontHover, FFont.Color);
                  end;
    wbtIsaretli : begin
                    HC        := iif(FChecked = True, FButtonChecked, FButtonColor).ToColor32;
                    FNT.Color := iif(FChecked = True, FFontChecked, FFont.Color);
                  end;
  end;
  if (FSymbol <> #0) and (FSymbolPos <> wgpNone) then begin
      SYM := TFont.Create;
      SYM.Assign(FSymbolFont);
      case FButtonType of
            wbtNormal : SYM.Color := iif(MouseIsInside = True, FSymbolHover  , FSymbolFont.Color);
          wbtIsaretli : SYM.Color := iif(FChecked      = True, FSymbolChecked, FSymbolFont.Color);
      end;
      case FSymbolPos of
           wgpNone   : RCT.Create(0,0,0,0); // Boþ kalmasýn //
           wgpTop    : RCT := Zone_Top;
           wgpLeft   : RCT := Zone_Left;
           wgpRight  : RCT := Zone_Right;
           wgpBottom : RCT := Zone_Bottom;
      end;
  end;
  case  FButtonStyle  of
        wbsDiktortgen : begin
                          Ressam.SekilBas(HC, Ressam.Dikdortgen(Merkez, Width, Height));
                          Ressam.SekilBas(FBorderColor.ToColor32, Ressam.DikDortgenCizgi(Merkez, Width, Height, FBorderWidth, FBorderStyle));
                          Ressam.YaziBas(ClientRect, FButtonText, FNT, fpCenterCenter);
                        end;
        wbsOval       : begin
                          Ressam.SekilBas(FBorderColor.ToColor32, Ressam.DikdortgenOval(Merkez, Width, Height, FButtonRound));
                          Ressam.SekilBas(HC, Ressam.DikdortgenOval(Merkez, Width - FBorderWidth, Height - FBorderWidth, FButtonRound));
                          Ressam.YaziBas(ClientRect, FButtonText, FNT, fpCenterCenter);
                        end;
        wbsDaire      : begin
                          Ressam.SekilBas(FBorderColor.ToColor32 , Ressam.Daire(Merkez, MinRadius));
                          Ressam.SekilBas(HC , Ressam.Daire(Merkez, MinRadius - FBorderWidth));
                          Ressam.YaziBas(WidgetRect, FButtonText, FNT, fpCenterCenter);
                          // Simge desteklenmez, çünkü fontun kendisi bir simge olarak düþünülmüþtür...
                        end;
  end;
  if (FSymbol <> #0) and (FSymbolPos <> wgpNone) then begin
      Ressam.YaziBas( RCT, FSymbol, SYM, fpCenterCenter);
      FreeAndNil(SYM);
  end;
  FreeAndNil(FNT);
  Ressam.Free;
end;

procedure TGR32WGButton.Resize;
var
  WH: Integer;
begin
  inherited;
  FBuffer.Font := FSymbolFont;
  WH := FBuffer.TextHeight(FSymbol);
  with  Zone_Top do begin
        Top    := 0 + FSymbolGap;
        Left   := 0;
        Width  := Self.Width;
        Height := WH;
  end;
  with  Zone_Left do begin
        Top    := 0;
        Left   := 0 + FSymbolGap;
        Width  := WH;
        Height := Self.Height;
  end;
  with  Zone_Right do begin
        Top    := 0;
        Left   := Self.Width - WH - FSymbolGap;
        Width  := WH;
        Height := Self.Height;
  end;
  with  Zone_Bottom do begin
        Top    := Self.Height - WH - FSymbolGap;
        Left   := 0;
        Width  := Self.Width;
        Height := WH;
  end;

  end;

end.
