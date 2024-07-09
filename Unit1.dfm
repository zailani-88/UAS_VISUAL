object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblNIK: TLabel
    Left = 72
    Top = 32
    Width = 19
    Height = 15
    Caption = 'NIK'
  end
  object lblNama: TLabel
    Left = 72
    Top = 69
    Width = 36
    Height = 15
    Caption = 'NAMA'
  end
  object lblTelp: TLabel
    Left = 72
    Top = 101
    Width = 25
    Height = 15
    Caption = 'TELP'
  end
  object lblEmail: TLabel
    Left = 72
    Top = 130
    Width = 34
    Height = 15
    Caption = 'EMAIL'
  end
  object lblAlamat: TLabel
    Left = 72
    Top = 159
    Width = 46
    Height = 15
    Caption = 'ALAMAT'
  end
  object lblMember: TLabel
    Left = 72
    Top = 192
    Width = 48
    Height = 15
    Caption = 'MEMBER'
  end
  object LabelDiskon: TLabel
    Left = 268
    Top = 192
    Width = 21
    Height = 15
    Caption = '.......'
  end
  object edtNIK: TEdit
    Left = 128
    Top = 32
    Width = 273
    Height = 23
    TabOrder = 0
  end
  object edtNama: TEdit
    Left = 128
    Top = 69
    Width = 273
    Height = 23
    TabOrder = 1
  end
  object edtEmail: TEdit
    Left = 128
    Top = 130
    Width = 273
    Height = 23
    TabOrder = 2
  end
  object edtAlamat: TEdit
    Left = 128
    Top = 159
    Width = 273
    Height = 23
    TabOrder = 3
  end
  object edtTelp: TEdit
    Left = 128
    Top = 98
    Width = 273
    Height = 23
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 192
    Width = 113
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'Pilih--'
    OnChange = ComboBox1Change
    Items.Strings = (
      'Yes'
      'No')
  end
  object btnSimpan: TButton
    Left = 153
    Top = 232
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 6
    OnClick = btnSimpanClick
  end
  object btnBaru: TButton
    Left = 72
    Top = 232
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 7
    OnClick = btnBaruClick
  end
  object btnEdit: TButton
    Left = 234
    Top = 232
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 8
  end
  object btnHapus: TButton
    Left = 315
    Top = 232
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 9
    OnClick = btnHapusClick
  end
  object btnBatal: TButton
    Left = 416
    Top = 232
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 10
    OnClick = btnBatalClick
  end
  object DBGrid1: TDBGrid
    Left = 70
    Top = 280
    Width = 421
    Height = 154
    DataSource = Form2.DataSource1
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nik'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alamat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'member'
        Visible = True
      end>
  end
end
