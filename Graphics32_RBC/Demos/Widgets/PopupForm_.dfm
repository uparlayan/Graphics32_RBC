object PopupForm: TPopupForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'PopupForm'
  ClientHeight = 304
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    482
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object GR32WidgetIzgara1: TGR32WidgetIzgara
    Left = 0
    Top = 43
    Width = 482
    Height = 221
    Align = alClient
    AralikDikey = 15
    AralikYatay = 15
    Background = clWindow
    BorderColor = 105180
    BorderStyle = psSolid
    BorderWidth = 1
    DamaModu = True
    LineColor = 13361128
    LineStyle = psDot
    LineWidth = 1
    LineView = wilTumu
  end
  object Panel2: TPanel
    Left = 0
    Top = 264
    Width = 482
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 396
      Top = 0
      Width = 46
      Height = 40
      Align = alRight
      Caption = 'Drag --->'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Button2: TButton
      Left = 442
      Top = 0
      Width = 40
      Height = 40
      Align = alRight
      Caption = '$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'UgurFonts'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnMouseDown = Button2MouseDown
    end
  end
  object WTT: TGR32WidgetTitle
    Left = 0
    Top = 0
    Width = 482
    Height = 43
    Align = alTop
    Ayarlar.Font.Charset = DEFAULT_CHARSET
    Ayarlar.Font.Color = clWindowText
    Ayarlar.Font.Height = -21
    Ayarlar.Font.Name = 'Trebuchet MS'
    Ayarlar.Font.Style = []
    Ayarlar.Icons.Charset = DEFAULT_CHARSET
    Ayarlar.Icons.Color = clWindowText
    Ayarlar.Icons.Height = -32
    Ayarlar.Icons.Name = 'UgurFonts'
    Ayarlar.Icons.Style = []
    Ayarlar.Gap = 0
    HeaderLeft = 'Demo'
    HeaderCenter = 'TForm'
    HeaderRight = 'Close'
    CloseChar = 'o'
    MenuChar = 'n'
    OnMenuClick = WTTMenuClick
    OnCloseClick = WTTCloseClick
  end
  object Edit1: TEdit
    Left = 20
    Top = 64
    Width = 403
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = 'Text'
  end
  object Button1: TButton
    Left = 425
    Top = 62
    Width = 34
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '+'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 20
    Top = 91
    Width = 439
    Height = 153
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
  end
end
