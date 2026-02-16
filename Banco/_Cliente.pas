unit _Cliente;

interface
uses System.SysUtils, system.Generics.Collections;
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

    FEndereco:string;
    FBairro:string;
    FCidade:string;
    FUf:string;
    FCep:string;

    procedure SetNome(const Value:string);
    procedure SetData_nascimento(const Value:TDateTime);
    procedure SetBairro(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetCpf_cnpj(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetLimite(const Value: Double);
    procedure SetStatus(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetUf(const Value: string);
    procedure SetCliente_id(const Value: Integer);

  public
    constructor Create;

    property codigo:Integer read FCliente_id write SetCliente_id;
    property nome:string read FNome write SetNome;
    property data_nascimento:TDateTime read FData_nascimento write SetData_nascimento;
    property status:string read FStatus write SetStatus;
    property cpf_cnpj:string read FCpf_cnpj write SetCpf_cnpj;

    property telefone:string read FTelefone write SetTelefone;
    property email:string read FEmail write SetEmail;
    property data_cadastro:TDateTime read FData_cadastro write FData_cadastro ;
    property limite:Double read FLimite write SetLimite;

    property endereco:string read FEndereco write SetEndereco;
    property bairro:string read FBairro write SetBairro;
    property cidade:string read FCidade write SetCidade;
    property uf:string read FUf write SetUf;
    property cep:string read FCep write SetCep;

    procedure Cadastrar;
    procedure Atualizar(AId:Integer);
    procedure Excluir;

    function Buscar():TObjectList<TCliente>;
  end;

implementation

uses _ConexaoBancoDeDados, ZDataset, ZConnection;

{ TCliente }

{$REGION '___ CREATE E DESTRUCTOR ___'}


constructor TCliente.Create;
begin
end;

{$ENDREGION}


{$REGION '_______ Set ________'}

{
  usando para informar os dados para o cadastros e edição sem precisar
  expondo a regra de negocio na tela evitando erros e tratamento de regra na tela
}

procedure TCliente.SetNome(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('O nome não pode ser vazio');
  if Value.Trim.Length > 100 then
    raise Exception.Create(
      Format(
      'Nome deve conter até 100 caracteres e foi informado %d caracteres.',
      [Value.Trim.Length]
  ));

  FNome:= Value;
end;

procedure TCliente.SetBairro(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('O nome do bairro não pode ser vazio!');

  FBairro := Value;
end;

procedure TCliente.SetCep(const Value: string);
begin
  if Value.Length = 9 then
    raise Exception.Create('CEP inválido: ' +Value + ', deve ser informado #####-###' );

  FCep := Value;
end;

procedure TCliente.SetCidade(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Cidade não pode ser vazio');

  FCidade := Value;
end;

procedure TCliente.SetCliente_id(const Value: Integer);
begin
  if Value>0 then
    raise Exception.Create('O Código do cadastro deve ser maior que 0.');

  FCliente_id := Value;
end;

procedure TCliente.SetCpf_cnpj(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('CPF / CNPJ não pode ser vazio');

  FCpf_cnpj := Value;
end;

procedure TCliente.SetStatus(const Value: string);
begin
  if (Value.Trim<>'ATIVO') and (Value.Trim<>'INATIVO') and Value.Trim.IsEmpty  then
    raise Exception.Create('Status do cliente e inválido');

  FStatus := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Campo de telefone não pode ser vazio');
  if Value.Length <= 7 then
    raise Exception.Create('Campo de telefone deve ter mais de 8 digitos');

  FTelefone := Value;
end;

procedure TCliente.SetUf(const Value: string);
begin
  FUf := Value;
end;

procedure TCliente.SetData_nascimento(const Value: TDateTime);
begin
  if Value > now then
    raise Exception.Create('Data de nascimento não pode ser futura');
  if Value <= 0 then
    raise Exception.Create('Data de nascimento e inválida');

  FData_nascimento := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
  if (pos('@', Value )<=0) and (pos('.', Value)<=0) then
    raise Exception.Create('Email inválido');

  FEmail := Value;
end;

procedure TCliente.SetEndereco(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Endereco de email não pode ser vazio');

  FEndereco := Value;
end;

procedure TCliente.SetLimite(const Value: Double);
begin
  if Value<0 then
    raise Exception.Create('Não é póssivel inserir valor negativo em limiete');

  FLimite := Value;
end;

{$ENDREGION}


{$REGION '____ PROCEDURES E FUNCTIONS ____ '}

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

    qry.ParamByName('CLIENTE_ID').AsInteger := FCliente_id;
    qry.ParamByName('NOME').AsString := FNome;
    qry.ParamByName('DATA_NASCIMENTO').AsDateTime := FData_nascimento;
    qry.ParamByName('STATUS').AsString := FStatus;
    qry.ParamByName('CPF_CNPJ').AsString := FCpf_cnpj;
    qry.ParamByName('TELEFONE').AsString := FTelefone;
    qry.ParamByName('EMAIL').AsString := FEmail;
    qry.ParamByName('DATA_CADASTRO').AsDateTime := FData_cadastro;
    qry.ParamByName('LIMITE').AsCurrency := FLimite;
    qry.ParamByName('ENDERECO').AsString := FEndereco;
    qry.ParamByName('BAIRRO').AsString := FBairro;
    qry.ParamByName('CIDADE').AsString := FCidade;
    qry.ParamByName('UF').AsString := FUf;
    qry.ParamByName('CEP').AsString := FCep;

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


function TCliente.Buscar: TObjectList<TCliente>;
var
  qry: TZQuery;
  cliente:TCliente;
begin
  Result := TObjectList<TCliente>.Create(True);
  qry := TZQuery.Create(nil);

  try
    qry.Connection := dmConexaoOracle.zConexao;
    qry.SQL.Text :=
        'select CLIENTE_ID, NOME, DATA_NASCIMENTO, STATUS, CPF_CNPJ, ' +
        'TELEFONE, EMAIL, DATA_CADASTRO, LIMITE, ' +
        'ENDERECO, BAIRRO, CIDADE, UF, CEP ' +
        'from CLIENTES';
    try
      qry.Open;

      while not qry.Eof do begin
        cliente := TCliente.Create;

        cliente.FCliente_id      := qry.FieldByName('CLIENTE_ID').AsInteger;
        cliente.FNome           := qry.FieldByName('NOME').AsString;
        cliente.FData_nascimento := qry.FieldByName('DATA_NASCIMENTO').AsDateTime;
        cliente.FStatus         := qry.FieldByName('STATUS').AsString;
        cliente.FCpf_cnpj        := qry.FieldByName('CPF_CNPJ').AsString;
        cliente.FTelefone       := qry.FieldByName('TELEFONE').AsString;
        cliente.FEmail          := qry.FieldByName('EMAIL').AsString;
        cliente.FData_cadastro   := qry.FieldByName('DATA_CADASTRO').AsDateTime;
        cliente.FLimite         := qry.FieldByName('LIMITE').AsCurrency;
        cliente.FEndereco       := qry.FieldByName('ENDERECO').AsString;
        cliente.FBairro         := qry.FieldByName('BAIRRO').AsString;
        cliente.FCidade         := qry.FieldByName('CIDADE').AsString;
        cliente.FUf             := qry.FieldByName('UF').AsString;
        cliente.FCep            := qry.FieldByName('CEP').AsString;

        Result.Add(cliente);

        qry.Next;
      end;

    except
      Result.free;
      raise;
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
      'CLIENTE_ID, NOME, DATA_NASCIMENTO, STATUS, CPF_CNPJ, ' +
      'TELEFONE, EMAIL, DATA_CADASTRO, LIMITE, ' +
      'ENDERECO, BAIRRO, CIDADE, UF, CEP) ' +
      'values (' +
      ':CLIENTE_ID, :NOME, :DATA_NASCIMENTO, :STATUS, :CPF_CNPJ, ' +
      ':TELEFONE, :EMAIL, :DATA_CADASTRO, :LIMITE, ' +
      ':ENDERECO, :BAIRRO, :CIDADE, :UF, :CEP)';

    qry.ParamByName('CLIENTE_ID').AsInteger := FCliente_id;
    qry.ParamByName('NOME').AsString := FNome;
    qry.ParamByName('DATA_NASCIMENTO').AsDateTime := FData_nascimento;
    qry.ParamByName('STATUS').AsString := FStatus;
    qry.ParamByName('CPF_CNPJ').AsString := FCpf_cnpj;

    qry.ParamByName('TELEFONE').AsString := FTelefone;
    qry.ParamByName('EMAIL').AsString := FEmail;
    qry.ParamByName('DATA_CADASTRO').AsDateTime := FData_cadastro;
    qry.ParamByName('LIMITE').AsCurrency := FLimite;

    qry.ParamByName('ENDERECO').AsString := FEndereco;
    qry.ParamByName('BAIRRO').AsString := FBairro;
    qry.ParamByName('CIDADE').AsString := FCidade;
    qry.ParamByName('UF').AsString := FUf;
    qry.ParamByName('CEP').AsString := FCep;

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

{$ENDREGION}
end.
