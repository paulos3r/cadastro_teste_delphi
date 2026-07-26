unit _Agendamento;

interface
uses System.SysUtils, system.Generics.Collections,system.Classes, ZDataset;

type
  TAgendamento=class
  private
    FAgendamento_id:Integer;
    FNome:string;
    FCliente_id:Integer;
    FAtendente_id:Integer;
    FData_agendamento:TDateTime;
    FObservacao:string;
  public
    property AgendamentoId: Integer  read FAgendamento_id;
    property Nome: string            read FNome;
    property ClienteId: Integer      read FCliente_id;
    property AtendenteId: Integer    read FAtendente_id;
    property DataAgendamento: TDateTime read FData_agendamento;
    property Observacao: string      read FObservacao;

    procedure Atualizar(agendamento_id,cliente_id,atendente_id:Integer; data:TDateTime; nome,observacao:string);
    procedure Cadastrar(agendamento_id,cliente_id,atendente_id:Integer; data:TDateTime; nome,observacao:string);
    procedure BuscarPorId(agendamento_id:Integer);
    procedure Excluir(agendamento_id:Integer);
  end;

implementation

uses _ConexaoBancoDeDados, ZConnection;

{ TAgendamento }

procedure TAgendamento.Atualizar(agendamento_id,cliente_id,atendente_id:Integer; data:TDateTime; nome,observacao:string);
var
  qry: TZQuery;
  conn: TZConnection;
begin
  conn := dmConexaoOracle.zConexao;
  qry := TZQuery.Create(nil);
  try
    qry.Connection := conn;
    qry.SQL.Text :=
      'update AGENDAMENTOS ' +
      'set NOME=:NOME, ' +
      'CLIENTE_ID=:CLIENTE_ID, ' +
      'ATENDENTE_ID=:ATENDENTE_ID, ' +
      'DATA_AGENDAMENTO=:DATA_AGENDAMENTO ' +
      'OBSERVACAO=:OBSERVACAO ' +
      'where AGENDAMENTO_ID=:AGENDAMENTO_ID';

    qry.ParamByName('NOME').AsString:=nome;
    qry.ParamByName('CLIENTE_ID').AsInteger:=cliente_id;
    qry.ParamByName('ATENDENTE_ID').AsInteger:=atendente_id;
    qry.ParamByName('DATA_AGENDAMENTO').AsDateTime:=data;
    qry.ParamByName('OBSERVACAO').AsString:=Self.FObservacao;

    qry.ParamByName('AGENDAMENTO_ID').AsInteger:=agendamento_id;

    try
      qry.ExecSQL;
      conn.Commit;
    except
      conn.Rollback;
      raise;
    end;

  finally
    qry.Free;
  end;
end;

procedure TAgendamento.BuscarPorId(agendamento_id:Integer);
var 
  qry: TZQuery;
  conn: TZConnection;
begin
  conn := dmConexaoOracle.zConexao;
  qry := TZQuery.Create(nil);

  try
    qry.Connection := conn;
    qry.SQL.Text := 
      'select AGENDAMENTO_ID,NOME,CLIENTE_ID,ATENDENTE_ID,DATA_AGENDAMENTO,OBSERVACAO ' +
      'from AGENDAMENTOS ' +
      'where AGENDAMENTO_ID=:AGENDAMENTO_ID';

    qry.ParamByName('AGENDAMENTO_ID').AsInteger:=agendamento_id;

    qry.Open;

    while not qry.Eof do begin
      FAgendamento_id := qry.FieldByName('AGENDAMENTO_ID').AsInteger;
    end;

    try
      qry.ExecSQL;
    except
      conn.Rollback;
      raise;
    end;
  finally
    qry.Free;
  end;

  
end;

procedure TAgendamento.Cadastrar(agendamento_id,cliente_id,atendente_id:Integer; data:TDateTime; nome,observacao: string);
var
  qry: TZQuery;
  conn: TZConnection;
begin
  conn := dmConexaoOracle.zConexao;
  qry := TZQuery.Create(nil);
  try
    qry.Connection := conn;
    qry.SQL.Text :=
      'insert into AGENDAMENTOS ' +
      '(NOME,CLIENTE_ID,ATENDENTE_ID,DATA_AGENDAMENTO,OBSERVACAO) ' +
      'values ' +
      '(:NOME,:CLIENTE_ID,:ATENDENTE_ID,:DATA_AGENDAMENTO,:OBSERVACAO) ';

    qry.ParamByName('NOME').AsString := nome;
    qry.ParamByName('CLIENTE_ID').AsInteger:=Self.FCliente_id;
    qry.ParamByName('ATENDENTE_ID').AsInteger:=Self.FAgendamento_id;
    qry.ParamByName('DATA_AGENDAMENTO').AsDateTime:=Self.FData_agendamento;
    qry.ParamByName('OBSERVACAO').AsString:=Self.FObservacao;

    try
      qry.ExecSQL;
      conn.Commit;
    except
      conn.Rollback;
      raise;
    end;

  finally
    qry.Free;
  end;
end;

procedure TAgendamento.Excluir(agendamento_id: Integer);
  var
    qry:TZQuery;
    conn:TZConnection;
begin
  conn:= dmConexaoOracle.zConexao;
  qry :=TZQuery.Create(nil);

  try
    qry.Connection := conn;
    qry.SQL.Text := 'delete from AGENDAMENTOS where AGENDAMENTO_ID = :AGENDAMENTO_ID ';

    qry.ParamByName('AGENDAMENTO_ID').AsInteger := Self.FAgendamento_id;

    try
      qry.ExecSQL;
      conn.Commit;
    except
      conn.Rollback;
      raise;
    end;
  finally
    qry.Free;
  end;

end;

end.
