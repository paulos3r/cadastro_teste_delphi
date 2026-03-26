unit _Cliente;

interface
uses System.SysUtils, system.Generics.Collections,system.Classes, ZDataset;
type
  TCliente = class
  private
    FCliente_id:Integer;
    FNome:string;
    FData_nascimento:TDateTime;
    FStatus:string;
    FCpf_cnpj:string;

    FTelefone:string;
    FEmail:string;
    FData_cadastro:TDateTime;
    FLimite:Double;
    FFormaPamento:string;

    FEndereco:string;
    FBairro:string;
    FCidade:string;
    FUf:string;
    FCep:string;

  public
    constructor Create;

    property codigo:Integer read FCliente_id write FCliente_id;
    property nome:string read FNome write FNome;
    property data_nascimento:TDateTime read FData_nascimento write FData_nascimento;
    property status:string read FStatus write FStatus;
    property cpf_cnpj:string read FCpf_cnpj write FCpf_cnpj;

    property telefone:string read FTelefone write FTelefone;
    property email:string read FEmail write FEmail;
    property data_cadastro:TDateTime read FData_cadastro write FData_cadastro ;
    property limite:Double read FLimite write FLimite;
    property forma_pagamento:string read FFormaPamento write FFormaPamento;

    property endereco:string read FEndereco write FEndereco;
    property bairro:string read FBairro write FBairro;
    property cidade:string read FCidade write FCidade;
    property uf:string read FUf write FUf;
    property cep:string read FCep write FCep;

    procedure Cadastrar;
    procedure Atualizar(AId:Integer);
    procedure Excluir;
    procedure MapearParametros(qry:TZQuery);

    function Buscar():TZQuery;
    function BuscarPorId(const Value:Integer):TCliente;
    class function BuscarClientes(nome_cgc:string):TObjectList<TCliente>;
  end;

implementation

uses _ConexaoBancoDeDados, ZConnection;

{ TCliente }


constructor TCliente.Create;
begin
end;

procedure TCliente.Atualizar;
var
  qry: TZQuery;
  Conn: TZConnection;
begin
  if FCliente_id <= 0 then
    raise Exception.Create('Cliente inválido para atualização.');

  Conn := dmConexaoOracle.zConexao;

  qry := TZQuery.Create(nil);
  try
    qry.Connection := Conn;

    qry.SQL.Text :=
      'update CLIENTES set ' +
      'NOME = :NOME, ' +
      'DATA_NASCIMENTO = :DATA_NASCIMENTO, ' +
      'STATUS = :STATUS, ' +
      'CPF_CNPJ = :CPF_CNPJ, ' +
      'TELEFONE = :TELEFONE, ' +
      'EMAIL = :EMAIL, ' +
      'DATA_CADASTRO = :DATA_CADASTRO, ' +
      'LIMITE = :LIMITE, ' +
      'ENDERECO = :ENDERECO, ' +
      'BAIRRO = :BAIRRO, ' +
      'CIDADE = :CIDADE, ' +
      'UF = :UF, ' +
      'CEP = :CEP ' +
      'where CLIENTE_ID = :CLIENTE_ID';

    qry.ParamByName('CLIENTE_ID').AsInteger       := FCliente_id;
    qry.ParamByName('NOME').AsString              := FNome;
    qry.ParamByName('DATA_NASCIMENTO').AsDateTime := FData_nascimento;
    qry.ParamByName('STATUS').AsString            := FStatus;
    qry.ParamByName('CPF_CNPJ').AsString          := FCpf_cnpj;
    qry.ParamByName('TELEFONE').AsString          := FTelefone;
    qry.ParamByName('EMAIL').AsString             := FEmail;
    qry.ParamByName('DATA_CADASTRO').AsDateTime   := FData_cadastro;
    qry.ParamByName('LIMITE').AsCurrency          := FLimite;
    qry.ParamByName('ENDERECO').AsString          := FEndereco;
    qry.ParamByName('BAIRRO').AsString            := FBairro;
    qry.ParamByName('CIDADE').AsString            := FCidade;
    qry.ParamByName('UF').AsString                := FUf;
    qry.ParamByName('CEP').AsString               := FCep;

    if not Conn.InTransaction then
      Conn.StartTransaction;

    try
      qry.ExecSQL;

      if qry.RowsAffected = 0 then
        raise Exception.Create('Nenhum registro foi atualizado.');

      Conn.Commit;
    except
      Conn.Rollback;
      raise;
    end;

  finally
    qry.Free;
  end;
end;


function TCliente.Buscar:TZQuery;
var
  qry: TZQuery;
  cliente:TCliente;
begin
  qry := TZQuery.Create(nil);
  qry.Connection := dmConexaoOracle.zConexao;

    qry.SQL.Text :=
        'select CLIENTE_ID, NOME, DATA_NASCIMENTO, STATUS, CPF_CNPJ, ' +
        'TELEFONE, EMAIL, DATA_CADASTRO, LIMITE, ' +
        'ENDERECO, BAIRRO, CIDADE, UF, CEP ' +
        'from CLIENTES ' +
        'where (CLIENTE_ID = :ID) or (NOME like :NOME)';
    qry.ParamByName('ID').AsInteger := FCliente_id;
    qry.ParamByName('NOME').AsString := '%' + FNome + '%';

    try
      qry.Open;
      Result := qry;
    except
      on E:Exception do begin
        qry.Free;
        raise Exception.Create('Error ao buscar o cleinte ' + e.Message);
      end;
    end;
end;

class function TCliente.BuscarClientes(nome_cgc:string): TObjectList<TCliente>;
var
  qry:TZQuery;
  cliente: TCliente;
begin

  Result:= TObjectList<TCliente>.Create;

  qry:= TZQuery.Create(nil);

  try
    qry.Connection := dmConexaoOracle.zConexao;
    qry.SQL.Text := 'select CLIENTE_ID,NOME,CPF_CNPJ from CLIENTES where CPF_CNPJ like :CPF_CNPJ or NOME like :NOME';

    qry.ParamByName('CPF_CNPJ').AsString := '%' + nome_cgc + '%';
    qry.ParamByName('NOME').AsString := '%' + nome_cgc + '%';

    qry.Open;

    while not qry.Eof do begin

      cliente:= TCliente.Create;

      cliente.FCliente_id:= qry.FieldByName('CLIENTE_ID').AsInteger;
      cliente.nome:=qry.FieldByName('NOME').AsString;
      cliente.cpf_cnpj:=qry.FieldByName('CPF_CNPJ').AsString;

      Result.Add(cliente);

      qry.Next;
    end;

  finally
    qry.Free;
  end;
end;

function TCliente.BuscarPorId(const Value: Integer): TCliente;
var qry: TZQuery;
begin
  Result := nil;

  qry:= TZQuery.Create(nil);
  qry.Connection := dmConexaoOracle.zConexao;

  try
    qry.Connection := dmConexaoOracle.zConexao;
    qry.SQL.Text :=
        'select CLIENTE_ID, NOME, DATA_NASCIMENTO, STATUS, CPF_CNPJ, ' +
        'TELEFONE, EMAIL, DATA_CADASTRO, LIMITE, ' +
        'ENDERECO, BAIRRO, CIDADE, UF, CEP ' +
        'from CLIENTES ' +
        'where CLIENTE_ID = :CLIENTE_ID';

        qry.ParamByName('CLIENTE_ID').AsInteger := Value;

    qry.Open;

    if not qry.Eof then begin
      Result := TCliente.Create;

      Result.FCliente_id     := qry.FieldByName('CLIENTE_ID').AsInteger;
      Result.FNome           := qry.FieldByName('NOME').AsString;
      Result.FData_nascimento := qry.FieldByName('DATA_NASCIMENTO').AsDateTime;
      Result.FStatus         := qry.FieldByName('STATUS').AsString;
      Result.FCpf_cnpj       := qry.FieldByName('CPF_CNPJ').AsString;
      Result.FTelefone       := qry.FieldByName('TELEFONE').AsString;
      Result.FEmail          := qry.FieldByName('EMAIL').AsString;
      Result.FData_cadastro  := qry.FieldByName('DATA_CADASTRO').AsDateTime;
      Result.FLimite         := qry.FieldByName('LIMITE').AsCurrency;
      Result.FEndereco       := qry.FieldByName('ENDERECO').AsString;
      Result.FBairro         := qry.FieldByName('BAIRRO').AsString;
      Result.FCidade         := qry.FieldByName('CIDADE').AsString;
      Result.FUf             := qry.FieldByName('UF').AsString;
      Result.FCep            := qry.FieldByName('CEP').AsString;
    end;

  finally
    qry.Free;
  end;
end;

procedure TCliente.Cadastrar;
var qry:TZQuery; conn:TZConnection;
begin
  qry:= TZQuery.Create(nil);
  conn := dmConexaoOracle.zConexao;

  try
    qry.Connection := conn;

    qry.SQL.Text :=
      'insert into CLIENTES (' +
      'NOME, DATA_NASCIMENTO, STATUS, CPF_CNPJ, ' +
      'TELEFONE, EMAIL, DATA_CADASTRO, LIMITE, ' +
      'ENDERECO, BAIRRO, CIDADE, UF, CEP) ' +
      'values (' +
      ':NOME, :DATA_NASCIMENTO, :STATUS, :CPF_CNPJ, ' +
      ':TELEFONE, :EMAIL, :DATA_CADASTRO, :LIMITE, ' +
      ':ENDERECO, :BAIRRO, :CIDADE, :UF, :CEP)';

    qry.ParamByName('NOME').AsString              := FNome;
    qry.ParamByName('DATA_NASCIMENTO').AsDateTime := FData_nascimento;
    qry.ParamByName('STATUS').AsString            := FStatus;
    qry.ParamByName('CPF_CNPJ').AsString          := FCpf_cnpj;

    qry.ParamByName('TELEFONE').AsString        := FTelefone;
    qry.ParamByName('EMAIL').AsString           := FEmail;
    qry.ParamByName('DATA_CADASTRO').AsDateTime := FData_cadastro;
    qry.ParamByName('LIMITE').AsCurrency        := FLimite;

    qry.ParamByName('ENDERECO').AsString := FEndereco;
    qry.ParamByName('BAIRRO').AsString   := FBairro;
    qry.ParamByName('CIDADE').AsString   := FCidade;
    qry.ParamByName('UF').AsString       := FUf;
    qry.ParamByName('CEP').AsString      := FCep;

    if not conn.InTransaction then
      conn.StartTransaction;

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

procedure TCliente.Excluir;
var
  qry:TZQuery;
  conn:TZConnection;
begin
  if FCliente_id <=0 then
    raise Exception.Create('Cliente inválido para excluir.');

  conn := dmConexaoOracle.zConexao;
  qry:= TZQuery.Create(nil);

  try
    qry.Connection:=conn;
    qry.SQL.Text :=
    'delete from CLIENTES ' +
    'where CLIENTE_ID = :CLIENTE_ID';

    qry.ParamByName('CLIENTE_ID').AsInteger := FCliente_id;

    if not conn.InTransaction then
      conn.StartTransaction;

    try
      qry.ExecSQL;

      if qry.RowsAffected=0 then
        raise Exception.Create('Nem um registro foi excluido.');

      conn.Commit;
    except
      conn.Rollback;
      raise;
    end;

  finally
    qry.Free;
  end;
end;
procedure TCliente.MapearParametros(qry:TZQuery);
begin
  qry.ParamByName('NOME').AsString              := FNome;
  qry.ParamByName('DATA_NASCIMENTO').AsDateTime := FData_nascimento;
  qry.ParamByName('STATUS').AsString            := FStatus;
  qry.ParamByName('CPF_CNPJ').AsString          := FCpf_cnpj;

  qry.ParamByName('TELEFONE').AsString        := FTelefone;
  qry.ParamByName('EMAIL').AsString           := FEmail;
  qry.ParamByName('DATA_CADASTRO').AsDateTime := FData_cadastro;
  qry.ParamByName('LIMITE').AsCurrency        := FLimite;

  qry.ParamByName('ENDERECO').AsString := FEndereco;
  qry.ParamByName('BAIRRO').AsString   := FBairro;
  qry.ParamByName('CIDADE').AsString   := FCidade;
  qry.ParamByName('UF').AsString       := FUf;
  qry.ParamByName('CEP').AsString      := FCep;
end;

end.
