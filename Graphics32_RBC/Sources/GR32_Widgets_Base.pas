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
  TGR32CustomWidget = class(TCustomControl)
    private
      FBufferValid: Boolean;
      FMouseIsInside: Boolean;
      FOnMouseEnter: TNotifyEvent;
      FOnMouseLeave: TNotifyEvent;
      procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;

      procedure WMGetDlgCode(var Msg: TWmGetDlgCode); message WM_GETDLGCODE;
      procedure WMMouseEnter (var Message: TWMMouse); message CM_MOUSEENTER;
      procedure WMMouseLeave (var Message: TMessage); message CM_MOUSELEAVE;
      function GetMouseIsInside: Boolean;
    protected
      procedure Paint; override;
    public
      FBuffer : TBitmap32;
      Merkez  : TFloatPoint;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy(); override;
      procedure Invalidate; override;
      procedure Resize; override;
      procedure PaintControl; virtual;                                          // Bu, yavru nesnelerde tanımlanacak. Bu noktada ise bu metod Paint metodunda çağırılacak. Böylece işleyiş ve performans düzgün ilerleyecek...
    published
      property Align;
      property AlignWithMargins;
      property Anchors;
      property Margins;
      property MouseIsInside: Boolean read GetMouseIsInside;                    // Hover olaylarını windows mesajlarını etkilemeyecek şekilde yönetebilmek için gerekir.
      property OnClick;
      property OnMouseEnter : TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
      property OnMouseLeave : TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  end;

implementation

{ TGR32_Widget_Circle }

constructor TGR32CustomWidget.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csOpaque];
  FBuffer  := TBitmap32.Create;
end;

destructor TGR32CustomWidget.Destroy;
begin
  FBuffer.Free;
  inherited Destroy;
end;

function TGR32CustomWidget.GetMouseIsInside: Boolean;
begin
  Result := FMouseIsInside;
end;

procedure TGR32CustomWidget.Invalidate;
begin
  FBufferValid := False;
  inherited;
end;

procedure TGR32CustomWidget.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TGR32CustomWidget.WMGetDlgCode(var Msg: TWmGetDlgCode);
begin
  with Msg do Result := Result or DLGC_WANTARROWS;
end;

procedure TGR32CustomWidget.WMMouseEnter(var Message: TWMMouse);
begin
  FMouseIsInside := True;
  Invalidate;
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
  inherited;
end;

procedure TGR32CustomWidget.WMMouseLeave(var Message: TMessage);
begin
  FMouseIsInside := False;
  Invalidate;
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
  inherited;
end;

procedure TGR32CustomWidget.Paint;
begin
  if NOT Assigned(Parent) then Exit;

  if not FBufferValid then begin
      (FBuffer.Backend as IPaintSupport).ImageNeeded;
       PaintControl;
      (FBuffer.Backend as IPaintSupport).CheckPixmap;
      FBufferValid := True;
  end;
  FBuffer.Lock;
  with Canvas do try
    (FBuffer.Backend as IDeviceContextSupport).DrawTo(Canvas.Handle, 0, 0);
  finally
    FBuffer.Unlock;
  end;
end;

procedure TGR32CustomWidget.PaintControl;
begin
  inherited;
end;

procedure TGR32CustomWidget.Resize;
begin
  inherited;
  Merkez.X  := Width  * 0.5;
  Merkez.Y  := Height * 0.5;
  FBuffer.SetSize(Width, Height);
  FBufferValid := False;
end;

end.
