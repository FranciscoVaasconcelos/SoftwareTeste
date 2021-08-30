unit Classe.DadosTanqueCombustivel;

interface

uses
  FireDAC.Comp.Client, System.Classes;
type
  TDadosCombustivelVenda = class
  private
    FIdBicoBomba: integer;
    FIdCombustivel: integer;
    FNomeTanque: string;
    FPrecoVenda: double;
    FIdBomba: integer;
    FCapacidade: double;
    FNomeCombustivel: string;
    FNomeBomba: string;
    FIdTanque: integer;
    FQuantidadeDisponivel: double;
    FQuantidadeMinima: double;
    procedure SetCapacidade(const Value: double);
    procedure SetIdBicoBomba(const Value: integer);
    procedure SetIdBomba(const Value: integer);
    procedure SetIdCombustivel(const Value: integer);
    procedure SetIdTanque(const Value: integer);
    procedure SetNomeBomba(const Value: string);
    procedure SetNomeCombustivel(const Value: string);
    procedure SetNomeTanque(const Value: string);
    procedure SetPrecoVenda(const Value: double);
    procedure SetQuantidadeDisponivel(const Value: double);
    procedure SetQuantidadeMinima(const Value: double);
  public
    property IdTanque: integer read FIdTanque write SetIdTanque;
    property NomeTanque: string read FNomeTanque write SetNomeTanque;
    property Capacidade: double read FCapacidade write SetCapacidade;
    property PrecoVenda: double read FPrecoVenda write SetPrecoVenda;
    property IdCombustivel: integer read FIdCombustivel write SetIdCombustivel;
    property NomeCombustivel: string read FNomeCombustivel write SetNomeCombustivel;
    property IdBicoBomba: integer read FIdBicoBomba write SetIdBicoBomba;
    property IdBomba: integer read FIdBomba write SetIdBomba;
    property NomeBomba: string read FNomeBomba write SetNomeBomba;
    property QuantidadeDisponivel: double read FQuantidadeDisponivel write SetQuantidadeDisponivel;
    property QuantidadeMinima: double read FQuantidadeMinima write SetQuantidadeMinima;
  published
    constructor Create(IdBico: integer; IdTanque: integer; Conn: TFDConnection;SQL1, SQL2: TStrings);overload;
    destructor Destroy; override;
    function QuantMinima(Capacidade: double): double;
  end;

implementation

{ TDadosTanque }

constructor TDadosCombustivelVenda.Create(IdBico: integer; IdTanque: integer; Conn: TFDConnection; SQL1, SQL2: TStrings);
var
  qr1, qr2: TFDQuery;
begin
  try
    qr1                       := TFDQuery.Create(nil);
    qr1.Connection            := Conn;
    qr1.SQL.Text              := SQL1.Text;
    qr1.ParamByName('ID').AsInteger:= IdBico;
    qr1.Open;
    if not(qr1.IsEmpty)then
    begin
      Self.IdTanque             := qr1.FieldByName('IdTanque').AsInteger;
      Self.IdCombustivel        := qr1.FieldByName('IdComb').AsInteger;
      Self.NomeTanque           := qr1.FieldByName('NomeTanque').AsString;
      Self.Capacidade           := qr1.FieldByName('Capacidade').AsFloat;
      Self.PrecoVenda           := qr1.FieldByName('PrecoPorLitro').AsFloat;
      Self.IdBicoBomba          := qr1.FieldByName('IdBicoBomba').AsInteger;
      Self.QuantidadeMinima     := QuantMinima(qr1.FieldByName('Capacidade').AsFloat);
    end;
  finally
    qr1.Free;
  end;
  try
    qr2                         := TFDQuery.Create(nil);
    qr2.Connection              := Conn;
    qr2.SQL.Text                := SQL2.Text;
    qr2.ParamByName('ID').AsInteger:= IdTanque;
    qr2.Open;
    if not(qr2.IsEmpty)then
    begin
      Self.QuantidadeDisponivel := qr2.FieldByName('QuantAtualNoTanque').AsFloat;

    end;
  finally
    qr2.Free;
  end;
end;

destructor TDadosCombustivelVenda.Destroy;
begin

  inherited;
end;

function TDadosCombustivelVenda.QuantMinima(Capacidade: double): double;
begin
  Result:= Capacidade * 0.02;
end;

procedure TDadosCombustivelVenda.SetCapacidade(const Value: double);
begin
  FCapacidade := Value;
end;

procedure TDadosCombustivelVenda.SetIdBicoBomba(const Value: integer);
begin
  FIdBicoBomba := Value;
end;

procedure TDadosCombustivelVenda.SetIdBomba(const Value: integer);
begin
  FIdBomba := Value;
end;

procedure TDadosCombustivelVenda.SetIdCombustivel(const Value: integer);
begin
  FIdCombustivel := Value;
end;

procedure TDadosCombustivelVenda.SetIdTanque(const Value: integer);
begin
  FIdTanque := Value;
end;

procedure TDadosCombustivelVenda.SetNomeBomba(const Value: string);
begin
  FNomeBomba := Value;
end;

procedure TDadosCombustivelVenda.SetNomeCombustivel(const Value: string);
begin
  FNomeCombustivel := Value;
end;

procedure TDadosCombustivelVenda.SetNomeTanque(const Value: string);
begin
  FNomeTanque := Value;
end;

procedure TDadosCombustivelVenda.SetPrecoVenda(const Value: double);
begin
  FPrecoVenda := Value;
end;

procedure TDadosCombustivelVenda.SetQuantidadeDisponivel(const Value: double);
begin
  FQuantidadeDisponivel := Value;
end;

procedure TDadosCombustivelVenda.SetQuantidadeMinima(const Value: double);
begin
  FQuantidadeMinima := Value;
end;

end.
