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
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 490
    Height = 217
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
    GradientEndColor = 105180
    GradientStartColor = 3391998
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
    Top = 247
    Width = 520
    Height = 25
    Align = alBottom
    Ayarlar.BorderWidth = 0
    Ayarlar.BracketWidth = 10
    Ayarlar.Font.Charset = DEFAULT_CHARSET
    Ayarlar.Font.Color = clWindowText
    Ayarlar.Font.Height = -11
    Ayarlar.Font.Name = 'Tahoma'
    Ayarlar.Font.Style = []
    FooterText = 'Statusbar'
  end
end
