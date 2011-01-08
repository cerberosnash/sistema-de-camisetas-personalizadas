/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     05/01/2011 12:09:21                          */
/*==============================================================*/


drop index FK_RELATIONSHIP_15;

drop index FK_RELATIONSHIP_13;

drop index PK_RELATIONSHIP_13;

drop table RELATIONSHIP_13;

drop index PK_TB_ATIVIDADES;

drop table TB_ATIVIDADES;

drop index FK_PRODUTO_FAVORITO;

drop index FK_USUARIO_FAVORITO;

drop index PK_TB_FAVORITOS;

drop table TB_FAVORITOS;

drop index FK_UF_DO_MUNICIPIO;

drop index PK_TB_MUNICIPIOS;

drop table TB_MUNICIPIOS;

drop index FK_RELATIONSHIP_14;

drop index FK_RELATIONSHIP_11;

drop index PK_TB_PEDIDOS;

drop table TB_PEDIDOS;

drop index PK_TB_PERFIL;

drop table TB_PERFIL;

drop index PK_TB_PRODUTOS;

drop table TB_PRODUTOS;

drop index FK_PRODUTOS_DO_PEDIDO2;

drop index FK_PRODUTOS_DO_PEDIDO;

drop index PK_TB_PRODUTO_PEDIDO;

drop table TB_PRODUTO_PEDIDO;

drop index PK_TB_STATUS;

drop table TB_STATUS;

drop index FK_RELATIONSHIP_12;

drop index FK_TIPO_DO_TELEFONE;

drop index PK_TB_TELEFONES;

drop table TB_TELEFONES;

drop index PK_TB_TP_TELEFONES;

drop table TB_TP_TELEFONES;

drop index PK_TB_UFS;

drop table TB_UFS;

drop index FK_MUNICIPIO_DO_USUARIO;

drop index FK_PERFIL_DO_USUARIO;

drop index PK_TB_USUARIOS;

drop table TB_USUARIOS;

/*==============================================================*/
/* Table: RELATIONSHIP_13                                       */
/*==============================================================*/
create table RELATIONSHIP_13 (
   SQ_HISTORICO_ATIVIDADE INT4                 not null,
   SQ_USUARIO           INT4                 not null,
   SQ_ATIVIDADE         INT4                 not null,
   DT_ATIVIDADE         TIMESTAMP            not null,
   constraint PK_RELATIONSHIP_13 primary key (SQ_HISTORICO_ATIVIDADE)
);

/*==============================================================*/
/* Index: PK_RELATIONSHIP_13                                    */
/*==============================================================*/
create unique index PK_RELATIONSHIP_13 on RELATIONSHIP_13 (
SQ_HISTORICO_ATIVIDADE
);

/*==============================================================*/
/* Index: FK_RELATIONSHIP_13                                    */
/*==============================================================*/
create  index FK_RELATIONSHIP_13 on RELATIONSHIP_13 (
SQ_USUARIO
);

/*==============================================================*/
/* Index: FK_RELATIONSHIP_15                                    */
/*==============================================================*/
create  index FK_RELATIONSHIP_15 on RELATIONSHIP_13 (
SQ_ATIVIDADE
);

/*==============================================================*/
/* Table: TB_ATIVIDADES                                         */
/*==============================================================*/
create table TB_ATIVIDADES (
   SQ_ATIVIDADE         INT4                 not null,
   TX_ATIVIDADE         VARCHAR(100)         not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_ATIVIDADES primary key (SQ_ATIVIDADE)
);

/*==============================================================*/
/* Index: PK_TB_ATIVIDADES                                      */
/*==============================================================*/
create unique index PK_TB_ATIVIDADES on TB_ATIVIDADES (
SQ_ATIVIDADE
);

/*==============================================================*/
/* Table: TB_FAVORITOS                                          */
/*==============================================================*/
create table TB_FAVORITOS (
   SQ_FAVORITO          INT4                 not null,
   SQ_USUARIO           INT4                 not null,
   SQ_PRODUTO           INT4                 not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_FAVORITOS primary key (SQ_FAVORITO)
);

/*==============================================================*/
/* Index: PK_TB_FAVORITOS                                       */
/*==============================================================*/
create unique index PK_TB_FAVORITOS on TB_FAVORITOS (
SQ_FAVORITO
);

/*==============================================================*/
/* Index: FK_USUARIO_FAVORITO                                   */
/*==============================================================*/
create  index FK_USUARIO_FAVORITO on TB_FAVORITOS (
SQ_USUARIO
);

/*==============================================================*/
/* Index: FK_PRODUTO_FAVORITO                                   */
/*==============================================================*/
create  index FK_PRODUTO_FAVORITO on TB_FAVORITOS (
SQ_PRODUTO
);

/*==============================================================*/
/* Table: TB_MUNICIPIOS                                         */
/*==============================================================*/
create table TB_MUNICIPIOS (
   SQ_MUNICIPIO         INT4                 not null,
   SQ_UF                INT4                 not null,
   NM_MUNICIPIO         VARCHAR(100)         not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_MUNICIPIOS primary key (SQ_MUNICIPIO)
);

/*==============================================================*/
/* Index: PK_TB_MUNICIPIOS                                      */
/*==============================================================*/
create unique index PK_TB_MUNICIPIOS on TB_MUNICIPIOS (
SQ_MUNICIPIO
);

/*==============================================================*/
/* Index: FK_UF_DO_MUNICIPIO                                    */
/*==============================================================*/
create  index FK_UF_DO_MUNICIPIO on TB_MUNICIPIOS (
SQ_UF
);

/*==============================================================*/
/* Table: TB_PEDIDOS                                            */
/*==============================================================*/
create table TB_PEDIDOS (
   SQ_PEDIDO            INT4                 not null,
   TB_STATUS            INT4                 not null,
   SQ_USUARIO           INT4                 not null,
   DT_PEDIDO            DATE                 not null,
   VL_PEDIDO            FLOAT8               not null,
   NU_QUANTIDATE        INT4                 not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_PEDIDOS primary key (SQ_PEDIDO)
);

/*==============================================================*/
/* Index: PK_TB_PEDIDOS                                         */
/*==============================================================*/
create unique index PK_TB_PEDIDOS on TB_PEDIDOS (
SQ_PEDIDO
);

/*==============================================================*/
/* Index: FK_RELATIONSHIP_11                                    */
/*==============================================================*/
create  index FK_RELATIONSHIP_11 on TB_PEDIDOS (
SQ_USUARIO
);

/*==============================================================*/
/* Index: FK_RELATIONSHIP_14                                    */
/*==============================================================*/
create  index FK_RELATIONSHIP_14 on TB_PEDIDOS (
TB_STATUS
);

/*==============================================================*/
/* Table: TB_PERFIL                                             */
/*==============================================================*/
create table TB_PERFIL (
   SQ_PERFIL            INT4                 not null,
   TX_PERFIL            VARCHAR(100)         not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_PERFIL primary key (SQ_PERFIL)
);

/*==============================================================*/
/* Index: PK_TB_PERFIL                                          */
/*==============================================================*/
create unique index PK_TB_PERFIL on TB_PERFIL (
SQ_PERFIL
);

/*==============================================================*/
/* Table: TB_PRODUTOS                                           */
/*==============================================================*/
create table TB_PRODUTOS (
   SQ_PRODUTO           INT4                 not null,
   VL_PRODUTO           FLOAT8               null,
   CO_PRODUTO           VARCHAR(7)           null,
   TM_PRODUTO           CHAR(1)              null,
   NM_PRODUTO           VARCHAR(100)         null,
   DS_PRODUTO           VARCHAR(100)         null,
   ST_PRIVADO           BOOL                 null default true,
   ST_ATIVO             BOOL                 null default true,
   constraint PK_TB_PRODUTOS primary key (SQ_PRODUTO)
);

/*==============================================================*/
/* Index: PK_TB_PRODUTOS                                        */
/*==============================================================*/
create unique index PK_TB_PRODUTOS on TB_PRODUTOS (
SQ_PRODUTO
);

/*==============================================================*/
/* Table: TB_PRODUTO_PEDIDO                                     */
/*==============================================================*/
create table TB_PRODUTO_PEDIDO (
   SQ_PRODUTO_PEDIDO    INT4                 not null,
   SQ_PEDIDO            INT4                 not null,
   SQ_PRODUTO           INT4                 not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_PRODUTO_PEDIDO primary key (SQ_PRODUTO_PEDIDO)
);

/*==============================================================*/
/* Index: PK_TB_PRODUTO_PEDIDO                                  */
/*==============================================================*/
create unique index PK_TB_PRODUTO_PEDIDO on TB_PRODUTO_PEDIDO (
SQ_PRODUTO_PEDIDO
);

/*==============================================================*/
/* Index: FK_PRODUTOS_DO_PEDIDO                                 */
/*==============================================================*/
create  index FK_PRODUTOS_DO_PEDIDO on TB_PRODUTO_PEDIDO (
SQ_PEDIDO
);

/*==============================================================*/
/* Index: FK_PRODUTOS_DO_PEDIDO2                                */
/*==============================================================*/
create  index FK_PRODUTOS_DO_PEDIDO2 on TB_PRODUTO_PEDIDO (
SQ_PRODUTO
);

/*==============================================================*/
/* Table: TB_STATUS                                             */
/*==============================================================*/
create table TB_STATUS (
   SQ_STATUS            INT4                 not null,
   TX_STATUS            VARCHAR(100)         not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_STATUS primary key (SQ_STATUS)
);

/*==============================================================*/
/* Index: PK_TB_STATUS                                          */
/*==============================================================*/
create unique index PK_TB_STATUS on TB_STATUS (
SQ_STATUS
);

/*==============================================================*/
/* Table: TB_TELEFONES                                          */
/*==============================================================*/
create table TB_TELEFONES (
   SQ_TELEFONE          INT4                 not null,
   SQ_TP_TELEFONE       INT4                 not null,
   SQ_USUARIO           INT4                 not null,
   NU_TELEFONE          VARCHAR(8)           not null,
   NU_DDD               VARCHAR(3)           not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_TELEFONES primary key (SQ_TELEFONE)
);

/*==============================================================*/
/* Index: PK_TB_TELEFONES                                       */
/*==============================================================*/
create unique index PK_TB_TELEFONES on TB_TELEFONES (
SQ_TELEFONE
);

/*==============================================================*/
/* Index: FK_TIPO_DO_TELEFONE                                   */
/*==============================================================*/
create  index FK_TIPO_DO_TELEFONE on TB_TELEFONES (
SQ_TP_TELEFONE
);

/*==============================================================*/
/* Index: FK_RELATIONSHIP_12                                    */
/*==============================================================*/
create  index FK_RELATIONSHIP_12 on TB_TELEFONES (
SQ_USUARIO
);

/*==============================================================*/
/* Table: TB_TP_TELEFONES                                       */
/*==============================================================*/
create table TB_TP_TELEFONES (
   SQ_TP_TELEFONE       INT4                 not null,
   TX_TP_TELEFONE       VARCHAR(100)         not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_TP_TELEFONES primary key (SQ_TP_TELEFONE)
);

/*==============================================================*/
/* Index: PK_TB_TP_TELEFONES                                    */
/*==============================================================*/
create unique index PK_TB_TP_TELEFONES on TB_TP_TELEFONES (
SQ_TP_TELEFONE
);

/*==============================================================*/
/* Table: TB_UFS                                                */
/*==============================================================*/
create table TB_UFS (
   SQ_UF                INT4                 not null,
   NM_UF                VARCHAR(100)         not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_UFS primary key (SQ_UF)
);

/*==============================================================*/
/* Index: PK_TB_UFS                                             */
/*==============================================================*/
create unique index PK_TB_UFS on TB_UFS (
SQ_UF
);

/*==============================================================*/
/* Table: TB_USUARIOS                                           */
/*==============================================================*/
create table TB_USUARIOS (
   SQ_USUARIO           INT4                 not null,
   SQ_PERFIL            INT4                 not null,
   SQ_MUNICIPIO         INT4                 not null,
   NM_USUARIO           VARCHAR(100)         not null,
   NU_CPF               VARCHAR(11)          not null,
   TX_SENHA             VARCHAR(100)         not null,
   TX_EMAIL             VARCHAR(100)         not null,
   TX_ENDERECO          VARCHAR(100)         not null,
   NU_CEP               VARCHAR(8)           not null,
   ST_ATIVO             BOOL                 not null default true,
   constraint PK_TB_USUARIOS primary key (SQ_USUARIO)
);

/*==============================================================*/
/* Index: PK_TB_USUARIOS                                        */
/*==============================================================*/
create unique index PK_TB_USUARIOS on TB_USUARIOS (
SQ_USUARIO
);

/*==============================================================*/
/* Index: FK_PERFIL_DO_USUARIO                                  */
/*==============================================================*/
create  index FK_PERFIL_DO_USUARIO on TB_USUARIOS (
SQ_PERFIL
);

/*==============================================================*/
/* Index: FK_MUNICIPIO_DO_USUARIO                               */
/*==============================================================*/
create  index FK_MUNICIPIO_DO_USUARIO on TB_USUARIOS (
SQ_MUNICIPIO
);

alter table RELATIONSHIP_13
   add constraint FK_RELATION_RELATIONS_TB_USUAR foreign key (SQ_USUARIO)
      references TB_USUARIOS (SQ_USUARIO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_13
   add constraint FK_RELATION_RELATIONS_TB_ATIVI foreign key (SQ_ATIVIDADE)
      references TB_ATIVIDADES (SQ_ATIVIDADE)
      on delete restrict on update restrict;

alter table TB_FAVORITOS
   add constraint FK_TB_FAVOR_PRODUTOS__TB_USUAR foreign key (SQ_USUARIO)
      references TB_USUARIOS (SQ_USUARIO)
      on delete restrict on update restrict;

alter table TB_FAVORITOS
   add constraint FK_TB_FAVOR_PRODUTOS__TB_PRODU foreign key (SQ_PRODUTO)
      references TB_PRODUTOS (SQ_PRODUTO)
      on delete restrict on update restrict;

alter table TB_MUNICIPIOS
   add constraint FK_TB_MUNIC_UF_DO_MUN_TB_UFS foreign key (SQ_UF)
      references TB_UFS (SQ_UF)
      on delete restrict on update restrict;

alter table TB_PEDIDOS
   add constraint FK_TB_PEDID_RELATIONS_TB_USUAR foreign key (SQ_USUARIO)
      references TB_USUARIOS (SQ_USUARIO)
      on delete restrict on update restrict;

alter table TB_PEDIDOS
   add constraint FK_TB_PEDID_RELATIONS_TB_STATU foreign key (TB_STATUS)
      references TB_STATUS (SQ_STATUS)
      on delete restrict on update restrict;

alter table TB_PRODUTO_PEDIDO
   add constraint FK_TB_PRODU_PRODUTOS__TB_PEDID foreign key (SQ_PEDIDO)
      references TB_PEDIDOS (SQ_PEDIDO)
      on delete restrict on update restrict;

alter table TB_PRODUTO_PEDIDO
   add constraint FK_TB_PRODU_PRODUTOS__TB_PRODU foreign key (SQ_PRODUTO)
      references TB_PRODUTOS (SQ_PRODUTO)
      on delete restrict on update restrict;

alter table TB_TELEFONES
   add constraint FK_TB_TELEF_RELATIONS_TB_USUAR foreign key (SQ_USUARIO)
      references TB_USUARIOS (SQ_USUARIO)
      on delete restrict on update restrict;

alter table TB_TELEFONES
   add constraint FK_TB_TELEF_TIPO_DO_T_TB_TP_TE foreign key (SQ_TP_TELEFONE)
      references TB_TP_TELEFONES (SQ_TP_TELEFONE)
      on delete restrict on update restrict;

alter table TB_USUARIOS
   add constraint FK_TB_USUAR_MUNICIPIO_TB_MUNIC foreign key (SQ_MUNICIPIO)
      references TB_MUNICIPIOS (SQ_MUNICIPIO)
      on delete restrict on update restrict;

alter table TB_USUARIOS
   add constraint FK_TB_USUAR_PERFIL_DO_TB_PERFI foreign key (SQ_PERFIL)
      references TB_PERFIL (SQ_PERFIL)
      on delete restrict on update restrict;

