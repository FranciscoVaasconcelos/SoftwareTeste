unit uFormInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;
const
  WM_AFTER_SHOW = WM_USER + 300;
  WM_AFTER_CREATE = WM_USER + 301;
type
  TfrmInicial = class(TForm)
    MainMenu: TMainMenu;
    StatusBar1: TStatusBar;
    Login1: TMenuItem;
    Sair1: TMenuItem;
    rocardeusurio1: TMenuItem;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    Bombas1: TMenuItem;
    Frentistas1: TMenuItem;
    Panel1: TPanel;
    Bicosdebombas1: TMenuItem;
    Combustveis1: TMenuItem;
    anquesdeCombustveis1: TMenuItem;
    Venda1: TMenuItem;
    Venda2: TMenuItem;
    Compra1: TMenuItem;
    Relatrios1: TMenuItem;
    otalGeral1: TMenuItem;
    Lucroporperodo1: TMenuItem;
    Comissesporfrentista1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure rocardeusurio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Frentistas1Click(Sender: TObject);
    procedure Bicosdebombas1Click(Sender: TObject);
    procedure Bombas1Click(Sender: TObject);
    procedure Combustveis1Click(Sender: TObject);
    procedure anquesdeCombustveis1Click(Sender: TObject);
    procedure Venda2Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Lucroporperodo1Click(Sender: TObject);
    procedure otalGeral1Click(Sender: TObject);
    procedure Comissesporfrentista1Click(Sender: TObject);
  private
    { Private declarations }
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure WmAfterCreate(var Msg: TMessage); message WM_AFTER_CREATE;
    procedure TelaLogin;
    function Sair: boolean;
  public
    { Public declarations }
    FUsuarioLogado: boolean;
  end;

var
  frmInicial: TfrmInicial;

implementation

uses
  uFormLogin, uFormCadUsuarios, uFormSimpleCrud, uFormCadFrentistas, uFormCadBicosCombustivel, uFormCadBombas, uFormCadCombustivel, uFormCadTanquesCombustivel, uFormBase, uFormVendaCombustivel, uFormCadEntradas, uFormEntradas, uFormRelLucroPeriodo, uFormRelTotalGeral, uFormRelComissao;

{$R *.dfm}

{ TfrmInicial }

procedure TfrmInicial.anquesdeCombustveis1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCadTanques, frmCadTanques);
    try
        frmCadTanques.ShowModal;
    finally
        FreeAndNil(frmCadTanques);
    end;
end;

procedure TfrmInicial.Bicosdebombas1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCadBicosCombustivel, frmCadBicosCombustivel);
    try
        frmCadBicosCombustivel.ShowModal;
    finally
        FreeAndNil(frmCadBicosCombustivel);
    end;
end;

procedure TfrmInicial.Bombas1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCadBombas, frmCadBombas);
    try
        frmCadBombas.ShowModal;
    finally
        FreeAndNil(frmCadBombas);
    end;
end;

procedure TfrmInicial.Combustveis1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCadCombustivel,frmCadCombustivel);
    try
        frmCadCombustivel.ShowModal;
    finally
        FreeAndNil(frmCadCombustivel);
    end;
end;

procedure TfrmInicial.Comissesporfrentista1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmRelComissao, frmRelComissao);
    try
        frmRelComissao.ShowModal;
    finally
        FreeAndNil(frmRelComissao);
    end;
end;

procedure TfrmInicial.Compra1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmEntradas, frmEntradas);
    try
        frmEntradas.ShowModal;
    finally
        FreeAndNil(frmEntradas);
    end;
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
    FUsuarioLogado:= False;
end;

procedure TfrmInicial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then
    begin
        if Sair then
        begin
            Close;
        end;
    end;
end;

procedure TfrmInicial.FormShow(Sender: TObject);
begin
    PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TfrmInicial.Frentistas1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCadFrentistas, frmCadFrentistas);
    try
        frmCadFrentistas.ShowModal;
    finally
        FreeAndNil(frmCadFrentistas);
    end;
end;

procedure TfrmInicial.Lucroporperodo1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmRelLucroPeriodo, frmRelLucroPeriodo);
    try
        frmRelLucroPeriodo.ShowModal;
    finally
      FreeAndNil(frmRelLucroPeriodo);
    end;
end;

procedure TfrmInicial.otalGeral1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmRelTotalGeral, frmRelTotalGeral);
    try
        frmRelTotalGeral.ShowModal;
    finally
        FreeAndNil(frmRelTotalGeral);
    end;
end;

procedure TfrmInicial.rocardeusurio1Click(Sender: TObject);
begin
    TelaLogin;
end;

function TfrmInicial.Sair: boolean;
begin
    if TfrmSimpleCrud.Pergunta('Deseja sair da aplicação?')then
    begin
        Result:= True;
    end
    else
    begin
        Result:= False;
    end;
end;

procedure TfrmInicial.Sair1Click(Sender: TObject);
begin
    if Sair then
    begin
        Close;
    end;
end;

procedure TfrmInicial.TelaLogin;
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  try
      frmLogin.ShowModal;
      case frmLogin.ModalResult of
          mrOK: begin
            FUsuarioLogado:= True;
          end;
          mrCancel: begin
              Application.Terminate;
          end;
      end;
  finally
    FreeAndNil(frmLogin);
  end;
end;

procedure TfrmInicial.Usurios1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadUsuarios, frmCadUsuarios);
  try
    frmCadUsuarios.ShowModal;
  finally
    FreeAndNil(frmCadUsuarios);
  end;
end;

procedure TfrmInicial.Venda2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmVendaCombustivel, frmVendaCombustivel);
  try
    frmVendaCombustivel.ShowModal;
  finally
    FreeAndNil(frmVendaCombustivel);
  end;
end;

procedure TfrmInicial.WmAfterCreate(var Msg: TMessage);
begin

end;

procedure TfrmInicial.WmAfterShow(var Msg: TMessage);
begin
  TelaLogin;
end;

end.
