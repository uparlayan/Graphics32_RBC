object DropDownForm: TDropDownForm
  Left = 0
  Top = 0
  Caption = 'DropDownForm'
  ClientHeight = 272
  ClientWidth = 520
  Color = clAppWorkSpace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object SG: TStringGrid
    Left = 0
    Top = 0
    Width = 520
    Height = 250
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alClient
    ColCount = 3
    DrawingStyle = gdsGradient
    FixedColor = clBtnShadow
    FixedCols = 0
    RowCount = 10
    GradientEndColor = 13681072
    GradientStartColor = 14800844
    TabOrder = 0
    ColWidths = (
      38
      307
      93)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object GR32WidgetStatusBar1: TGR32WidgetStatusBar
    Left = 0
    Top = 250
    Width = 520
    Height = 22
    Align = alBottom
    Ayarlar.Background = 14800844
    Ayarlar.BackgroundHover = 13681072
    Ayarlar.BorderColor = 12429457
    Ayarlar.BracketWidth = 20
    Ayarlar.Font.Charset = DEFAULT_CHARSET
    Ayarlar.Font.Color = 1
    Ayarlar.Font.Height = -11
    Ayarlar.Font.Name = 'Tahoma'
    Ayarlar.Font.Style = []
    Ayarlar.Gap = 4
    FooterText = 'StatusBar'
  end
end
