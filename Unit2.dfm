object Form1: TForm1
  Left = 87
  Top = -2
  Width = 664
  Height = 569
  VertScrollBar.Position = 3
  Caption = 'Osmos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object Image1: TImage
    Left = 0
    Top = -3
    Width = 640
    Height = 480
  end
  object Label1: TLabel
    Left = 320
    Top = 480
    Width = 3
    Height = 16
  end
  object Label2: TLabel
    Left = 415
    Top = 480
    Width = 3
    Height = 16
  end
  object Label3: TLabel
    Left = 415
    Top = 496
    Width = 3
    Height = 16
  end
  object Label4: TLabel
    Left = 320
    Top = 496
    Width = 3
    Height = 16
  end
  object Label5: TLabel
    Left = 232
    Top = 483
    Width = 5
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 96
    Top = 487
    Width = 26
    Height = 16
    Caption = 'Mb='
  end
  object Label7: TLabel
    Left = 224
    Top = 525
    Width = 84
    Height = 16
    Caption = 'Radius = 2 cm'
  end
  object Label8: TLabel
    Left = 352
    Top = 525
    Width = 3
    Height = 16
  end
  object Button1: TButton
    Left = 8
    Top = 483
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 560
    Top = 483
    Width = 75
    Height = 25
    Caption = 'Graph'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 124
    Top = 484
    Width = 89
    Height = 22
    Style = csOwnerDrawVariable
    ItemHeight = 16
    TabOrder = 2
    Items.Strings = (
      '0.50 g'
      '0.30 g'
      '0.40 g')
  end
  object Button3: TButton
    Left = 540
    Top = 483
    Width = 17
    Height = 25
    Caption = '?'
    TabOrder = 3
    OnClick = Button3Click
  end
  object RichEdit1: TRichEdit
    Left = 160
    Top = 117
    Width = 320
    Height = 240
    BorderStyle = bsNone
    Lines.Strings = (
      'RichEdit1')
    ReadOnly = True
    TabOrder = 4
    OnMouseDown = RichEdit1MouseDown
  end
  object Button4: TButton
    Left = 560
    Top = 517
    Width = 75
    Height = 25
    Caption = 'Mass_mol'
    TabOrder = 5
    OnClick = Button4Click
  end
end
