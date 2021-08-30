unit uFormLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLogin = class(TfrmBase)
    edtSenha: TLabeledEdit;
    btnEntrar: TButton;
    btnCancelar: TButton;
    cmbUsuario: TComboBox;
    Label1: TLabel;
    qr: TFDQuery;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure BotaoEntrar;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uFormInicial, uDataModule;

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
    inherited;
    BotaoEntrar;
end;

procedure TfrmLogin.BotaoEntrar;
begin
    if(cmbUsuario.ItemIndex < 0)then
    begin
        Self.Atencao('Selecione um usuário!');
        Abort;
    end;
    if(Trim(edtSenha.Text) = '')then
    begin
        Self.Atencao('Informe uma senha!');
        Abort;
    end;
    qr.ParamByName('ID').AsInteger    := ResultComboSelecionado(cmbUsuario);
    qr.ParamByName('Senha').AsString  := Trim(edtSenha.Text);
    qr.Open;
    if (qr.Active) and (qr.RecordCount > 0)then
    begin
        Self.ModalResult:= mrOk;
        frmInicial.FUsuarioLogado:= True;
    end
    else
    begin
        qr.Active:= False;
        Self.Erro('Senha inválida para este usuário!', 'Verifique a senha digitada!');
    end;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
    inherited;
    frmInicial.FUsuarioLogado:= False;
    ModalResult:= mrCancel;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
    inherited;
    Self.PopularComboBox(cmbUsuario, 'SELECT ID, UsuarioNome FROM USUARIOS', DM.Conexao);
    {$IFDEF DEBUG$}
    edtSenha.Text:= '123456';
    {$ENDIF}
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
    inherited;
    cmbUsuario.SetFocus;
end;

end.
