unit PopupForm_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, GR32_Widgets_Izgara, GR32_Widgets_Title, GR32_Widgets_Base, GR32_Widgets_Statusbar;

type
  TPopupForm = class(TForm)
    GR32WidgetIzgara1: TGR32WidgetIzgara;
    WTT: TGR32WidgetTitle;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    GR32WidgetStatusBar1: TGR32WidgetStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WTTMenuClick(Sender: TObject);
    procedure WTTCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TPopupForm.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add(Edit1.Text);
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TPopupForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
      Key := #0;
      Button1.Click;
  end;
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
