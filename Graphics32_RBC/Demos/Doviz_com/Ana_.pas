unit Ana_;

interface

uses
  Generics.Collections, Rest.Json,
  System.JSON,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, MemDS, VirtualDataSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ExtCtrls, GR32_Widgets_Base, GR32_Widgets_Chart, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Client: TRESTClient;
    Request: TRESTRequest;
    Response: TRESTResponse;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    CART: TGR32WGChart;
    Panel2: TPanel;
    BT_Altin_Anlik: TButton;
    BT_Kur_Anlik: TButton;
    PB: TComboBox;
    BT_Kur_ZamanAralikli: TButton;
    T1: TDateTimePicker;
    T2: TDateTimePicker;
    BT_GramAltin: TButton;
    TRA: TTrackBar;
    Button1: TButton;
    RESTResponse1: TRESTResponse;
    CB_ChartStil: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BT_Klik(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

const
  URL = 'https://doviz.com/api/v1/golds/gram-altin/archive?start=2018-01-01&end=2019-01-01;';

implementation

{$R *.dfm}

uses
  System.DateUtils;

procedure TForm3.FormCreate(Sender: TObject);
begin
  T1.DateTime := EncodeDateTime(2007,1,1,0,0,0,0);// IncMonth(Now, -1);
  T2.DateTime := now;
  BT_Klik(CB_ChartStil);
end;

procedure TForm3.BT_Klik(Sender: TObject);
var
  A       : Boolean;
  I       : Integer;
  JDATA   : TJSONValue; // Verinin tamamý
  JARAY   : TJSONArray; // Verideki bir tablo
  JVAL    : TJSONValue; // tablonun tek bir satýrý
  JPAR1   : TJSONPair;  // satýrýn tek bir sütun
  JPAR2   : TJSONPair;  // satýrýn tek bir sütun
  X       : Single;
  T       : String;
  Z       : TDateTime;
  RAWDATA : String;
begin
  A := False;
  if (Sender = CB_ChartStil) then begin
      case CB_ChartStil.ItemIndex of
          0: CART.Ayarlar.ChartType := wctCubuk;
          1: CART.Ayarlar.ChartType := wctCizgi;
      end;
      CART.Invalidate;
  end else
  if (Sender = TRA) then begin
      CART.Ayarlar.Cizgi_Kalinlik := TRA.Position;
      CART.Ayarlar.Cizgi_YariCap := CART.Ayarlar.Cizgi_Kalinlik * 0.5;
      CART.Invalidate;
  end else
  if (Sender = BT_Kur_ZamanAralikli) then begin
      A := True;
      T := Format('%s Kuru Zaman Aralýklý', [PB.Text]);
      Client.BaseURL := Format('https://doviz.com/api/v1/currencies/%s/archive?start=%s&end=%s',
                              [ PB.Text
                              , FormatDateTime('yyyy-mm-dd',T1.DateTime)
                              , FormatDateTime('yyyy-mm-dd',T2.DateTime)
                              ]);
  end else
  if (Sender = BT_GramAltin) then begin
      A := True;
      T := 'Gram Altýn Zaman Aralýklý';
      Client.BaseURL := Format('https://doviz.com/api/v1/golds/gram-altin/archive?start=%s&end=%s',
                              [ FormatDateTime('yyyy-mm-dd',T1.DateTime)
                              , FormatDateTime('yyyy-mm-dd',T2.DateTime)
                              ]);
  end else
  if (Sender = BT_Altin_Anlik) then begin
      A := True;
      T := 'Gram Altýn Anlýk';
      Client.BaseURL := Format('https://doviz.com/api/v1/golds/%s/daily', [ 'gram-altin' ]);
  end else
  if (Sender = BT_Kur_Anlik) then begin
      A := True;
      T := Format('%s Kuru Anlýk', [PB.Text]);
      Client.BaseURL := Format('https://doviz.com/api/v1/currencies/%s/daily', [ PB.Text ]);
  end else
  begin
    { Standart else sonu }
  end;
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (A = True) then begin
      CART.ClearItems;
      Request.Execute;
      JDATA := TJSONObject.ParseJSONValue(BytesOf( Response.Content ), 0);
      if (JDATA <> nil) then begin
          JARAY := JDATA as TJSONArray;
          for JVAL in JARAY do begin
              JPAR1 := (JVAL as TJSONObject).Get('selling');
              JPAR2 := (JVAL as TJSONObject).Get('update_date');
              X := StrToFloat(JPAR1.JsonValue.Value); // JPAR1.JsonValue.Value // JPAR2.JsonValue.Value
              Z := UnixToDateTime(JPAR2.JsonValue.Value.ToInteger div 1000);
              CART.Add( FormatDateTime('yyyy-mm-dd HH:MM', Z) , X / 100 );
          end;
      end;
      FreeAndNil(JDATA);
      X := CART.MinValue;
      for I := 0 to CART.ItemCount - 1 do begin
          CART.Item(I).Value := CART.Item(I).Value - X;
      end;
      CART.Header := Format('%s Grafiði', [T]);
      CART.Invalidate;
  end;
end;

end.
