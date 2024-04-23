object Ana: TAna
  Left = 0
  Top = 0
  ActiveControl = TRA
  AlphaBlend = True
  BorderStyle = bsNone
  Caption = 'Ana'
  ClientHeight = 764
  ClientWidth = 1072
  Color = 14800844
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = PNL_2Resize
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 167
    Top = 61
    Width = 10
    Height = 676
    Color = 14800844
    ParentColor = False
    ResizeStyle = rsUpdate
    ExplicitLeft = 400
    ExplicitTop = 70
    ExplicitHeight = 638
  end
  object TTL: TGR32WGHeader
    Left = 0
    Top = 0
    Width = 1072
    Height = 61
    Align = alTop
    AlphaBlend = 255
    Ayarlar.Background = 4194432
    Ayarlar.BackgroundHover = 6756525
    Ayarlar.BorderColor = 4194432
    Ayarlar.Font.Charset = DEFAULT_CHARSET
    Ayarlar.Font.Color = clWhite
    Ayarlar.Font.Height = -21
    Ayarlar.Font.Name = 'Century Gothic'
    Ayarlar.Font.Style = []
    Ayarlar.Icons.Charset = DEFAULT_CHARSET
    Ayarlar.Icons.Color = clWhite
    Ayarlar.Icons.Height = -27
    Ayarlar.Icons.Name = 'UgurFonts'
    Ayarlar.Icons.Style = []
    Ayarlar.Gap = 0
    HeaderLeft = 'Rubicube'
    HeaderRight = 'Dashboard Example'
    CloseChar = 'K'
    MenuChar = 'J'
    OnMenuClick = TTLMenuClick
    OnCloseClick = TTLCloseClick
    OnDblClick = TTLDblClick
  end
  object FB: TGR32WGStatusBar
    Left = 0
    Top = 737
    Width = 1072
    Height = 27
    Align = alBottom
    AlphaBlend = 255
    Ayarlar.Background = 5127995
    Ayarlar.BackgroundHover = 6245191
    Ayarlar.BorderColor = clRed
    Ayarlar.BracketWidth = 15
    Ayarlar.Font.Charset = DEFAULT_CHARSET
    Ayarlar.Font.Color = clWhite
    Ayarlar.Font.Height = -17
    Ayarlar.Font.Name = 'Calibri'
    Ayarlar.Font.Style = []
    FooterText = 'Footer'
  end
  object Panel3: TPanel
    Left = 177
    Top = 61
    Width = 895
    Height = 676
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object CRUMB: TGR32WGBreadcrumb
      Left = 0
      Top = 0
      Width = 895
      Height = 40
      Align = alTop
      AlphaBlend = 255
      Ayarlar.Background = 14405569
      Ayarlar.BackgroundHover = 14405569
      Ayarlar.BorderColor = 13285804
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 1
      Ayarlar.Delimiter = 'z'
      Ayarlar.DelimiterFont.Charset = DEFAULT_CHARSET
      Ayarlar.DelimiterFont.Color = 12363414
      Ayarlar.DelimiterFont.Height = -16
      Ayarlar.DelimiterFont.Name = 'UgurFonts'
      Ayarlar.DelimiterFont.Style = []
      Ayarlar.Font.Charset = DEFAULT_CHARSET
      Ayarlar.Font.Color = clBlack
      Ayarlar.Font.Height = -13
      Ayarlar.Font.Name = 'Century Gothic'
      Ayarlar.Font.Style = []
      Ayarlar.FontHover = clYellow
      Ayarlar.Gap = 10
      Ayarlar.ItemHover = 5395168
      OnItemClick = CRUMBItemClick
    end
    object GP: TGridPanel
      Left = 0
      Top = 40
      Width = 895
      Height = 602
      Align = alClient
      BevelOuter = bvNone
      Color = 14800844
      ColumnCollection = <
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = GR32WidgetBox6
          Row = 0
        end
        item
          Column = 1
          ColumnSpan = 2
          Control = GR32WidgetBox3
          Row = 1
        end
        item
          Column = 1
          Control = CRC2
          Row = 2
          RowSpan = 2
        end
        item
          Column = 0
          Control = CRC1
          Row = 2
          RowSpan = 2
        end
        item
          Column = -1
          Row = -1
        end
        item
          Column = -1
          Row = -1
        end
        item
          Column = -1
          Row = -1
        end
        item
          Column = -1
          Row = 1
        end
        item
          Column = 2
          ColumnSpan = 2
          Control = PNL_2
          Row = 2
          RowSpan = 2
        end
        item
          Column = 0
          Control = GR32WidgetBar2
          Row = 1
        end
        item
          Column = 3
          Control = Panel2
          Row = 0
          RowSpan = 2
        end>
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 93.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 90.000000000000000000
        end
        item
          SizeStyle = ssAuto
        end>
      TabOrder = 1
      object GR32WidgetBox6: TGR32WGBox
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 651
        Height = 100
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        AlphaBlend = 255
        Ayarlar.Background = 16448250
        Ayarlar.BackgroundHover = clWhite
        Ayarlar.BorderColor = 13285804
        Ayarlar.BorderStyle = psSolid
        Ayarlar.BorderWidth = 1
        Ayarlar.FrameColor = 13285804
        Ayarlar.FrameStyle = psClear
        Ayarlar.FrameWidth = 0
        Ayarlar.Header.Charset = DEFAULT_CHARSET
        Ayarlar.Header.Color = 5653047
        Ayarlar.Header.Height = -67
        Ayarlar.Header.Name = 'Kenyan Coffee Rg'
        Ayarlar.Header.Style = []
        Ayarlar.HeaderPos = fpBottomRight
        Ayarlar.Footer.Charset = DEFAULT_CHARSET
        Ayarlar.Footer.Color = 5653047
        Ayarlar.Footer.Height = -40
        Ayarlar.Footer.Name = 'Rakesly Rg'
        Ayarlar.Footer.Style = []
        Ayarlar.FooterPos = fpTopLeft
        Ayarlar.Padding.Left = 10
        Ayarlar.Padding.Top = 10
        Ayarlar.Padding.Right = 10
        Ayarlar.Padding.Bottom = 10
        Ayarlar.Simge.Charset = DEFAULT_CHARSET
        Ayarlar.Simge.Color = 13285804
        Ayarlar.Simge.Height = -47
        Ayarlar.Simge.Name = 'UgurFonts'
        Ayarlar.Simge.Style = []
        Ayarlar.Filigran.Charset = DEFAULT_CHARSET
        Ayarlar.Filigran.Color = 14800844
        Ayarlar.Filigran.Height = -100
        Ayarlar.Filigran.Name = 'UgurFonts'
        Ayarlar.Filigran.Style = []
        Ayarlar.FiligranPos = fpTopRight
        Ayarlar.SimgeWidth = 60
        Ayarlar.SimgePos = fpCenterCenter
        HeaderText = '140 ad'
        FooterText = 'Requests'
        SimgeChar = '}'
        FiligranChar = 'z'
      end
      object GR32WidgetBox3: TGR32WGBox
        AlignWithMargins = True
        Left = 234
        Top = 130
        Width = 427
        Height = 73
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        AlphaBlend = 255
        Ayarlar.Background = 16448250
        Ayarlar.BackgroundHover = clWhite
        Ayarlar.BorderColor = 13285804
        Ayarlar.BorderStyle = psSolid
        Ayarlar.BorderWidth = 1
        Ayarlar.FrameColor = 13285804
        Ayarlar.FrameStyle = psClear
        Ayarlar.FrameWidth = 0
        Ayarlar.Header.Charset = DEFAULT_CHARSET
        Ayarlar.Header.Color = 5653047
        Ayarlar.Header.Height = -48
        Ayarlar.Header.Name = 'Steelfish Rg'
        Ayarlar.Header.Style = []
        Ayarlar.HeaderPos = fpTopLeft
        Ayarlar.Footer.Charset = DEFAULT_CHARSET
        Ayarlar.Footer.Color = 5653047
        Ayarlar.Footer.Height = -35
        Ayarlar.Footer.Name = 'Libel Suit Rg'
        Ayarlar.Footer.Style = []
        Ayarlar.FooterPos = fpBottomRight
        Ayarlar.Padding.Left = 10
        Ayarlar.Padding.Top = 10
        Ayarlar.Padding.Right = 10
        Ayarlar.Padding.Bottom = 10
        Ayarlar.Simge.Charset = DEFAULT_CHARSET
        Ayarlar.Simge.Color = 13285804
        Ayarlar.Simge.Height = -47
        Ayarlar.Simge.Name = 'UgurFonts'
        Ayarlar.Simge.Style = []
        Ayarlar.Filigran.Charset = DEFAULT_CHARSET
        Ayarlar.Filigran.Color = 14800844
        Ayarlar.Filigran.Height = -171
        Ayarlar.Filigran.Name = 'UgurFonts'
        Ayarlar.Filigran.Style = []
        Ayarlar.FiligranPos = fpTopRight
        Ayarlar.SimgeWidth = 60
        Ayarlar.SimgePos = fpCenterCenter
        HeaderText = '39143$'
        FooterText = 'Drop Down Form'
        SimgeChar = '#'
        FiligranChar = '#'
        OnClick = GR32WidgetBox3Click
      end
      object CRC2: TGR32WGCircle
        AlignWithMargins = True
        Left = 234
        Top = 223
        Width = 204
        Height = 369
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        AlphaBlend = 127
        Ayarlar.AntiAliased = True
        Ayarlar.Background = 16448250
        Ayarlar.BackgroundHover = clWhite
        Ayarlar.BorderColor = 13285804
        Ayarlar.BorderWidth = 1
        Ayarlar.DisplayFormat = '%%%D'
        Ayarlar.Font.Charset = DEFAULT_CHARSET
        Ayarlar.Font.Color = 5653047
        Ayarlar.Font.Height = -67
        Ayarlar.Font.Name = 'Droid'
        Ayarlar.Font.Style = []
        Ayarlar.FrameColor = clWindow
        Ayarlar.FrameWidth = 0
        Ayarlar.Header.Charset = DEFAULT_CHARSET
        Ayarlar.Header.Color = 5653047
        Ayarlar.Header.Height = -27
        Ayarlar.Header.Name = 'Rakesly Lt'
        Ayarlar.Header.Style = []
        Ayarlar.HeaderPos = fpCenterCenter
        Ayarlar.HeaderHeight = 50
        Ayarlar.Style = wgtPasta
        Ayarlar.StyleFill = wfsWinding
        Ayarlar.StyleLine = psSolid
        Ayarlar.BaseColor = 14057217
        Ayarlar.ValueColor = 3391998
        Ayarlar.InnerColor = clWindow
        Ayarlar.OuterColor = 14057217
        Ayarlar.IntraColor = 15460322
        Ayarlar.Padding.Left = 10
        Ayarlar.Padding.Top = 10
        Ayarlar.Padding.Right = 10
        Ayarlar.Padding.Bottom = 10
        Ayarlar.ValueOnInner = False
        Ayarlar.ValueOnOuter = False
        HeaderText = 'Process Percent'
        Yuzde = 10
      end
      object CRC1: TGR32WGCircle
        AlignWithMargins = True
        Left = 10
        Top = 223
        Width = 204
        Height = 369
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        AlphaBlend = 255
        Ayarlar.AntiAliased = True
        Ayarlar.Background = 16448250
        Ayarlar.BackgroundHover = clWhite
        Ayarlar.BorderColor = 13285804
        Ayarlar.BorderWidth = 1
        Ayarlar.DisplayFormat = '%D'
        Ayarlar.Font.Charset = DEFAULT_CHARSET
        Ayarlar.Font.Color = 10519147
        Ayarlar.Font.Height = -67
        Ayarlar.Font.Name = 'Droid'
        Ayarlar.Font.Style = []
        Ayarlar.FrameColor = 13285804
        Ayarlar.FrameWidth = 0
        Ayarlar.Header.Charset = DEFAULT_CHARSET
        Ayarlar.Header.Color = 5653047
        Ayarlar.Header.Height = -27
        Ayarlar.Header.Name = 'Rakesly Bk'
        Ayarlar.Header.Style = []
        Ayarlar.HeaderPos = fpCenterCenter
        Ayarlar.HeaderHeight = 50
        Ayarlar.Style = wgtDaire
        Ayarlar.StyleFill = wfsWinding
        Ayarlar.StyleLine = psSolid
        Ayarlar.BaseColor = 13285804
        Ayarlar.ValueColor = 14798444
        Ayarlar.InnerColor = 5387228
        Ayarlar.OuterColor = 14798444
        Ayarlar.IntraColor = clWindow
        Ayarlar.Padding.Left = 10
        Ayarlar.Padding.Top = 10
        Ayarlar.Padding.Right = 10
        Ayarlar.Padding.Bottom = 10
        Ayarlar.ValueOnInner = True
        Ayarlar.ValueOnOuter = True
        HeaderText = 'Mission Percent'
        Yuzde = 75
      end
      object PNL_2: TPanel
        Left = 448
        Top = 213
        Width = 447
        Height = 389
        Align = alClient
        BevelOuter = bvNone
        Color = 14800844
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        ParentBackground = False
        TabOrder = 4
        OnResize = PNL_2Resize
        object Image1: TImage
          Left = 10
          Top = 10
          Width = 269
          Height = 301
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000100
            0000010008060000005C72A866000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA86400
            00001874455874536F667477617265007061696E742E6E657420342E312E3564
            47585200001C6249444154785EEDDD8BF31E557907F0FC3342D5B694413A5E8A
            CD3088915B21680356698B2DE0902A2D1A44A472B1C1D21028092408840488D1
            C1D092A1622C21B4D25AA0026907946919A5D5162DD88AE12ED9EE7737FBCBB3
            FB7EF77E3BBBE7BB339F99E4F9BDEFBEBBE79C67DFDD73CEEEBB2C080299A9B5
            F706C1457705C1EA3B83E09C6D4170D6CD4170E6E620F8D08D41F05BD7A72186
            BFE135782DDE83F7621D769D322F34286E5BF78D383991ACD9441E1AB601DB82
            6DB2DB28D34083E2062415BE89576EE4C9E7326CF3F977E8C0E03A1A94715CB0
            639AC95E15F60DFB68F759C64583320C7CBBB344F109CAC096890C8B06A51F57
            ECE21D701243D9A08C6C9949BF6850BA830EB253496397622833949D2D4BE91E
            0D4A3B4AFA6EE960D01F1A94FAD0DB7DFA0DBC014B7750C61A59E80E0D4A75E7
            6EE30D55FA87B2B77521F5D1A0145BBF7BDEC3755383BA409DD83A926A6850B8
            4B76F20628EE401DD93A9362342869C978BD3AF6DC97D491E61754438312FBC3
            AD8B0D4CA6057568EB54D268D077EAD89B1F75187234E8AB3FDACE1B8FCC07EA
            D8D6B9EF68D037987ECA1A8BCC97A61CC768D0279ABCE32FD4BD6D0B3EA2411F
            B8F0300D7103DA826D1B3EA1C139D358BEE4F1710E010DCE956EC595326823B6
            CDCC1D0DCE8D7AF7A52E5F460B68704E34675F9A42DBB16D698E68700E2EFC0A
            AF5491BAD0966CDB9A131A9CBA559B78458A34853665DBD85CD0E054E1965056
            79225D99DB6DC734384578063DAB3091AEA1ADD9B637653438353AE597A1CDE5
            928006A744F7E8CB58D0F66C5B9C221A9C02DDC023AE98F28D4534E83A4DEC11
            D74C75E2100DBA4C37F1888B703930C59B8A68D055EAEC13D74DAD7390065DA4
            29BD3215539A424C83AE514FBF4CCD54460868D025AC7045A6C2B66517D1A02B
            58818A4C8D6DD3AEA14117B08214992ADBB65D4283636305283275B68DBB8206
            C7C40A4E642E6C5B77010D8E851598C8DCD8363F361A1C8386FAC4172E0D11D2
            E0D0F4E31CE21B577E94840687A4E9BDE22B17A60DD3E05074638FF86EEC1B88
            687008BAA5572436E6ADC434D8B7B5F7F28210F11572C2E6C85068B06FAC0044
            7C6773642834D8270DF775EF946BDF088EBFE4E9E0BDE7DE17BCF38C5B83238F
            FB5CF0ABC77C32F8A523560587BFFDB4E02D6F397EC961879F10C5DF7EF4EF47
            AFC16B7F7DE586E0DD1FB93358BEFA81E07D173F199C70D5F3F473BA8075E373
            DE71F2D5D136E0F3D8EB7C34C6F0200DF6E5CCCD7CC7A5BEE3D6EC8B921D498C
            A4B649DE05AC13097AC4F24F47C98ACFC201E6D80B1F890E361FB8F247C14957
            BF181D7CEC7621062B2E7B36DA467B50C28127FB3947ADB832F57EDF21476CCE
            F48D06FBA04EBFF6907C48C6ECB7FA941DF6D6938353D6BF46F7D75743760AD2
            60D7F48B3DCDE19419DFA0ECDB732E7419B068A85F20A2C1AEB11D946238CDC6
            E9F1E187BD9F26CD9CE032819581EF6C0EF58506BBA4997EF520F171BDCC1265
            AE7EE3ECBB6959F86E88998234D815FD447775E854C3F53D4B90B9C308042B13
            E9FFA7C969B02B6C87240D1D6048803E7AF2A7426700C56C4E758D06BBA0C778
            97C3301986DA5852F804F30258F948ACCFC78CD3605B1AF22B866F7D4CBE61C9
            E0230C6FB272924356DF196616C9B5B668B02DB603125BF1F9EFEB5B3F0365C2
            CA4AD26C8E758506DBD0A97F3E0C7761E20B4B025FA1EF233B9B50B83E2E0568
            B0A98BEEE21BEE3B34709DF27398CACCCA4C38E498CDB9B668B029B6C1BEC3BC
            78CCA7678DDF7798E4A41180FA6CCEB545834DE8E93E8B308DF797DF751E6DFC
            12C3FC07567692AFCBA708D160136C437D86BBE1DE76E4EFD0462F319C01A043
            540781FA6CEEB5418375A9E32F0DC93FE79B77BA86BB1B3514584F571D823458
            C715BBF806FA4AC9DF9CA604D783DCB3B9D8040DD6C136CC57B8E6D7697F3BB8
            11EAA475FB69F9CA229B8B4DD060559AF177087AFB35C1A71BE838EDF3B16473
            D2F6E121345815DB201F619C1FE3D9AC314B33B88CD20CC16A6C4ED64583559C
            B3956F8C8F7CBD8DB76FE81CD4D382CA21176D6ED6418355B00DF111A6F7B2C6
            2BDDC0D469DC35C9CA5E0EB1B959070D96D1B77F0C3DFE9ADBDF3F1D04CA353D
            0BA0C1326C037C83EB7ECDF21B0E0E02BA1C286673B42A1A2C82FB92D987FB06
            73D8594395FEA04F401D83F99A3C3380068BB00FF60D86A874EA3F0ECCB3D010
            613E9BAB55D0609E4B76F20FF58D6EED1D172EBDF463221C72D4E66C191ACCC3
            3ED037B871C5E70778BA0243AFAC7E24CC5492BB796890D1AFFBC434E6EF0EFD
            A00857E757856890D11D7F07AFFDF5EDEF0CF4C3E856E24575EE14A441867D90
            6F70B71A6B88321E3D528CB3B95B8406B3CEDDC63FC42718F7D76DBE6ED263C5
            1621676D0EE7A1C12CF601BEC1032B58E393F1617E80860617D91CCE4383D6BA
            6FF095FB469D7F6ED3A8C022E4AECD658606ADD36FE02BF78D4EFFDD877B3358
            DDF90AB96B7399A1418BADD837B81185353871CB512BAEA4F5E7339BCB0C0D26
            F4431FB1779E712B6D70E21E9D05A495CD0CA4C1C4A964853ED20F7B4C07A669
            B33AF41572D8E674160D26D80A7DA41B7FA60323027AA8689ACDE92C1A049DFE
            C7704AC91A9AB84B5384D38A7E4F900641A7FFB1E5AB1FA08D4CDC85478BB3BA
            F455D165000D025B918F34FD777A70BF061ED3CEEAD35736B72D1A5C7B2F5F89
            8F3401689A70E6C6EAD357C8699BE3898500ACDAC457E2239C4EB206266ED368
            401A72DAE6786221006C05BED2833FBBF1F18F7C2CFA3560F6B73EE0579A587D
            FACCE678622100ECCDBED26FFDB5B7FC3DA7052F3F7E5B70FFB6B5C1BB8F3E85
            BEA60FEA0748B3399E5808E8F7FED230AECC1A975477D3172E0A5EFB97AD9167
            F7DE189CBAE20CFABAAEE9B704D2D8EF08A6FE03EC8D3ED324A0768EF8951382
            FFF9C72F2D1D00E0C5EFDC1AAC39B7FF4B2B3D276091CD7548FD07D89B7CC61A
            965477FDA59F4A25BF75E7359F0BDEF6D615F47D6DA1BF411D818B6CAE43EA3F
            C0DEE433D6B8A41A5CEFFFEF23B7D0E44F3C7CD7BADEFA057477E0229BEB90FA
            CF053BF89B7CC61A965473CFA6CB69D267FDF7B7360767ADFC285D471B7A5EE0
            22E4B8CDF9D401404FFE5DC41A9694C3B01F4BF63C1825F8E2A72FA0EB6A0A23
            38AC4E7D967D6270EA00C0DEE03BD6B0241FAEBDD1F1876F7596E86570D680F7
            B375D785A738B13AF59DCD791D004AB08625C530DECF92BBAAEFDD777D70FCF2
            0FD275D781215C56A7BEB339BFF40F3DFC93630D4BF215F5FAD781CE435C46B0
            CFA883D5A9EFECC342970E00E7DFC15FEC3BD6A8843BE7C36747D7F22CA11BD9
            B735B8E1B235ADA610B33AF51D723DC9FBA503803A0039D6A864D1074FFC70E9
            905F537FBFFD8B8D870A599DFACE76042E1D00D80B4507802A4E3CEEB71766FB
            75ADE9146256A782FCD701A012D6A82CCC7367715FE09BBFEFE44FEC7F6C4BED
            29C4AC4E05F9AF034025AC51596898B84E657F9B3B4CDEE9EBB4BF489D29C4AC
            4E05F96F0E001A01C8C71A95651BE590F7BB8F0DDFC4B8A9C726E6901EFFABF5
            D16DC66CDB2C56A7726824203A00680A703ED6A82CDB28DB74564D050E725BAE
            BA38B5DF63C1A507DB468BD5A91C9A121C1D00CEDCCC5F24F50E0080CE2A5C17
            B3D74E1DBE7171F34E769FC7C4B6D362752A41809C5F3A00B017488C352A8B35
            4A8C85A35FA0AF5B5DC78053FE31AEF7CBB06DB5589D4A4C07800A58A3B258A3
            4C604A6B1F77B90D0953727169C3F6CF056C9B2D56A712D301A002D6A82CD628
            B330371E63E5ECFDAEC20D39388BC1D01BDB2757B06DB7589D4A4C07800A58A3
            B258A3647059803BDD5C3F1020F1715BEE5063FB6DB17DB0589D4A4C07800A58
            A3B258A32CB42F1E2DC0BC7997860D317A811B799ADEC63B16B62F16AB5389E9
            0050016B54166B945561C400A7D9639D15E000843E0A9C99747A13CF80D87E59
            AC4E25161D003409A8186B54166B944DA0C310070324649FA30758373E031397
            A6F66DCFB07DB4589D4A6CFDEEF00870C52EFE4789B14665B146D91686DB7099
            805372DC138FF1F7A6970B782FD68175619D63CEDEEB03DB678BD5A9C490FBCB
            F0DBE1EC8F12638DCA628DB20F485C9C25604401A7ECB80909498D0E3BC0D903
            62F866C76BF05A17C7EDBBC6EAC462752A31E4BE7E09A8046B54166B94BDDA77
            10FB9B87589D58AC4E2586DC5FF607B7F13F4A8C352A8B354A190EAB138BD5A9
            C490FBCBCEBA99FF5162AC5159AC51CA70589D58AC4E2586DCD78D40256C63C2
            58F955ABCF0BF66CF86CF0FDAFAD0D5EF8FA5FD04629C3411D3CB9FDCAA84E50
            37D9BB31599D4A0CB9BF6CD526FE478925897FD7DA4F05FBEFBF367879CFFA14
            D6286538D9FA401DA1AE920301AB538921F73509A804C6CCF12D936D6809D628
            6538AC4E007586BA63752A87E80050E0C6ED4FD06F7D8B354A190EAB9304EA0E
            75C8EA56623A00E4B8FCB6674A931F58A3EC02EEC2C39377F07011DCA003F837
            C6F95DBC430FDB846DCB6E2FF6A1CFED657562A10E5197AC8E450700EA639B7F
            1EBCF0B71B6983CA628DB22DDC2350747F00FE86D7B0F78E61CCED65759285BA
            449DB2BAF69D3A0189FBEFFE3A6D480C6B946D60C65F959B83F08C7C17A6F562
            1BAA3CAF1FFBD4C7F6B23A6150A7ACAE7D1675026A18300DDF14554EFD13AC51
            B681536696408C0B0FE71C7B7B599D30A8539D05A445C3809A089476CB971FA5
            0D280F6B946DD479A0285ECBD631A4B1B797D5491ED42DAB735F451381341538
            EDE17B76D2C6938735CA36EADC0A8CD7B2750C69ECED6575920775CBEADC57D1
            5460DD0C94F6A3DD5FA28D270F6B946DD44928F4B4B3750C69ECED6575920775
            CBEADC57D1CD40BA1D38ADCEF53FB046D9862E01EA6175920775CBEADC57D1ED
            C07A2048DAD807007502D6C3EA248F0E0069D10341F448B0B4B12F0130548667
            F1B304B2FA1A56AB0BDB5065D812FB34E63020E812202D7A24981E0A9A367627
            2068225075AC4EF2A813302D7A28A80E00695BBEFC086D3C7958A36C6D5FFCCD
            8A53665C370F39B5B6A9BCA9CB88F579A6C2EA240FEA96D5B9AF740020305984
            359E3CAC51CA70589DE4D144A0341D00728C391558EA6175C2682AF0221D0072
            E09B62CC9B81A43A562759BA1988D301A0C09F6FFB1E6D4C59AC51CA70589D64
            A12E591DFB6EE900A01B82383C4C8235288B354A190EAB134B0F04E190F34B07
            800B76F01749FC6090A2CB01D6286538AC4E0075A60781E443CE2F1D003419A8
            18AE1FF33A0659A394E164EB03B3FD5057BAE62F869C5F3A00007B91A4A15161
            2C19134A30AB0C8D8D354A190EEA0075813A41DD28F1AB49F25E07809658A394
            E1B03A917249DEEB00D0126B94321C5627522EC9FBA503C0A9E445528E354A19
            0EAB1329B67223F23F730038FF0EFE6229C61AA50CE3A57DB7D33A9162C8F524
            EF970E001A0968E6678F6FA78D53FAF7D3C776D03A9162C908002C1D0080BD58
            8AFDF89FBF4A1BA7F46CDFD6A8EC599D48319BF33A00B4F46FDFDEC51BA8F40E
            65CFEA448AD99C4F1D004EBF81BF41F27DFBC13DB4714AFF50F6AC4E241F72DC
            E67CEA00A00784D6B7EBBE7FA28DD355D9997359EC3DAE42D9B33A917CC8719B
            F3A90300B03749BECD3BBF4B1BA7AB5E79E8069AF880BFB1F7B80A65CFEA44F2
            D95C87D47F80BD49F25D7CFB73B4713AEB892D34F9017FA3EF7114CA9ED589E4
            B3B90EA9FF007B93E43BE3C6D769E3745A98E8F64C20FAE69F58F263140065CF
            EA44F2D95C87D47F40BF14549F460286A71180FA90DB36D721F59F047BB3E49B
            5A47E01CA803B03E9BE3898500B0374BBEAB76FC803652E90FCA9CD585E4B339
            9E5808C0AA4D7C05C2E15A14F3D2594395EEA1AC75FD5F0F72DAE6786221006B
            EFE52B917C9A10341C4D00AA0F396D733CB11048B095483E5D060C47A7FFF5D9
            DCB66810F47C807A566E7833BA3B8D35D83EBDFA9D5B82FDF75D17ECBFF7DAE0
            957FB889BEA64BF80C7C163E139FCD5ED3279431CA9AD58170C8659BDB160D82
            A605D7F7B5BF799436DA3EBDF4CDEB839FDF73CD92571FBD99BEAE0B58B7FD2C
            7C367B5D9FD4FB5F5F76FAAF458309B632C98707520EDD19983D00E09BB99749
            3DE13AB16EFB59431F0050B6E7DDF2222D7BC967733A8B0613BA0CA86FEF9EBF
            A38DB72FAF3E7C532A299712731F7F7D23E1BAB2071AE8F36C8341D9B232977C
            45A7FF4083095D06D4876FA8A1CF025E7E60C342724607812ECE04C275B0E47F
            E5C18DFCF53DD1B77F3397EC0C3399E47682062DB65229B6FB9B0FD146DC9BF0
            1B3A7B7A0E51475D8B6F69BC97ADB7F3338C0A74EDDF8CCD6586062D3D24A4BE
            DFDBFCF2F0CF0A24D7E8099C21D4E9B1C76BD95905E0337AE9632880B24499B2
            B2967CD9877F303468E961A1CDDCF6D7FF4A1B73AF724ED713F81BEEFC8BCE0A
            90C4F81687F0DF88E16F65EF1F3AF90165C9CA588AD9877FE6A1C12CB6722986
            B1EA51EE120C131AD7E72C81DB88AEF9073EED0794A1C6FD9BB1399C8706B3CE
            DDC63F408A8DD12198C8BB7EAFAB6D3F421B28BB4F6CF9292D5B29869CB5399C
            870619F621526EEC47866198B0E8B43E0FDE83F7B2750E45A7FECDD9DC2D4283
            0C7E4E887D90941B7A6E00155EBB631A2F3AF7F0AD8EE9BC49B227537BF1B768
            3AF108D7F929E1A5866EF869CEFEF457191A64D6EFE61F26E570EBAA9E1A541D
            CA4AB7FB36875CB5B95B8406F3B00F936A308CA55F112A8732D2849F766CCE96
            A1C13C9855C43E50AAF993DB9E1FE58EC1A9C0783FCA88959D545336F32F8B06
            8BB00F95EAD66CFB897E50944099A06C589949753657ABA0C122ABEFE41F2CD5
            A1A1EB4CE01024BF9EF1DF1E72D3E66A153458867DB8D483F16DF509C4D7FC1A
            EBEF86CDD1AA68B0CC395BF906483D787E80CFA303D87794012B1BA907396973
            B42A1AAC826D84D487E12E27E6090C0CFBACA1BEEED8DCAC8306ABD05940B730
            6370AC69C343C23EEA473DBBD5F4DB1F68B02AB631D21CAE85E77C49807DD3F5
            7EF76C4ED6458355E97704BB873BDF30077E4E6703E8E5C73EE9AEBEEEB1DFFB
            AB8306EB601B25EDA1736C0E7D03D80775F4F5C7E662133458C715BBF8864937
            70CA1C1D089E9CD6E421DCCCA3597DFD42EED95C6C8206EBD29D82DD3BF9BA20
            38EECF82E03D9F0D82753B83E0C01BAF04BFF8E1636E1F08C26D7BE3993DC181
            975E88B619DB8E7DC0BEB07D94E6EADCF15784069B601B29F52449FFAE8B82E0
            C8D541F06BE7C79E7A362CE16439702078F3F97F0F5E7FFA6E9E8423C0B6FCE2
            B9A7A28354B2609B93EDC7BE609F7430E84EB8D03CAC8B069B38EB66BEA152EE
            FD57C7DF9636E913C77E262C5DBB84078064C1B76DF4D08E31EEDFC77304C3CF
            C636E42DEF0BF729BB3FD847EC2BF69995859443AE850BCDC3BA68B029B6B1C2
            E19BF0D8CB83E01D7FBC9824D667B684259BB3BCFECCB78297F7AC8FEDBD2EFD
            C04F96B46D20E10F3E38149F957C2EB6216FC1B6B37D4A60DF51063A2BA8275C
            68FE3541834DE98744CA9DB83E08DE7B69101CF5099E1459DBF786259BB3A40E
            0059070F08D14121FCA646F2468F06C7C121FB70CF834F068E923C7C4DF4DAF0
            3DC9FB6DC267151D00B0ED6C9FB250162813940D2B3339A4E877FE9AA0C136D4
            21C8A171E79DE61779E8C9B0547396C203C0408A0E00D876B64F7992CB031D08
            B8AE3AFE2C1A6C8B6DBCAF707A8B6FB7BA899FF88F9F84259AB3B87E00C0B6B3
            7D2A83B24299E9D2202D5C68BEB541836DE9990187AEF19B267EE2A557C312CD
            595C3F0060DBD93E5585B2531F41ACC9BDFE55D060177CBE1438FEAAF2CEBDAA
            8A16D70F0058D83ED585B24499B2B2F6411FA7FE091AEC0ADB99394BAEF35923
            6EAA68C1C420969443C236E42DAFBFC1F7A9295FFB07C285E6571768B02B177E
            85EFD01C61924BD59EFD3A722F010E1C8826DFB0A41C12B6216FF9D94B7C9FDA
            4019E3B280D5C11C2187C285E6571768B04BAB36F11D9B0B5C9F62961B6BAC5D
            28EA047CF3FFFE8B26E590B00D794BD34EC02A50E673EF1B40EE840BCDABAED0
            60D7D8CECD01AE4BFBF8D6B78A86017116805FF361893988F0B3EDCCC4EC5277
            18B02E94FD9CFB06C285E6539768B06B73FC89719C86B246D9B5A28940585E7B
            E26E9E9C03C067172D552702B535C74B823ABFEED3060DF6612E0F0FE9FB943F
            AB682A309631FB018AAEFFB1944D05EED29C2E09DA3EE4A30E1AECCB999BF90E
            4F057AA0BB1ADEAB6AE166A0EC129E82473FFA4912B44FF8CCA2D37F2CEC66A0
            3EA16EA63E4A801C09179A3F7DA0C13E9D4A767A0A70F75ADFD7FB7952B70393
            658CE1C0A2E13F2CF676E021A18EA67AA72172235C68DEF48506FBC676DE65E8
            686A3BA3AF0D3C5CA37009BF895F7D743B4DD43EE0B3CABEFDB1CD6C5F8680BA
            9A62E760B8D07CE9130DF66D4A8F11C3F8FE98C90FCBC3EB5B4CAA295AF0149E
            571EDC4813B64BF80C7C56D1826DC536B37D190AEA0C75C7EAD4455D3CDEAB09
            1A1CC2143A05D18058E31A43D96800163C2988256D67F65E177D46D93254EF7F
            155338080CD9E99745834371F929422E253FA043ADE8C6A064890E0205F7EF37
            F6C0864AC98F6D1CBAF3AF8CCB07812E9FEED3040D0EC9C59982635FF3E7F9CB
            7BC212ABB060765E9723035857D18C3FBB601BD9B68FC9D53E812166FA95A1C1
            A1B974E7A0ABC90FE8E1FEEE7F86255661C1033A5F7F6A374DE83AB00EFBB0CF
            A205DB36D6484919D4A94BA3037DDEE157070D8EC185E1418C21BB9AFC89532E
            AB7629902CE8B08B0E04752E0BC2D746895FD2D967176C13B68D6DB32B707072
            619EC018C37D7968702CACB086825964434FF269EA829BC2D22A19865B5A0EBE
            2EFA5D81E79E8A121BC3784BCFFA0B45CF0D0C63F81B5E53F51B7F69093F03DB
            C4B6D535A8E3B1670C860B6DFF63A0C131B1021BC290D37BBBF0851D616939B2
            605BD836BA0A75CDDAC010C285B6FBB1D0E0D858C1F509CF9F630DC575D141A0
            EA99401F4BF8D9534BFE04EA9CB5853E850B6DEF63A24117B002EC033AFD5803
            990A9C7AD7E913E86AC1674EE5B43FCF902303E142DBF9D868D015AC20BB840E
            21577BADEB40E75BD5D1812E96A77F18042BAFE4DB322543750A860B6DDF2EA0
            4197B002EDCAD4AEFB8BA031630CBE6CCA709B05EBC667CCE1A099E8BB3F205C
            68BB76050DBAA68F21C2A11EE83134CCC2C354DC2E2F0BB02EACD3B5197E5DE9
            E381222E0DF515A14117753959680AE3FD6DE1661CDC9157762B71D182F7621D
            63DFD8D337B4852E2F055C99E453050DBAAAAB69C3733AF5AF020F15C1D379F0
            2D8EE7F4FDE0C7F1137B714A0FF83762F81B5E83D7E23D6C5D73D5D5A5800BD3
            7BEBA04197B5BD8168EABDFED29FB6A30263DFD8D3040DBAAECDADC45399ED27
            C343DB606DA68A316FE96D8306A7A0C94345E6DAF127DD69D22138D6C33CBA40
            835352758400F3BFE7347C25FD401BA97AAFC0547AFA8BD0E0D454E91CD4B7BF
            5455E52C606A9D7D7968708ACEBF835714E8DB5FEA283B0B405BB36D6FCA6870
            AAF06B2AACC2F4ED2F75E59D050CF58B3D43A1C1A9CB5E12A8E75FEACA8E08CC
            E5943F8B06E720F969728DFB4B53C9BC80BE7FA27B4C343827C7CC74FEBAF4EF
            988BC31644DAD49CD0E0DC7CC8B1477C8BFBD0666C1B9A2B1A9CABA335122025
            D0466C9B993B1A9CB3B3D7F38A1741DBB06DC50734E883DF5CC31B81F8076DC1
            B60D9FD0A02FAED9199FF2B14621F387BA471BB06DC23734E89B8F6FE40D44E6
            0B756EDB80AF68D0571A2D983F5F7AF7ABA241DF9DF479DE7864BA50A7B68E25
            4683123BF14F796392E9401DDA3A95341A94B4D366F00C7CDFA0CE6C1D0A4783
            C2A9B3D07DEADCAB8706A5D8A5B76BF8D025A80BD489AD23A98606A53A75188E
            471D7BEDD1A0D4B7E6569D150C01658CB2B6652FCDD1A0B4F3BBD7CCFF978786
            84B24499DA32966ED0A074E7A3EB743068026586B2B36529DDA341E9077AA875
            99900F65A35EFC61D1A0F40F37A1687E415C06BEDF9033261A94E12109CE0A4F
            79E77C86807DC369BD12DE1D34286E406F37BE21A7D887806DC6B6ABC7DE6D34
            28EEDAB02B4E2A9C2DB8F050136C03B605DB846DB3DB2AEEA34199369C626366
            1C92128FB9C2373126CD2059C19E51E0DF38354FFE869B67F05ABC07EFC53AB0
            2E9DB6CF51B0ECFF01A1C6569A94B2EAAE0000000049454E44AE426082}
        end
        object Splitter2: TSplitter
          Left = 10
          Top = 159
          Width = 427
          Height = 6
          Cursor = crVSplit
          Align = alTop
          ExplicitWidth = 451
        end
        object Splitter3: TSplitter
          Left = 10
          Top = 268
          Width = 427
          Height = 6
          Cursor = crVSplit
          Align = alBottom
          ExplicitTop = 306
          ExplicitWidth = 451
        end
        object BRO: TGR32WGChart
          Left = 10
          Top = 10
          Width = 427
          Height = 149
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alTop
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = 16448250
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 1
          Ayarlar.ChartType = wctAlan
          Ayarlar.Cizgi_Cember = clWindow
          Ayarlar.Cizgi_Dolgusu = 14057217
          Ayarlar.Cizgi_Kalinlik = 2.000000000000000000
          Ayarlar.Cizgi_Renk = 14057217
          Ayarlar.Cizgi_YariCap = 5.000000000000000000
          Ayarlar.Cizgi_CemberEkle = True
          Ayarlar.FrameBG = 16448250
          Ayarlar.FrameBGHover = 16448250
          Ayarlar.FrameColor = 14057217
          Ayarlar.FrameStyle = psSolid
          Ayarlar.FrameWidth = 0
          Ayarlar.Header.Charset = DEFAULT_CHARSET
          Ayarlar.Header.Color = 5653047
          Ayarlar.Header.Height = -27
          Ayarlar.Header.Name = 'Rakesly Ul'
          Ayarlar.Header.Style = [fsBold]
          Ayarlar.HeaderHeight = 40
          Ayarlar.HeaderPos = fpCenterLeft
          Ayarlar.Padding.Left = 20
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 20
          Ayarlar.Padding.Bottom = 10
          Ayarlar.LineColor = clSilver
          Ayarlar.LineStyle = psSolid
          Ayarlar.LineWidth = 1.000000000000000000
          Ayarlar.AralikDikey = 30
          Ayarlar.AralikYatay = 40
          Ayarlar.ChartAreaColor = 13285804
          Ayarlar.ChartAreaColorAlpha = 172
          Ayarlar.ShowValues = True
          Ayarlar.ShowValueType = svtPick
          Ayarlar.AutoScroll = True
          Ayarlar.Axis.Charset = DEFAULT_CHARSET
          Ayarlar.Axis.Color = clHotLight
          Ayarlar.Axis.Height = -11
          Ayarlar.Axis.Name = 'Tahoma'
          Ayarlar.Axis.Style = []
          Ayarlar.AxisYCount = 9
          Ayarlar.AxisLineStyle = psSolid
          Ayarlar.AxisLineColor = clRed
          Ayarlar.AxisLineColorAlpha = 255
          Ayarlar.AxisTextPos = fpTopRight
          Ayarlar.AxisYVisible = False
          AntiAliased = False
          Header = 'Incoming Invoices Graphs'
        end
        object GRO: TGR32WGChart
          Left = 10
          Top = 165
          Width = 427
          Height = 103
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = clWhite
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 1
          Ayarlar.ChartType = wctCizgi
          Ayarlar.Cizgi_Cember = 12400043
          Ayarlar.Cizgi_Dolgusu = clWindow
          Ayarlar.Cizgi_Kalinlik = 6.000000000000000000
          Ayarlar.Cizgi_Renk = 12400043
          Ayarlar.Cizgi_YariCap = 3.000000000000000000
          Ayarlar.Cizgi_CemberEkle = True
          Ayarlar.FrameBG = 16448250
          Ayarlar.FrameBGHover = clWhite
          Ayarlar.FrameColor = 13285804
          Ayarlar.FrameStyle = psSolid
          Ayarlar.FrameWidth = 0
          Ayarlar.Header.Charset = DEFAULT_CHARSET
          Ayarlar.Header.Color = 5653047
          Ayarlar.Header.Height = -27
          Ayarlar.Header.Name = 'Zekton Rg'
          Ayarlar.Header.Style = []
          Ayarlar.HeaderHeight = 40
          Ayarlar.HeaderPos = fpCenterRight
          Ayarlar.Padding.Left = 20
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 20
          Ayarlar.Padding.Bottom = 10
          Ayarlar.LineColor = 13879393
          Ayarlar.LineStyle = psDot
          Ayarlar.LineWidth = 1.000000000000000000
          Ayarlar.AralikDikey = 30
          Ayarlar.AralikYatay = 40
          Ayarlar.ChartAreaColor = clBlack
          Ayarlar.ChartAreaColorAlpha = 255
          Ayarlar.ShowValues = True
          Ayarlar.ShowValueType = svtEveryValue
          Ayarlar.AutoScroll = True
          Ayarlar.Axis.Charset = DEFAULT_CHARSET
          Ayarlar.Axis.Color = clHotLight
          Ayarlar.Axis.Height = -11
          Ayarlar.Axis.Name = 'Tahoma'
          Ayarlar.Axis.Style = []
          Ayarlar.AxisYCount = 9
          Ayarlar.AxisLineStyle = psSolid
          Ayarlar.AxisLineColor = clRed
          Ayarlar.AxisLineColorAlpha = 255
          Ayarlar.AxisTextPos = fpTopRight
          Ayarlar.AxisYVisible = False
          AntiAliased = False
          Header = 'Sales Graph'
        end
        object KRO: TGR32WGChart
          Left = 10
          Top = 274
          Width = 427
          Height = 105
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alBottom
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = clWhite
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 1
          Ayarlar.ChartType = wctCubuk
          Ayarlar.Cizgi_Cember = 12400043
          Ayarlar.Cizgi_Dolgusu = 13720770
          Ayarlar.Cizgi_Kalinlik = 1.000000000000000000
          Ayarlar.Cizgi_Renk = 12400043
          Ayarlar.Cizgi_YariCap = 3.000000000000000000
          Ayarlar.Cizgi_CemberEkle = True
          Ayarlar.FrameBG = 16448250
          Ayarlar.FrameBGHover = clWhite
          Ayarlar.FrameColor = 13285804
          Ayarlar.FrameStyle = psSolid
          Ayarlar.FrameWidth = 0
          Ayarlar.Header.Charset = DEFAULT_CHARSET
          Ayarlar.Header.Color = 5653047
          Ayarlar.Header.Height = -27
          Ayarlar.Header.Name = 'Zekton Rg'
          Ayarlar.Header.Style = []
          Ayarlar.HeaderHeight = 40
          Ayarlar.HeaderPos = fpCenterRight
          Ayarlar.Padding.Left = 20
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 20
          Ayarlar.Padding.Bottom = 10
          Ayarlar.LineColor = 13879393
          Ayarlar.LineStyle = psDot
          Ayarlar.LineWidth = 1.000000000000000000
          Ayarlar.AralikDikey = 30
          Ayarlar.AralikYatay = 40
          Ayarlar.ChartAreaColor = clBlack
          Ayarlar.ChartAreaColorAlpha = 255
          Ayarlar.ShowValues = True
          Ayarlar.ShowValueType = svtEveryValue
          Ayarlar.AutoScroll = True
          Ayarlar.Axis.Charset = DEFAULT_CHARSET
          Ayarlar.Axis.Color = clHotLight
          Ayarlar.Axis.Height = -11
          Ayarlar.Axis.Name = 'Tahoma'
          Ayarlar.Axis.Style = []
          Ayarlar.AxisYCount = 9
          Ayarlar.AxisLineStyle = psSolid
          Ayarlar.AxisLineColor = clRed
          Ayarlar.AxisLineColorAlpha = 255
          Ayarlar.AxisTextPos = fpTopRight
          Ayarlar.AxisYVisible = False
          AntiAliased = False
          Header = 'Sales Graph'
        end
      end
      object GR32WidgetBar2: TGR32WGBar
        AlignWithMargins = True
        Left = 10
        Top = 130
        Width = 204
        Height = 73
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        AlphaBlend = 255
        Ayarlar.Background = 16448250
        Ayarlar.BackgroundHover = clWhite
        Ayarlar.BarColor = 14734538
        Ayarlar.BorderColor = 13285804
        Ayarlar.BorderStyle = psSolid
        Ayarlar.BorderWidth = 1
        Ayarlar.DisplayFormat = '%%%D'
        Ayarlar.Font.Charset = DEFAULT_CHARSET
        Ayarlar.Font.Color = 5653047
        Ayarlar.Font.Height = -32
        Ayarlar.Font.Name = 'Rakesly Rg'
        Ayarlar.Font.Style = []
        Ayarlar.HeaderHeight = 40
        Ayarlar.Invert = False
        Ayarlar.Padding.Left = 10
        Ayarlar.Padding.Top = 10
        Ayarlar.Padding.Right = 10
        Ayarlar.Padding.Bottom = 10
        Ayarlar.ValueColor = 12400043
        Header = 'Popup Form'
        Yuzde = 25
        OnClick = GR32WidgetBar2Click
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 681
        Top = 10
        Width = 204
        Height = 193
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        Color = 16448250
        ParentBackground = False
        TabOrder = 6
        object GR32WidgetBar4: TGR32WGBar
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 200
          Height = 48
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = clWhite
          Ayarlar.BarColor = 14734538
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 0
          Ayarlar.DisplayFormat = '%%%D'
          Ayarlar.Font.Charset = DEFAULT_CHARSET
          Ayarlar.Font.Color = 5653047
          Ayarlar.Font.Height = -17
          Ayarlar.Font.Name = 'Rakesly Bk'
          Ayarlar.Font.Style = []
          Ayarlar.HeaderHeight = 20
          Ayarlar.Invert = False
          Ayarlar.Padding.Left = 10
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 10
          Ayarlar.Padding.Bottom = 10
          Ayarlar.ValueColor = 37119
          Header = 'Inquiries'
          Yuzde = 25
        end
        object GR32WidgetBar5: TGR32WGBar
          AlignWithMargins = True
          Left = 0
          Top = 48
          Width = 200
          Height = 48
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = clWhite
          Ayarlar.BarColor = 14734538
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 0
          Ayarlar.DisplayFormat = '%%%D'
          Ayarlar.Font.Charset = DEFAULT_CHARSET
          Ayarlar.Font.Color = 5653047
          Ayarlar.Font.Height = -17
          Ayarlar.Font.Name = 'Rakesly El'
          Ayarlar.Font.Style = []
          Ayarlar.HeaderHeight = 20
          Ayarlar.Invert = True
          Ayarlar.Padding.Left = 10
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 10
          Ayarlar.Padding.Bottom = 10
          Ayarlar.ValueColor = 1616246
          Header = 'Purchase Orders'
          Yuzde = 25
        end
        object GR32WidgetBar6: TGR32WGBar
          AlignWithMargins = True
          Left = 0
          Top = 96
          Width = 200
          Height = 48
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = clWhite
          Ayarlar.BarColor = 14734538
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 0
          Ayarlar.DisplayFormat = '%%%D'
          Ayarlar.Font.Charset = DEFAULT_CHARSET
          Ayarlar.Font.Color = 5653047
          Ayarlar.Font.Height = -17
          Ayarlar.Font.Name = 'Rakesly Lt'
          Ayarlar.Font.Style = []
          Ayarlar.HeaderHeight = 20
          Ayarlar.Invert = True
          Ayarlar.Padding.Left = 10
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 10
          Ayarlar.Padding.Bottom = 10
          Ayarlar.ValueColor = 5387228
          Header = 'Proformas'
          Yuzde = 25
        end
        object GR32WidgetBar7: TGR32WGBar
          AlignWithMargins = True
          Left = 0
          Top = 144
          Width = 200
          Height = 48
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          AlphaBlend = 255
          Ayarlar.Background = 16448250
          Ayarlar.BackgroundHover = clWhite
          Ayarlar.BarColor = 14734538
          Ayarlar.BorderColor = 13285804
          Ayarlar.BorderStyle = psSolid
          Ayarlar.BorderWidth = 0
          Ayarlar.DisplayFormat = '%%%D'
          Ayarlar.Font.Charset = DEFAULT_CHARSET
          Ayarlar.Font.Color = 5653047
          Ayarlar.Font.Height = -17
          Ayarlar.Font.Name = 'Rakesly Ul'
          Ayarlar.Font.Style = []
          Ayarlar.HeaderHeight = 20
          Ayarlar.Invert = False
          Ayarlar.Padding.Left = 10
          Ayarlar.Padding.Top = 10
          Ayarlar.Padding.Right = 10
          Ayarlar.Padding.Bottom = 10
          Ayarlar.ValueColor = 5387228
          Header = 'Taxes'
          Yuzde = 25
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 642
      Width = 895
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      Color = 14405569
      ParentBackground = False
      TabOrder = 2
      object TRA: TTrackBar
        Left = 695
        Top = 0
        Width = 200
        Height = 34
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alRight
        Max = 100
        Position = 66
        TabOrder = 0
        OnChange = TRAChange
      end
      object FREQ: TTrackBar
        Left = 0
        Top = 0
        Width = 200
        Height = 34
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Max = 1000
        Min = 1
        ParentShowHint = False
        Position = 50
        PositionToolTip = ptRight
        ShowHint = True
        TabOrder = 1
        OnChange = FREQChange
      end
      object ALF: TTrackBar
        Left = 200
        Top = 0
        Width = 200
        Height = 34
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Max = 255
        Min = 1
        ParentShowHint = False
        Position = 255
        PositionToolTip = ptRight
        ShowHint = True
        TabOrder = 2
        OnChange = ALFChange
      end
      object FAL: TTrackBar
        Left = 400
        Top = 0
        Width = 200
        Height = 34
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Max = 255
        Min = 1
        ParentShowHint = False
        Position = 255
        PositionToolTip = ptRight
        ShowHint = True
        TabOrder = 3
        OnChange = FALChange
      end
      object CX_Form: TCheckBox
        Left = 600
        Top = 0
        Width = 47
        Height = 34
        Align = alLeft
        Caption = 'Form'
        TabOrder = 4
      end
      object CX_Graf: TCheckBox
        Left = 647
        Top = 0
        Width = 60
        Height = 34
        Align = alLeft
        Caption = 'Grafikler'
        TabOrder = 5
      end
    end
  end
  object Menu: TScrollBox
    Left = 0
    Top = 61
    Width = 167
    Height = 676
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = 6113589
    ParentColor = False
    TabOrder = 3
    object Panel4: TPanel
      Left = 0
      Top = 49
      Width = 167
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object GR32WidgetButton2: TGR32WGButton
        Left = 0
        Top = 0
        Width = 50
        Height = 50
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        AlphaBlend = 255
        OnClick = BT_AnimasyonClick
        Background = 6113589
        BorderColor = clBtnShadow
        BorderWidth = 0
        ButtonColor = 14057217
        ButtonHover = 5387228
        ButtonChecked = clWhite
        ButtonStyle = wbsDaire
        ButtonType = wbtNormal
        ButtonText = 'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'UgurFonts'
        Font.Style = []
        FontHover = clLime
        FontChecked = clYellow
        Symbol = #0
        SymbolFont.Charset = DEFAULT_CHARSET
        SymbolFont.Color = clWindowText
        SymbolFont.Height = -11
        SymbolFont.Name = 'Tahoma'
        SymbolFont.Style = []
        SymbolHover = clBlack
        SymbolChecked = clBlack
        SymbolPos = wgpNone
        SymbolGap = 0
      end
      object GR32WidgetButton1: TGR32WGButton
        Left = 117
        Top = 0
        Width = 50
        Height = 50
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alRight
        AlphaBlend = 255
        OnClick = BT_AnimasyonClick
        Background = 6113589
        BorderColor = clBtnShadow
        BorderWidth = 0
        ButtonColor = 14057217
        ButtonHover = 5387228
        ButtonChecked = 1616246
        ButtonStyle = wbsDiktortgen
        ButtonType = wbtIsaretli
        ButtonText = 'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'UgurFonts'
        Font.Style = []
        FontHover = clLime
        FontChecked = clYellow
        Symbol = #0
        SymbolFont.Charset = DEFAULT_CHARSET
        SymbolFont.Color = clWindowText
        SymbolFont.Height = -11
        SymbolFont.Name = 'Tahoma'
        SymbolFont.Style = []
        SymbolHover = clBlack
        SymbolChecked = clBlack
        SymbolPos = wgpNone
        SymbolGap = 0
      end
    end
    object BT_Currencies: TGR32WGBox
      Tag = 1
      Left = 0
      Top = 99
      Width = 167
      Height = 50
      Align = alTop
      AlphaBlend = 255
      OnMouseEnter = BT_CurrenciesMouseEnter
      OnMouseLeave = BT_CurrenciesMouseLeave
      Ayarlar.Background = 6113589
      Ayarlar.BackgroundHover = 103377
      Ayarlar.BorderColor = 6113589
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 0
      Ayarlar.FrameColor = 6113589
      Ayarlar.FrameStyle = psSolid
      Ayarlar.FrameWidth = 0
      Ayarlar.Header.Charset = DEFAULT_CHARSET
      Ayarlar.Header.Color = clSilver
      Ayarlar.Header.Height = -21
      Ayarlar.Header.Name = 'Rakesly Lt'
      Ayarlar.Header.Style = []
      Ayarlar.HeaderPos = fpCenterLeft
      Ayarlar.Footer.Charset = DEFAULT_CHARSET
      Ayarlar.Footer.Color = 5653047
      Ayarlar.Footer.Height = -19
      Ayarlar.Footer.Name = 'Libel Suit Rg'
      Ayarlar.Footer.Style = []
      Ayarlar.FooterPos = fpCenterRight
      Ayarlar.Padding.Left = 5
      Ayarlar.Padding.Top = 5
      Ayarlar.Padding.Right = 5
      Ayarlar.Padding.Bottom = 5
      Ayarlar.Simge.Charset = DEFAULT_CHARSET
      Ayarlar.Simge.Color = clWhite
      Ayarlar.Simge.Height = -32
      Ayarlar.Simge.Name = 'UgurFonts'
      Ayarlar.Simge.Style = []
      Ayarlar.Filigran.Charset = DEFAULT_CHARSET
      Ayarlar.Filigran.Color = 14734538
      Ayarlar.Filigran.Height = -171
      Ayarlar.Filigran.Name = 'UgurFonts'
      Ayarlar.Filigran.Style = []
      Ayarlar.FiligranPos = fpTopRight
      Ayarlar.SimgeWidth = 50
      Ayarlar.SimgePos = fpTopCenter
      HeaderText = 'Currencies'
      FooterText = ' '
      SimgeChar = '2'
      FiligranChar = #0
      OnClick = BT_CurrenciesClick
    end
    object BT_Mentions: TGR32WGBox
      Tag = 1
      Left = 0
      Top = 149
      Width = 167
      Height = 50
      Align = alTop
      AlphaBlend = 255
      OnMouseEnter = BT_CurrenciesMouseEnter
      OnMouseLeave = BT_CurrenciesMouseLeave
      Ayarlar.Background = 6113589
      Ayarlar.BackgroundHover = 103377
      Ayarlar.BorderColor = 6113589
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 0
      Ayarlar.FrameColor = 6113589
      Ayarlar.FrameStyle = psSolid
      Ayarlar.FrameWidth = 0
      Ayarlar.Header.Charset = DEFAULT_CHARSET
      Ayarlar.Header.Color = clSilver
      Ayarlar.Header.Height = -21
      Ayarlar.Header.Name = 'Rakesly Lt'
      Ayarlar.Header.Style = []
      Ayarlar.HeaderPos = fpCenterLeft
      Ayarlar.Footer.Charset = DEFAULT_CHARSET
      Ayarlar.Footer.Color = 5653047
      Ayarlar.Footer.Height = -19
      Ayarlar.Footer.Name = 'Libel Suit Rg'
      Ayarlar.Footer.Style = []
      Ayarlar.FooterPos = fpCenterRight
      Ayarlar.Padding.Left = 5
      Ayarlar.Padding.Top = 5
      Ayarlar.Padding.Right = 5
      Ayarlar.Padding.Bottom = 5
      Ayarlar.Simge.Charset = DEFAULT_CHARSET
      Ayarlar.Simge.Color = clWhite
      Ayarlar.Simge.Height = -32
      Ayarlar.Simge.Name = 'UgurFonts'
      Ayarlar.Simge.Style = []
      Ayarlar.Filigran.Charset = DEFAULT_CHARSET
      Ayarlar.Filigran.Color = 14734538
      Ayarlar.Filigran.Height = -171
      Ayarlar.Filigran.Name = 'UgurFonts'
      Ayarlar.Filigran.Style = []
      Ayarlar.FiligranPos = fpTopRight
      Ayarlar.SimgeWidth = 50
      Ayarlar.SimgePos = fpTopCenter
      HeaderText = 'Mentions'
      FooterText = ' '
      SimgeChar = '7'
      FiligranChar = #0
    end
    object BT_Drops: TGR32WGBox
      Tag = 1
      Left = 0
      Top = 199
      Width = 167
      Height = 50
      Align = alTop
      AlphaBlend = 255
      OnMouseEnter = BT_CurrenciesMouseEnter
      OnMouseLeave = BT_CurrenciesMouseLeave
      Ayarlar.Background = 6113589
      Ayarlar.BackgroundHover = 103377
      Ayarlar.BorderColor = 6113589
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 0
      Ayarlar.FrameColor = 6113589
      Ayarlar.FrameStyle = psSolid
      Ayarlar.FrameWidth = 0
      Ayarlar.Header.Charset = DEFAULT_CHARSET
      Ayarlar.Header.Color = clSilver
      Ayarlar.Header.Height = -21
      Ayarlar.Header.Name = 'Rakesly Lt'
      Ayarlar.Header.Style = []
      Ayarlar.HeaderPos = fpCenterLeft
      Ayarlar.Footer.Charset = DEFAULT_CHARSET
      Ayarlar.Footer.Color = 5653047
      Ayarlar.Footer.Height = -19
      Ayarlar.Footer.Name = 'Libel Suit Rg'
      Ayarlar.Footer.Style = []
      Ayarlar.FooterPos = fpCenterRight
      Ayarlar.Padding.Left = 5
      Ayarlar.Padding.Top = 5
      Ayarlar.Padding.Right = 5
      Ayarlar.Padding.Bottom = 5
      Ayarlar.Simge.Charset = DEFAULT_CHARSET
      Ayarlar.Simge.Color = clWhite
      Ayarlar.Simge.Height = -32
      Ayarlar.Simge.Name = 'UgurFonts'
      Ayarlar.Simge.Style = []
      Ayarlar.Filigran.Charset = DEFAULT_CHARSET
      Ayarlar.Filigran.Color = 14734538
      Ayarlar.Filigran.Height = -171
      Ayarlar.Filigran.Name = 'UgurFonts'
      Ayarlar.Filigran.Style = []
      Ayarlar.FiligranPos = fpTopRight
      Ayarlar.SimgeWidth = 50
      Ayarlar.SimgePos = fpTopCenter
      HeaderText = 'Drops'
      FooterText = ' '
      SimgeChar = '"'
      FiligranChar = #0
    end
    object BT_Shipping: TGR32WGBox
      Tag = 1
      Left = 0
      Top = 249
      Width = 167
      Height = 50
      Align = alTop
      AlphaBlend = 255
      OnMouseEnter = BT_CurrenciesMouseEnter
      OnMouseLeave = BT_CurrenciesMouseLeave
      Ayarlar.Background = 6113589
      Ayarlar.BackgroundHover = 103377
      Ayarlar.BorderColor = 6113589
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 0
      Ayarlar.FrameColor = 6113589
      Ayarlar.FrameStyle = psSolid
      Ayarlar.FrameWidth = 0
      Ayarlar.Header.Charset = DEFAULT_CHARSET
      Ayarlar.Header.Color = clSilver
      Ayarlar.Header.Height = -21
      Ayarlar.Header.Name = 'Rakesly Lt'
      Ayarlar.Header.Style = []
      Ayarlar.HeaderPos = fpCenterLeft
      Ayarlar.Footer.Charset = DEFAULT_CHARSET
      Ayarlar.Footer.Color = 5653047
      Ayarlar.Footer.Height = -19
      Ayarlar.Footer.Name = 'Libel Suit Rg'
      Ayarlar.Footer.Style = []
      Ayarlar.FooterPos = fpCenterRight
      Ayarlar.Padding.Left = 5
      Ayarlar.Padding.Top = 5
      Ayarlar.Padding.Right = 5
      Ayarlar.Padding.Bottom = 5
      Ayarlar.Simge.Charset = DEFAULT_CHARSET
      Ayarlar.Simge.Color = clWhite
      Ayarlar.Simge.Height = -32
      Ayarlar.Simge.Name = 'UgurFonts'
      Ayarlar.Simge.Style = []
      Ayarlar.Filigran.Charset = DEFAULT_CHARSET
      Ayarlar.Filigran.Color = 14734538
      Ayarlar.Filigran.Height = -171
      Ayarlar.Filigran.Name = 'UgurFonts'
      Ayarlar.Filigran.Style = []
      Ayarlar.FiligranPos = fpTopRight
      Ayarlar.SimgeWidth = 50
      Ayarlar.SimgePos = fpTopCenter
      HeaderText = 'Shipping'
      FooterText = ' '
      SimgeChar = '?'
      FiligranChar = #0
    end
    object BT_Sales: TGR32WGBox
      Tag = 1
      Left = 0
      Top = 299
      Width = 167
      Height = 50
      Align = alTop
      AlphaBlend = 255
      OnMouseEnter = BT_CurrenciesMouseEnter
      OnMouseLeave = BT_CurrenciesMouseLeave
      Ayarlar.Background = 6113589
      Ayarlar.BackgroundHover = 103377
      Ayarlar.BorderColor = 6113589
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 0
      Ayarlar.FrameColor = 6113589
      Ayarlar.FrameStyle = psSolid
      Ayarlar.FrameWidth = 0
      Ayarlar.Header.Charset = DEFAULT_CHARSET
      Ayarlar.Header.Color = clSilver
      Ayarlar.Header.Height = -21
      Ayarlar.Header.Name = 'Rakesly Lt'
      Ayarlar.Header.Style = []
      Ayarlar.HeaderPos = fpCenterLeft
      Ayarlar.Footer.Charset = DEFAULT_CHARSET
      Ayarlar.Footer.Color = 5653047
      Ayarlar.Footer.Height = -19
      Ayarlar.Footer.Name = 'Libel Suit Rg'
      Ayarlar.Footer.Style = []
      Ayarlar.FooterPos = fpCenterRight
      Ayarlar.Padding.Left = 5
      Ayarlar.Padding.Top = 5
      Ayarlar.Padding.Right = 5
      Ayarlar.Padding.Bottom = 5
      Ayarlar.Simge.Charset = DEFAULT_CHARSET
      Ayarlar.Simge.Color = clWhite
      Ayarlar.Simge.Height = -32
      Ayarlar.Simge.Name = 'UgurFonts'
      Ayarlar.Simge.Style = []
      Ayarlar.Filigran.Charset = DEFAULT_CHARSET
      Ayarlar.Filigran.Color = 14734538
      Ayarlar.Filigran.Height = -171
      Ayarlar.Filigran.Name = 'UgurFonts'
      Ayarlar.Filigran.Style = []
      Ayarlar.FiligranPos = fpTopRight
      Ayarlar.SimgeWidth = 50
      Ayarlar.SimgePos = fpTopCenter
      HeaderText = 'Sales'
      FooterText = ' '
      SimgeChar = '_'
      FiligranChar = #0
    end
    object BT_Settings: TGR32WGBox
      Tag = 1
      Left = 0
      Top = 349
      Width = 167
      Height = 50
      Align = alTop
      AlphaBlend = 255
      OnMouseEnter = BT_CurrenciesMouseEnter
      OnMouseLeave = BT_CurrenciesMouseLeave
      Ayarlar.Background = 6113589
      Ayarlar.BackgroundHover = 103377
      Ayarlar.BorderColor = 6113589
      Ayarlar.BorderStyle = psSolid
      Ayarlar.BorderWidth = 0
      Ayarlar.FrameColor = 6113589
      Ayarlar.FrameStyle = psSolid
      Ayarlar.FrameWidth = 0
      Ayarlar.Header.Charset = DEFAULT_CHARSET
      Ayarlar.Header.Color = clSilver
      Ayarlar.Header.Height = -21
      Ayarlar.Header.Name = 'Rakesly Lt'
      Ayarlar.Header.Style = []
      Ayarlar.HeaderPos = fpCenterLeft
      Ayarlar.Footer.Charset = DEFAULT_CHARSET
      Ayarlar.Footer.Color = 5653047
      Ayarlar.Footer.Height = -19
      Ayarlar.Footer.Name = 'Libel Suit Rg'
      Ayarlar.Footer.Style = []
      Ayarlar.FooterPos = fpCenterRight
      Ayarlar.Padding.Left = 5
      Ayarlar.Padding.Top = 5
      Ayarlar.Padding.Right = 5
      Ayarlar.Padding.Bottom = 5
      Ayarlar.Simge.Charset = DEFAULT_CHARSET
      Ayarlar.Simge.Color = clWhite
      Ayarlar.Simge.Height = -32
      Ayarlar.Simge.Name = 'UgurFonts'
      Ayarlar.Simge.Style = []
      Ayarlar.Filigran.Charset = DEFAULT_CHARSET
      Ayarlar.Filigran.Color = 14734538
      Ayarlar.Filigran.Height = -171
      Ayarlar.Filigran.Name = 'UgurFonts'
      Ayarlar.Filigran.Style = []
      Ayarlar.FiligranPos = fpTopRight
      Ayarlar.SimgeWidth = 50
      Ayarlar.SimgePos = fpTopCenter
      HeaderText = 'Settings'
      FooterText = ' '
      SimgeChar = '%'
      FiligranChar = #0
    end
    object GR32WidgetButton3: TGR32WGButton
      AlignWithMargins = True
      Left = 10
      Top = 613
      Width = 147
      Height = 53
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alBottom
      AlphaBlend = 255
      OnClick = BT_AnimasyonClick
      Background = 6113589
      BorderColor = clRed
      ButtonColor = 4194432
      ButtonHover = 15590057
      ButtonChecked = 3391998
      ButtonStyle = wbsOval
      ButtonType = wbtIsaretli
      ButtonText = 'Animate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = []
      FontHover = clWhite
      FontChecked = clBlack
      Symbol = #0
      SymbolFont.Charset = DEFAULT_CHARSET
      SymbolFont.Color = clWindowText
      SymbolFont.Height = -11
      SymbolFont.Name = 'Tahoma'
      SymbolFont.Style = []
      SymbolHover = clBlack
      SymbolChecked = clBlack
      SymbolPos = wgpNone
      SymbolGap = 0
    end
    object Logo: TImage32
      Left = 0
      Top = 0
      Width = 167
      Height = 49
      Align = alTop
      AutoSize = True
      Bitmap.DrawMode = dmBlend
      Bitmap.ResamplerClassName = 'TNearestResampler'
      BitmapAlign = baCenter
      Color = 6113589
      ParentColor = False
      Scale = 1.000000000000000000
      ScaleMode = smOptimalScaled
      TabOrder = 3
    end
  end
  object Frekans: TTimer
    Enabled = False
    Interval = 1
    OnTimer = FrekansTimer
    Left = 654
    Top = 14
  end
  object GR32WidgetPopupForm1: TGR32WGPopupForm
    Animasyon.AnimasyonStili = wasHarmanlama
    Bosluk_Kenar = 1
    Bosluk_Ust = 1
    Nesne = GR32WidgetBar2
    OnBeforePopup = GR32WidgetPopupForm1BeforePopup
    Left = 682
    Top = 14
  end
  object GR32WidgetPopupForm2: TGR32WGPopupForm
    Animasyon.AnimasyonStili = wasHarmanlama
    Bosluk_Kenar = 1
    Bosluk_Ust = 1
    Nesne = GR32WidgetBox3
    OnBeforePopup = GR32WidgetPopupForm2BeforePopup
    Left = 710
    Top = 14
  end
  object GR32WidgetPopupForm3: TGR32WGPopupForm
    Animasyon.AnimasyonStili = wasHarmanlama
    Bosluk_Kenar = 1
    Bosluk_Ust = 1
    Nesne = GR32WidgetButton3
    OnBeforePopup = GR32WidgetPopupForm3BeforePopup
    Left = 738
    Top = 14
  end
end
