unit uFormEntradas;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
    uFormBase, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
    FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
    Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TfrmEntradas = class(TfrmBase)
        Panel1: TPanel;
        btnFechar: TButton;
        btnExcluir: TButton;
        btnAlterar: TButton;
        btnIncluir: TButton;
        DBGrid: TJvDBGrid;
        ds: TDataSource;
        qr: TFDQuery;
        procedure FormCreate(Sender: TObject);
        procedure btnIncluirClick(Sender: TObject);
        procedure qrAfterOpen(DataSet: TDataSet);
        procedure btnFecharClick(Sender: TObject);
        procedure qrBeforeOpen(DataSet: TDataSet);
        procedure FormShow(Sender: TObject);
        procedure btnExcluirClick(Sender: TObject);
        procedure btnAlterarClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmEntradas: TfrmEntradas;

implementation

uses
    uDataModule, uFormCadEntradas;

{$R *.dfm}

procedure TfrmEntradas.btnAlterarClick(Sender: TObject);
begin
    inherited;
    Application.CreateForm(TfrmCadEntrada, frmCadEntrada);
    try
        frmCadEntrada.FTipoCrud := tcEdit;
        frmCadEntrada.ShowModal;
        case frmCadEntrada.ModalResult of
            mrOk:
                begin
                    qr.Refresh;
                end;
            mrCancel:
                begin

                end;
        end;
    finally
        FreeAndNil(frmCadEntrada);
    end;
end;

procedure TfrmEntradas.btnExcluirClick(Sender: TObject);
begin
    inherited;
    if Pergunta('Deseja excluir este registro?') then
    begin
        try
            qr.Delete;
        except
            on e: Exception do
            begin
                Erro(e.Message);
            end;
        end;
    end;
end;

procedure TfrmEntradas.btnFecharClick(Sender: TObject);
begin
    inherited;
    Close;
end;

procedure TfrmEntradas.btnIncluirClick(Sender: TObject);
begin
    inherited;
    Application.CreateForm(TfrmCadEntrada, frmCadEntrada);
    try
        frmCadEntrada.ShowModal;
        case frmCadEntrada.ModalResult of
            mrOk:
                begin
                    qr.Refresh;
                end;
            mrCancel:
                begin

                end;
        end;
    finally
        FreeAndNil(frmCadEntrada);
    end;
end;

procedure TfrmEntradas.FormCreate(Sender: TObject);
begin
    inherited;
    qr.Open;
end;

procedure TfrmEntradas.FormShow(Sender: TObject);
begin
    inherited;
    SetFloatFields(qr);
end;

procedure TfrmEntradas.qrAfterOpen(DataSet: TDataSet);
begin
    inherited;
    DBGrid.Columns[0].Title.Caption := 'Código';
    DBGrid.Columns[1].Title.Caption := 'Tipo Combustível';
    DBGrid.Columns[2].Title.Caption := 'Quantidade';
    DBGrid.Columns[3].Title.Caption := 'Total Custo';
    DBGrid.Columns[4].Title.Caption := 'Data Entrada';
    DBGridTitleColor(DBGrid);
end;

procedure TfrmEntradas.qrBeforeOpen(DataSet: TDataSet);
begin
    inherited;
    SetFloatFields(qr);
end;

end.

