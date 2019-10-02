object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 421
  ClientWidth = 928
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 113
    Top = 0
    Width = 815
    Height = 421
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Grafik'
      object CART: TGR32WGChart
        Left = 0
        Top = 0
        Width = 807
        Height = 393
        Align = alClient
        AlphaBlend = 255
        Ayarlar.Background = clWindow
        Ayarlar.BackgroundHover = clWindow
        Ayarlar.BorderColor = clBtnShadow
        Ayarlar.BorderStyle = psSolid
        Ayarlar.BorderWidth = 0
        Ayarlar.ChartType = wctAlan
        Ayarlar.Cizgi_Cember = clRed
        Ayarlar.Cizgi_Dolgusu = clRed
        Ayarlar.Cizgi_Kalinlik = 1.000000000000000000
        Ayarlar.Cizgi_Renk = clRed
        Ayarlar.Cizgi_YariCap = 0.100000001490116100
        Ayarlar.Cizgi_CemberEkle = True
        Ayarlar.FrameBG = clWindow
        Ayarlar.FrameBGHover = clWindow
        Ayarlar.FrameColor = clWindowFrame
        Ayarlar.FrameStyle = psSolid
        Ayarlar.FrameWidth = 0
        Ayarlar.Header.Charset = DEFAULT_CHARSET
        Ayarlar.Header.Color = clHotLight
        Ayarlar.Header.Height = -15
        Ayarlar.Header.Name = 'Tahoma'
        Ayarlar.Header.Style = []
        Ayarlar.HeaderHeight = 30
        Ayarlar.HeaderPos = fpCenterCenter
        Ayarlar.Padding.Left = 5
        Ayarlar.Padding.Top = 5
        Ayarlar.Padding.Right = 5
        Ayarlar.Padding.Bottom = 5
        Ayarlar.LineColor = clBtnShadow
        Ayarlar.LineStyle = psDot
        Ayarlar.LineWidth = 1.000000000000000000
        Ayarlar.AralikDikey = 30
        Ayarlar.AralikYatay = 40
        Ayarlar.ChartAreaColor = 16764573
        Ayarlar.ChartAreaColorAlpha = 255
        Ayarlar.ShowValues = True
        Ayarlar.ShowValueType = svtEveryValue
        Ayarlar.AutoScroll = True
        Ayarlar.Axis.Charset = DEFAULT_CHARSET
        Ayarlar.Axis.Color = clHotLight
        Ayarlar.Axis.Height = -15
        Ayarlar.Axis.Name = 'Tahoma'
        Ayarlar.Axis.Style = []
        Ayarlar.AxisYCount = 10
        Ayarlar.AxisLineStyle = psSolid
        Ayarlar.AxisLineColor = clRed
        Ayarlar.AxisLineColorAlpha = 255
        Ayarlar.AxisTextPos = fpTopLeft
        Ayarlar.AxisYVisible = True
        AntiAliased = True
        Header = 'Gram Alt'#305'n Fiyatlar'#305
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 421
    Align = alLeft
    TabOrder = 1
    object BT_Altin_Anlik: TButton
      AlignWithMargins = True
      Left = 4
      Top = 37
      Width = 105
      Height = 27
      Align = alTop
      Caption = 'Anl'#305'k Gram Alt'#305'n'
      TabOrder = 0
      OnClick = BT_Klik
    end
    object BT_Kur_Anlik: TButton
      AlignWithMargins = True
      Left = 4
      Top = 70
      Width = 105
      Height = 27
      Align = alTop
      Caption = 'Anl'#305'k Kur'
      TabOrder = 1
      OnClick = BT_Klik
    end
    object PB: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 103
      Width = 105
      Height = 21
      Align = alTop
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'USD'
      Items.Strings = (
        'USD'
        'EUR'
        'GBP'
        'CHF'
        'CAD'
        'RUB'
        'AED'
        'AUD'
        'DKK'
        'SEK'
        'NOK'
        'JPY'
        'KWD'
        'ZAR'
        'BHD'
        'LYD'
        'SAR'
        'IQD'
        'ILS'
        'IRR'
        'INR'
        'MXN'
        'HUF'
        'NZD'
        'BRL'
        'IDR'
        'CSK'
        'PLN'
        'BGN'
        'RON'
        'CNY'
        'ARS'
        'ALL'
        'AZN'
        'BAM'
        'BYR'
        'CLP'
        'COP'
        'CRC'
        'DZD'
        'EGP'
        'HKD'
        'HRK'
        'ISK'
        'JOD'
        'KRW'
        'KZT'
        'LBP'
        'LKR'
        'LTL'
        'LVL'
        'MAD'
        'MDL'
        'MKD'
        'MYR'
        'OMR'
        'PEN'
        'PHP'
        'PKR'
        'QAR'
        'RSD'
        'SGD'
        'SYP'
        'THB'
        'TWD'
        'UAH'
        'UYU')
    end
    object BT_Kur_ZamanAralikli: TButton
      AlignWithMargins = True
      Left = 4
      Top = 130
      Width = 105
      Height = 22
      Align = alTop
      Caption = 'D'#246'nemlik Kur'
      TabOrder = 3
      OnClick = BT_Klik
    end
    object T1: TDateTimePicker
      AlignWithMargins = True
      Left = 4
      Top = 158
      Width = 105
      Height = 22
      Align = alTop
      Date = 43244.756359259260000000
      Time = 43244.756359259260000000
      TabOrder = 4
    end
    object T2: TDateTimePicker
      AlignWithMargins = True
      Left = 4
      Top = 186
      Width = 105
      Height = 22
      Align = alTop
      Date = 43244.756359259260000000
      Time = 43244.756359259260000000
      TabOrder = 5
    end
    object BT_GramAltin: TButton
      AlignWithMargins = True
      Left = 4
      Top = 214
      Width = 105
      Height = 22
      Align = alTop
      Caption = 'D'#246'nemlik Alt'#305'n'
      TabOrder = 6
      OnClick = BT_Klik
    end
    object TRA: TTrackBar
      Left = 1
      Top = 239
      Width = 111
      Height = 33
      Align = alTop
      Min = 1
      Position = 1
      TabOrder = 7
      OnChange = BT_Klik
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 105
      Height = 27
      Align = alTop
      Caption = #8364'/$ Anl'#305'k Parite'
      TabOrder = 8
      OnClick = BT_Klik
    end
    object CB_ChartStil: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 275
      Width = 105
      Height = 21
      Align = alTop
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 9
      Text = #199'izgi'
      OnChange = BT_Klik
      Items.Strings = (
        'Bar'
        #199'izgi')
    end
  end
  object Client: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 
      'https://doviz.com/api/v1/golds/gram-altin/archive?start=2018-01-' +
      '01&end=2019-01-01'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 682
    Top = 6
  end
  object Request: TRESTRequest
    Client = Client
    Params = <>
    Response = Response
    SynchronizedEvents = False
    Left = 710
    Top = 6
  end
  object Response: TRESTResponse
    ContentType = 'application/json'
    Left = 738
    Top = 6
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 738
    Top = 34
  end
end
