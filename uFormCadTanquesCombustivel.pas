unit uFormCadTanquesCombustivel;

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
  TfrmCadTanques = class(TfrmSimpleCrud)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    qrCombustivel: TFDQuery;
    ds1: TDataSource;
    cmbBomba: TJvDBLookupCombo;
    Label4: TLabel;
    qrId: TFDAutoIncField;
    qrIdCombustivel: TIntegerField;
    qrNomeTanque: TStringField;
    qrCapacidade: TBCDField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTanques: TfrmCadTanques;

implementation

{$R *.dfm}

procedure TfrmCadTanques.FormCreate(Sender: TObject);
begin
    inherited;
    qrCombustivel.Open;
end;

end.
