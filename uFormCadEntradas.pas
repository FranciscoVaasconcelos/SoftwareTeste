unit uFormCadEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, FireDAC.Comp.Client, Vcl.Mask, RxToolEdit;

type
  TfrmCadEntrada = class(TfrmBase)
    dtEntrada: TDateEdit;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtQntAtualTanque: TcxCurrencyEdit;
    Label9: TLabel;
    edtCapacidade: TcxCurrencyEdit;
    Label10: TLabel;
    edtDiferenca: TcxCurrencyEdit;
    Label4: TLabel;
    cmbTanque: TComboBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    edtPrecoCustoLitro: TcxCurrencyEdit;
    edtQuantEntrada: TcxCurrencyEdit;
    edtVrTotalCusto: TcxCurrencyEdit;
    Label1: TLabel;
    cmbTipoComb: TComboBox;
    edtPrecoVendaAtual: TcxCurrencyEdit;
    Label6: TLabel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cmbTipoCombCloseUp(Sender: TObject);
    procedure cmbTipoCombExit(Sender: TObject);
    procedure cmbTanqueExit(Sender: TObject);
    procedure cmbTanqueCloseUp(Sender: TObject);
    procedure edtPrecoCustoLitroPropertiesChange(Sender: TObject);
    procedure edtQuantEntradaPropertiesChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtQuantEntradaExit(Sender: TObject);
  private
    { Private declarations }
    FDiferenca: double;
    procedure GetInfoCombustivel;
    procedure GetInfoTanque;
    procedure CalcularTotalCusto;
    procedure CalcularDiferencaTanque;
    function Salvar: boolean;
  public
    { Public declarations }
  end;

var
  frmCadEntrada: TfrmCadEntrada;

implementation

uses
  uDataModule;

{$R *.dfm}

procedure TfrmCadEntrada.btnCancelarClick(Sender: TObject);
begin
    inherited;
    Close;
end;

procedure TfrmCadEntrada.btnSalvarClick(Sender: TObject);
begin
    inherited;
    if cmbTipoComb.ItemIndex < 0 then
    begin
        Erro('Informe um tipo de combustível!');
        cmbTipoComb.SetFocus;
        Abort;
    end;
    if cmbTanque.ItemIndex < 0 then
    begin
        Erro('Informe um tanque onde será depositado o combustível comprado!');
        cmbTanque.SetFocus;
        Abort;
    end;
    if edtPrecoCustoLitro.Value <= 0 then
    begin
        Erro('Informe um valor de custo por litro!');
        Abort;
    end;
    if edtQuantEntrada.Value <= 0 then
    begin
        Erro('Informe a quantidade de entrada!');
        Abort;
    end;
    if Salvar then
    begin
        Self.ModalResult:= mrOK;
    end;
end;

procedure TfrmCadEntrada.CalcularDiferencaTanque;
begin
    edtDiferenca.Value:= edtCapacidade.Value - edtQntAtualTanque.Value;
end;

procedure TfrmCadEntrada.CalcularTotalCusto;
begin
    edtVrTotalCusto.Value:= edtPrecoCustoLitro.Value * edtQuantEntrada.Value;
    CalcularDiferencaTanque;
end;

procedure TfrmCadEntrada.cmbTanqueCloseUp(Sender: TObject);
begin
    inherited;
    GetInfoTanque;
end;

procedure TfrmCadEntrada.cmbTanqueExit(Sender: TObject);
begin
    inherited;
    if cmbTanque.ItemIndex > -1 then
    begin
        GetInfoTanque;
    end;
end;

procedure TfrmCadEntrada.cmbTipoCombCloseUp(Sender: TObject);
begin
    inherited;
    GetInfoCombustivel;
end;

procedure TfrmCadEntrada.cmbTipoCombExit(Sender: TObject);
begin
    inherited;
    if cmbTipoComb.ItemIndex > -1 then
    begin
        GetInfoCombustivel;
    end;
end;

procedure TfrmCadEntrada.edtPrecoCustoLitroPropertiesChange(Sender: TObject);
begin
    inherited;
    CalcularTotalCusto;
end;

procedure TfrmCadEntrada.edtQuantEntradaExit(Sender: TObject);
begin
    inherited;
    if edtQuantEntrada.Value > edtDiferenca.Value then
    begin
        Erro('A quantidade de entrada não pode ser superior ao valor de diferença entre capacidade total do tanque e o valor que ele ainda contém!');
        edtQuantEntrada.Value:= edtDiferenca.Value;
    end;
end;

procedure TfrmCadEntrada.edtQuantEntradaPropertiesChange(Sender: TObject);
begin
    inherited;
    CalcularTotalCusto;
end;

procedure TfrmCadEntrada.FormCreate(Sender: TObject);
begin
    inherited;
    FDiferenca:= 0;
    dtEntrada.Date:= Date;
    Self.PopularComboBox(cmbTipoComb, 'SELECT ID, NomeCombustivel FROM combustiveis', DM.Conexao);
    Self.PopularComboBox(cmbTanque, 'SELECT ID, NomeTanque FROM TanquesCombustivel', DM.Conexao);
end;

procedure TfrmCadEntrada.GetInfoCombustivel;
var
    qr: TFDQuery;
begin
    try
        qr:= TFDQuery.Create(nil);
        qr.Connection:= DM.Conexao;
        qr.SQL.Add('SELECT * FROM Combustiveis WHERE ID =:ID');
        qr.ParamByName('ID').AsInteger:= ResultComboSelecionado(cmbTipoComb);
        qr.Open;
        if not(qr.IsEmpty)then
        begin
            edtPrecoVendaAtual.Value:= qr.FieldByName('PrecoPorLitro').AsFloat;
        end;
    finally
        FreeAndNil(qr);
    end;
end;

procedure TfrmCadEntrada.GetInfoTanque;
var
  qr: TFDQuery;
begin
    try
        qr:= TFDQuery.Create(nil);
        qr.Connection:= DM.Conexao;
        qr.SQL.Add(DM.FDScript1.SQLScripts.Items[3].SQL.Text);
        qr.ParamByName('ID').AsInteger:= ResultComboSelecionado(cmbTanque);
        qr.Open;
        if not(qr.IsEmpty)then
        begin
            edtQntAtualTanque.Value:= qr.FieldByName('QuantAtualNoTanque').AsFloat;
            edtCapacidade.Value:= qr.FieldByName('Capacidade').AsFloat;
        end;
      finally
        FreeAndNil(qr);
    end;
end;

function TfrmCadEntrada.Salvar: boolean;
var
    qr: TFDQuery;
begin
    Result:= False;
    try
        qr:= TFDQuery.Create(nil);
        qr.Connection:= DM.Conexao;
        qr.SQL.Add('SELECT * FROM entradas');
        qr.Open;
        qr.Append;
        try
            qr.FieldByName('DataEntrada').AsDateTime:= Date;
            qr.FieldByName('HoraEntrada').AsDateTime:= Now;
            qr.FieldByName('IdCombustivel').AsInteger:= ResultComboSelecionado(cmbTipoComb);
            qr.FieldByName('IdTanque').AsInteger:= ResultComboSelecionado(cmbTanque);
            qr.FieldByName('PrecoCustoLitro').AsFloat:= edtPrecoCustoLitro.Value;
            qr.FieldByName('PrecoCustoTotal').AsFloat:= edtVrTotalCusto.Value;
            qr.FieldByName('Quantidade').AsFloat:= edtQuantEntrada.Value;
            qr.Post;
            Result:= true;
          except on E : Exception do
            begin
                Result:= False;
                Application.MessageBox(PWideChar(E.Message), 'Erro:', 0);
            end;
        end;
    finally
        FreeAndNil(qr);
    end;
end;

end.
