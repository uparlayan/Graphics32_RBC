unit Ana_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32_Widgets_Base, GR32_Widgets_Chart, Vcl.ExtCtrls, GR32_Widgets_Circle,
  dxGDIPlusClasses, Vcl.ComCtrls;

type
  TGezici = record
    private
      Yon: Boolean; // True ise art, False ise azal...
      Min: Integer;
      Max: Integer;
      CRS: Integer; // Cursor / Ýmleç
      Step: Integer;
    public
      procedure Setup(aMin, aMax, aStep: Integer);
      function Sonraki: Integer;
  end;
  TAna = class(TForm)
    Frekans: TTimer;
    CHRT: TGR32WGChart;
    Image1: TImage;
    TrackBar1: TTrackBar;
    procedure FrekansTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Gezici: TGezici;
  end;

var
  Ana: TAna;

implementation

{$R *.dfm}

{ TGezici }

procedure TGezici.Setup(aMin, aMax, aStep: Integer);
begin
  Yon := True;
  Min := aMin;
  Max := aMax;
  CRS := aMin;
  Step:= aStep;
end;

function TGezici.Sonraki: Integer;
begin
  case Yon of
    True:  begin
             if (CRS + Step >= Max - 1)
             then Yon := False
             else CRS := CRS + Step;
           end;
    False: begin
             if (CRS - Step <= Min + 1)
             then Yon := True
             else CRS := CRS - Step;
           end;
  end;
  Result := CRS;
end;

{ TAna }

procedure TAna.FormCreate(Sender: TObject);
begin
  Gezici.Setup(128,255,10);
end;

procedure TAna.FrekansTimer(Sender: TObject);
var
  I, J, K: Integer;
begin
  Gezici.Sonraki;
  for I := 0 to ComponentCount - 1 do begin
      if Components[I] is TGR32WGChart then begin
          with  TGR32WGChart(Components[I]) do begin
                K := 1;
                for J := 0 to ItemCount - 1 do begin
                    K := (K + 1) mod ItemCount;
                    Item(J).Value := Item(K).Value;
                end;
                Invalidate;
          end;
      end else
      begin end;
  end;
end;

procedure TAna.TrackBar1Change(Sender: TObject);
begin
  CHRT.AlphaBlend := Trackbar1.Position;
end;

end.
