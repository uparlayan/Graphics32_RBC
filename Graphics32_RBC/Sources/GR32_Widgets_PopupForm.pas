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
{$IF CompilerVersion > 18}
  System.SysUtils, System.Classes, vcl.Forms, vcl.Controls, vcl.StdCtrls,
  System.Types, Winapi.Windows;
{$ELSE}
  SysUtils, Classes, Forms, Controls, StdCtrls, Types, Windows;
{$IFEND}

type
  TGR32WidgetsPopupYonu           = (wpyLeftToRight, wpyCenter, wpyRightToLeft);
  TGR32WidgetsPopupSlaytYonu      = (wsyTopBottom, wsyLeftRight, wsyRightLeft);
  TGR32WidgetsPopupAnimasyonStili = (wasKayma, wasHarmanlama);
  TGR32WidgetPopupForm = class(TComponent)
  type
    TGR32WidgetsPopupSettings = class(TPersistent)
      private
        // Görsel bir bileşen olmadığı için Getter ve Setter metodları kullanmadık... (UP)
        FAktif            : Boolean;
        FAnimationPeriyot : Integer;
        FAnimasyonStili   : TGR32WidgetsPopupAnimasyonStili;
        FSlaytYonu        : TGR32WidgetsPopupSlaytYonu;
      protected
      public
        procedure Assign(Source: TPersistent); override;
      published
        property Aktif            : Boolean                         read FAktif             write FAktif            default True;
        property AnimationPeriyot : Integer                         read FAnimationPeriyot  write FAnimationPeriyot default 50;
        property AnimasyonStili   : TGR32WidgetsPopupAnimasyonStili read FAnimasyonStili    write FAnimasyonStili   default wasKayma;
        property SlaytYonu        : TGR32WidgetsPopupSlaytYonu      read FSlaytYonu         write FSlaytYonu        default wsyTopBottom;
    end;
  private
    FPopupForm      : TForm;
    FNesne          : TWinControl;
    FOtomatikKapat  : Boolean;
    FBosluk_Ust     : SmallInt;
    FBosluk_Kenar   : SmallInt;
    FPopupYonu      : TGR32WidgetsPopupYonu;
    FAnimasyon      : TGR32WidgetsPopupSettings;
    FGolgeli        : Boolean;
    FOnBeforePopup  : TNotifyEvent;
    procedure SetAnimasyon(const Value: TGR32WidgetsPopupSettings);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FormDeActivate(Sender: TObject);
    procedure DoPopupForm;
    procedure DoPopupControl(aControl: TWinControl; aForm: TForm; aPopupYonu: TGR32WidgetsPopupYonu = wpyLeftToRight);
  published
    property Animasyon    : TGR32WidgetsPopupSettings  read FAnimasyon     write SetAnimasyon;
    property Bosluk_Kenar : SmallInt                   read FBosluk_Kenar  write FBosluk_Kenar   default 0;
    property Bosluk_Ust   : SmallInt                   read FBosluk_Ust    write FBosluk_Ust     default 0;
    property Golgeli      : Boolean                    read FGolgeli       Write FGolgeli        default True;
    property Nesne        : TWinControl                read FNesne         write FNesne;
    property OtomatikKapat: Boolean                    read FOtomatikKapat write FOtomatikKapat  default True;
    property PopupForm    : TForm                      read FPopupForm     write FPopupForm;
    property PopupYonu    : TGR32WidgetsPopupYonu      read FPopupYonu     write FPopupYonu      default wpyLeftToRight;
    property OnBeforePopup: TNotifyEvent               read FOnBeforePopup write FOnBeforePopup;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WidgetPopupForm]);
end;

{ TRbcPopupForm }

constructor TGR32WidgetPopupForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  OtomatikKapat := True;
  Golgeli       := True;

  FAnimasyon                   := TGR32WidgetPopupForm.TGR32WidgetsPopupSettings.Create;
  FAnimasyon.FAktif            := True;
  FAnimasyon.FAnimationPeriyot := 50;
  FAnimasyon.FAnimasyonStili   := wasKayma;
  FAnimasyon.SlaytYonu         := wsyTopBottom;
end;

destructor TGR32WidgetPopupForm.Destroy;
begin
  FAnimasyon.Free;
  inherited;
end;

procedure TGR32WidgetPopupForm.DoPopupForm;
begin
  // FNesne'nin koordinatlarını ve ölçülerini baz alarak pencereyi ekrana getirir...
  if Assigned(FOnBeforePopup) then FOnBeforePopup(Self); // Bu satır, eğer formunuzu runtime anında oluşturmak istiyorsanız oldukça işinize yarayacaktır. Bu olayın olay işleyicisine doğrudan runtime'de oluşturduğunuz formu bir değişken gibi atayabilirsiniz... (UP)
  DoPopupControl(FNesne, FPopupForm, FPopupYonu);
end;

procedure TGR32WidgetPopupForm.DoPopupControl(aControl: TWinControl; aForm: TForm; aPopupYonu: TGR32WidgetsPopupYonu);
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

procedure TGR32WidgetPopupForm.FormDeActivate(Sender: Tobject);
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

procedure TGR32WidgetPopupForm.SetAnimasyon(const Value: TGR32WidgetsPopupSettings);
begin
  FAnimasyon.Assign(Value);
end;

{ TGR32WidgetsPopupForm.TGR32WidgetsPopupSettings }

procedure TGR32WidgetPopupForm.TGR32WidgetsPopupSettings.Assign(Source: TPersistent);
var
  aSors : TGR32WidgetPopupForm.TGR32WidgetsPopupSettings;
begin
  if (Source is TGR32WidgetPopupForm.TGR32WidgetsPopupSettings) then begin
      aSors := TGR32WidgetPopupForm.TGR32WidgetsPopupSettings(Source);
      FAktif            := aSors.FAktif;
      FAnimationPeriyot := aSors.FAnimationPeriyot;
      FAnimasyonStili   := aSors.FAnimasyonStili;
      FSlaytYonu        := aSors.FSlaytYonu;
  end else inherited
end;

end.
