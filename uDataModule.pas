unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script;

type
  TDM = class(TDataModule)
    MSSQLDriver: TFDPhysMSSQLDriverLink;
    Conexao: TFDConnection;
    xWaitCursor: TFDGUIxWaitCursor;
    FDScript1: TFDScript;
    SQL_Relatorios: TFDScript;
    procedure ConexaoAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CriarUsuarioPadrao;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.ConexaoAfterConnect(Sender: TObject);
begin
    CriarUsuarioPadrao;
end;

procedure TDM.CriarUsuarioPadrao;
var
  qr: TFDQuery;
begin
    try
        qr:= TFDQuery.Create(nil);
        qr.Connection:= Conexao;
        qr.Open('SELECT * FROM usuarios');
        if (qr.IsEmpty)then
        begin
           Conexao.ExecSQL('INSERT INTO Usuarios(UsuarioNome, UsuarioSenha) VALUES ("Usuário", "123456")');
        end;
    finally
        qr.Free;
    end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
    Conexao.Connected:= True;
end;

end.
