unit uFormRelTotalGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormBase, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, JvExMask, JvToolEdit, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TfrmRelTotalGeral = class(TfrmBase)
      Label1: TLabel;
      Label2: TLabel;
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
      procedure qrAfterOpen(DataSet: TDataSet);
      procedure btnConsultarClick(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure CloseDataSet1Click(Sender: TObject);
  private
      { Private declarations }
      procedure BotaoConsultar;
      procedure BotaoImprimir;
  public
      { Public declarations }
  end;

var
  frmRelTotalGeral: TfrmRelTotalGeral;

implementation

uses
  uFormRelatorios, uDataModule;

{$R *.dfm}

{ TfrmRelTotalGeral }

procedure TfrmRelTotalGeral.BotaoConsultar;
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

procedure TfrmRelTotalGeral.BotaoImprimir;
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
        frmRelatorios.RLReport1.DataSource  := Self.ds;
        frmRelatorios.lbPeriodo1.Caption    := frmRelatorios.lbPeriodo1.Caption + ': '+ DateToStr(dtInicial.Date) + ' à ' + DateToStr(dtFinal.Date);
        frmRelatorios.RLReport1.Preview;
    finally
        FreeAndNil(frmRelatorios);
    end;
    //
end;

procedure TfrmRelTotalGeral.btnConsultarClick(Sender: TObject);
begin
    inherited;
    BotaoConsultar;
end;

procedure TfrmRelTotalGeral.btnImprimirClick(Sender: TObject);
begin
    inherited;
    BotaoImprimir;
end;

procedure TfrmRelTotalGeral.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelTotalGeral.CloseDataSet1Click(Sender: TObject);
begin
    inherited;
    qr.Close;
end;

procedure TfrmRelTotalGeral.qrAfterOpen(DataSet: TDataSet);
begin
    inherited;
    DBGridTitleColor(DBGrid);
    DBGrid.Columns[0].Width:= 300;
    DBGrid.Columns[1].Width:= 60;
    DBGrid.Columns[2].Width:= 60;
    DBGrid.Columns[3].Width:= 60;
    DBGrid.Columns[4].Width:= 60;
end;

end.
