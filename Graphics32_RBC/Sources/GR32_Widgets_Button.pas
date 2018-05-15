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
  TGR32WidgetButtonTypes = (wbtNormal, wbtIsaretli);
  TGR32WidgetButtonStyle = (wbsDiktortgen, wbsOval, wbsDaire);
  TGR32WidgetButton = class(TGR32CustomWidget)
    private
      FOnMouseMove            : TNotifyEvent;
      FBackground             : TColor;
      FBorderColor            : TColor;
      FBorderStyle            : TPenStyle;
      FBorderWidth            : Integer;
      FButtonColor            : TColor;
      FButtonHover            : TColor;
      FButtonChecked          : TColor;
      FButtonRound            : Integer;
      FButtonStyle            : TGR32WidgetButtonStyle;
      FButtonType             : TGR32WidgetButtonTypes;
      FButtonText             : String;
      FChecked                : Boolean;
      FFont                   : TFont;
      FFontHover              : TColor;
      FFontChecked            : TColor;
      procedure SetBackground(const Value: TColor);
      procedure SetBorderColor(const Value: TColor);
      procedure SetBorderStyle(const Value: TPenStyle);
      procedure SetBorderWidth(const Value: Integer);
      procedure SetButtonColor(const Value: TColor);
      procedure SetButtonHover(const Value: TColor);
      procedure SetButtonChecked(const Value: TColor);
      procedure SetButtonRound(const Value: Integer);
      procedure SetButtonStyle(const Value: TGR32WidgetButtonStyle);
      procedure SetButtonType(const Value: TGR32WidgetButtonTypes);
      procedure SetButtonText(const Value: String);
      procedure SetChecked(const Value: Boolean);
      procedure SetFont(const Value: TFont);
      procedure SetFontHover(const Value: TColor);
      procedure SetFontChecked(const Value: TColor);
      procedure InlineChangeNotifier(Sender: TObject);
      procedure WMMouseMove (var Message: TWMMouseMove); message WM_MOUSEMOVE;
      procedure WMLMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN; // Click olaylarý burada iþlenir...
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure ResetSettings;
    published
      property OnClick;
      property OnMouseMove    : TNotifyEvent            read  FOnMouseMove    write FOnMouseMove;
      property Background     : TColor                  read  FBackground     write SetBackground     stored True default clBtnFace ; // Zemin rengini ifade eder, butonun deðil,i butonun yerleþtiði zemin anlaþýlmalýdýr...
      property BorderColor    : TColor                  read  FBorderColor    write SetBorderColor    stored True default $00019ADC ;
      property BorderStyle    : TPenStyle               read  FBorderStyle    write SetBorderStyle    stored True default psSolid   ;
      property BorderWidth    : Integer                 read  FBorderWidth    write SetBorderWidth    stored True default 2         ;
      property ButtonColor    : TColor                  read  FButtonColor    write SetButtonColor    stored True default $0033C1FE ;
      property ButtonHover    : TColor                  read  FButtonHover    write SetButtonHover    stored True;
      property ButtonRound    : Integer                 read  FButtonRound    write SetButtonRound    stored True default 10        ;
      property ButtonChecked  : TColor                  read  FButtonChecked  write SetButtonChecked  stored True;
      property ButtonStyle    : TGR32WidgetButtonStyle  read  FButtonStyle    write SetButtonStyle;
      property ButtonType     : TGR32WidgetButtonTypes  read  FButtonType     write SetButtonType;
      property ButtonText     : String                  read  FButtonText     write SetButtonText;
      property Checked        : Boolean                 read  FChecked        write SetChecked        stored True default False     ;
      property Font           : TFont                   read  FFont           write SetFont;
      property FontHover      : TColor                  read  FFontHover      write SetFontHover      stored True;
      property FontChecked    : TColor                  read  FFontChecked    write SetFontChecked    stored True;
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
  RegisterComponents('Graphics32RBC', [TGR32WidgetButton]);
end;

{ TGR32WidgetButton }

constructor TGR32WidgetButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  FFont.OnChange := InlineChangeNotifier;
  ResetSettings;
end;

destructor TGR32WidgetButton.Destroy;
begin
  FreeAndNil(FFont);
  inherited;
end;

procedure TGR32WidgetButton.InlineChangeNotifier(Sender: TObject);
begin
  Invalidate;
end;

procedure TGR32WidgetButton.SetBackground(const Value: TColor);
begin
  FBackground := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonColor(const Value: TColor);
begin
  FButtonColor := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonHover(const Value: TColor);
begin
  FButtonHover := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonRound(const Value: Integer);
begin
  FButtonRound := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonStyle(const Value: TGR32WidgetButtonStyle);
begin
  FButtonStyle := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonChecked(const Value: TColor);
begin
  FButtonChecked := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); Invalidate;
end;

procedure TGR32WidgetButton.SetFontHover(const Value: TColor);
begin
  FFontHover := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonText(const Value: String);
begin
  FButtonText := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetButtonType(const Value: TGR32WidgetButtonTypes);
begin
  FButtonType := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetChecked(const Value: Boolean);
begin
  FChecked := Value; Invalidate;
end;

procedure TGR32WidgetButton.SetFontChecked(const Value: TColor);
begin
  FFontChecked := Value; Invalidate;
end;

procedure TGR32WidgetButton.WMLMouseDown(var Message: TWMLButtonDown);

begin
  if (FButtonType = wbtIsaretli) then begin
      SetChecked(NOT FChecked);
      Invalidate;
  end;
  if Assigned(OnClick) then OnClick(Self);
end;

procedure TGR32WidgetButton.WMMouseMove(var Message: TWMMouseMove);
begin
  // Nesnenin iç iþleyiþi için gerekli... Farenin nesne içindeki konumunu okutuyoruz...
  Resize;
  Invalidate;
  if (Assigned(FOnMouseMove) = True) then FOnMouseMove(Self);
end;

procedure TGR32WidgetButton.ResetSettings;
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

procedure TGR32WidgetButton.PaintControl;
var
  Ressam          : TPolygonRenderer32VPR;
  HC, HT          : TColor32;
  FNT             : TFont;
begin
  Resize;
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;
  Ressam.FillMode := pfWinding;
  Ressam.Bitmap   := Self.FBuffer;
  Ressam.Bitmap.Clear( FBackground.ToColor32 ); // Nesnenin yerleþtiði zeminin rengi kastedilmektedir.

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
                        end;
  end;
  FreeAndNil(FNT);
  Ressam.Free;
end;

end.
