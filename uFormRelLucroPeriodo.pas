unit uFormRelLucroPeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Data.DB,
  Vcl.Mask, JvExMask, JvToolEdit, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TfrmRelLucroPeriodo = class(TfrmBase)
    btnConsultar: TButton;
    btnSair: TButton;
    btnImprimir: TButton;
    DBGrid: TJvDBGrid;
    dtInicial: TJvDateEdit;
    dtFinal: TJvDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    ds: TDataSource;
    qr: TFDQuery;
    PopupMenu1: TPopupMenu;
    CloseDataSet1: TMenuItem;
    procedure btnSairClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrAfterOpen(DataSet: TDataSet);
    procedure qrBeforeOpen(DataSet: TDataSet);
    procedure CloseDataSet1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure BotaoConsultar;
    procedure BotaoImprimir;
  public
    { Public declarations }
  end;

var
  frmRelLucroPeriodo: TfrmRelLucroPeriodo;

implementation

uses
  uDataModule, uFormRelatorios;

{$R *.dfm}

procedure TfrmRelLucroPeriodo.BotaoConsultar;
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

procedure TfrmRelLucroPeriodo.BotaoImprimir;
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
        frmRelatorios.RLReport2.DataSource  := Self.ds;
        frmRelatorios.lbPeriodo2.Caption    := frmRelatorios.lbPeriodo2.Caption + ': '+ DateToStr(dtInicial.Date) + ' à ' + DateToStr(dtFinal.Date);
        frmRelatorios.RLReport2.Preview;
    finally
        FreeAndNil(frmRelatorios);
    end;
end;

procedure TfrmRelLucroPeriodo.btnConsultarClick(Sender: TObject);
begin
    inherited;
    BotaoConsultar;
end;

procedure TfrmRelLucroPeriodo.btnImprimirClick(Sender: TObject);
begin
    inherited;
    BotaoImprimir;
end;

procedure TfrmRelLucroPeriodo.btnSairClick(Sender: TObject);
begin
    inherited;
    Close;
end;

procedure TfrmRelLucroPeriodo.CloseDataSet1Click(Sender: TObject);
begin
    inherited;
    qr.Close;
end;

procedure TfrmRelLucroPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  dtInicial.Date  := Date;
  dtFinal.Date    := Date;
end;

procedure TfrmRelLucroPeriodo.qrAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DBGridTitleColor(DBGrid);
  DBGrid.Columns[0].Width:= 30;
  DBGrid.Columns[1].Width:= 320;
  DBGrid.Columns[2].Width:= 60;
  DBGrid.Columns[3].Width:= 60;
  DBGrid.Columns[4].Width:= 60;
end;

procedure TfrmRelLucroPeriodo.qrBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetFloatFields(qr);
end;

end.
