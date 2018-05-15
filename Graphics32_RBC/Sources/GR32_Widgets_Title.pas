{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Title.pas                                             /
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

unit GR32_Widgets_Title;

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
  TGR32WidgetTitle = class(TGR32CustomWidget)
    type
      TGR32WidgetTitleSettings = class(TPersistent)
        private
          FOwner            : TGR32WidgetTitle;
          FBackground       : TColor;
          FBackgroundHover  : TColor;
          FBorderColor      : TColor;
          FBorderStyle      : TPenStyle;
          FBorderWidth      : Integer;
          FFont             : TFont;
          FIcons            : TFont;
          FGap              : Integer;
          procedure SetBackground(const Value: TColor);
          procedure SetBackgroundHover(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetFont(const Value: TFont);
          procedure SetIcons(const Value: TFont);
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
          property Font               : TFont         read  FFont             write SetFont;
          property Icons              : TFont         read  FIcons            write SetIcons;
          property Gap                : Integer       read  FGap              write SetGap              stored True  default 10        ;
      end;
    private
      Zone_Menu         : TRect;
      Zone_Close        : TRect;
      Zone_H_Left       : TRect;
      Zone_H_Right      : TRect;

      FAyarlar          : TGR32WidgetTitleSettings;
      FHeaderLeft       : String;
      FHeaderCenter     : String;
      FHeaderRight      : String;
      FCloseChar        : Char;
      FMenuChar         : Char;
      FOnMouseMove      : TNotifyEvent;
      FOnMenuClick      : TNotifyEvent;
      FOnCloseClick     : TNotifyEvent;

      procedure WMLMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN; // Click olayları burada işlenir...
      procedure WMMouseMove (var Message: TWMMouseMove); message WM_MOUSEMOVE;

      procedure SetAyarlar(const Value: TGR32WidgetTitleSettings);
      procedure SetHeaderLeft(const Value: String);
      procedure SetHeaderCenter(const Value: String);
      procedure SetHeaderRight(const Value: String);
      procedure SetCloseChar(const Value: Char);
      procedure SetMenuChar(const Value: Char);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure Resize; override;
    published
      property Align;
      property Margins;
      property Ayarlar        : TGR32WidgetTitleSettings  read  FAyarlar      write SetAyarlar;
      property HeaderLeft     : String                    read  FHeaderLeft   write SetHeaderLeft;
      property HeaderCenter   : String                    read  FHeaderCenter write SetHeaderCenter;
      property HeaderRight    : String                    read  FHeaderRight  write SetHeaderRight;
      property CloseChar      : Char                      read  FCloseChar    write SetCloseChar;
      property MenuChar       : Char                      read  FMenuChar     write SetMenuChar;
      property OnMouseMove    : TNotifyEvent              read  FOnMouseMove  write FOnMouseMove;
      property OnMenuClick    : TNotifyEvent              read  FOnMenuClick  write FOnMenuClick;
      property OnCloseClick   : TNotifyEvent              read  FOnCloseClick write FOnCloseClick;
      property OnDblClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WidgetTitle]);
end;

{ TGR32WidgetTitle.TGR32WidgetTitleSettings }

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.AfterConstruction;
begin
  inherited;
  FFont             := TFont.Create;
  FFont.OnChange    := InlineChangeNotifier;
  FIcons            := TFont.Create;
  FIcons.OnChange   := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WidgetTitle.TGR32WidgetTitleSettings;
begin
  if (Source is TGR32WidgetTitle.TGR32WidgetTitleSettings) then begin
      aSors := TGR32WidgetTitle.TGR32WidgetTitleSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background     ;
      FBorderColor      := aSors.BorderColor    ;
      FBorderStyle      := aSors.BorderStyle    ;
      FBorderWidth      := aSors.BorderWidth    ;
      FFont             := aSors.Font           ;
      FIcons            := aSors.Icons          ;
      FGap              := aSors.Gap            ;
  end else inherited;
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.BeforeDestruction;
begin
  FreeAndNil(FFont);
  FreeAndNil(FIcons);
  inherited;
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sınıfın alt type'lerinde bir değişiklik olduğunda ana sınıfın grafiğinin yeniden çizilmesini tetikler...
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.ResetSettings;
begin
  FBackground       := $0033C1FE;
  FBackgroundHover  := $0033C1FE;
  FBorderColor      := $00019ADC;
  FBorderStyle      := psSolid;
  FBorderWidth      := 1;
  FGap              := 10;
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetBackgroundHover(const Value: TColor);
begin
  FBackgroundHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetIcons(const Value: TFont);
begin
  FIcons.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WidgetTitle.TGR32WidgetTitleSettings.SetGap(const Value: Integer);
begin
  FGap := Value; InlineChangeNotifier(nil);
end;

{ TGR32WidgetTitle }

constructor TGR32WidgetTitle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar        := TGR32WidgetTitleSettings.Create;
  FAyarlar.FOwner := Self;
end;

destructor TGR32WidgetTitle.Destroy;
begin
  FreeAndNil(FAyarlar);
  inherited;
end;

procedure TGR32WidgetTitle.SetAyarlar(const Value: TGR32WidgetTitleSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WidgetTitle.SetCloseChar(const Value: Char);
begin
  FCloseChar := Value; Invalidate;
end;

procedure TGR32WidgetTitle.SetHeaderCenter(const Value: String);
begin
  FHeaderCenter := Value; Resize; Invalidate;
end;

procedure TGR32WidgetTitle.SetHeaderLeft(const Value: String);
begin
  FHeaderLeft := Value; Resize; Invalidate;
end;

procedure TGR32WidgetTitle.SetHeaderRight(const Value: String);
begin
  FHeaderRight := Value; Resize; Invalidate;
end;

procedure TGR32WidgetTitle.SetMenuChar(const Value: Char);
begin
  FMenuChar := Value; Invalidate;
end;

procedure TGR32WidgetTitle.WMLMouseDown(var Message: TWMLButtonDown);
var
  Fare: TPoint;
begin
  Fare := Self.ScreenToClient(Mouse.CursorPos);
  if (PtInRect(Zone_Menu, Fare) = True) then begin
      if (Assigned(FOnMenuClick) = True) then FOnMenuClick(Self);
  end else
  if (PtInRect(Zone_Close, Fare) = True) then begin
      if (Assigned(FOnCloseClick) = True) then FOnCloseClick(Self);
  end else
  if (Self.Parent is TForm) then begin
      ReleaseCapture;
      Self.Parent.Perform(WM_SYSCOMMAND, SC_MOVE + 1, 0);
  end;
end;

procedure TGR32WidgetTitle.WMMouseMove(var Message: TWMMouseMove);
begin
  // Nesnenin iç işleyişi için gerekli... Farenin nesne içindeki konumunu okutuyoruz...
  Resize;
  if (Assigned(FOnMouseMove) = True) then FOnMouseMove(Self);
end;

procedure TGR32WidgetTitle.PaintControl;
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

  // Genel çerçeve bilgileri hesaplanıyor.
  Ressam.YaziBas( Zone_Menu     , FMenuChar     , FAyarlar.FIcons, fpCenterCenter);
  Ressam.YaziBas( Zone_Close    , FCloseChar    , FAyarlar.FIcons, fpCenterCenter);
  Ressam.YaziBas( Zone_H_Left   , FHeaderLeft   , FAyarlar.FFont , fpCenterLeft);
  Ressam.YaziBas( ClientRect    , FHeaderCenter , FAyarlar.FFont , fpCenterCenter);
  Ressam.YaziBas( Zone_H_Right  , FHeaderRight  , FAyarlar.FFont , fpCenterRight);

  Ressam.SekilBas( FAyarlar.FBorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, Width, Height, FAyarlar.FBorderWidth, FAyarlar.FBorderStyle));
  Ressam.Free;
end;

procedure TGR32WidgetTitle.Resize;
begin
  inherited;
  with  Zone_Menu do begin
        Top    := 0;
        Left   := 0;
        Width  := MinWH;
        Height := MinWH;
  end;
  with  Zone_Close do begin
        Top    := 0;
        Left   := Self.Width - MinWH;
        Width  := MinWH;
        Height := MinWH;
  end;
  with  Zone_H_Left do begin
        Top    := 0;
        Left   := Zone_Menu.Left + Zone_Menu.Width + FAyarlar.FGap;
        Width  := FBuffer.TextWidth(FHeaderLeft);
        Height := MinWH;// FBuffer.TextHeight(FHeaderLeft);
  end;
  with  Zone_H_Right do begin
        Height := MinWH;// FBuffer.TextHeight(FHeaderRight);
        Width  := FBuffer.TextWidth(FHeaderRight);
        Top    := 0;
        Left   := TGR32WidgetTitle(Self).Width - Zone_Close.Width - FAyarlar.FGap - Zone_H_Right.Width;
  end;
end;

end.
