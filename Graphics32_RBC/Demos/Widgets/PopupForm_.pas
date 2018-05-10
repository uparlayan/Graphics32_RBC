unit PopupForm_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32_Widgets_Base, GR32_Widgets_Chart, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinVS2010, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxSkinsdxStatusBarPainter, dxStatusBar, dxRibbonStatusBar,
  Vcl.ComCtrls, Vcl.StdCtrls, GR32_Widgets_Izgara, Vcl.ExtCtrls, GR32_Widgets_Title;

type
  TPopupForm = class(TForm)
    GR32WidgetIzgara1: TGR32WidgetIzgara;
    Panel2: TPanel;
    Button2: TButton;
    WTT: TGR32WidgetTitle;
    Label1: TLabel;
    procedure Button2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WTTMenuClick(Sender: TObject);
    procedure WTTCloseClick(Sender: TObject);
    //procedure GR32WidgetTitle1MouseMove(Sender: TObject);
  private
    { Private declarations }
    //procedure CreateParams(var Params: TCreateParams);
  public
    { Public declarations }
  end;

  // var PopupForm: TPopupForm;
  function CreatePopupForm(aOwner: TComponent): TPopupForm;

implementation

{$R *.dfm}

function CreatePopupForm(aOwner: TComponent): TPopupForm;
begin
  Result := TPopupForm.Create(aOwner);
end;

{ TPopupForm }

procedure TPopupForm.Button2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, SC_SIZE + 8, 0);
end;

procedure TPopupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; // Pencereyi bellekten tamamen atar...
end;

procedure TPopupForm.WTTCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPopupForm.WTTMenuClick(Sender: TObject);
begin
  ShowMessage('Menu Click');
end;

end.
