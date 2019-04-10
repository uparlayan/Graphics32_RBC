{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_PopupForm.pas                                         /
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

unit GR32_Widgets_PopupForm;

interface

uses
  System.SysUtils, System.Classes, System.Types, Winapi.Windows, Vcl.Forms, Vcl.Controls;

type
  TGR32WGPopupYonu           = (wpyLeftToRight, wpyCenter, wpyRightToLeft);
  TGR32WGPopupSlaytYonu      = (wsyTopBottom, wsyLeftRight, wsyRightLeft);
  TGR32WGPopupAnimasyonStili = (wasKayma, wasHarmanlama);
  TGR32WGPopupForm = class(TComponent)
  type
    TGR32WGPopupSettings = class(TPersistent)
      private
        // Görsel bir bileşen olmadığı için Getter ve Setter metodları kullanmadık... (UP)
        FAktif            : Boolean;
        FAnimationPeriyot : Integer;
        FAnimasyonStili   : TGR32WGPopupAnimasyonStili;
        FSlaytYonu        : TGR32WGPopupSlaytYonu;
      protected
      public
        procedure Assign(Source: TPersistent); override;
      published
        property Aktif            : Boolean                         read FAktif             write FAktif            default True;
        property AnimationPeriyot : Integer                         read FAnimationPeriyot  write FAnimationPeriyot default 50;
        property AnimasyonStili   : TGR32WGPopupAnimasyonStili read FAnimasyonStili    write FAnimasyonStili   default wasKayma;
        property SlaytYonu        : TGR32WGPopupSlaytYonu      read FSlaytYonu         write FSlaytYonu        default wsyTopBottom;
    end;
  private
    FPopupForm      : TForm;
    FNesne          : TWinControl;
    FOtomatikKapat  : Boolean;
    FBosluk_Ust     : SmallInt;
    FBosluk_Kenar   : SmallInt;
    FPopupYonu      : TGR32WGPopupYonu;
    FAnimasyon      : TGR32WGPopupSettings;
    FGolgeli        : Boolean;
    FOnBeforePopup  : TNotifyEvent;
    procedure SetAnimasyon(const Value: TGR32WGPopupSettings);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FormDeActivate(Sender: TObject);
    procedure DoPopupForm;
    procedure DoPopupControl(aControl: TWinControl; aForm: TForm; aPopupYonu: TGR32WGPopupYonu = wpyLeftToRight);
  published
    property Animasyon    : TGR32WGPopupSettings  read FAnimasyon     write SetAnimasyon;
    property Bosluk_Kenar : SmallInt                   read FBosluk_Kenar  write FBosluk_Kenar   default 0;
    property Bosluk_Ust   : SmallInt                   read FBosluk_Ust    write FBosluk_Ust     default 0;
    property Golgeli      : Boolean                    read FGolgeli       Write FGolgeli        default True;
    property Nesne        : TWinControl                read FNesne         write FNesne;
    property OtomatikKapat: Boolean                    read FOtomatikKapat write FOtomatikKapat  default True;
    property PopupForm    : TForm                      read FPopupForm     write FPopupForm;
    property PopupYonu    : TGR32WGPopupYonu      read FPopupYonu     write FPopupYonu      default wpyLeftToRight;
    property OnBeforePopup: TNotifyEvent               read FOnBeforePopup write FOnBeforePopup;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WGPopupForm]);
end;

{ TRbcPopupForm }

constructor TGR32WGPopupForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  OtomatikKapat := True;
  Golgeli       := True;

  FAnimasyon                   := TGR32WGPopupForm.TGR32WGPopupSettings.Create;
  FAnimasyon.FAktif            := True;
  FAnimasyon.FAnimationPeriyot := 50;
  FAnimasyon.FAnimasyonStili   := wasKayma;
  FAnimasyon.SlaytYonu         := wsyTopBottom;
end;

destructor TGR32WGPopupForm.Destroy;
begin
  FAnimasyon.Free;
  inherited;
end;

procedure TGR32WGPopupForm.DoPopupForm;
begin
  // FNesne'nin koordinatlarını ve ölçülerini baz alarak pencereyi ekrana getirir...
  if Assigned(FOnBeforePopup) then FOnBeforePopup(Self); // Bu satır, eğer formunuzu runtime anında oluşturmak istiyorsanız oldukça işinize yarayacaktır. Bu olayın olay işleyicisine doğrudan runtime'de oluşturduğunuz formu bir değişken gibi atayabilirsiniz... (UP)
  DoPopupControl(FNesne, FPopupForm, FPopupYonu);
end;

procedure TGR32WGPopupForm.DoPopupControl(aControl: TWinControl; aForm: TForm; aPopupYonu: TGR32WGPopupYonu);
var
  SolUst: TPoint;
begin
  // FNESNE HARİCİNDE, Başka bir nesnenin koordinat ve ölçüleri baz alınarak pencereyi ekrana getirir.
  if  Assigned(aControl) and Assigned(aForm)  then begin
      SolUst := aControl.ClientToScreen(Point(0, 0));
      if OtomatikKapat then aForm.OnDeactivate := FormDeActivate;
      if aForm.Visible then aForm.Visible := False;
      aForm.BorderStyle := bsNone;
      aForm.Top := SolUst.y + aControl.Height + FBosluk_Ust;
      case  aPopupYonu  of
            wpyLeftToRight : aForm.Left := SolUst.X + FBosluk_Kenar;
            wpyRightToLeft : aForm.Left := SolUst.X - aForm.Width + aControl.Width - FBosluk_Kenar;
            wpyCenter      : aForm.Left := SolUst.X - (aForm.Width - aControl.Width) div 2;
      end;
      aForm.FormStyle := fsStayOnTop;
      case FGolgeli of
           True  : SetClassLong(aForm.Handle, GCL_STYLE, GetClassLong(aForm.Handle, GCL_STYLE)      or CS_DROPSHADOW);
           False : SetClassLong(aForm.Handle, GCL_STYLE, GetClassLong(aForm.Handle, GCL_STYLE) and not CS_DROPSHADOW);
      end;
      with FAnimasyon do begin
      if (Aktif = True) then begin
          case  FAnimasyonStili  of
                wasKayma: begin
                             case FSlaytYonu of
                                  wsyTopBottom : AnimateWindow(aForm.Handle, FAnimationPeriyot, AW_VER_POSITIVE or AW_SLIDE);
                                  wsyLeftRight : AnimateWindow(aForm.Handle, FAnimationPeriyot, AW_HOR_POSITIVE or AW_SLIDE);
                                  wsyRightLeft : AnimateWindow(aForm.Handle, FAnimationPeriyot, AW_HOR_NEGATIVE or AW_SLIDE);
                             end;
                         end;
                wasHarmanlama: AnimateWindow(aForm.Handle, FAnimationPeriyot, AW_BLEND or AW_SLIDE);
          end;
      end;
    end;
    aForm.Show;
  end;
end;

procedure TGR32WGPopupForm.FormDeActivate(Sender: Tobject);
begin
  // Başka bir forma geçildiğinde bu kısım tetiklenir, böylece bu formun kendi kendisini kapatmak mümkün hale gelir...
  with FAnimasyon do begin
       if Aktif = True then begin
          case FAnimasyonStili of
               wasKayma: begin
                          case FSlaytYonu of
                               wsyTopBottom : AnimateWindow((Sender as TForm).Handle, FAnimationPeriyot, AW_VER_NEGATIVE or AW_HIDE);
                               wsyLeftRight : AnimateWindow((Sender as TForm).Handle, FAnimationPeriyot, AW_HOR_NEGATIVE or AW_HIDE);
                               wsyRightLeft : AnimateWindow((Sender as TForm).Handle, FAnimationPeriyot, AW_HOR_POSITIVE or AW_HIDE);
                          end;
                        end;
               wasHarmanlama: AnimateWindow((Sender as TForm).Handle, FAnimationPeriyot, AW_BLEND or AW_HIDE);
          end;
       end;
  end;
  (Sender as TForm).Close;
end;

procedure TGR32WGPopupForm.SetAnimasyon(const Value: TGR32WGPopupSettings);
begin
  FAnimasyon.Assign(Value);
end;

{ TGR32WGsPopupForm.TGR32WGsPopupSettings }

procedure TGR32WGPopupForm.TGR32WGPopupSettings.Assign(Source: TPersistent);
var
  aSors : TGR32WGPopupForm.TGR32WGPopupSettings;
begin
  if (Source is TGR32WGPopupForm.TGR32WGPopupSettings) then begin
      aSors := TGR32WGPopupForm.TGR32WGPopupSettings(Source);
      FAktif            := aSors.FAktif;
      FAnimationPeriyot := aSors.FAnimationPeriyot;
      FAnimasyonStili   := aSors.FAnimasyonStili;
      FSlaytYonu        := aSors.FSlaytYonu;
  end else inherited
end;

end.
