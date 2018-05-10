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
  , GR32_ColorGradients         //  TColor32, ColorTo
  , GR32_Polygons               //  Poligon hesaplama formülleri
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , System.Math                 //  Min
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  , Vcl.Forms                   //
  , Winapi.Messages
  , Winapi.Windows              //  ReleaseCapture
  ;

type

  TGR32WidgetTitle = class(TGR32CustomWidget)
    private
      Zone_Menu         : TRect;
      Zone_Close        : TRect;
      Zone_H_Left       : TRect;
      Zone_H_Right      : TRect;

      FBackground       : TColor;
      FBorderStyle      : TPenStyle;
      FBorderWidth      : Integer;
      FCloseChar        : Char;
      FFont             : TFont;
      FIcons            : TFont;
      FHeaderLeft       : String;
      FHeaderCenter     : String;
      FHeaderRight      : String;
      FMaximizeChar     : Char;
      FMenuChar         : Char;
      FBorderColor      : TColor;
      FGap              : Integer;
      FOnMouseMove      : TNotifyEvent;
      FOnMenuClick      : TNotifyEvent;
      FOnCloseClick     : TNotifyEvent;

      procedure WMLMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN; // Click olayları burada işlenir...
      procedure WMMouseMove (var Message: TWMMouseMove); message WM_MOUSEMOVE;

      procedure SetBackground(const Value: TColor);
      procedure SetBorderColor(const Value: TColor);
      procedure SetBorderStyle(const Value: TPenStyle);
      procedure SetBorderWidth(const Value: Integer);
      procedure SetCloseChar(const Value: Char);
      procedure SetFont(const Value: TFont);
      procedure SetIcons(const Value: TFont);
      procedure SetHeaderLeft(const Value: String);
      procedure SetHeaderCenter(const Value: String);
      procedure SetHeaderRight(const Value: String);
      procedure SetMaximizeChar(const Value: Char);
      procedure SetMenuChar(const Value: Char);
      procedure SetGap(const Value: Integer);
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure Resize; override;
    published
      property Align;
      property Background     : TColor        read  FBackground   write SetBackground;
      property BorderColor    : TColor        read  FBorderColor  write SetBorderColor;
      property BorderStyle    : TPenStyle     read  FBorderStyle  write SetBorderStyle;
      property BorderWidth    : Integer       read  FBorderWidth  write SetBorderWidth;
      property CloseChar      : Char          read  FCloseChar    write SetCloseChar;
      property Font           : TFont         read  FFont         write SetFont;
      property Icons          : TFont         read  FIcons        write SetIcons;
      property HeaderLeft     : String        read  FHeaderLeft   write SetHeaderLeft;
      property HeaderCenter   : String        read  FHeaderCenter write SetHeaderCenter;
      property HeaderRight    : String        read  FHeaderRight  write SetHeaderRight;
      property MaximizeChar   : Char          read  FMaximizeChar write SetMaximizeChar;
      property MenuChar       : Char          read  FMenuChar     write SetMenuChar;
      property Margins;
      property Gap            : Integer       read  FGap          write SetGap            default 10;
      property OnMouseMove    : TNotifyEvent  read  FOnMouseMove  write FOnMouseMove;
      property OnMenuClick    : TNotifyEvent  read  FOnMenuClick  write FOnMenuClick;
      property OnCloseClick   : TNotifyEvent  read  FOnCloseClick write FOnCloseClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WidgetTitle]);
end;

{ TGR32WidgetTitle }

constructor TGR32WidgetTitle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFont         := TFont.Create;
  FIcons        := TFont.Create;
  FBackground   := clWindow;
  FBorderWidth  := 2;
  FBorderStyle  := psSolid;
  FBorderColor  := $00CAB9AC;
  FGap          := 10;
end;

destructor TGR32WidgetTitle.Destroy;
begin
  FreeAndNil(FIcons);
  FreeAndNil(FFont);
  inherited;
end;

procedure TGR32WidgetTitle.SetBackground(const Value: TColor);
begin
  FBackground := Value; Invalidate;
end;

procedure TGR32WidgetTitle.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; Invalidate;
end;

procedure TGR32WidgetTitle.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; Invalidate;
end;

procedure TGR32WidgetTitle.SetCloseChar(const Value: Char);
begin
  FCloseChar := Value; Invalidate;
end;

procedure TGR32WidgetTitle.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; Invalidate;
end;

procedure TGR32WidgetTitle.SetIcons(const Value: TFont);
begin
  FIcons.Assign(Value); Invalidate;
  //FIcons.FontAdapter.Changed
end;

procedure TGR32WidgetTitle.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); Invalidate;
end;

procedure TGR32WidgetTitle.SetGap(const Value: Integer);
begin
  FGap := Value; Invalidate;
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

procedure TGR32WidgetTitle.SetMaximizeChar(const Value: Char);
begin
  FMaximizeChar := Value; Invalidate;
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
  Ressam.Bitmap.Clear( FBackground.ToColor32 ); // Tuvalin zemin rengi ve tam temizlik

  // Genel çerçeve bilgileri hesaplanıyor.
  Ressam.YaziBas( Zone_Menu     , FMenuChar     , FIcons.Color  , FIcons.Size , FIcons.Name , fpCenterCenter  , FFont.Style);
  Ressam.YaziBas( Zone_Close    , FCloseChar    , FIcons.Color  , FIcons.Size , FIcons.Name , fpCenterCenter  , FFont.Style);
  Ressam.YaziBas( Zone_H_Left   , FHeaderLeft   , FFont.Color   , FFont.Size  , FFont.Name  , fpCenterLeft    , FFont.Style);
  Ressam.YaziBas( ClientRect    , FHeaderCenter , FFont.Color   , FFont.Size  , FFont.Name  , fpCenterCenter  , FFont.Style);
  Ressam.YaziBas( Zone_H_Right  , FHeaderRight  , FFont.Color   , FFont.Size  , FFont.Name  , fpCenterRight   , FFont.Style);
  Ressam.SekilBas( FBorderColor.ToColor32, Ressam.DikDortgenCizgi( Merkez, Width, Height, FBorderWidth, FBorderStyle));
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
        Left   := Zone_Menu.Left + Zone_Menu.Width + FGap;
        Width  := FBuffer.TextWidth(FHeaderLeft);
        Height := MinWH;// FBuffer.TextHeight(FHeaderLeft);
  end;
  with  Zone_H_Right do begin
        Height := MinWH;// FBuffer.TextHeight(FHeaderRight);
        Width  := FBuffer.TextWidth(FHeaderRight);
        Top    := 0;
        Left   := TGR32WidgetTitle(Self).Width - Zone_Close.Width - FGap - Zone_H_Right.Width;
  end;
end;

end.
