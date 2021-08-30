unit uFormCadUsuarios;

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
  TfrmCadUsuarios = class(TfrmSimpleCrud)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    procedure qrAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

procedure TfrmCadUsuarios.qrAfterOpen(DataSet: TDataSet);
begin
    inherited;
    DBGrid.Columns[2].Visible:= False;
    DBGrid.Columns[0].Title.Caption:= 'Código';
    DBGrid.Columns[1].Title.Caption:= 'Nome usuário';
    DBGrid.Columns[1].Width:= ((DBGrid.Width - DBGrid.Columns[0].Width) - 50);
end;

end.
