unit uFormRelComissao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask,
  JvExMask, JvToolEdit, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmRelComissao = class(TfrmBase)
    btnConsultar: TButton;
    btnSair: TButton;
    btnImprimir: TButton;
    DBGrid: TJvDBGrid;
    dtInicial: TJvDateEdit;
    dtFinal: TJvDateEdit;
    ds: TDataSource;
    qr: TFDQuery;
    PopupMenu1: TPopupMenu;
    CloseDataSet1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    procedure CloseDataSet1Click(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qrAfterOpen(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure BotaoConsultar;
    procedure BotaoImprimir;
  public
    { Public declarations }
  end;

var
  frmRelComissao: TfrmRelComissao;

implementation

uses
  uFormRelatorios;

{$R *.dfm}

procedure TfrmRelComissao.BotaoConsultar;
var
    DataInicial, DataFinal: string;
begin
    DataInicial:= FormatDateTime('YYYY-mm-dd', dtInicial.Date) + ' 00:00:00';
    DataFinal:= FormatDateTime('YYYY-mm-dd', dtFinal.Date)  + ' 23:59:59';
    qr.Close;
    if (dtInicial.Date > dtFinal.Date) or (dtFinal.Date < dtInicial.Date)then
    begin
        Erro('Período inválido!');
        dtInicial.SetFocus;
        Abort;
    end;
    qr.ParamByName('DataInicial').AsString:= DataInicial;
    qr.ParamByName('DataFinal').AsString:= DataFinal;
    qr.Open;
    if qr.IsEmpty then
    begin
        Informacao('Nenhum dado retornado neste período!');
    end;
end;

procedure TfrmRelComissao.BotaoImprimir;
begin
    if not(qr.Active)then
    begin
        Exit;
    end;
    if (qr.Active) and (qr.RecordCount <= 0) then
    begin
        Informacao('Nenhum dado para imprimir!');
        Exit;
    end;
    Application.CreateForm(TfrmRelatorios, frmRelatorios);
    try
        frmRelatorios.RLReport3.DataSource  := Self.ds;
        frmRelatorios.lbPeriodo3.Caption    := frmRelatorios.lbPeriodo3.Caption + ': '+ DateToStr(dtInicial.Date) + ' à ' + DateToStr(dtFinal.Date);
        frmRelatorios.RLReport3.Preview;
    finally
        FreeAndNil(frmRelatorios);
    end;
end;

procedure TfrmRelComissao.btnConsultarClick(Sender: TObject);
begin
    inherited;
    BotaoConsultar;
end;

procedure TfrmRelComissao.btnImprimirClick(Sender: TObject);
begin
    inherited;
    BotaoImprimir;
end;

procedure TfrmRelComissao.btnSairClick(Sender: TObject);
begin
    inherited;
    Close;
end;

procedure TfrmRelComissao.CloseDataSet1Click(Sender: TObject);
begin
    inherited;
    qr.Close;
end;

procedure TfrmRelComissao.qrAfterOpen(DataSet: TDataSet);
begin
    inherited;
    DBGridTitleColor(DBGrid);
end;

end.
