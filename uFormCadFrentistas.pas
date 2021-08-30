unit uFormCadFrentistas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormSimpleCrud, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadFrentistas = class(TfrmSimpleCrud)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    qrId: TFDAutoIncField;
    qrNomeFrentista: TStringField;
    qrPercComissao: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFrentistas: TfrmCadFrentistas;

implementation

{$R *.dfm}

end.
