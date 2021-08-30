unit uFormSimpleCrud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, JvExDBGrids, JvDBGrid;

type
  TfrmSimpleCrud = class(TfrmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ds: TDataSource;
    qr: TFDQuery;
    Panel1: TPanel;
    btnFechar: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnIncluir: TButton;
    DBGrid: TJvDBGrid;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qrAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Incluir;
    procedure Alterar;
    function CancelarOuSair: boolean;
  public
    { Public declarations }
  end;

var
  frmSimpleCrud: TfrmSimpleCrud;

implementation

uses
  uDataModule;

{$R *.dfm}

procedure TfrmSimpleCrud.Alterar;
begin
  if not(qr.Active)then
  begin
    Abort;
  end;
  if (qr.Active) and (qr.RecordCount > 0)then
  begin
    PageControl1.ActivePageIndex:= 1;
    qr.Edit;
  end
  else
  begin
    Self.Erro('Nenhum registro para alterar!', 'Erro');
  end;
end;

procedure TfrmSimpleCrud.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Alterar;
end;

procedure TfrmSimpleCrud.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSimpleCrud.btnExcluirClick(Sender: TObject);
begin
    inherited;
    if Pergunta('Deseja excluir este registro?')then
    begin
        try
            qr.Delete;
        except on E : Exception do
            begin
                Application.MessageBox(PWideChar(E.Message), 'Erro:', 0);
            end;
        end;
    end;
end;

procedure TfrmSimpleCrud.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSimpleCrud.btnIncluirClick(Sender: TObject);
begin
  inherited;
  incluir;
end;

procedure TfrmSimpleCrud.btnSalvarClick(Sender: TObject);
begin
    inherited;
    if qr.State in[dsInsert, dsEdit]then
    begin
        try
            qr.Post;
            PageControl1.ActivePageIndex:= 0;
        except on E : Exception do
            begin
                Application.MessageBox(PWideChar(E.Message), 'Erro:', 0);
            end;
        end;
    end;
end;

function TfrmSimpleCrud.CancelarOuSair: boolean;
begin
    case qr.State of
        dsInsert: begin
            if Self.Pergunta('Deseja cancelar a inclusão deste cadastro?')then
            begin
                Result:= True;
            end
            else
            begin
                Result:= False;
            end;
        end;
        dsEdit: begin
            if Self.Pergunta('Deseja cancelar a alteração deste cadastro?')then
            begin
                Result:= True;
                qr.Cancel;
                PageControl1.ActivePageIndex:= 0;
            end
            else
            begin
                Result:= False;
            end;
        end;
    end;
end;

procedure TfrmSimpleCrud.DBGridDblClick(Sender: TObject);
begin
    inherited;
    Alterar;
end;

procedure TfrmSimpleCrud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    inherited;
    if not(qr.State in[dsInsert, dsEdit])then
    begin
        Close;
    end
    else
    begin
        if CancelarOuSair then
        begin
            qr.Cancel;
            PageControl1.ActivePageIndex:= 0;
            Abort;
        end
        else
        begin
            Abort;
        end;
    end;
end;

procedure TfrmSimpleCrud.FormCreate(Sender: TObject);
begin
    inherited;
    TabSheet1.TabVisible:= False;
    TabSheet2.TabVisible:= False;
    PageControl1.ActivePageIndex:= 0;
    if Trim(qr.SQL.Text) <> '' then
    begin
        try
            qr.Open;
        except on E : Exception do
            begin
                Application.MessageBox(PWideChar(E.Message), 'Erro:', 0);
            end;
        end;
    end;
end;

procedure TfrmSimpleCrud.Incluir;
begin
    if qr.Active then
    begin
        PageControl1.ActivePageIndex:= 1;
        qr.Append;
    end;
end;

procedure TfrmSimpleCrud.qrAfterOpen(DataSet: TDataSet);
begin
    inherited;
    DBGridTitleColor(DBGrid);
end;

end.
