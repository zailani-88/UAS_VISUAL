unit Unit1;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    lblNIK: TLabel;
    lblNama: TLabel;
    lblTelp: TLabel;
    lblEmail: TLabel;
    lblAlamat: TLabel;
    lblMember: TLabel;
    LabelDiskon: TLabel;
    edtNIK: TEdit;
    edtNama: TEdit;
    edtTelp: TEdit;
    edtEmail: TEdit;
    edtAlamat: TEdit;
    ComboBox1: TComboBox;
    btnBaru: TButton;
    btnSimpan: TButton;
    btnEdit: TButton;
    btnHapus: TButton;
    btnBatal: TButton;
    DBGrid1: TDBGrid;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    selectedID: Integer;
    procedure ClearInputs;
    procedure EnableInputs(AEnable: Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ClearInputs;
begin
  edtNIK.Clear;
  edtNama.Clear;
  edtTelp.Clear;
  edtEmail.Clear;
  edtAlamat.Clear;
  ComboBox1.ItemIndex := -1;
end;

procedure TForm1.EnableInputs(AEnable: Boolean);
begin
  edtNIK.Enabled := AEnable;
  edtNama.Enabled := AEnable;
  edtTelp.Enabled := AEnable;
  edtEmail.Enabled := AEnable;
  edtAlamat.Enabled := AEnable;
  ComboBox1.Enabled := AEnable;
end;

procedure TForm1.btnBaruClick(Sender: TObject);
begin
  EnableInputs(True);
  btnSimpan.Enabled := True;
  btnEdit.Enabled := False;
  btnHapus.Enabled := False;
  btnBatal.Enabled := True;
  ClearInputs;
  selectedID := 0;
end;

procedure TForm1.btnSimpanClick(Sender: TObject);
begin
  if Form2.ZConnection1.Connected then
  begin
    try
      if selectedID = 0 then
      begin
        Form2.ZQuery1.SQL.Clear;
        Form2.ZQuery1.SQL.Add('INSERT INTO kustomer (nik, nama, telp, email, alamat, member) VALUES (:nik, :nama, :telp, :email, :alamat, :member)');
        Form2.ZQuery1.ParamByName('nik').AsString := edtNIK.Text;
        Form2.ZQuery1.ParamByName('nama').AsString := edtNama.Text;
        Form2.ZQuery1.ParamByName('telp').AsString := edtTelp.Text;
        Form2.ZQuery1.ParamByName('email').AsString := edtEmail.Text;
        Form2.ZQuery1.ParamByName('alamat').AsString := edtAlamat.Text;
        Form2.ZQuery1.ParamByName('member').AsString := ComboBox1.Text;
        Form2.ZQuery1.ExecSQL;
        ShowMessage('Data Berhasil Disimpan!');
      end
      else
      begin
        Form2.ZQuery1.SQL.Clear;
        Form2.ZQuery1.SQL.Add('UPDATE kustomer SET nik = :nik, nama = :nama, telp = :telp, email = :email, alamat = :alamat, member = :member WHERE id = :id');
        Form2.ZQuery1.ParamByName('nik').AsString := edtNIK.Text;
        Form2.ZQuery1.ParamByName('nama').AsString := edtNama.Text;
        Form2.ZQuery1.ParamByName('telp').AsString := edtTelp.Text;
        Form2.ZQuery1.ParamByName('email').AsString := edtEmail.Text;
        Form2.ZQuery1.ParamByName('alamat').AsString := edtAlamat.Text;
        Form2.ZQuery1.ParamByName('member').AsString := ComboBox1.Text;
        Form2.ZQuery1.ParamByName('id').AsInteger := selectedID;
        Form2.ZQuery1.ExecSQL;
        ShowMessage('Data Berhasil Diupdate!');
      end;
      Form2.ZQuery1.SQL.Clear;
      Form2.ZQuery1.SQL.Add('SELECT * FROM kustomer');
      Form2.ZQuery1.Open;
      btnSimpan.Enabled := False;
      btnEdit.Enabled := False;
      btnHapus.Enabled := False;
      btnBatal.Enabled := False;
      EnableInputs(False);
      ClearInputs;
      selectedID := 0;
    except
      on E: Exception do
        ShowMessage('Error saat menyimpan data: ' + E.Message);
    end;
  end
  else
    ShowMessage('Koneksi ke database tidak berhasil.');
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  // Memeriksa nilai yang dipilih pada ComboBox
  if ComboBox1.Text = 'Yes' then
    LabelDiskon.Caption := 'Diskon : 10%'
  else if ComboBox1.Text = 'No' then
    LabelDiskon.Caption := 'Diskon : 5%'
  else
    LabelDiskon.Caption := 'Diskon: -';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Menambahkan item ke ComboBox
  ComboBox1.Items.Clear;
  ComboBox1.Items.Add('Yes');
  ComboBox1.Items.Add('No');
  ComboBox1.ItemIndex := -1; // Memastikan tidak ada item yang dipilih secara default
  // Mengaktifkan koneksi database di Form2
  Form2.ZConnection1.Connect;
  Form2.ZQuery1.SQL.Text := 'SELECT * FROM kustomer';
  Form2.ZQuery1.Open;
  // Mengatur DataSource DBGrid
  DBGrid1.DataSource := Form2.DataSource1;
end;

procedure TForm1.btnEditClick(Sender: TObject);
begin
  // tidak ada aksi pada btnEdit karena tombol Simpan yang digunakan untuk update
end;

procedure TForm1.btnHapusClick(Sender: TObject);
begin
  if selectedID <> 0 then
  begin
    if MessageDlg('Apakah Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        Form2.ZQuery1.SQL.Clear;
        Form2.ZQuery1.SQL.Add('DELETE FROM kustomer WHERE id = :id');
        Form2.ZQuery1.ParamByName('id').AsInteger := selectedID;
        Form2.ZQuery1.ExecSQL;
        Form2.ZQuery1.SQL.Clear;
        Form2.ZQuery1.SQL.Add('SELECT * FROM kustomer');
        Form2.ZQuery1.Open;
        ShowMessage('Data Berhasil Dihapus!');
        btnSimpan.Enabled := False;
        btnEdit.Enabled := False;
        btnHapus.Enabled := False;
        btnBatal.Enabled := False;
        EnableInputs(False);
        ClearInputs;
        selectedID := 0;
      except
        on E: Exception do
          ShowMessage('Error saat menghapus data: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('Pilih data yang akan dihapus terlebih dahulu.');
end;

procedure TForm1.btnBatalClick(Sender: TObject);
begin
  ClearInputs;
  EnableInputs(False);
  btnSimpan.Enabled := False;
  btnEdit.Enabled := True;
  btnHapus.Enabled := True;
  btnBatal.Enabled := False;
  selectedID := 0;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  if not Form2.ZQuery1.IsEmpty then
  begin
    selectedID := Form2.ZQuery1.FieldByName('id').AsInteger;
    edtNIK.Text := Form2.ZQuery1.FieldByName('nik').AsString;
    edtNama.Text := Form2.ZQuery1.FieldByName('nama').AsString;
    edtTelp.Text := Form2.ZQuery1.FieldByName('telp').AsString;
    edtEmail.Text := Form2.ZQuery1.FieldByName('email').AsString;
    edtAlamat.Text := Form2.ZQuery1.FieldByName('alamat').AsString;
    ComboBox1.Text := Form2.ZQuery1.FieldByName('member').AsString;
    btnEdit.Enabled := False; // tidak digunakan
    btnHapus.Enabled := True;
    btnSimpan.Enabled := True;
    EnableInputs(True);
    btnBatal.Enabled := True;
  end;
end;

end.
