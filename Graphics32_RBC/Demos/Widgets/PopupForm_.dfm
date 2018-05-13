object PopupForm: TPopupForm
  Left = 0
  Top = 0
  Caption = 'PopupForm'
  ClientHeight = 272
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    440
    272)
  PixelsPerInch = 96
  TextHeight = 13
  object GR32WidgetIzgara1: TGR32WidgetIzgara
    Left = 0
    Top = 40
    Width = 440
    Height = 207
    Align = alClient
    AralikDikey = 15
    AralikYatay = 15
    Background = clWindow
    BorderColor = 105180
    BorderStyle = psSolid
    BorderWidth = 0
    DamaModu = True
    LineColor = 13361128
    LineStyle = psDot
    LineWidth = 1
    LineView = wilTumu
  end
  object WTT: TGR32WidgetTitle
    Left = 0
    Top = 0
    Width = 440
    Height = 40
    Align = alTop
    Ayarlar.BorderWidth = 0
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
    HeaderCenter = 'TForm'
    CloseChar = 'o'
    MenuChar = 'n'
    OnMenuClick = WTTMenuClick
    OnCloseClick = WTTCloseClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 49
    Width = 384
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'Text'
  end
  object Button1: TButton
    Left = 398
    Top = 49
    Width = 34
    Height = 26
    Anchors = [akTop, akRight]
    Caption = '+'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 81
    Width = 424
    Height = 156
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object GR32WidgetStatusBar1: TGR32WidgetStatusBar
    Left = 0
    Top = 247
    Width = 440
    Height = 25
    Align = alBottom
    Ayarlar.BorderWidth = 0
    Ayarlar.BracketWidth = 10
    Ayarlar.Font.Charset = DEFAULT_CHARSET
    Ayarlar.Font.Color = clWindowText
    Ayarlar.Font.Height = -11
    Ayarlar.Font.Name = 'Tahoma'
    Ayarlar.Font.Style = []
    Ayarlar.Gap = 4
    FooterText = 'StatusBar'
  end
end
