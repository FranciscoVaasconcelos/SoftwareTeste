unit uFormCadBicosCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormSimpleCrud, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, JvExControls, JvDBLookup;

type
  TfrmCadBicosCombustivel = class(TfrmSimpleCrud)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    cmbTanque: TJvDBLookupCombo;
    qrTanques: TFDQuery;
    ds1: TDataSource;
    Label3: TLabel;
    cmbBomba: TJvDBLookupCombo;
    Label4: TLabel;
    ds2: TDataSource;
    qrBomba: TFDQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBicosCombustivel: TfrmCadBicosCombustivel;

implementation

{$R *.dfm}

procedure TfrmCadBicosCombustivel.FormCreate(Sender: TObject);
begin
    inherited;
    qrTanques.Open;
    qrBomba.Open;
end;

end.
