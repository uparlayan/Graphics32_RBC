unit Currencies_;

interface

uses
  Generics.Collections, Rest.Json,
  System.JSON,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, GR32_Widgets_Chart, Vcl.ComCtrls, GR32_Widgets_Button,
  Vcl.ExtCtrls, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, GR32_Widgets_Statusbar, GR32_Widgets_Base,
  GR32_Widgets_Title;

type
  TCurrencies = class(TForm)
    WTT: TGR32WGHeader;
    GR32WidgetStatusBar1: TGR32WGStatusBar;
    Client: TRESTClient;
    Request: TRESTRequest;
    Response: TRESTResponse;
    CART: TGR32WGChart;
    BT_GOLD: TGR32WGButton;
    BT_EUR: TGR32WGButton;
    BT_USD: TGR32WGButton;
    TRA: TTrackBar;
    BT_Clear: TGR32WGButton;
    procedure BT_Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function CreateCurrencies(aOwner: TComponent): TCurrencies;
  end;

  // var Currencies: TCurrencies;

implementation

{$R *.dfm}

uses
  System.DateUtils;

class function TCurrencies.CreateCurrencies(aOwner: TComponent): TCurrencies;
begin
  Result := TCurrencies.Create(aOwner);
  Result.CART.ClearItems;
end;

procedure TCurrencies.BT_Click(Sender: TObject);
var
  A     : Boolean;
  I     : Integer;
  JDATA : TJSONValue; // Verinin tamamý
  JARAY : TJSONArray; // Verideki bir tablo
  JVAL  : TJSONValue; // tablonun tek bir satýrý
  JPAR1 : TJSONPair;  // satýrýn tek bir sütun
  JPAR2 : TJSONPair;  // satýrýn tek bir sütun
  X     : Single;
  T     : String;
  Z     : TDateTime;
begin
  if (Sender = WTT) then begin
      Close;
  end else
  if (Sender = BT_Clear) then begin
      CART.ClearItems;
      CART.Invalidate;
  end;


  A := False;
  if (Sender = TRA) then begin
      CART.Ayarlar.Cizgi_Kalinlik := TRA.Position;
      CART.Ayarlar.Cizgi_YariCap := CART.Ayarlar.Cizgi_Kalinlik * 0.5;
      CART.Invalidate;
  end else
  if (Sender = BT_GOLD) then begin
      A := True;
      T := 'Instant TRL/Gram Gold values';
      Client.BaseURL := Format('https://doviz.com/api/v1/golds/%s/daily', [ 'gram-altin' ]);
  end else
  if (Sender = BT_USD) then begin
      A := True;
      T := Format('Instant Currencies for TRL/%s values', [ 'USD' ]);
      Client.BaseURL := Format('https://doviz.com/api/v1/currencies/%s/daily', [ 'USD' ]);
  end else
  if (Sender = BT_EUR) then begin
      A := True;
      T := Format('Instant Currencies for TRL/%s values', [ 'EUR' ]);
      Client.BaseURL := Format('https://doviz.com/api/v1/currencies/%s/daily', [ 'EUR' ]);
  end else
  begin { Standart else sonu } end;
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
      CART.Header := T; // Format('%s', [T]);
      CART.Invalidate;
      WTT.HeaderRight := T;
  end;
end;

end.
