unit Class_Currency_;

interface

uses
    REST.Client
  ;

type
  TCurrency = class
    private
      FURL: String;
      Client: TRESTClient;
    public
      constructor Create(aURL: String); overload;
      property  URL: String read FURL write FURL;
      function fgc: string;
  end;

implementation

{ TCurrency }

constructor TCurrency.Create(aURL: String);
begin
  inherited Create;
  FURL := aURL;
  Client := TRESTClient.Create(aURL);
end;

function TCurrency.fgc: string;
begin
  //
end;

end.
