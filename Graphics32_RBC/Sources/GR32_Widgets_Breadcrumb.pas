{-----------------------------------------------------------------------------------
 Unit Name    : GR32_Widgets_Breadcrumb.pas                                        /
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

unit GR32_Widgets_Breadcrumb;

interface

uses
    GR32_Widgets_Base
  , GR32_Rubicube_Utils         //  Rubicube extensions
  , GR32                        //  TBitmap32
  , GR32_Polygons               //  Poligon hesaplama formülleri
  , System.Classes              //  TComponent
  , System.SysUtils             //  FreeAndNil
  , Vcl.Graphics                //  TColor
  , Vcl.Controls                //  TCustomControl
  , Vcl.Forms                   //
  , Winapi.Messages
  , Winapi.Windows              //  ReleaseCapture
  ;

type
  TGR32WGBreadcrumbItemClickEvent = procedure(Sender: TObject; aItemIndex: Integer) of object;
  TGR32WGBreadcrumbItem = class
    private
      Hovered : Boolean;
      Zone    : TRect;
    public
      Tag     : Single;
      Text    : String;
      Constructor Add(const aText: String; aTag: Single);
      procedure Edit(aText: String; aTag: Single);
      procedure SetZone(aRect: TRect);
  end;
  TGR32WGBreadcrumb = class(TGR32CustomWG)
    type
      TGR32WGBreadcrumbSettings = class(TPersistent)
        private
          FOwner          : TGR32WGBreadcrumb;
          FBackground     : TColor;
          FBackgroundHover: TColor;
          FBorderColor    : TColor;
          FBorderStyle    : TPenStyle;
          FBorderWidth    : Integer;
          FDelimiter      : String;
          FDelimiterFont  : TFont;
          FFont           : TFont;
          FFontHover      : TColor;
          FGap            : Integer;
          FItemHover      : TColor;
          procedure SetBackground(const Value: TColor);
          procedure SetBackgroundHover(const Value: TColor);
          procedure SetBorderColor(const Value: TColor);
          procedure SetBorderStyle(const Value: TPenStyle);
          procedure SetBorderWidth(const Value: Integer);
          procedure SetDelimiter(const Value: String);
          procedure SetDelimiterFont(const Value: TFont);
          procedure SetFont(const Value: TFont);
          procedure SetFontHover(const Value: TColor);
          procedure SetGap(const Value: Integer);
          procedure SetItemHover(const Value: TColor);
        protected
          procedure InlineChangeNotifier(Sender: TObject);
        public
          procedure Assign(Source: TPersistent); reintroduce;
          procedure AfterConstruction; override;
          procedure BeforeDestruction; override;
          procedure ResetSettings;
        published
          property Background       : TColor                read  FBackground         write SetBackground       ;
          property BackgroundHover  : TColor                read  FBackgroundHover    write SetBackgroundHover  ;
          property BorderColor      : TColor                read  FBorderColor        write SetBorderColor      ;
          property BorderStyle      : TPenStyle             read  FBorderStyle        write SetBorderStyle      ;
          property BorderWidth      : Integer               read  FBorderWidth        write SetBorderWidth      ;
          property Delimiter        : String                read  FDelimiter          write SetDelimiter        ;
          property DelimiterFont    : TFont                 read  FDelimiterFont      write SetDelimiterFont    ;
          property Font             : TFont                 read  FFont               write SetFont             ;
          property FontHover        : TColor                read  FFontHover          write SetFontHover        ;
          property Gap              : Integer               read  FGap                write SetGap              ;
          property ItemHover        : TColor                read  FItemHover          write SetItemHover        ;
      end;
    private
      FItems: TList;
      FAyarlar: TGR32WGBreadcrumbSettings;
      FOnItemClick: TGR32WGBreadcrumbItemClickEvent;
      procedure WMLMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WMMouseMove (var Message: TWMMouseMove); message WM_MOUSEMOVE;
      procedure SetAyarlar(const Value: TGR32WGBreadcrumbSettings); // Click olayları burada işlenir...
    protected
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure PaintControl; override;
      procedure DemoData;
      procedure Add(aText: string; aTag: Single);
      procedure Delete(aText: String); overload;
      procedure Delete(aTag: Single); overload;
      procedure Delete(aIndex: Integer); overload;
      procedure Edit(aIndex: Integer; aText: String; aTag: Single);
      procedure ClearItems;
      function ItemCount: Integer;
      function Item(aIndex: Integer): TGR32WGBreadcrumbItem;
      property Items: TList read FItems write FItems;
    published
      property Ayarlar: TGR32WGBreadcrumbSettings read FAyarlar write SetAyarlar;
      property Align;
      property Width;
      property Height;
      property Margins;
      property OnItemClick: TGR32WGBreadcrumbItemClickEvent read FOnItemClick write FOnItemClick;
  end;

procedure Register;

implementation

uses
    System.Math     //  Min
  ;

procedure Register;
begin
  RegisterComponents('Graphics32RBC', [TGR32WGBreadcrumb]);
end;

{ TGR32WGBreadcrumb }

procedure TGR32WGBreadcrumb.Add(aText: string; aTag: Single);
begin
  FItems.Add( TGR32WGBreadcrumbItem.Add(aText, aTag) );
  FBuffer.Font.Assign(Self.FAyarlar.FFont);
  TGR32WGBreadcrumbItem(FItems.Last).Zone.Width := FBuffer.TextWidth(aText);
  TGR32WGBreadcrumbItem(FItems.Last).Zone.Height:= FBuffer.TextHeight(aText);
  // Sort prosedürü eklenecek...
end;

procedure TGR32WGBreadcrumb.ClearItems;
begin
  FItems.Flush;
end;

constructor TGR32WGBreadcrumb.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAyarlar          := TGR32WGBreadcrumbSettings.Create;
  FAyarlar.FOwner   := Self;
  FItems            := TList.Create;
  DemoData;
end;

procedure TGR32WGBreadcrumb.Delete(aText: String);
var
  I: Integer;
begin
  for I := FItems.Count - 1 downto 0 do begin
      if (TGR32WGBreadcrumbItem(FItems[I]).Text = aText) then begin
          TGR32WGBreadcrumbItem(FItems[I]).Free;
          FItems.Delete(I);
      end;
  end;
end;

procedure TGR32WGBreadcrumb.Delete(aTag: Single);
var
  I: Integer;
begin
  for I := FItems.Count - 1 downto 0 do begin
      if (TGR32WGBreadcrumbItem(FItems[I]).Tag = aTag) then begin
          TGR32WGBreadcrumbItem(FItems[I]).Free;
          FItems.Delete(I);
      end;
  end;
end;

procedure TGR32WGBreadcrumb.Delete(aIndex: Integer);
begin
  if (aIndex > -1) and (aIndex < FItems.Count) then FItems.Delete(aIndex);
end;

procedure TGR32WGBreadcrumb.DemoData;
begin
  Self.FItems.Flush;
  Self.Add('Root',  0);
  Self.Add('Seeeeeeeeeeeeeettings',  1);
  Self.Add('System', 2);
  Self.Add('Desktop',  3);
end;

destructor TGR32WGBreadcrumb.Destroy;
begin
  FItems.Flush;
  FreeAndNil(FItems);
  FreeAndNil(FAyarlar);
  inherited Destroy;
end;

procedure TGR32WGBreadcrumb.Edit(aIndex: Integer; aText: String; aTag: Single);
begin
  if (aIndex < FItems.Count) and (aIndex > -1) then begin
      FBuffer.Font.Assign(Self.FAyarlar.FFont);
      with TGR32WGBreadcrumbItem(FItems[aIndex]) do begin
            Text  := aText;
            Tag   := aTag;
            Width := FBuffer.TextWidth(aText);
            Height:= FBuffer.TextHeight(aText);
      end;
  end;
end;

function TGR32WGBreadcrumb.Item(aIndex: Integer): TGR32WGBreadcrumbItem;
begin
  Result := TGR32WGBreadcrumbItem(FItems[aIndex]);
end;

function TGR32WGBreadcrumb.ItemCount: Integer;
begin
  Result := FItems.Count;
end;

procedure TGR32WGBreadcrumb.SetAyarlar(const Value: TGR32WGBreadcrumbSettings);
begin
  FAyarlar.Assign(Value); Invalidate;
end;

procedure TGR32WGBreadcrumb.WMLMouseDown(var Message: TWMLButtonDown);
var
  Fare: TPoint;
  I: Integer;
begin
  Fare := Self.ScreenToClient(Mouse.CursorPos);
  if (Assigned(FOnItemClick) = True) then begin
      for I := 0 to FItems.Count - 1 do begin
          if Item(I).Hovered = True then begin
              Item(I).Hovered := False;
              FOnItemClick(Self, I);
              Invalidate;
              Exit;
          end;
      end;
  end;
end;

procedure TGR32WGBreadcrumb.WMMouseMove(var Message: TWMMouseMove);
var
  Fare: TPoint;
  I: Integer;
  H: Boolean;
begin
  H := False;
  Fare := Self.ScreenToClient(Mouse.CursorPos);
  for I := 0 to FItems.Count - 1 do begin
      Item(I).Hovered := (PtInRect(Item(I).Zone, Fare) = True);
      if (Item(I).Hovered = True) then H := True;
  end;
  if H
  then Screen.Cursor := crHandPoint
  else Screen.Cursor := crDefault;

  Invalidate;
end;

procedure TGR32WGBreadcrumb.PaintControl;
var
  Ressam            : TPolygonRenderer32VPR;
  I                 : Integer;
  TL, TT, DW        : Integer;
  TR                : TRect;
  TmpFont           : TFont;
begin
  Resize;
  Ressam          := TPolygonRenderer32VPR.Create;
  Ressam.Filler   := nil;
  Ressam.FillMode := pfWinding;
  Ressam.Bitmap   := Self.FBuffer;

  if  (MouseIsInside = True)
  then Ressam.Bitmap.Clear( FAyarlar.BackgroundHover.ToColor32 )
  else Ressam.Bitmap.Clear( FAyarlar.Background.ToColor32 ); // Tuvalin zemin rengi ve tam temizlik
  FBuffer.Font.Assign(FAyarlar.FFont);

  // Dış Kenar
  Ressam.SekilBas(FAyarlar.FBorderColor.ToColor32, Ressam.DikDortgenCizgi(Merkez, Width, Height, FAyarlar.FBorderWidth, FAyarlar.FBorderStyle));
  //
  TL := 0 + FAyarlar.FGap + FAyarlar.BorderWidth;
  TT := 0 + FAyarlar.FGap + FAyarlar.BorderWidth;
  FBuffer.Font.Assign(FAyarlar.FDelimiterFont);
  DW := FBuffer.TextWidth(FAyarlar.Delimiter.Trim);
  FBuffer.Font.Assign(FAyarlar.FFont);

  TR := TRect.Create(TL, TT, 0, 0);
  TmpFont := TFont.Create;
  TmpFont.Assign(FAyarlar.FFont);
  TmpFont.Color := FAyarlar.FFontHover;

  for I := 0 to FItems.Count - 1 do begin
      // Kırıntıyı yazdır
      FBuffer.Font.Assign(FAyarlar.FFont);
      TR.Width := FBuffer.TextWidth(Item(I).Text.Trim);
      TR.Height:= FBuffer.TextHeight(Item(I).Text.Trim);

      if  (Item(I).Hovered = True)
      then Ressam.SekilBas(FAyarlar.FItemHover.ToColor32, Ressam.DikDortgen(TR.ToCenterPointFloat, TR.Width.ToSingle + (FAyarlar.FGap), Height.ToSingle - (FAyarlar.BorderWidth.ToSingle * 2)));

      Ressam.YaziBas(TR
                    , Item(I).Text.Trim
                    , iif ( Item(I).Hovered
                          , TmpFont
                          , FAyarlar.Font
                          )
                    , fpCenterCenter
                    );

      // Kırıntının ekran koordinatları kaydediliyor.
      Item(I).SetZone(TR);
      if (I < (FItems.Count - 1)) then begin
          // Ayracı yazdır
          TR.Left  := TR.Left + TR.Width;
          TR.Width := DW + (FAyarlar.FGap * 2);
          FBuffer.Font.Assign(FAyarlar.FDelimiterFont);
          Ressam.YaziBas(TR, FAyarlar.Delimiter.Trim, FAyarlar.DelimiterFont, fpCenterCenter);
          // Sonraki kırıntının başlangıcını belirle
          TR.Left  := TR.Left + TR.Width;
      end;
  end;

  FreeAndNil(TmpFont);
  Ressam.Free;
end;

{ TGR32WGBreadcrumbItem }

constructor TGR32WGBreadcrumbItem.Add(const aText: String; aTag: Single);
begin
  Text   := aText;
  Tag    := aTag;
  Zone   := TRect.Create(0,0,0,0);
  Hovered:= False;
end;

procedure TGR32WGBreadcrumbItem.Edit(aText: String; aTag: Single);
begin
  Self.Text := aText;
  Self.Tag := aTag;
end;

procedure TGR32WGBreadcrumbItem.SetZone(aRect: TRect);
begin
  Zone := aRect;
end;

{ TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings }

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.AfterConstruction;
begin
  inherited;
  FFont                   := TFont.Create;
  FFont.OnChange          := InlineChangeNotifier;
  FDelimiterFont          := TFont.Create;
  FDelimiterFont.OnChange := InlineChangeNotifier;
  ResetSettings;
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.Assign(Source: TPersistent);
var
  aSors: TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings;
begin
  if (Source is TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings) then begin
      aSors := TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings(Source);
      //FOwner      := BU KULLANILMAYACAK..
      FBackground       := aSors.Background     ;
      FBorderColor      := aSors.BorderColor    ;
      FBorderStyle      := aSors.BorderStyle    ;
      FBorderWidth      := aSors.BorderWidth    ;
      FFont             := aSors.Font           ;
  end else inherited;
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.BeforeDestruction;
begin
  FreeAndNil(FDelimiterFont);
  FreeAndNil(FFont);
  inherited;
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.InlineChangeNotifier(Sender: TObject);
begin
  // Persistent sýnýfýn alt type'lerinde bir deðiþiklik olduðunda ana sýnýfýn grafiðinin yeniden çizilmesini tetikler...
  // "Sender" parametresi bu noktada işimize yaramadıðı için prosedürü çağırırken NIL değerini vermekte herhangi bir sakınca yoktur.
  if Assigned(FOwner) then FOwner.Invalidate;
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.ResetSettings;
begin
  FBackground       := $004E3F3B;
  FBackgroundHover  := $005F4B47;
  FBorderColor      := $003D312E;
  FBorderStyle      := psSolid;
  FBorderWidth      := 1;
  FDelimiter        := '>';
  with  FDelimiterFont do begin
        Name  := 'Calibri';
        Size  := 11;
        Style := [];
        Color := clBlack;
  end;
  with  FFont do begin
        Name  := 'Calibri';
        Size  := 11;
        Style := [];
        Color := clWhite;
  end;
  FFontHover  := clYellow;
  FItemHover  := $00AC8C6C
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetBackground(const Value: TColor);
begin
  FBackground := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetBackgroundHover(const Value: TColor);
begin
  FBackgroundHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetBorderStyle(const Value: TPenStyle);
begin
  FBorderStyle := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetBorderWidth(const Value: Integer);
begin
  FBorderWidth := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetDelimiter(const Value: String);
begin
  FDelimiter := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetDelimiterFont(const Value: TFont);
begin
  FDelimiterFont.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetFont(const Value: TFont);
begin
  FFont.Assign(Value); InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetFontHover(const Value: TColor);
begin
  FFontHover := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetGap(const Value: Integer);
begin
  FGap := Value; InlineChangeNotifier(nil);
end;

procedure TGR32WGBreadcrumb.TGR32WGBreadcrumbSettings.SetItemHover(const Value: TColor);
begin
  FItemHover := Value; InlineChangeNotifier(nil);
end;

end.
