unit uFormVendaCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Classe.Frentista, ACBrUtil, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit;

type
  TfrmVendaCombustivel = class(TfrmBase)
    cmbFrentista: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbBicoCombustivel: TComboBox;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    UpDown1: TUpDown;
    cmbBomba: TComboBox;
    Label5: TLabel;
    qrDadosTanque: TFDQuery;
    qrDadosComb: TFDQuery;
    edtQuant: TcxCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtPreco: TcxCurrencyEdit;
    edtTotal: TcxCurrencyEdit;
    Label8: TLabel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure cmbBicoCombustivelCloseUp(Sender: TObject);
    procedure cmbBicoCombustivelExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cmbBombaCloseUp(Sender: TObject);
    procedure cmbBombaExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbFrentistaCloseUp(Sender: TObject);
    procedure cmbFrentistaChange(Sender: TObject);
    procedure edtQuantPropertiesChange(Sender: TObject);
    procedure edtPrecoPropertiesChange(Sender: TObject);
    procedure qrDadosTanqueAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FQuant, FPreco, FTotal, FPercComissao: double;
    FID_Tanque, FID_Combustivel, FID_Bico, FID_Bomba: integer;
    FQuantidadeAtualTanque, FCapacidadeTanque: double;
    procedure ResetarInformacoes;
    procedure OnCmbFrentistaChange;
    procedure GetDadosFrentista(IDFrentista: integer);
    procedure DestruirFrentista;
    procedure GetDadosCombustivel;
    procedure CalcularVenda;
    function FinalizarVenda: boolean;
    procedure DestruirObjetos;
    function CalcularComissao(BaseCalculo, PercComissao: double): double;
    procedure BotaoSalvar;
  public
    { Public declarations }
  end;

var
  frmVendaCombustivel: TfrmVendaCombustivel;
  FFrentista: TFrentista;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmVendaCombustivel.BotaoSalvar;
begin
    if not(Assigned(FFrentista))then
    begin
        Erro('Indique um frentista!');
        cmbFrentista.SetFocus;
        Abort;
    end;
    if not(cmbBomba.ItemIndex > -1)then
    begin
        Erro('Indique uma bomba!');
        cmbBomba.SetFocus;
        Abort;
    end;
    if (edtQuant.Value <= 0)then
    begin
        Erro('Informe uma quantidade!');
        edtQuant.SetFocus;
        Abort;
    end;
    if (edtPreco.Value <= 0) then
    begin
        Erro('Informe o preço!');
        edtPreco.SetFocus;
        Abort;
    end;
    if qrDadosTanque.Active then
    begin
        if qrDadosTanque.FieldByName('QuantAtualNoTanque').AsFloat < qrDadosTanque.FieldByName('QuantMinima').AsFloat then
        begin
            Erro('A quantidade no tanque está abaixo da quantidade mínima!' + sLineBreak + 'Não será possível concluir esta venda!');
            Abort;
        end;
    end;
    if not(qrDadosComb.Active)then
    begin
        Abort;
    end;
    if FinalizarVenda then
    begin
        Self.Informacao('Salvo com sucesso!');
        ResetarInformacoes;
        qrDadosTanque.Close;
        qrDadosComb.Close;
    end;
end;

procedure TfrmVendaCombustivel.Button1Click(Sender: TObject);
begin
    inherited;
    BotaoSalvar;
end;

procedure TfrmVendaCombustivel.Button2Click(Sender: TObject);
begin
    inherited;
    Close;
end;

function TfrmVendaCombustivel.CalcularComissao(BaseCalculo,
  PercComissao: double): double;
begin
    Result:= RoundABNT((BaseCalculo * PercComissao)/100, 2);
end;

procedure TfrmVendaCombustivel.CalcularVenda;
begin
    edtTotal.Value:= (edtPreco.Value * edtQuant.Value);
end;

procedure TfrmVendaCombustivel.cmbBicoCombustivelCloseUp(Sender: TObject);
begin
    inherited;
    GetDadosCombustivel;
end;

procedure TfrmVendaCombustivel.cmbBicoCombustivelExit(Sender: TObject);
begin
    inherited;
    GetDadosCombustivel;
end;

procedure TfrmVendaCombustivel.cmbBombaCloseUp(Sender: TObject);
begin
    inherited;
    Self.PopularComboBox(cmbBicoCombustivel, 'SELECT ID, NomeBico FROM bicos WHERE idBomba = ' + QuotedStr(IntToStr(ResultComboSelecionado(cmbBomba))), DM.Conexao);
end;

procedure TfrmVendaCombustivel.cmbBombaExit(Sender: TObject);
begin
    inherited;
    Self.PopularComboBox(cmbBicoCombustivel, 'SELECT ID, NomeBico FROM bicos WHERE idBomba = ' + QuotedStr(IntToStr(ResultComboSelecionado(cmbBomba))), DM.Conexao);
end;

procedure TfrmVendaCombustivel.cmbFrentistaChange(Sender: TObject);
begin
    inherited;
    OnCmbFrentistaChange;
end;

procedure TfrmVendaCombustivel.cmbFrentistaCloseUp(Sender: TObject);
begin
    inherited;
    OnCmbFrentistaChange;
end;

procedure TfrmVendaCombustivel.DestruirFrentista;
begin
    if Assigned(FFrentista)then
      FreeAndNil(FFrentista);
end;

procedure TfrmVendaCombustivel.DestruirObjetos;
begin
    DestruirFrentista;
end;

procedure TfrmVendaCombustivel.edtPrecoPropertiesChange(Sender: TObject);
begin
  inherited;
  CalcularVenda;
end;

procedure TfrmVendaCombustivel.edtQuantPropertiesChange(Sender: TObject);
begin
  inherited;
  CalcularVenda;
end;

function TfrmVendaCombustivel.FinalizarVenda: boolean;
var
    qr: TFDQuery;
begin
    try
        try
            qr:= TFDQuery.Create(nil);
            qr.Connection:= DM.Conexao;
            qr.SQL.Add('SELECT * FROM VENDAS WHERE 1 = 2');
            qr.Open;
            qr.Append;
            qr.FieldByName('IdFrentista').AsInteger   := ResultComboSelecionado(cmbFrentista);
            qr.FieldByName('IdCombustivel').AsInteger := qrDadosComb.FieldByName('IDComb').AsInteger;
            qr.FieldByName('IdTanque').AsInteger      := qrDadosComb.FieldByName('IdTanque').AsInteger;
            qr.FieldByName('PrecoPorLitro').AsFloat   := StrToFloat(edtPreco.Text);
            qr.FieldByName('IdBico').AsInteger        := ResultComboSelecionado(cmbBicoCombustivel);
            qr.FieldByName('DataHora').AsDateTime     := Now;
            qr.FieldByName('Quantidade').AsFloat      := edtQuant.Value;
            qr.FieldByName('Total').AsCurrency        := edtTotal.Value;
            qr.FieldByName('PercComissao').AsFloat    := FFrentista.PercComissao;
            qr.FieldByName('VrComissao').AsFloat      := CalcularComissao(StrToFloat(edtTotal.Text), FFrentista.PercComissao);
            qr.FieldByName('CustoPorLitro').AsFloat   := qrDadosTanque.FieldByName('CustoMedio').AsFloat;
            qr.Post;
            Result:= True;
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

procedure TfrmVendaCombustivel.FormCreate(Sender: TObject);
begin
    inherited;
    ResetarInformacoes;
    Self.PopularComboBox(cmbFrentista, 'SELECT ID, NomeFrentista FROM FRENTISTAS', DM.Conexao);
    Self.PopularComboBox(cmbBomba, 'SELECT ID, NomeBomba FROM Bombas', DM.Conexao);
end;

procedure TfrmVendaCombustivel.FormDestroy(Sender: TObject);
begin
    inherited;
    DestruirObjetos;
end;

procedure TfrmVendaCombustivel.GetDadosCombustivel;
begin
    try
        qrDadosComb.Close;
        qrDadosComb.ParamByName('ID').AsInteger:= ResultComboSelecionado(cmbBicoCombustivel);
        qrDadosComb.Open;
        if not(qrDadosComb.IsEmpty)then
        begin
            edtPreco.Text       := FormatFloat('0.000', qrDadosComb.FieldByName('PrecoPorLitro').AsFloat);
        end;
    finally
        if (qrDadosComb.Active) and (not(qrDadosComb.IsEmpty))then
        begin
            qrDadosTanque.ParamByName('IDTanque').AsInteger:= qrDadosComb.FieldByName('IdTanque').AsInteger;
            qrDadosTanque.Open;
        end;
    end;
{    try
        qr:= TFDQuery.Create(nil);
        qr.Connection:= DM.Conexao;
        qr.SQL.Add(DM.FDScript1.SQLScripts.Items[2].SQL.Text);
        qr.ParamByName('ID').AsInteger:= ResultComboSelecionado(cmbBicoCombustivel);
        qr.Open;
        if not(qr.IsEmpty)then
        begin
            FID_Bico            := qr.FieldByName('IDBicoBomba').AsInteger;
            FID_Combustivel     := qr.FieldByName('IDComb').AsInteger;
            FID_Tanque          := qr.FieldByName('IDTanque').AsInteger;
//            FCustoMedioPorLitro := qr.FieldByName('CustoMedio').AsFloat;
            edtPreco.Text       := FormatFloat('0.000', qr.FieldByName('PrecoPorLitro').AsFloat);
        end;
    finally
        FreeAndNil(qr);
    end;      }
end;
procedure TfrmVendaCombustivel.GetDadosFrentista(IDFrentista: integer);
var
    qr: TFDQuery;
begin
    try
        qr:= TFDQuery.Create(nil);
        qr.Connection:= DM.Conexao;
        qr.SQL.Add('SELECT * FROM FRENTISTAS WHERE ID = :ID');
        qr.ParamByName('ID').AsInteger:= IDFrentista;
        qr.Open;
        if not(qr.IsEmpty)then
        begin
          if not(Assigned(FFrentista))then
          begin
              FFrentista:= TFrentista.Create;
          end;
          if Assigned(FFrentista)then
          begin
              FFrentista.ID             := qr.FieldByName('ID').AsInteger;
              FFrentista.NomeFrentista  := qr.FieldByName('NomeFrentista').AsString;
              FFrentista.PercComissao   := qr.FieldByName('PercComissao').AsFloat;
          end;
        end;
    finally
        FreeAndNil(qr);
    end;
end;

procedure TfrmVendaCombustivel.OnCmbFrentistaChange;
begin
    if cmbFrentista.ItemIndex < 0 then
    begin
        DestruirFrentista;
    end
    else
    begin
        GetDadosFrentista(ResultComboSelecionado(cmbFrentista));
    end;
end;

procedure TfrmVendaCombustivel.qrDadosTanqueAfterOpen(DataSet: TDataSet);
begin
    inherited;
    StatusBar1.Panels[0].Text:= 'Quantidade atual no tanque: ' +  FloatToStr(qrDadosTanque.FieldByName('QuantAtualNoTanque').AsFloat);
end;

procedure TfrmVendaCombustivel.ResetarInformacoes;
begin
    FQuant                := 0;
    FPreco                := 0;
    FTotal                := 0;
    FID_Tanque            := 0;
    FID_Combustivel       := 0;
    FID_Bico              := 0;
    FID_Bomba             := 0;
    FPercComissao         := 0;
    FQuantidadeAtualTanque:= 0;
    cmbFrentista.ItemIndex:= -1;
    cmbBomba.ItemIndex    := -1;
    cmbBicoCombustivel.ItemIndex:= -1;
    edtQuant.Text         := '';
    edtPreco.Text         := '';
    edtTotal.Text         := '';
    StatusBar1.Panels[0].Text:= '';
    DestruirFrentista;
end;

end.
