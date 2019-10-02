unit DropDownForm_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, GR32_Widgets_Base,
  GR32_Widgets_Izgara, Vcl.StdCtrls, Vcl.ExtCtrls, GR32_Widgets_Statusbar;

type
  TDropDownForm = class(TForm)
    SG: TStringGrid;
    GR32WidgetStatusBar1: TGR32WGStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function CreateDropDownForm(aOwner: TComponent): TDropDownForm;
  end;

  //  var DropDownForm: TDropDownForm;

implementation

{$R *.dfm}

{ TDropDownForm }

class function TDropDownForm.CreateDropDownForm(aOwner: TComponent): TDropDownForm;
begin
  Result := TDropDownForm.Create(aOwner);
end;

procedure TDropDownForm.FormCreate(Sender: TObject);
const
  Caps: array[0..2] of string = ('ID', 'Invoice Type', 'Amount');
var
  I, J, Row: Integer;
begin
  Row := SG.RowCount;
  SG.RowCount := Row + 1;
  for J := 1 to Row do begin
      SG.Cells[0, J] := J.ToString;
      SG.Cells[1, J] := 'Send Invoice';
      SG.Cells[2, J] := Random(1000).ToString+'.00 €';
  end;
  for I := Low(Caps) to High(Caps) do SG.Cells[I, 0] := Caps[I];
  SG.Row := Row;
end;

procedure TDropDownForm.FormResize(Sender: TObject);
begin
  SG.ColWidths[0] := 50;
  SG.ColWidths[2] := 60;
  SG.ColWidths[1] := Width - SG.ColWidths[0] - SG.ColWidths[2] - (GetSystemMetrics(SM_CYVSCROLL) * 2);
end;

end.
