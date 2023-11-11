-- Criação das tabelas para o BD Model

-- Tabela empresa
CREATE TABLE empresa (
    cnpj VARCHAR(14) PRIMARY KEY,
    nome_empresa VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2)
);

-- Tabela colaborador
CREATE TABLE colaborador (
    Pk_IdCadastro INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador VARCHAR(255) NOT NULL,
    email_colaborador VARCHAR(255) NOT NULL,
    empresa_cnpj VARCHAR(14),
    FOREIGN KEY (empresa_cnpj) REFERENCES empresa(cnpj)
);

-- Tabela cursos
CREATE TABLE cursos (
    Pk_ldCursos INT AUTO_INCREMENT PRIMARY KEY,
    avaliacao INT,
    nome_curso VARCHAR(255) NOT NULL,
    comentario TEXT,
    Pk_IdCadastro INT,
    FOREIGN KEY (Pk_IdCadastro) REFERENCES colaborador(Pk_IdCadastro)
);

-- Tabela cadastroVaga_empr
CREATE TABLE cadastroVaga_empr (
    Pk_IdVaga INT AUTO_INCREMENT PRIMARY KEY,
    titulo_vaga VARCHAR(255) NOT NULL,
    localizacao VARCHAR(255),
    salario DECIMAL(10,2),
    descricao_vaga TEXT,
    requisitos TEXT,
    empresa_cnpj VARCHAR(14),
    FOREIGN KEY (empresa_cnpj) REFERENCES empresa(cnpj)
);

-- Tabela perfil_cand
CREATE TABLE perfil_cand (
    Pk_Idperfil_cand INT AUTO_INCREMENT PRIMARY KEY,
    data_nasc DATE,
    nacionalidade VARCHAR(255),
    sexo VARCHAR(2),
    cpf VARCHAR(11),
    colaborador_Pk_IdCadastro INT,
    FOREIGN KEY (colaborador_Pk_IdCadastro) REFERENCES colaborador(Pk_IdCadastro)
);

-- Tabela habilidades_cand
CREATE TABLE habilidades_cand (
    Pk_Idhabilidades_cand INT AUTO_INCREMENT PRIMARY KEY,
    nome_habilidade VARCHAR(255) NOT NULL,
    nivel_habilidade VARCHAR(255),
    perfil_cand_Pk_Idperfil_cand INT,
    FOREIGN KEY (perfil_cand_Pk_Idperfil_cand) REFERENCES perfil_cand(Pk_Idperfil_cand)
);

-- Tabela formacao_academica
CREATE TABLE formacao_academica (
    Pk_IdFormacao_Academica INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso_formacao VARCHAR(255) NOT NULL,
    local_curso VARCHAR(255),
    nivel_curso VARCHAR(255),
    perfil_cand_Pk_Idperfil_cand INT,
    FOREIGN KEY (perfil_cand_Pk_Idperfil_cand) REFERENCES perfil_cand(Pk_Idperfil_cand)
);

-- Tabela experiencia_profissional
CREATE TABLE experiencia_profissional (
    Pk_IdExperiencia_Profissional INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(255) NOT NULL,
    empresa_empr VARCHAR(255) NOT NULL,
    periodo_inicio DATE,
    periodo_fim DATE,
    perfil_cand_Pk_Idperfil_cand INT,
    FOREIGN KEY (perfil_cand_Pk_Idperfil_cand) REFERENCES perfil_cand(Pk_Idperfil_cand)
);

-- Tabela certificacao
CREATE TABLE certificacao (
    Pk_IdCertificacao INT AUTO_INCREMENT PRIMARY KEY,
    nome_certificacao VARCHAR(255) NOT NULL,
    emissor VARCHAR(255),
    data_emissao DATE,
    perfil_cand_Pk_Idperfil_cand INT,
    FOREIGN KEY (perfil_cand_Pk_Idperfil_cand) REFERENCES perfil_cand(Pk_Idperfil_cand)
);

-- Tabela inscricao_vaga
CREATE TABLE inscricao_vaga (
    Pk_IdInscricao_Vaga INT AUTO_INCREMENT PRIMARY KEY,
    data_inscricao DATE,
    colaborador_Pk_IdCadastro INT,
    FOREIGN KEY (colaborador_Pk_IdCadastro) REFERENCES colaborador(Pk_IdCadastro),
    Pk_IdVaga INT,
    FOREIGN KEY (Pk_IdVaga) REFERENCES cadastroVaga_empr(Pk_IdVaga)
);