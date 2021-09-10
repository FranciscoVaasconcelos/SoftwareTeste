unit uFormBase;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
    uDataModule, Data.DB, Vcl.DBGrids, FireDAC.Comp.Client, Vcl.StdCtrls,
    ACBrUtil;

type
    TTipoCrud = (tcNone, tcInsert, tcEdit);

    TfrmBase = class(TForm)
        procedure FormKeyPress(Sender: TObject; var Key: Char);
        procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
        FTipoCrud: TTipoCrud;
        class function Pergunta(AMsg: string; ACaption: string = 'Atenção'): boolean;
        class procedure Atencao(AMsg: string; ACaption: string = 'Atenção.');
        class procedure Erro(AMsg: string; ACaption: string = 'Atenção');
        class procedure Informacao(AMsg: string; ACaption: string = 'Atenção');
        procedure DBGridTitleColor(DBGrid: TDBGrid); virtual;
        class procedure PopularComboBox(ComboBox: TComboBox; SQL: string; Conn: TFDConnection);
        class function ResultComboSelecionado(Combobox: TComboBox): integer;
        procedure SetFloatFields(DataSet: TDataSet);
    end;

var
    frmBase: TfrmBase;

implementation

{$R *.dfm}

class procedure TfrmBase.Atencao(AMsg, ACaption: string);
begin
    Application.MessageBox(PChar(AMsg), PChar(ACaption), MB_ICONWARNING + MB_OK);
end;

procedure TfrmBase.DBGridTitleColor(DBGrid: TDBGrid);
var
    I: integer;
begin
    for I := 0 to DBGrid.Columns.Count - 1 do
    begin
        DBGrid.Columns[I].Title.Color := clBtnFace;
        DBGrid.Columns[I].Title.Font.Color := clNavy;
        DBGrid.Columns[I].Title.Font.Style := [];
        DBGrid.Columns[I].Title.Alignment := taCenter;
    end;
end;

class procedure TfrmBase.Erro(AMsg, ACaption: string);
begin
    Application.MessageBox(PChar(AMsg), PChar(ACaption), MB_ICONERROR + MB_OK);
end;

procedure TfrmBase.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
    begin
        Self.Close;
    end;
end;

procedure TfrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        Perform(Wm_NextDlgCtl, 0, 0);
    end;
end;

class procedure TfrmBase.Informacao(AMsg, ACaption: string);
begin
    Application.MessageBox(PChar(AMsg), PChar(ACaption), MB_ICONINFORMATION + MB_OK);
end;

class function TfrmBase.Pergunta(AMsg, ACaption: string): boolean;
begin
    Result := Application.MessageBox(PChar(AMsg), PChar(ACaption), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
end;

class procedure TfrmBase.PopularComboBox(ComboBox: TComboBox; SQL: string; Conn: TFDConnection);
var
    qry: TFDQuery;
begin
    qry := TFDQuery.Create(nil);
    qry.Connection := Conn;
    try
        ComboBox.Items.Clear;
        qry.Close;
        qry.Open(SQL);
        if qry.RecordCount > 0 then
        begin
            while not qry.Eof do
            begin
                ComboBox.Items.Add(qry.Fields[0].AsString + ' - ' + qry.Fields[1].AsString);
                qry.Next;
            end;
        end
        else
        begin
            ComboBox.Items.Add('Nenhum registro');
        end;
    finally
        FreeAndNil(qry);
    end;
end;

class function TfrmBase.ResultComboSelecionado(Combobox: TComboBox): integer;
var
    i: integer;
begin
    try
        i := StrToIntDef(OnlyNumber(Copy(Combobox.Text, 1, 3)), 0);
        Result := i;
    except
        Self.Informacao('Selecione algum dado na caixa de seleção!');
    end;
end;

procedure TfrmBase.SetFloatFields(DataSet: TDataSet);
var
    i: integer;
    Campo: string;
begin
    Campo := '';
    for i := 0 to DataSet.FieldCount - 1 do
    begin
        if (DataSet.Fields[i].DataType = ftFloat) or (DataSet.Fields[i].DataType = ftBCD) then
        begin
            Campo := DataSet.Fields[i].FieldName;
            DataSet.FieldByName(Campo).DefaultExpression := '0.00';
            if DataSet.FieldByName(Campo) is TNumericField then
            begin
                TNumericField(DataSet.FieldByName(Campo)).DisplayFormat := '##,###,##0.00';
            end;
        end;
    end;
end;

end.

