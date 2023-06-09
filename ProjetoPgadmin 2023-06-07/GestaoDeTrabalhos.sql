PGDMP                         {            GestaoDeTrabalhos    15.2    15.2 Z    >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            A           1262    24576    GestaoDeTrabalhos    DATABASE     �   CREATE DATABASE "GestaoDeTrabalhos" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 #   DROP DATABASE "GestaoDeTrabalhos";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            B           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1255    32904    teste_cidades()    FUNCTION     �  CREATE FUNCTION public.teste_cidades() RETURNS trigger
    LANGUAGE plpgsql
    AS $$declare
--aqui ficam as variaveis
begin
	if (TG_OP = 'INSERT') then --tg_op instrução que
	update cidades              --o postgres entende
	set teste_altera = 'I'
	where id_cidade = new.id_cidade;
	
		return new;
	else
	update cidades
	set teste_altera = 'U'
	where id_cidade = old.id_cidade;
	
		return old;
	end if;
end$$;
 &   DROP FUNCTION public.teste_cidades();
       public          postgres    false    4            �            1255    32909    teste_funcao()    FUNCTION     R  CREATE FUNCTION public.teste_funcao() RETURNS character varying
    LANGUAGE plpgsql
    AS $$declare
	retornoidservico integer;
begin
	select id_servico
	into retornoidservico
	from servicos
	order by id_servico desc
	limit 1;
	
	update servicos
	set teste_funcao = 'ultimo'
	where id_servico = retornoidservico;
	
	return 'ok';
end;$$;
 %   DROP FUNCTION public.teste_funcao();
       public          postgres    false    4            �            1255    32903    testetrigger()    FUNCTION     �   CREATE FUNCTION public.testetrigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
if (TG_OP ='insert') then
update cidades set teste_gatilho = 'ok'
where id_cidade = new.cidade;
end if;
END$$;
 %   DROP FUNCTION public.testetrigger();
       public          postgres    false    4            �            1259    32769    cidades    TABLE     �   CREATE TABLE public.cidades (
    id_cidade integer NOT NULL,
    nome character varying,
    teste character varying(200),
    teste_altera character varying(200),
    uf_estado character varying(3)
);
    DROP TABLE public.cidades;
       public         heap    postgres    false    4            �            1259    32768    cidades_id_cidade_seq    SEQUENCE     �   CREATE SEQUENCE public.cidades_id_cidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cidades_id_cidade_seq;
       public          postgres    false    215    4            C           0    0    cidades_id_cidade_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cidades_id_cidade_seq OWNED BY public.cidades.id_cidade;
          public          postgres    false    214            �            1259    33055    pedido    TABLE     �   CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    valor numeric,
    id_servico integer,
    id_usuario integer
);
    DROP TABLE public.pedido;
       public         heap    postgres    false    4            �            1259    33054    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          postgres    false    223    4            D           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          postgres    false    222            �            1259    32828    servicos    TABLE     �   CREATE TABLE public.servicos (
    id_servico integer NOT NULL,
    descricao_servico character varying(200),
    id_sub integer,
    teste_funcao character varying
);
    DROP TABLE public.servicos;
       public         heap    postgres    false    4            �            1259    32827    servicos_id_servico_seq    SEQUENCE     �   CREATE SEQUENCE public.servicos_id_servico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.servicos_id_servico_seq;
       public          postgres    false    221    4            E           0    0    servicos_id_servico_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.servicos_id_servico_seq OWNED BY public.servicos.id_servico;
          public          postgres    false    220            �            1259    32778    subgrupo_servicos    TABLE     p   CREATE TABLE public.subgrupo_servicos (
    id_sub integer NOT NULL,
    descricao_servico character varying
);
 %   DROP TABLE public.subgrupo_servicos;
       public         heap    postgres    false    4            �            1259    32777    subgrupo_servicos_id_sub_seq    SEQUENCE     �   CREATE SEQUENCE public.subgrupo_servicos_id_sub_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.subgrupo_servicos_id_sub_seq;
       public          postgres    false    4    217            F           0    0    subgrupo_servicos_id_sub_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.subgrupo_servicos_id_sub_seq OWNED BY public.subgrupo_servicos.id_sub;
          public          postgres    false    216            �            1259    32792    usuarios    TABLE     f  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome character varying(20),
    sobrenome text,
    email text,
    senha character varying,
    id_cidade integer,
    telefone character varying(11),
    cpf_cnpj character varying(15),
    data_nasc date,
    cep character varying(8),
    endereco character varying(50),
    numero character varying(10),
    rua character varying(50),
    complemento character varying(50),
    data_cadastro timestamp without time zone DEFAULT now(),
    sexo integer,
    reputacao_servico numeric,
    reputacao_cliente numeric,
    id_servico integer,
    descricao_servico character varying(200),
    hora_inicio time without time zone,
    hora_final time without time zone,
    semana_inicio character varying(20),
    semana_final character varying(20),
    id_usuario_servico integer,
    valor numeric
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false    4            G           0    0    TABLE usuarios    COMMENT     P   COMMENT ON TABLE public.usuarios IS 'tabela de usuarios clientes e serviçais';
          public          postgres    false    219            H           0    0    COLUMN usuarios.id_usuario    COMMENT     A   COMMENT ON COLUMN public.usuarios.id_usuario IS 'id do usuario';
          public          postgres    false    219            I           0    0    COLUMN usuarios.nome    COMMENT     =   COMMENT ON COLUMN public.usuarios.nome IS 'nome do usuario';
          public          postgres    false    219            J           0    0    COLUMN usuarios.sobrenome    COMMENT     G   COMMENT ON COLUMN public.usuarios.sobrenome IS 'sobrenome do usuario';
          public          postgres    false    219            K           0    0    COLUMN usuarios.id_cidade    COMMENT     S   COMMENT ON COLUMN public.usuarios.id_cidade IS 'codigo sequencia auto incremento';
          public          postgres    false    219            L           0    0    COLUMN usuarios.telefone    COMMENT     E   COMMENT ON COLUMN public.usuarios.telefone IS 'telefone do usuario';
          public          postgres    false    219            M           0    0    COLUMN usuarios.cpf_cnpj    COMMENT     E   COMMENT ON COLUMN public.usuarios.cpf_cnpj IS 'cpf/cnpj do usuario';
          public          postgres    false    219            N           0    0    COLUMN usuarios.data_nasc    COMMENT     P   COMMENT ON COLUMN public.usuarios.data_nasc IS 'data de nascimento do usuario';
          public          postgres    false    219            O           0    0    COLUMN usuarios.cep    COMMENT     ;   COMMENT ON COLUMN public.usuarios.cep IS 'cep do usuario';
          public          postgres    false    219            P           0    0    COLUMN usuarios.endereco    COMMENT     E   COMMENT ON COLUMN public.usuarios.endereco IS 'endereco do usuario';
          public          postgres    false    219            Q           0    0    COLUMN usuarios.rua    COMMENT     F   COMMENT ON COLUMN public.usuarios.rua IS 'rua de moradia do usuario';
          public          postgres    false    219            R           0    0    COLUMN usuarios.complemento    COMMENT     o   COMMENT ON COLUMN public.usuarios.complemento IS 'referencia para facilitar o encontro da moradia do usuario';
          public          postgres    false    219            S           0    0    COLUMN usuarios.data_cadastro    COMMENT     d   COMMENT ON COLUMN public.usuarios.data_cadastro IS 'data em que o usuario se cadastrou no sistema';
          public          postgres    false    219            T           0    0    COLUMN usuarios.sexo    COMMENT     =   COMMENT ON COLUMN public.usuarios.sexo IS 'sexo do usuario';
          public          postgres    false    219            U           0    0 !   COLUMN usuarios.reputacao_servico    COMMENT     _   COMMENT ON COLUMN public.usuarios.reputacao_servico IS 'reputação do trabalho do serviçal';
          public          postgres    false    219            V           0    0 !   COLUMN usuarios.reputacao_cliente    COMMENT     X   COMMENT ON COLUMN public.usuarios.reputacao_cliente IS 'reputação que o cliente tem';
          public          postgres    false    219            W           0    0    COLUMN usuarios.id_servico    COMMENT     B   COMMENT ON COLUMN public.usuarios.id_servico IS 'id de serviço';
          public          postgres    false    219            X           0    0 !   COLUMN usuarios.descricao_servico    COMMENT     V   COMMENT ON COLUMN public.usuarios.descricao_servico IS 'descreve como é o serviço';
          public          postgres    false    219            Y           0    0    COLUMN usuarios.hora_inicio    COMMENT     S   COMMENT ON COLUMN public.usuarios.hora_inicio IS 'horario de nicio do expediente';
          public          postgres    false    219            Z           0    0    COLUMN usuarios.hora_final    COMMENT     O   COMMENT ON COLUMN public.usuarios.hora_final IS 'horario final do expediente';
          public          postgres    false    219            [           0    0    COLUMN usuarios.semana_inicio    COMMENT     `   COMMENT ON COLUMN public.usuarios.semana_inicio IS 'dia em que se começa o tempo de trabalho';
          public          postgres    false    219            \           0    0    COLUMN usuarios.semana_final    COMMENT     `   COMMENT ON COLUMN public.usuarios.semana_final IS 'dia em que se finaliza o tempo de trabalho';
          public          postgres    false    219            ]           0    0 "   COLUMN usuarios.id_usuario_servico    COMMENT     o   COMMENT ON COLUMN public.usuarios.id_usuario_servico IS 'id do serviçal, usuario que optou por esta opção';
          public          postgres    false    219            ^           0    0    COLUMN usuarios.valor    COMMENT     @   COMMENT ON COLUMN public.usuarios.valor IS 'valor do serviço';
          public          postgres    false    219            �            1259    32791    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    4    219            _           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    218            |           2604    32772    cidades id_cidade    DEFAULT     v   ALTER TABLE ONLY public.cidades ALTER COLUMN id_cidade SET DEFAULT nextval('public.cidades_id_cidade_seq'::regclass);
 @   ALTER TABLE public.cidades ALTER COLUMN id_cidade DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    33058    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    32831    servicos id_servico    DEFAULT     z   ALTER TABLE ONLY public.servicos ALTER COLUMN id_servico SET DEFAULT nextval('public.servicos_id_servico_seq'::regclass);
 B   ALTER TABLE public.servicos ALTER COLUMN id_servico DROP DEFAULT;
       public          postgres    false    220    221    221            }           2604    32781    subgrupo_servicos id_sub    DEFAULT     �   ALTER TABLE ONLY public.subgrupo_servicos ALTER COLUMN id_sub SET DEFAULT nextval('public.subgrupo_servicos_id_sub_seq'::regclass);
 G   ALTER TABLE public.subgrupo_servicos ALTER COLUMN id_sub DROP DEFAULT;
       public          postgres    false    217    216    217            ~           2604    32795    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    219    218    219            3          0    32769    cidades 
   TABLE DATA           R   COPY public.cidades (id_cidade, nome, teste, teste_altera, uf_estado) FROM stdin;
    public          postgres    false    215   Ce       ;          0    33055    pedido 
   TABLE DATA           J   COPY public.pedido (id_pedido, valor, id_servico, id_usuario) FROM stdin;
    public          postgres    false    223   J'      9          0    32828    servicos 
   TABLE DATA           W   COPY public.servicos (id_servico, descricao_servico, id_sub, teste_funcao) FROM stdin;
    public          postgres    false    221   g'      5          0    32778    subgrupo_servicos 
   TABLE DATA           F   COPY public.subgrupo_servicos (id_sub, descricao_servico) FROM stdin;
    public          postgres    false    217   �'      7          0    32792    usuarios 
   TABLE DATA           K  COPY public.usuarios (id_usuario, nome, sobrenome, email, senha, id_cidade, telefone, cpf_cnpj, data_nasc, cep, endereco, numero, rua, complemento, data_cadastro, sexo, reputacao_servico, reputacao_cliente, id_servico, descricao_servico, hora_inicio, hora_final, semana_inicio, semana_final, id_usuario_servico, valor) FROM stdin;
    public          postgres    false    219   �'      `           0    0    cidades_id_cidade_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cidades_id_cidade_seq', 1, false);
          public          postgres    false    214            a           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);
          public          postgres    false    222            b           0    0    servicos_id_servico_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.servicos_id_servico_seq', 1, true);
          public          postgres    false    220            c           0    0    subgrupo_servicos_id_sub_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.subgrupo_servicos_id_sub_seq', 1, false);
          public          postgres    false    216            d           0    0    usuarios_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 4, true);
          public          postgres    false    218            �           2606    32776    cidades cidades_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id_cidade);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public            postgres    false    215            �           2606    33062    pedido id_pedido_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT id_pedido_pkey PRIMARY KEY (id_pedido);
 ?   ALTER TABLE ONLY public.pedido DROP CONSTRAINT id_pedido_pkey;
       public            postgres    false    223            �           2606    32881    usuarios id_serv_usuarios_fkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT id_serv_usuarios_fkey UNIQUE (id_servico);
 H   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT id_serv_usuarios_fkey;
       public            postgres    false    219            �           2606    32800    usuarios id_usuario_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT id_usuario_pkey PRIMARY KEY (id_usuario);
 B   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT id_usuario_pkey;
       public            postgres    false    219            �           2606    32785    subgrupo_servicos is_sub_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.subgrupo_servicos
    ADD CONSTRAINT is_sub_pkey PRIMARY KEY (id_sub);
 G   ALTER TABLE ONLY public.subgrupo_servicos DROP CONSTRAINT is_sub_pkey;
       public            postgres    false    217            �           2606    32991 %   usuarios unique_usuario_servico_valor 
   CONSTRAINT     m   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT unique_usuario_servico_valor UNIQUE (id_servico, valor);
 O   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT unique_usuario_servico_valor;
       public            postgres    false    219    219            �           2606    32826 #   usuarios usuarios_id_servico_unique 
   CONSTRAINT     d   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_servico_unique UNIQUE (id_servico);
 M   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_id_servico_unique;
       public            postgres    false    219            �           1259    33100    idx_cep    INDEX     ;   CREATE INDEX idx_cep ON public.usuarios USING btree (cep);
    DROP INDEX public.idx_cep;
       public            postgres    false    219            �           1259    33099    idx_cpfcnpj    INDEX     D   CREATE INDEX idx_cpfcnpj ON public.usuarios USING btree (cpf_cnpj);
    DROP INDEX public.idx_cpfcnpj;
       public            postgres    false    219            �           1259    33106    idx_descserc    INDEX     W   CREATE INDEX idx_descserc ON public.subgrupo_servicos USING btree (descricao_servico);
     DROP INDEX public.idx_descserc;
       public            postgres    false    217            �           1259    33107    idx_descserv2    INDEX     O   CREATE INDEX idx_descserv2 ON public.servicos USING btree (descricao_servico);
 !   DROP INDEX public.idx_descserv2;
       public            postgres    false    221            �           1259    33097 	   idx_email    INDEX     ?   CREATE INDEX idx_email ON public.usuarios USING btree (email);
    DROP INDEX public.idx_email;
       public            postgres    false    219            �           1259    33096    idx_idcidade    INDEX     F   CREATE INDEX idx_idcidade ON public.usuarios USING btree (id_cidade);
     DROP INDEX public.idx_idcidade;
       public            postgres    false    219            �           1259    33104    idx_idservico    INDEX     F   CREATE INDEX idx_idservico ON public.pedido USING btree (id_servico);
 !   DROP INDEX public.idx_idservico;
       public            postgres    false    223            �           1259    33105 	   idx_idsub    INDEX     @   CREATE INDEX idx_idsub ON public.servicos USING btree (id_sub);
    DROP INDEX public.idx_idsub;
       public            postgres    false    221            �           1259    33103    idx_idusuario    INDEX     F   CREATE INDEX idx_idusuario ON public.pedido USING btree (id_usuario);
 !   DROP INDEX public.idx_idusuario;
       public            postgres    false    223            �           1259    33102    idx_idususerv    INDEX     P   CREATE INDEX idx_idususerv ON public.usuarios USING btree (id_usuario_servico);
 !   DROP INDEX public.idx_idususerv;
       public            postgres    false    219            �           1259    33098 	   idx_senha    INDEX     ?   CREATE INDEX idx_senha ON public.usuarios USING btree (senha);
    DROP INDEX public.idx_senha;
       public            postgres    false    219            �           1259    33101    idx_telefone    INDEX     E   CREATE INDEX idx_telefone ON public.usuarios USING btree (telefone);
     DROP INDEX public.idx_telefone;
       public            postgres    false    219            �           1259    33076    index_idusuario    INDEX     J   CREATE INDEX index_idusuario ON public.usuarios USING btree (id_usuario);
 #   DROP INDEX public.index_idusuario;
       public            postgres    false    219            �           1259    33074    index_nomecidade    INDEX     S   CREATE INDEX index_nomecidade ON public.cidades USING btree (nome) INCLUDE (nome);
 $   DROP INDEX public.index_nomecidade;
       public            postgres    false    215            �           2620    33073    cidades teste_cidades    TRIGGER     r   CREATE TRIGGER teste_cidades AFTER INSERT ON public.cidades FOR EACH ROW EXECUTE FUNCTION public.teste_cidades();
 .   DROP TRIGGER teste_cidades ON public.cidades;
       public          postgres    false    215    226            �           2620    32905    cidades testetrigger    TRIGGER     |   CREATE TRIGGER testetrigger BEFORE INSERT OR DELETE ON public.cidades FOR EACH ROW EXECUTE FUNCTION public.teste_cidades();
 -   DROP TRIGGER testetrigger ON public.cidades;
       public          postgres    false    226    215            �           2606    32801    usuarios id_cidade_cidades_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT id_cidade_cidades_fkey FOREIGN KEY (id_cidade) REFERENCES public.cidades(id_cidade) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT id_cidade_cidades_fkey;
       public          postgres    false    219    3203    215            �           2606    33063    pedido id_serv_usuarios_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT id_serv_usuarios_fkey FOREIGN KEY (id_servico) REFERENCES public.usuarios(id_servico) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.pedido DROP CONSTRAINT id_serv_usuarios_fkey;
       public          postgres    false    219    3223    223            �           2606    32837 "   servicos id_subgrupo_servicos_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT id_subgrupo_servicos_fkey FOREIGN KEY (id_sub) REFERENCES public.subgrupo_servicos(id_sub) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.servicos DROP CONSTRAINT id_subgrupo_servicos_fkey;
       public          postgres    false    221    3207    217            �           2606    33068    pedido id_usuario_usuarios_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT id_usuario_usuarios_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.pedido DROP CONSTRAINT id_usuario_usuarios_fkey;
       public          postgres    false    219    223    3211            3      x�|}˒�H��Z�)�c&.�e�$RI5����2��b�ƬV��M��^����x@�U.��squ�F��t��Cu���?ݵ���;4��"`.=T�g�<���ٴ�N�A�_?��EIq8O����<\�G�:[���.��U7C����d_��P?���4��w&���V7��ls\>�������Iv��c�iǶ��J�ý���=NÙ�cQ:ԗ��=���t��i�D�;<�����r����9��8�G?��co]&
��j�z0`z�}6|w��L��0�ס�M��X�����;<�n��C��0̏i�,�;�Ϻ����:4vlR'�����i$�� ;��������0H~*?*z�$��(>���M��ȿ�e0��V���6'���}]���^_�U[�p��s5fc@�ލ�����e4+-���������ݾ�8�Ù��ϻi.�M��wc��"����_�m��<."۫�mj:�&N�Ks?z,��^��	[�.'���i-��HO�Р��- �V�}�Ղu�B3�hLsN]�}^�����j��i��KZ��ן��P�a��C}���+�{�e�6��_:h.�c[����6������7�㳾�����he>j8��P�~���)u�Z�w<��O�u�M��������n�;�xZ^e�Xo}�����og��G`�|ѯ�5-hI�����>���t�։w~O��r�1m����ʮi;�GIDc��hə֘ơ��Q����"�1��K#I�k�m����ם���Q�dz���dԷ��A�66�;�6aC�m��+5m���h�!$(h�}�Q�i:������D,g>и=�S��mvZ
�ȳ�������R0;�:�0;Z�.?�W��������W�Ҏ͓xK�ޒ&�N��g=���݂8�	�Ϻ�Iqd�l�-ő=�k�o^&F͹������vwbx���W5gK�sk=�*v	����Ϋ��I���Y����8h�>�6�]�.���E��nW�|�4�ǫ0��.џ!�V��[�v)���!�!Tv�2������׿̈́du�����S�t~?�����U{�{���V�=����� �Â|���7mQK���>�FY��<��� ��qy� �?�YF��&b���Ξgm�ã��`�
Z_��>�:O�O+i}=��~?�3��:=�O�#�}w�H�#ҿ���l�r�.�S5O�C�.$q�����rC�D4Ĩ~ެБ� &�Az�����N�����`����ۛE
ZEC?��S^�)���^����	�6��	�G��w3nEtrk�;����oCS�X�:�?L��������	N@_S}�oH�ۖd$��.��Q���%v�ć�)>N��,2���8ǻ���U9�& ��J��(h11�&�`l�#�(iQ=�b`�ZQ�l���9�]�&"6���B}��[F4n#q*�H]��i�{j�t��W�x���f��	���5������*�nI�����Vx.�$��5@��1s�7�,��DO�"�yӸ��L�ŷzD�Yq`�Ib���fk��:�b$>dw��B�UFlt�)s���̛ XN}S= + ��0oM���u�y�F����p	��D�I6�C^���L;���Gh������m���[�~��eq,�O��d��"y��B��O������.Hv����v;�w���Oӌ{I:����t�{�2�|��[Zx�_��
>
�;��]�6e����,	�w����t wO��R$t��)�xb2t;�h/�O�$]��`��a�����~8��)����Ȱ��o:��� |O���~"�	X���Jߎ������U�g��ȷ��Z},� �#�㦮~�~ĺ�\�1i���R����%�~h1ڥ�����^ъ� .�ͣ�1u�I�y��d����tS��+]��׈5�WMBv��o��^�/���4LA3��4�v��}�q�\�}�N��7Lr	C���T�%�d&����Lr�`'����ݹ|/�W��y_i+�����]׽#	���w�0_Y�����.���Ah�:�A|E��ڑ$k�	7C����	Ijĳ�k������ȨTYɢT�+�O3|�ɨyVgf�G� w��\��E��R��v�
/Oܪ�����^��:�-|�dJ��Io J��P���':�����f���Ā�l�ЂD,x��^�}u���jJ�$?�}Wmf)��y�Ieg�ﴴ�/��K- :��F��ľ��}���u������%���w�_cs�?�.��N�ۑؓr{a�U�o�2D۱�Xm�Ҿ)�=V��d�3��d�k�6N��,])�}F|�g�@c�z]K�N�ʰ����G`�q�ÄA��+΂_�ӆ�~�E���S�^Ԛv�|��̎Q���v��a��[�VI��!���	n=�����{�D�y�f�t~׻�O�و1�R�����ɴc#��1���`�vbB�%�.Z۱�Ѿ�c)�_MCMñ���PԜI4��B��%���Bx�A
꾪�L{�ߦ�Xt�t����x�jn�=��
4Ĵ���1�SH�3>����*��E��$C�:z4�#Ixl �)n����8f��Rcݮ��
���<_�B#q��)���|k��"���qz4wC¦��~����S.����6��`�M��Ѡ�c������vXR6#��c ��{�F�H2 �(��gg4�����xz���^�u�c ��<��w����#$ܻi�� ch�*�ĚP�'}
��B���+���P;Mլ'RB6:Xn,�;��2���tJf�ou���t��Mw]| �$l6y����R�4��R縫��fYjg뻌��Q�L{�7�;��=�\�W�;	x��d��b�d��Y�ݍ;�ҽ��=8ƳH�B�?6'X&ʁn��P �NⒻ9���G��k>s�=jo�d�;Z�vqd�1_x���u�����d;��>��ή}���=؜#G�1�y�<a���f��U�|][[�)y��'=� 0v��f��	��LW�H�m��3�c����PX��ƛ�<�������Hs�
n�n�a�IX�|�9�������
,�ׯK�W�P��K���aT��Kn��� .���d�å�`v�7�$�gC��yE���׍����/҆L���ʱa�PY˗�el�6}��.�$E`h���uW9�Mw	%��j���8��<�ו�V���a����s������G�7��2�>��BY�L��c}kl�K�.���^	�eh�;�R��c	q�=Fx������aG�KI�\���;Хw�{�>�〾�	�g�Z�J읶��W��� �/��h�Q��_O~�u�l��V��C�`ʻ���`�ո��K�|�ؓ��B�T?-����.�ti�����e�'Q�9Q�0�G������܃��'�o��(ؖ���a����F�~���[c10��f�C��7����l�#����Z�F�����b �A���}�m%!�F|�r����ۀ7>{ӻ���5�`zt5Z���w�?�Aw(�����2h���~$8#�w��l���,L��w��l7W�s5���.D��L��9]�-%�������(��ۋx�[���QQ��>[z0)�7ct%G"��"�d �F�_�)	8!:�(%�� ��@V�I"�͸�?��;�F�0���n�8�inU(�@���Г��v�$`Ddd3�	��%���������<��:J�yh�!��(E�;	�9��f˛��y�*���c�s���� ��N�S�=��D)x
��M��Vg���\�=����
>��y�C���@7(�h[�#ζ���X������g�ǎ7 �t�[H:!w!�����K�?�7Wï�P8��G(��5�4k�?̒t��b;Q���~��[u��#��e���=�Ob��þ"K�tF�O�R�ģ�w��^<����g�y����r��f�e�L� ��K�x������C� )0�#�"	c���<�>�7�(O��-f���$�ѝ��    ~Uչ�mԌa�;yY�;��Q.��J~Q}��f�r(\�ՓC�"�����h8�113���3�Y�$��{O=2%�_BI���䃦*<O8[��+jY�Ȕ�F��b����+��±E��F�p�i��";I{S١)rvN{��z�i�O�b5�tJ���`��Q��⨡�У���7Pz��AX�C��z��Qܫ!|(&<�f�j����n�1*ahaPy�e%���r�-َS�\�"r�|�;q����umh1~�R_'��$��*�Z����=!�e���:3���𶪵�+VN�V�2�W�UT9�z
~����9����>�����!��Ѱ1K.���ZÛ�l�����I)R1e������q�6�g,1z#�� os��L������s��4���yi���f�g?}ٞ����uݎK�x;z�q����a�o�m�U�����^'��K]�h��Π�$j��`/Q1b�����H�vec=�5�����$�8b�P�j�@ ;v�q�|{��9w3RV��n�+���z:�Swc��_j��`��%��B�u5_G�ada����D��I0{op�i�� 0�;��mgbp�������š��A/��캦�d��w��#����k�Z��(�w�I�pOXrl{�&�9�~ag1.NC�,�.p�5�щ�ТN{�(<1Z�@�q̃�z���|���I�qh��ͼ3��=��qF�Vs��
[X��	x6}m���UF���)NRu�U��@'`�ޫ�>:cWXb �T'9;�n��qR�'��HQ�_�%P
�+~�[�m\P�����ƶ��8��yN�]�Ϊ�$X��N�\�6�5���>�{
��W�P�Tx��Kg��-�����rp��Fb%O�{�~�(���/L#iWZ���vS�৬�jǀ9��@ľ��K��,v1{��`W�f�`����u�Y߬b(vP=Xp�ltC�@ތ4C+��4�ywP��>h�7p�%����c�,�t߹�ӆx�g�i�q'�A5Dr�͛,\�D@~l�Vѱ8��
�2]�9�W���`�gP+$��n��%�}�sۏ,akO����3h�$�g_/I��	�Gg=��՝6��R��V��~6B1Q��$�-+�o!A�{9�{�A�5��ˀ����A��60Nq����bG(��j证�*Ρ��ߏ�j8 O�����)z��F��sh���O����W�U���c8�KQ�g�}��n�cs�~d����zkWFE֊^��IkȠ�R���������`���F��_�sW�b��3�rs�F��~�;�%޿�>� 1��f���/���tl�ڮ�"�Y�����`�:t^��XNQz��+�'ܩK����Ab�)�E��ݫ��R�U?,���%X`�����J�Bht|�?#��9���O�� bo��$G����L}P��q����}������<V�-3��G��2�	�cd�&x>�?Ox�۝[�P_�A+5⚚����X�P�J8LA.��ù�ތ�p�/��w	Gx�н.�8AWq����5��tkt 	�� ج��ðv�6w�Ƿ&|&����K-J4��e+W�� ���i�C�M±$�c���r :�i������$t���ϋ4��=X+��Ǽ�PIȋ�A[�#Z�)(���A���^b��ƺ��m�[]Q�bi�H��8uc_^N8��v�"�q� ����D�x�D`�#�/�������8]*#��$�ʊIN<m�e\��s���	��{��N��J��L��t?O�'������#����P9� � 
΋�ǝ�KP���gծ|������	MOqЈ��8'���¯6|*�L )�n�����gE�ն��~փ��a#���G�D�T��ȭ�?I  ���u�`�����OC[�n����K�l�zx���:�G���@���V�ǡ<|��ۥ�v�9���E۱���+Դk���̓���f�ע6cU-����xk��[U���rb�����Cp��E}>�(��yd'�ྨXt�cj��1_�GcT_��F��ӎe���	�aY��Q/�`e��Ît���.���;2s^�Q��
��ִB��v,��]v�Mo�\u��<5v��R�x�K.8q���O�m�_�~��B����Gh�l/b�a��\/��d�XoEER���U�껁 ��ڬ�X�+�Kc��$���	KZc�����A[}��u�q��E�j���G��3��;%��|-J������D�)�{:�/w���w�ބ����uv�%�gY�	��vv��"ɴ���{�|����K�[j�W������׮Ӕ}!i���X��	9Tv��8�7}5�}�ƴ�%����p��2��]A��.������y~ 6LaJ׷C=��y��.���!T�M���c���6L��RH/��e��
�FbWq
q�iL���gn5�������i�ކ%�E�!��84�4C̹��n�9�Fc���Q)�+�� *f�_p����b���u�
Bc��\IۃIr�����SA���$�ED{��D\��uD����sY��j;���.~�8�4{�js�9��L���.v�ʁK�frvة��^Z������JI�`&)��I��ڎH���=;{Y,��Ç��?l�*K��Q}�=����h���ĩc����#�3��������,�4XL���
NMî�@��JNM#�YH�%��Tُ�#�z�vN�]����4���!C�O�j�-�d��z���͒sr�i��j�c���Uu֯P�`p]���==K`%�Bb~�� �V-sp��V�� Ya(��Zs��b��#NW�'��iIzx��l��ظg�� [S������H��?m3��w6O�uS���ɪܗ-*f��9<]��v�����i	�6��rRLͲ4�f�
������M�J��V���E)vW6̚���$D�`���Mn+�=0�����:8v˔�u�%X�%���26���¶�l��lD�`�ܥ��,�6w�>�$�K@;߻����}b�r�U��(7T���ϩ�>۟$'A��m���l�k�㝙,d$m��`c�-h��rn!�@�C���e��ns���*ǣ��fq�67(���n��a˨��]�I,�=�F.ű�n�m'���d�o��,��i��2Pq+8[��݌ �x���� ,�L�ٜ���N4�N�0OY�B�7$-6�,��f�{�r��G<*�[����
5`,�c7�A��u���%^�&S�\EE2gB'+��U;�h�٪P����9�l��2Uxr�)��-�%�壿?jsؾ�O;�1�CC���p
jn�-ׁ_7�����5��:N:]��>��#�h��\'	�>'�u	��X@ڲ,^�5`��o�d��N-��0̌M�������/����[YaH�pϡ<O۝���5�|~I��>�Ѵ��L^]��SJPx%ԋQ�D2��>_�����IbMi��K��c���O��.~>�ۥ&���M4�=��D8���fNӾ�]�b/cxؕ������\QN��]ޛ� ����fI̪�(��{���U��]�>��o�}"G<W�ڼ��� �:�T��[��iTD�#�ע�UX��1�d7P��SWD�ϩٱ{��Nr��~���Ԩ�[�՜�oW}
d���!\��+Q.�y&8p�%`����J~�^a	�q��(үY2�������$�$ Ϋ�����i�{�*��^ݝ��f��I%���o ����E�#���W����$zhXT]p���,2��en���7s��aߛKL�:V\��Gl��1�s�.�T�K�ouޛ�
���ă���u����%IN�TNBէ}n�%>�ʫ�5�	yZhw{�$➋XQ#y4�r}��L�%?("疌�����N�;�67�e�^��,=�"z1��Iy��B�9#8�<�O���G�:��b?��<pf?m���Þ�8
���x���"f�ٯ���]�)    X�x����S欜��Yw$A�nI����7g�P��
��v�9%���y�=��T�]��#%�f_x�<�32WX?��C�s͆���YA�
��1�8p����M�J�q�����c�'ƆZ�8�
��}�[��"!�\y<Bl���[}�Kh�����@l��s��;��:;���	N�i0>���Ey&�'��`!r]A�`9���!!�q��LW��[�̪�[�`�L ��BI�u�#��W������u�o�	..Dms����ُؓ���<����vlY�w>�5,gZ`�3ox|pĪ��y5�8Rò2Ʈ}O�,�8d�&:\��;zU׋g����4`�t�{~ʷ� �"�B�!Vɛ�4Z]s�:�plp���\��
G4�^Q���P��s��OӜI����js.ɔn�6�]ُ�[��~J�	�8��Ûk�LWC�7f|�d��?�=��M��J�;#�f���W�3M��_��LG
��g���[Z|�c���9+A��@��_��׻��v!�G5T_p͢bA�0�m8/|ɓ�>���Ѥ����Y�{�w�Ku�/+U�B�:���V� l\�<�Hg���K��K8M�2�T�UH�B��-���Os�_���[�B�iU�ᛏɜ$ꡣ%�����HJ67�4@;G|���h��L%�)[��K�V�ăt���%�N�����s�i,	��q{�nKIZ���y����S��[�����K���ӓ�C���Ĺ�_+۸r�����;� �)Jz�������ʜ��E��r�ܾ���\�d6�J����(����PN�����	���T(L�9��X�Y��beþ2�s(T�*�J���2�w5�w�d�'�#�JϤ��øV�o^GB�����Z}�$9�.�M�\*���a�/����Q��q��x��y��F��Z�����T�f�f�eCv����ߪ�i��x��f�Ӏ�Ɛ|({��W��C��_oM�b��ma���v��ę����H9�I�+�pT`��X��`/��ϧ��=v���}��a슰�4��a�E���o�>�N D�B�1g��ͥ�.�~YT�>�J��+�ɚ�Ξ�%����9��V�Kn�� ��VO�9;�^1�I~ ڰ�G�\A���f'd����h�\,��v�}���P���%��6s2��P���g�O�aF�v{��?��d�S�zh��������1�?���$� &c�b��6L+�B�x7K�_R���rv����@�u8��sg�`o�$iB�^hi��r�@�i�`q5��)�<8Ձ�����Ɔ���s�Ia�Jm��>')`̓������}_b��)�r����� ���byS,g���9�s!nRZ� ���Y��ˤNwy��
Y�Gؙ'x͊��M�?��	V,�h_i�H��`��'~����O.d�㥭��zLt�:����<�W����h��ZZ�N���ݸ�\�a{��!�K�`QOR�Έӵ7ڄ�+�Ō�q���=��+%�pu��a�7\����}����l��Gc�]{=���s+o����I7���� q�7hopS�
q�荴���e��,%�'7�H�[<1vZ�Ɇ�*
�hl쯠���I|��Z�Xy3Gj;%s�3��վ��}��o�1�>6��B�J�&X�K�+ٓԸ4մ(����,�fU�MAM�_�:ЗzOT@Ң��QD��>d%WZ�s`�EC��^V�Bf�$�Ƥ@"�{
��%rK4 Ts$�}[�.%�����x'�q����%8Ћ����P
�%�Y�����[�|���(Q7��=$�AL/r�會y�Dh�
��@���"�����Wld�I�D�D�����K�w�A�S���&�[�D��9VEt�74�h=��p4���� b��`�t�.��[d/��tɚ,�Z�0+�tK/{"�~Sf�x�#����9��;�(ބ�s��K���ݽ�ml/w�ҟ�J�J\x���h�yV!�;�M�4n?�WW^���<�q�d���c��i<�j)�sO�:�[q$��Z��:��8�G��j4��#�: ���ui,���a���`p*�x:Z뫅�I�QwN��K] �t(C{�!�t��\�Ǔ��hse�|���..P6~�Np�����)[b�iAC����
�1�������x V|l�`�a; $"D���`��a�۝�(�\���<����[��g�9�[�!�y��&��+d�Y*X"\��sWIs�����Y��ppf6'��H��
ʡ�%�w~�`h�ګ̽b�ȩ�Ւ;؃�Eֿ����^)��Kܠ���qzxV�?�r��CC�|�d�UV��B��!!���M\J���K��J��awҢz߿
WT�$�=Uή`��Jc�H�V�jU��I|���,K�cy�ƴ�0�H).dM����pŅ�r�n�0�U6Gm�����ˉi�9&Z��A��u$�"	%.I�|3�$�*C
�\V�}���a��j��跁F�{�*E���DW��\K�h\�}:n�k�7�H�o�eűPp����ۺ�(�����پ��)�R�NM�$j�ݦ�[Jh8}�>Z(�L���Y��v �}�L�N7_�U\�9Ӷb9@I�ڞ%�~^�ph3|ԘxFy�N����,�b:Zy��oJ�te\W�P�Tj�#��/p���#X��S���Y	P?�XW�Q<��𙪃/��PG�ї��\I3JQH �J�@)a�Ӻ��@�X�~4vb9�A�v���E��#G�3����+<!/Ϧ}G�kC�F>��5s�|��v�R"
�v�)N���D��q}1��v�q��rs�r<>�&,!�
���ݰ��Lr\��+q�\��K���N�|B���n��iu�� OA��˴�C@w&_�޻9��m��^;�;��o�e�$��H\��LR���9ʕS�t�m��tP��n��:M��s���z�x�8T�K�Ušb_9�V�彶��`�Z(�~�ݱ��a���_"-f�>}ì���q�&��ɪ���rњ���5қ��������M�rVޓJˀ��yN��`�a�i�l�	����ΗF-��=u��{�(��������ϝ��En��)٘.;N�}�
GzIa��Q���铛��cOW����ڰ������d��l��Ksx w���TBR"x��%�v�,�+U�	a;������]�?R�rp<�5@
圎�&Wk�-8����;�cS�[�SP�Гdޚ#s�_�1���$8�h!�+�����Z����;���󲘍DFt�t��g�vN�I��83�t���m K8� "{o�]����Xe<P���V�Z���c��r�,c�Ը�|{��]	!��%���	ʠ|ąjV��v�h�Xo迠P?bCAD1 ���~ '@�*pp�2��#�i�hE#�}�]�9T�b&�r�<����.�syXww|r({W�ےp����O�2h�Y����r��o�.�{cyz.�g��=r�|�9Ͼ��h�ٮZ�_�Գ�'R�������}���껧�8�u�җ�\��r�'g�]��V��ݜ��A�ϕ&�+{�Rp~Z�Ys�4m����lO�"e7��� X�yk�b���5}�*�����?�h��_hZ�c�O?��ZgN��-?�'�硷 ƅA����
B��o��*bG��a�煋�Z��䐥s�:�hx���}":�wC���>�A��lEc΢���Q��h$g#�6�U�Wp����������eƩM�+�����#s��[�����~��l�k��ٔ�J-��ն�E=����Zs2��0i���w�~e�Pbb���}>[�0�{��5Y�1����@�|g�6�MI9�EI(��k���^�
�g��g��+k���!,>�(nb��	��^�Q��<o�u1�����X�Ia��Ӊ�~e�BE[Fb{}�%ˋ��ُ���4OX>��Ϩ�D���oYK���Ϲ̞}\��KvJ�z���_���<���u��!L��ʧ��p�s�=�4O)�¢X�� Q���n�M�L�>9K@�D!5�d��_K����c#���)��'ւZ�8ع�cl�q:�'!t�V�9����    ��˒����v�Q���ˊ/�`���> �5:���P�(�"oBb(vX�ݐl���x��&�!�����HA� _�÷&l���f�_���"O���cN��[AX7Nw�����tʌ���b+�i|��g��Ң�ɳ��8��p��9��C�i�V�$�s%���k6.���f�譱�9��K�l5P��/>V��E�T���cd �������5-���4��Mأ>�V������'9������p~�by�`�\ͪ\� ��?�3��A�
-�Y!ǹ-��nvYU��ள�AQ,esQ�X�����^��j�uW�|�+@�7-�/�e�w�/�r3�&�C�ᓶ>� t�U ��)�p��N�t��P�ז��*/�j��Q��|�q_�d=A)��a�؜hB�K!�U��J���5)PpHԓ�
���1q���ۍ�O�`ސ����/p�z7]�huT�u�9��Qo�9�N�V��9g�_�woK`�2Ĵh�]���i�*IrT8�f�@����M�����q� T�u�<�{p9!�;������=>�P΅p����U�=�8���am��4��|	h�}y�_,�S?�LN� ��?��p(�D2����
����ab��O!���1��� <g����Ǻ4�2�Dbg�cڹb�پNJ8r�?��o��%���'�ñ������0i~L�38��4���`zB��ĉ�ws����������L��������'?%���H�~:Wp��ޒvW���e��1k�H,j��G������87\�A�`�~ī�{��j|Q>K��xg!�:8U)b�����ő����Ҋ�?��F����X��"va�IQx��&A���A�����׉�f>i���w�]�B�:��]{M��q��K�f��Q[��S�������Y�{��������$(�;�Y�i1��(��z��B]����Q\��:�h�h��n{h��5ߪ"�bi��ыͫ��?���K�}�g㧡p\c��V0k�֒�v��$?	Imo�
j��y���k��*������b3rs]��{
d�S
�f���P˽W�So6n~b���0Y =�f��,�8�c�����W��
E�/UӀj";κ�Z�⴪�ę�ۍT�Ge�P}��Mk���Za+��1zZ�;�A+1��]^�|��<n��\ꭴc��?)��F�Z�w��41��P`��>=MV��$6�T�c9'��:E�C���xU�������Lr�N�!-���&�a������e�w�h�d.�3�`&8���|��s�^����W��	o���}f�ҥy��/r�5z��m^���^�W���+�����1�CLQ�Br^מ�1d�%�s�l�%��ݶә8�?r�Ï���%�]��
e���(�:u���4�Q�$蠛�Y'v���O>h�����)��?Z��#}�z>a��.����'�Y���N���֙Ǟ�!uL{	�x��[qcc�s�}��_���t1��D��ѓd�E���KF��.����6�b��x��D��!}�Gi�┝R[�]��:v���J�B�}>�5�*=@��ױ@��p�ڴ'Q�"���H����nq���DSO�h,�ٓ�/d��c@�@��lص(`!^|ݝM{�
���7 S��`�l&@"`���V��<�:��w5�<V� � f';�:ah�^�w����E5i���Z�W�uQ�(�M��f��T�Z;�
t:r�5v꒜=鸄�}rNcS��~ks����2�t����VN�������4�l�D�&1�-�`��)�!\$���~�P[�a~1�@N"�7+>���/��E\ � ��}N��@����gA� ��f��&߽6�)�u;~�f:�>&;���DW���V� M��ґ�ُr�ɧ��0ǀ�w�����b�<���s3T��^\4̠̾-���U��`�d�O�k�f�f��o/M���R�X�F��X���ʒ�r�9ۗ$��|��V ՚�H�|�gl� �J�����s������� �#���h,+����\0�4j��ጊ&Z����w�J�s0�����OK���+���p�������~��;+YU��
f�~��a�;�:�5M%������kcn�yx0�l��CЌ�w���9�4Fk
�`q�BvC��	/ �J�;�YҨ#Z> aK:��؜n7��@C4�\�I��@è���#@�2�
i��j����t��AGH?*N���R�Va����ct��� T�e�)q���z��x����֘��Yg�V@�K}�,f#�l��HlF(r/G���b4z����`6���?�W���ۃ�^�-� llj��\)9b�ʦ��E7�zɤ���Kŝ�k�:NU��b^VIJ�ב���l���������f�*�#7~��%k>�� i�d3��z���Ksr�?䴑0��=� ��q>H/päc�M��Ÿ��M$_��\I|�_,�q�ƅ�	�H��˪֤"�=�S;��q��
�l�]���I�� .`a7h���d��c�C1=di����0h�I����(����1	��^�DiN�g�f�3V S�	?�ӧ�$/��I�9-�s�۷���	
�����e�j�MOQG�3��%_�������U��j����~���:	��K�$NO +�.Qy�;��}����<5�h�!z�v�k���<���2r���ŝ��Y\�i97[#�赺�#��9K�r�UVaWl*�(Q���W� �*�bk?7s��ŏ�s��0�iY�q�����a�FX�r��ܹ��a�a�97R��"_��)��X�R��`������!,����G#@π��l����3��.i���w@0��|����ܖ��JRj�֡~��]e,y{���0.��*a��\s��u�*��&b�ʙ�c�J_�l*�z�8�3��ُ�R������y�-�W.6���O���t�@�{�|(5=��:/�o<�}]�Z!��	���_�(�"ཧ"/{��V(E�`��@����q]1(_|[����y��\����~[����3�U�l���z�7ҍ��V$�꣞�E�1\ܓD�jg��Ȝ2j~�	'�5G6d@h�>&#&@��4�iN����  +��8�J-%X�#r1g���*4����X�yt+{�����k�Hk���g�]N}b�/�/�Q����B���4\-��x<� bNP�I�{e#`v�}�nt��ɍ$tx��\)����dUy�l�q2p`���!k>=�쿛��/1��]'EUL ?�	�,�`B�f_A8��zW1V=9��ڽ����R��3P1 {��z��{���3s�^x�+�Yl�8�7w��2���)LL�����I%���W�D͌�"Rh|g�+��2.3(�t����&��dUDj-sih���Z��ZsYH��Σ�0J���]]�?���Z��>��o7Ղ�K���PH䬧~�܉����
X�
26��("���� ��M��0l�~*�s�7!�_rP��D����LL�K��4t%FV��^y�<.��'�9dn�j���G"����͜�a\���,9�,���s��`���
i��%���49έ.�Z�4�-�?.V��l�i��2������Y:;hép���f�)�\	PI2��3�0s㧹TD��j+�Yี�gg1cە����T�j���l���ɎS�V+�V]9@`�xf�J�p'�b�2�f��N��S�kwVs�M����
R����3�}B��u��cCRDm.�Q�X�}����ݓ-�c���D�l�BoA!,���)�����@!���vH=�^l�\9��\�Lۡ����v�EV�d�1�)ęX���^�W���D܇�g��<���V5u��TFp&zX��5��=�����d�FD� ���ƹ+lg^�C5/�O�R,���*����)��"7#�i���*�^���Y�)�Cn��w���`c������8��c�%��2��{mF�K/�Q}6�`
#*�K��%-�¨�4�o+�A�/WuV�=�1��Y�(̷{�fl���k�     <1�b0���̧�t"5�� ^���sA-�����+�3Cc��?d�6L�f�Jb�	�/��X�+��YQ��hz$��� �,�OE�\�Mn��+H�/�i�X�ke� �{=к|#ܺ�F���s �v8�%Ln�� }փ���#,���K\�p�
��q�	���oK$6y���_b-�w�_��>�kBr��@&��$ו4�`���$�iq5�u(����	�Q��\�q]#Â�1��E[MO3��b.���cI��p�s��ؾ������.FЋ9l��,�<J����\���8ص��oM����� �\}e��Dp����}T#$�esIOx�5���3 a��@�`axg %$E��MV%0�u2�b������Wc��	.Ww�Z#7Ꚙ�VVM�`�Y����fԘ�U�}��*��c=|nNO�U��wĺ��1*��>r���	�Q�>0�z-�G��1��`mA1G� i�]��2W|Y��4�T]s=����++k_�9���n{z̘�X����|q~��=X�R����m{�g�F��޸�d[��bwPN��r�P�#M\��@τ��H9��&	Џ��O�lc�F�@�9!��QĄ��?�U�Q*>��)����1WϘ�MLEmOl����K��}螖��s��$
(�V�&X�tL��.#���Ra�}�������A���uf ^)�㦴��a�}����[Y��"ٲ�~�� %�}s� S`� ��!��t�'��7	uMhM%�䜹���x|��j_���`<���y�Ť�5��|�63��$)'-0�an����sb�%!�O�P���YH���9ސ48؛{�q��6D2̃]�9X��g�,�T<d���Í����ZHɴC�������5�k���ч�Eι�S��Wkj��Ն����K
i�����{Rpx����ŎF5��}��9�W�#�?��1�F?v��b(a�h��(a��V�ޥf�g\r{��OXD1�[����*���.���{_��|�1�L���$��D:@��
v�3� ���PMk#?Y��d�<4�g���㶹�~Y�!��|?Kr����{5+:��L��0��:�#����I����	�|�OfʨO���sĺ=��[�R�Z���5�)p�ae%*s�Rt+TF���}3�W�z4�R?����Ǵ��� ���v����[m�+�j\gI�l ����r�c�Xkr��<�� H�u��8��VW,�XKu}L�1-��V�d�6v��Lz�؛���s��ݤ������0��&qɡ������I�x�T8���꫙Q����g%���le���yuk�%nN�Y�ˤc��Ӷ�ғ���)XlI�
	��Ƥ8)l�bR�@�}Yz⾆�=���Z=��;:5�M�����HR>�Q��p,�Wg�^�GN�z�=Lsd�
�$-8��b-�I��͛� x��^hٝ8�i`�f��5w��D��k�u�p|b� �&��-�p'w�X	r9�t�F%]���C�%��βp������[�Aq#����렷��AM�5
�	�(�T����Վ���"�2hl�}#�$�4�R�voK�Ĩ����T��\���!G53Ч|��u��4s	[\gO�Zb{�R��ת�`.�l�_�q�Ǻ���C]���Z� �sVp�,@���*St�t�$4w�Z�d��V!��#ɡ��N&�P�����7M'����S�h�����eSQ1���[�$����ͻ&8T6m���#5�k´��$�nO���]����"��?Q>�t��y�>�=*)�jik�H��s,`�8��]*oZ���BF�BZUkR@�BX�����s_�,v����:�C	��}7�����i�� ������30O( �ю�_��L[ə9.���������^ܹ�+��}[�8q��"�).W"'�C�I�0�R�w�S�GJI^�Z�!W,%1�$vK�,E���,ڒ��j��ä�ì��ri�H,�{;�h�)�������#����o�$�p���!�����SB
��g�4P*�D�P��g"��?�,{o&������K>�Hό<ҡ��dw�1��`�c����VX9��n�m�̱KW,^�#P8h�S�`{��誧�uy�a�])�q,�n:W=��VD�%)�XaR\����/�"	��E�M��ƘJ���%,	]���^?Y�0 �/����qv�r?���K�ڸd�Ȧ�ɹ�N3E�'F�0C�.��ϐѧq�i��m��ֻmu\]����*�3I�-	}�����9g�FZ��/(v��nvT��T�c2�VA��c2E �B�#DQ��ѭV7M�GU���YIꓗ��uH�D�k��k�dL��3$s�<���{/�x�1�J�<��<^j��:���O4]_����4�gʼf��HZ��L_�U[u|������c+��1��ڒ��զ5wN��=�R��蔽�����_�q��GGLa !Sc2�)�kx/*8��� ��X���U~���4-}���믫�Ê�Q��N�+=ĕK�.u��ы8V�Lݜ*KҭZ!9�u%���a��z��*�겻\]"#�,�:���
�C%���㺮�% tN�ي]��p(�{"��Υ����0��A��Wv���65���9��
<�s.Z�9�4W\�x�Z��B�7k�O3��Y���+[y3��D�ܱ��4pr�p��Y`�ՐS~H���p�����XG�4˸Ԁ��Ҧ�*�A���;�QVr`��.f���we�F�O\]a��N�X'�B�5����礐�)wi��Gm��i�q��2���Ux"u���N��& �l�=�;+�������������5�ŉ�;����"�.�7C9ntis�g�5�[NQ$��S��f�qf��gj�e��xd>�ç�8/m�`����6A�k%	Ć��t��|n��>-�S6���&�%�Ptk�OK�/����	��f�P�)�kʪ�����=�����쵬W`3V�Á�Ï��+�X�KKN� }�iͥ�Ƶ�SR�`�ȗ=:K�A@�0L��"G�9������%p]�厮6�d����q����9�dԓ!�\y�SO%���043�NtT�4N|G�/p(��dS[���
p'r�.�����i�����U���#Uիp$J-IB�nP�
d7�0)�d�\�
f�r.b^���U��yŖ�"i*�3��m3󊖤���-z�	�>��SO����E�8����o�|��?��b���dw��Q1D��{ceU�?)Ⱦ$�vB.�|ؗ�\���Tޚ�n����X3_@�����̉��.f>f�p1��@��bf1x6�\��H��0/Yj�hi;	3��K�����ӹ�������9�B��p��|.an2L�YP��������j�{kP��t�d�#��7p�;�)��@o��q)��P_�����d_��A%{SkAP0B-��0M�zV�m1�KQ��H�I�^������ \bɥ��Q�c2���I����%4`)8���h�<E�pOsQB	����VM$�~J4gнꌰ�\�ٸ�;���v������R�w+U9�s�"���eq��'@5�0ʗ���#�I��7�H6��џ�,����Y��I��H]��_�+�ˠ-BD���Q;�8�l�W�B�˸��D�j+���k6M���2)�t�~\&%��{b�ˤ�ek4���
Lm��\�*i�^�b6�RJ�L�;[��]�a�S�ˋ�m.h��e�,�8�^]�$�I��3�y����Hp�&�8�ɷva�N�V����ҧ��+�gs���}O"q~X$3�>U>W�����h��+4mjk	�Ֆ��4Y�#�v�<�*��ǭ��+�y>���-�y�"�l�+�yX$ٞS�s�<�b=lf)W&�"��� :>o3̥�˧Ic���2�+�y"It2�˕�������W�1��u���L��H�Hv:�;���p~�:���.��N�*��������t�T	;�q�(���|�� W�~d|��=��\�&��ڀgD    ka��"Z� {
�e�W�m�">���'��0
:�O��-p��PT~�N}�e��o)��1j^�P�^Q�N��;�N���7?,qv�)��a�j���r?�ϭg7	��2y#?�j?����q���3��|���YZ�����^x/Ȑ�),��q�����+���MH�]�Ϗm螁�x��N!=��j(�/Z�R��~V�G\Av�E�����f:8�7?���Ϗz�|v�E�/]�&|Q��ؒ�.��SU�҆b%�Z�-��A�ő��[?��f
�(�f⹔�Pן�/����B���p��AQ���W�����"P�"
HBkL��KC'i�|ʯ,�W*�+�d�$.,׸w����ҍu\�x��9n���FX��:f�\�2�:=�<��p���A61�J�qJ|�ŷ4�4m�0$ɪ��<�7+�eɪ(�AV�*	�R�hR�$9U)����,I�AW"�1�,q�"��]~�$;��
8�4��d�\Ʊ�'�i�������U��(����T�� �4�0Wh�c0���R�r����(�4�/J�����e)i�G�Y������aBw��E3-��7�Nv�����l.u~�-]X�R�3?�8t7���O�%��ti�����=���ۭ��r ��Tƽ-ssY��f�ָ��fB���O	E�Gk.��\n�W!ݛoǵ1��#t%˜cي��e��qM�᫶�	:�ó��U|l�Q�e.k�y4[�e��Y�Kh9�4���6�h����s���P�{��sr�Ɖe��s-�<7��B�aUh��ˆ ���I��k~�-�%��)!�&�R�a�A�e��cP��̢J�g��W�J�����Y˲�T���N��,��Z|���F*�I��S�K�Z �A���<���&m-0ǘ��+�J8x�	���m��D�����]��С6ˡ�~�F�+p0�r(��=.m�@����ٌ�(���<��5���{�����PZ�̍�3+"�������[�-�)�햌�`C�_X@�M����4+ {����c��U�7�7��n�ï����ldh�D�eT�c�you�Y�B� !Z~�7�����c�_��IG�9x̜��]3��i	�!`��a����[�O�w���6�q"i�	C��f�q�aެ���Sl]���� �
�ij�k:���Q�����jg�v���sT>=L��+W�3p��ߟ&�\�h�.	������P�h�.�A@H̿D�R�N��;��DD8t��bj�-��W�AH��v��Yy||�e�>_c	����Nq�|�ޙ��'�����.�?ʹn�{��"w()��[ȥoT	mA9���|T� 3R�0ԃd����RMx�䑔��Q��pr��8"�=SG�\�j��l!bL\�)h�I޸��1���q'P%����Uw���V~���D\	*�����B�3rKIݜ�S[���f��m
[�\�<�pa�)M��	�/��B���-(������)��O��c.���X��N�k=ٟ�(A>�[[�U�v:��l��B��j�����s��̩��y�k+g8����oFr��˻iO��6wv�x�]_}�����W�q����lf��G�̦�X��aw�Kmis.��o�l���&�^�Z�9�?���f�z�9���l
�
������<}T����d3*�������$$�4v�cɟ|�ǰ�Ň��-Vl�f,I����
H�eME�^3�t�\)�_�˫|m�̹����a���Q�s')_RUf���<C1�P�ݭ�te�%���(�v�e�����M�8j�>N����@Rr�(((k;�%�_JL��ng%�h�V�ݛ��t�D��0� �nP���`nF�D�DS�@��I�mAj��Գ������X��J�E!���,p�nZVAމG�c��N�0 ���6���&�"	�R �r���!��c�w���Lv��k���6:�/G��{ɘGs���"����8|iNS�h�'�%Bl)=�퉄��>s�"���і�l+EIbH��`�p�GtS��FQǱO��
��4㨙���P��Cb>�8 ����%hM)
c�S!�ߧ%=�ov����?$SԾbJ]hk�[@�������V�~�mX�4x8K���V�W��u��׹��.;���d�{s*�6
j X��i��KX�,� .-��}��c�K�}��N�߉ΩC��_I�K�}~���`��I�,�t;C�%�羱HgQ��@p�;�?/�;��I��6�J��x�������ɗ�fW��5����V����C�֟�H�3pl�Q�E	��п�Ve�z�M�"�Jл���phlZ&�Gm���2�j?��\�!�z�@�}���g#�d��O��b��ز�x�|CT�6K:�nMJ����4���kώ}n���A�>�f�  a2?͆����	"��OR4��`�j�OK袭�}���R���,	��l�U-հW���h�U3�f,�ԛW��ݏK3c�U�i@���F�n�%w���g�b�"�{������k�-E�ع��r�@!J��枎�7$����Mi0��V�o�(�Â�N��]��ǔy��*#�`�llW�Hj�T�������_�v$�xCpF���:����Q���a6�y ��r�s���v+XJE�*���"auF K�K��_����[���"�!�L��g��
�����mss(�E�]��bn�V|D��r�Z G��[�����`���P� y�֎X�9w� �"\!�k���P
�=�\7䨹ɭ�$%�T�k�V�H+��+S�II�(H�0D\t��g����|N��
�r���/�!b)oI���n�`�@2��C)�I:��-��ǹh���R�N	���\���z�a�K.�үps^#��V�*�k�
�t��%�����!����B�1/���	DAb�n�J��H�
����b�\'}�9��pMwɖ�`�s���ͅ 8������>+	Wߨ�E%��j�k&��$�\��
$Am�����[̦J%��/t��e��?	W�X�i�<4Ba�-�Y��ϔr^�׶;9�)hU�OQ�.߲�e*�).U�4� =i�)\.�(��R��n[s),��1�i$�jp�]�����z5O�4�M�E\��C��︲G5���� �! ���U�KE�*����^۵NG0Z��fi�
������͏�&�\Xc��7٩�t�k"M�9W�6s1�)즋�#���L?��Y"N�ߌ�e&�+$I��%"��(/WE��[:��ս	��A���� �aͷo�
b��NW����tP�^Q����:��B��v�lⶺ�B�̾���� �i�}��Q{��0�>-��|��`�«J��"s�ϖ�n��g�z�̬Ż�n�9�dƶ��C�Y`��,�Ik)�#ϫ�~��'����*i"�~�V,�cI��_I{���0 4�pG�i����	�`K�!2�]*dc���w������8��������;�e�r)ƺũ�����5�,�16Vk�XqҴu�1��l�ޒ&������v����q�=.R����6C�6�&2�C.=���dR��vU�]�Y;�
�U��b�\�q��u��Ly��a���q�+��,.#ѝ6�ѱڴ��C�Y��|r��`���d�be�NN�a�%��s֪ɏV**�2��TÒt\��խ��QOڝ& 
�2�����5�v�r��(|l����������C��i�3M��,x����6�ja�ا����K|���`-�)_�+�>#��r52Ws��P��;3W���,	T�$s���c^ 6�6�Q�&�y&«&
�&
rD;Q�P<%˥���>�L�\nfѢ�#����~\��nm��K(m�H�]�����jp�:����D�?ck�sc4P�O�+�o��lF��L���S �%Y��;AC�k�.(#�����\.�8�:�][9}�te!	�	���9�����PHA�51�k��7?*;1F��ׯ[Lm�Q���B��t$���`$��ڀ�E1    �m��e^Wi%�z��FQ�6�#}=6�=p�wh�o��
E��mY��wa�EZ�9��R_V�Y���ই��>jQ�C-�|�b("�s��F,���Ʈ����<I������%�C	���g[�� �'"�~��/)TA/Ed�|�������ĈY(+��آi��V{j&eF`����Q�n�?�S@��_l}^dÂ�doۡ��N�P�@#��4����|�\B�y�Ҁ���W��TlI@Ȣ�{H��L�C��*�K����D.�S�N�|W!-v���q2(K�>���~T\���ޠ@�\mn�P�Q(����p�^܃:Q�?Co�`�޲� Wͯ@�A�(�4�Ց�{�a��s����ӻ|�Q��>K���G8����u"�3��MQ@{V!� <x6+�}��F.U	<�W�``S��z[ K����x��%���2���4���e);jw~D��7��ֽ�\"�!'�s�N$�9;f��Zy�9:��g �ǡ��7�E��l��p�����}մ�MJ����Abe��͸�?�j���������XAe3������1�
���M�^�[�B2$yGԈ���K�'�â:?����|D�ɲ9+�G�'@���.�~�6�M_2*��Q*@��OɆ��3H�ԝ�N��$��3��vǞ�ￛֈ�;��`?��6�mNh��1�}":�3ߋ�-��0���h�-��� DLx���\]�����mwl�yLA��G���T�eU��Cl�ơ���O�R@ĕ�6��*���>��t�
�ȃt>��ͼ4��������8a#Ik�F*�3V��'l�����Cp.��6�d�.K�E4ן���GJ��?�o+N�h�Đ�lm$��D�O�� �Z'����im�ep����._,?;%���ع����Ͻ]�;֫7$�Oَ�H�8^c{?��v�1�;g_��l�\�n���N���T�蔍%o��+�v������A�M�W��=҉�y#��gI&&�U#r6N-�-��`�Ԫ������7��/)Wv
�	\���{���R�)��������\�c<����\P��4c�t^��	F!�����P��lV�Ӷ��ѯ���ƶ�X3.a�ʞ��赻� π�K�5Nv���MOK�ʃT���1��<C��|ӂ�]O�~�f�Ғ�Y+�-7;�pM�fw�>-�p\���iέ͒p\��/iS�ԯ�����=-���)�F8�`g�qA��o$k-�6��$u[��0Ǖ���l���IS�J�e ;IYv��_�e���\��^A���!bK/���=��D������[w���.�(���Kٻ]j���u*@�cC��}6�����H:�F.���ٌ��0
�� ��y�* ��7�L�{�Ul�R�eyE���%M el<�q��|3g�1`.���[��m���R�zƏ�%�Gqj(��͹vO��gc����L�'}ɹ*6
�G�љ����$�����|ک�aN��s��aQ^PF�MxD�.�E�w&+G	����R�K3�y���GIu��.rTxB̂��-�P���3[}am��*	��o���6'٪ʯ�h�I����1���a��S��M7�� 
�ؼ\U^���9����qF�[��i	�ݹ)�p��}3�'*����$N�
������B�{���-18uB��.��}���ȑw�q�٦�������:���Y{%�9W���]��+XHY֕�O�K��Z5������]��׊�i�%��"��}�=��OsmZӞ,�g�I*So�L��Z����eA{�xe&��67EH{�E��e��p�f�����2��a�
)캹��*iV����Ccz�$�X��S�4C�f��|�@�@��E�Wa�'\�t� �)W6��OU�q��B�P�࣠����A�k�mNp$&0����Qk=V���R+�����X����"��ą�t��d���X
c>�q�?�҅`��)D�Y_s{6�xH������кE$�2_�veì�jMK�̥9d+,aP��>%��k(�J�\����"���bŕxw:sME��;K)�z��$��ui��;����pmlԽ���Qc���,�l:��q�_ce���j~-�"��@�R�Q4�����$�s�A�v0��M�jJ`�C1��%F�)[!P)P`�
>,Ẋ�Δ$i��}����c��		�b�7=�:��"f��5�a��8�,���W�'��$��� ��謐���=8�%R��������sU3����)�R�F|����x�G��0���ƀ{��LJ�a0�:���|��
J!�v�g؜S��}�Q�4����:�l��G񮔐�+V ����L(LM+�a�N� �b�m��K�����cX�?^���VR��G\kM�YE41��gwBMR
I+�_�=U� �M�L5�v�P����3���ֵ����yS��ϝ���l^������>w��9��4�+�2�͛��=��(S�Xw��x��,Z�*W��sgO����Ma;Xa��6�������@c�Z���S�JOES�2��-"f�wƥ��
C����[����R{���3�,j��]8BS���^��xO�8D�FY�$'ar0�����2_s	�pT�j����Ǽ����z��糷K�Ũ2�:*��W�U��T�+B}�̿���dD����I��&(�P����좁�J�,��;�H�Ӫ�O��s��DX.g����5¡���ʱR�+������p���K`m.��&�=��R��0F�H�H�.{ސ�V���|���e�nn&�cZ�e�nn�d�I�E�nm���9˂��t�XoTR���Ӳ�(V�B��n@�V@�����PFd���{2�g�^@��0kf��Oyͯg{��>i�Ye7L�����V�a���E��o�K$&L�Q���x�;���l��PR�%�o�_�5��7	A�A$����޳�:=��aV�����G!ޤaz�X�kmTN���X{b�f���#Rݲ��?�n��(�v���U��è&'����Mw`� �h�L�����3h� ��*X{�������?-��U��}7km?����3�|���U�D�f�DI�1~����D�	�g��y7ߺ�/�u��k�����1�º�h'��;c
?,�B�v��VX+����=���j�����aгi��vٔ&X0���C�Ң�o?�����9���`��q���E
J�0*=N]4�C.*�����C9E�z�5Ue��f�PVf��_ex	m҃*�D�4MT_�8^m{Qj����^��|��n���rS�*�6��2�����a��ԡ�y�(R��)Z��)���>�5��yU�ٻN�ҁ�e��U/�����56����S�n�
�r��OI,7m�)��EI�g����i�4˖��E	f�c�/��o��#�fÖf�J��
V-��p����zI�]�$6�^V��������R/R&5����E��,��W�yO��{���(��V=j(�&<��U���#y��6�V�C-��<�U�8�}4���!�1�IUI�\߫5��o��뀨נ��F\�U�>�WK¯��ɮ��N5�k#`����o@q8$���Z���|M>6��b����eo�(�5)Z,v�Ec��`U��PE��qٶ�QZ�c)�1gQD�ӣ���
֙yF~u��/ӊ��^��< 75�$ߕ�cg)*�q����Y-�����.���Ε��"-KH�}�e�0��W���"[s�v�� ,���L��z��M��p|_Rkߎwb���@ݛnr�L�a��^��k5�"��g�~kI�Gn��>\s���k�ߘ�I����F��g�4�,��asu����i�0Qx����"�9NG�{8��X�8Z�jA�h��Vh�e!x���p1ﶂ���̧=�wZU�^i���&����Dϵ�ݞB��eE�CW���]�|�� �gg���7�V���s������������\�HP�Q����z�bj?�nkϏ�|�	����w�������vlo�a@?���j    s�5|֟Q۵d�uK��i�HW���|X����/���i�r�?<Ɲ���2}���<���� )W�F�0���
���`@+򫼑5~4 V�j,�S��DX7B�AA��K�i[�A*�~���R�Z����Ù�q��K;r�_D�jۋThl��b��T2��G7
�x��EH`��Z���)>l��0aE� d/Qb��P�	���Jܲ[4%��� �B����{$�
���
tUH�k9�ka��'J֢9p�Ҕl-ם+H3f$Y�Ҍej��՗�c5���U���ۂ��y�J}�����q�n�qXGu1���?�fiN�cX�x��	E�q���dI@���LE��e�&2�����=�B�!�h{�LY0��GsY!I��ID���bVJ��z�!�H�nx{׵d��%AH!�N���G�R��(�6n����`���C���YۙF�s3H���ui�J����5�i�\��W�U&�hbg���M^J��9zey��P���,Aj��N�uO+�B��8l.H�<ߣ� ���s!�=����vs�Y=�`����g�&�/*��S��~�P����R�"l�ԉiG��6I~3�՚g��}�0�pm����K+�Q�K�a�6���͜�$[����yg��8q�yl	.�H4v�p��v$��㐈x���F��@?D�c�(r��+��yOe�$W-�+*��aq\M>���(iN���&�R�D�X}���)Q���\ȖA�g�*��%#�RR��%i�?��GO��*84���UNUg��}4�Upb"m�}�6���'8�3<�aqp���'Q��$˔
�=ǣ}�u�Pȴ�[ R (ܖ>���S`�9E���Hs��9Yc�TDi������o.��u���Tz[��Y�������1��@�iG�ϡ���	\��*;�3PU1E�g�0�!�� �nk:�4�̂�ڕEP�3MAp;k�~֘p�n���*Ӣ���r��D�+�,��	s��>�q��h���x5����*�'W|`�1b;�&,	U��oV��h�.�փ�cb��{<�%,�1���v�᧰�ǄE�5� v��8�v��g��\Ӎ�W_@��F��H/d�v�߭jH�,�7��,�|���n���d���������4��C95�*�����n� �kC��
�F?��6IW��h�MR��̵��g���T�1�]����" X��<�-�o��x���EƲGM��]��0�����kg_x��h,T���tK8 ut�)�m���� �4�����Z�94���g	���la�8�[�7��{m��
�U5��j�V +iڛA�,f�`}���[J��b�RI��L,ڣ;�f�-<�y�mn�zs2F�B����َ�%B����D}��9ae�C6t+i�@�����Y���5�Y�i���b���ځ?aEߓ�u�������X�'zv����bO�n?e]�8(�m@º�����A�u}�e�s���"�}~��{N�m�bE��H;y�;�h�����I�'Ē>)a^�!���6�eRg����c@����y36��E}���䇐�:dU�}�e|��_��^<Fo�ןڵR�g3�.�>�Ӟ���w������Ix�]��ԆL��d���cB�Ġ�1ȀLX#�E���&bed���e8�Ċ��,/H rD�.�I�}��D������~S�+��I.����$�p��Wg/�F�rZC�˧Na���e��N���O�|�8��䤒��1T�;ӳ�A!K�����Ի.�	��]����%�JR�na��[�u���m/ʘ�`{ܢJ��AIG'g��f{�LG�A"��f�Q�|f����U%t�c����"m�Ͷc��Z+��/�,M����^u�������~����2*=?A�V��W���O� <���{�Mws���&j�E!�֧��0�*.韌j�Jϒ���_�ݐ��YZ���-YI~:��H�!`I�r��3X��]�y�����1��*=��A���^�V���S��By#�������>�����ͱrzWՖfAXVL
�S'd=���Yٶ�ÂN�������j�Z�����fXVETd�>ّ5��DZ�
�E�OZ���J]�P����hH�L��G��i�M���ڹ�Z(�C�����R����>��Fx��.��8M_�Җ��pA;L1�B�T����i���uCa���� ���|��󦢒�z�ء��+R7���j�S7�Ƒ81�慒z����f$c���mY��S����­`E� ��n�GnC\�}X�Q��R�FGk.��d��]��~3O?��z�.�� n�@�o��#����pg$��(�C`l��J�ߧ.���Y�k{Z}{b�}�j`D� c����T��ܽ��Ucv����(��ڍ��H!%�A͙ ؝��n�F���E���,�����`���CZ�렠x�}���V�� �J��9,.��	�p����(��>�~s^��>ZО�c�t���yXՠ*����Cc���M�5��)��Qz�O��f;H�Q�*�E�u�s! ��/���P�����?LE��/����<]�3d���ks�i�M��U�aߍܫ]Y��t]R�_b�:�w�Y�����>:Q.��yܑ ��M���ؕ�d��G��\�;�Ϣ�+��P�g�L@��F�;������DJ�f"DU������,7�(}t_�֟��s{�م��w�
n������mxo����p\�B�b��Ko2����{����ۯ�;���X����RX�y�[���5���=������#�|1��V���H�?v�R�y�Y��
Y\iٽ걌a}��M�u��9��P����v�!��,nZ��n
���eS!9d�L`$
���O@�;�Z�c0cU����}ZgC��{��}���#�,ؓ��L
����3���#$���� PP�#H%�|&)D��	e���?]Q�v�l����f�J�Jv�E��{�9��u�-�1Ƿ�-��
-����.FH�s�Gn�;_7���>�,:Ҍ�,G��:2�5���
PHi�'H��um1N��g���Ë��Z��E��*Z����<S'dAa�M�ba����|��+lX�D'��eD�`<d��g��?�}lxiϨ��0�,�3$�]�������1Z��|uɤ�O;W�h����k��jXv���ǚ����N}�7��Z��NN�V�����Y.⡋�螕�$F��G���_T��/�}Ʉ���{/i�6�;���X���4Eǫ��n����/�dQ���l>��c|FVU\���Pw���ܤ�8٨޹��㡰7Y���_l)��f{�E��Í�v� Kj�	��҇4�?tФf����7�>p�&q	��u(�S�ٳ�Ͻ�Z�j����-J��]�{7�A�������;���Ȓ�b� ^�G阴�Vק��d�A1��h�H;�m���-�����fb!¶��m��ܓ���lQ��6�~�f����d�o@�,�0'U���f�f�`Eb��ͪ����\���m�M��<��_��b���1��ӍΜ�8;���h��RX�ˠ_I��˲l�+��C`��P��[�T$`�y��z |��ғ|k6�k����������*j+���jU�i�d���Þ7[�R�Wa1������8�Qpc\(�t���3�C"j����e�v"�y�,����z>$����l�T�8{�@iO�&�7���4�%�V�qnH��q3fO�wx���P�rrG-!�⒨>]��IS �5���3�k��Jq������>5ǊD0��9��%"�9N���b�Tێ�̏1�_}�c;0�
��F��?�=L��PU2�h�[E��;�qgDHZ�b�`��Br�͉�ӎ�־$8G<;�-B
�>�%p�
�=|ӦY(�>:����|�iNb�Ӧ� ;�i�Z�悤Y�ȸT0��,ɕ�Uʚ�dSi;�
�������e�@��c�=ƽ:#)�r5 ���I�d�3��o�e�V+�[    撚�\��3/���8/t��b�LԔW*XDb�$���49q/m����7p�w�\�c����᭛��fV>��ĂRys퐞d�`�`�y��{�����%�!P�&�!ۜ�~�9F�g��<�Ed^,%Au}�9V�+Մ��6�^(R(�r/���������BX/D�=��Ғ���]�ԨR�1�y���<[��g���'�Q�R*�50����,o|����hq�j�[��M�V����[#��(�E��������}�Z��2���^[���?wv,2�~�:O+ː�I+�U�H�)r�q�`�i7�w�Oc�i����F������)P�|[}k�^k��c��-v���:y�n�]��Z�;E1�a/KZ���A�=Z�*K�?�V���`�~��3ҫr(+(�rZ��[)��҈�־��2L�ֽ��xY�U]S
�u���ň���N����۠x)�Peݏ/K�I-��}6����?����@��-�ǳ�qp�P���L)۳ԎikN���?[��A��؆�T
"^s�1BJ��`�Y��-^�(�'chk�RQ���ն�����(;U-Dnd�PR�ϕ�LSQ/Y՛���"�a�g�UD:�=�(�@G8�$UP�F�Ҽ"T����G�T�Z�j$� ,�\|�
Q����o�zS@�~Pjí���@�ZD%�-�75z�5hD[B�Id�\��(;x=��mO�{�`Z���y�*O���Vuϫ�o�6zmBݥ��Jڎd�]ző���z��w�2 k	����;"��(��EN_ր�`'^ӿiL����b�r�sƆ��6@fݡ�vQ`)7\�a�!�[n�I��_�=����`�Ys)B�B�=8R0Aj���`"����>̜ňwv�h�Y�xR|���}�^�7����ܥ��m�Z.K7�핹_%�>#�l aؾ�¸u�O's/�Rm�a�x���ݎ�E�����T!��)F�Q-�]�y����F�DnmY���%�}�EP+�pBeyD���X-x;��5��R�ύe���IݏE�������-�&6����󰴐R����϶��� 
����n�O�?��Z�x�����W	��)�B*��v����~`8[�l̛X3��j dכ	���_�`��$ϵ����l�KoЊ�֠��{aUK��`�FR�Q���6G��ktc�d�o�����<Rc{�d�X�]��on��.E�ˊ��a��Za�EZܐ�R�Rw�7ۿ��S՚q�����+��F�i�MeK�ZF���e�H5��ˮ͚t� �@&
�5�T9r}��n(\�ZǝeKS��`@��Xu�i-0h��F�^��咷������H��W/��c�I�ͫB@��^�+��X��<������0O���q{����݅)�"�7����P�ꐮ��q�D�"�T�ۛ���g1/4��;Ri���x1���ɋ�;�������e�U�I���m���YYz��rq���u���ilg/�b@�F|o�N�����I�i��U�Dumf�f7��.�]�hB�qY[1���Zܨ;�P�Z��C웸���8�l�Ć�]���i��n�<��OK�+6�C�ҌfÊjV5S�6u��-���8IT��E|H["�Q�@�,֒L2���*�����g�}g�٥9	�c��5���(�R�	���}%�`������)%mD0ͣ�
U��(�xU����������@e@a:���ɭ��X���A\��e��K�*�9����������t_9��w��k��f��8#)��i1)��z��ĸ�JL��gt�*�XD��R�.Nc�9�:�Wkϋ�se9�s�Q���
@��������|�p���g�fF;�փ�rZx��^��=u���!���j�,���ݦ����f.�Ё6t�ua#�9%����E�b��|{����,��{3c�����8�c���b/�e q�I���Z
D5н��A�=}�a|�eI�ne��E^Tq��8?Nѩ�	�ξ�*%�a�zN���o�T��̝��N��	���-$rD2��ҧ((Ǭ~�p�03L-^T�H�(*�G��/.���.��c�� �Z�{sa��b�F��e~<�
�^��\v�m��2�3jk����։O �)�pa�kU�6Ӈ�N��͜��n�bѭ/�4��jd�Dx�o����d)���T�j@��e��G?G0վ� -B���ݟ�W�����U�Pu T�/��F72��������X�_����ܨ�#����b���;F_
x߭ѩ=w���Ym���ij�	�I|Wٶ��#E�Z���D��(�@��k�z����ߠ�@m
z߱�O����k��JsI�|{�ƨm:b��;3x��|��}��Eiڽ�{����Dq�wt�.~f���Cq8oHL�d?���u�'Jg�[W)Ar2J4� �dٴ_�< j����R�K����/+)��j�Iu�%��/���r9>OsX��͜Nw� �R�D��Sd�/��|Hnf�����^D�.�*���BD���k�O�H*e��d��Ғ
������k+�d�� Di�7}�z~ѓ��Y^fo$9����Rʧ}e.�n,^f���Fg���`�GP��Z��-P�\���ޥW����i��B;ts	R�3#C�u.(��j¡�T��_��'y�*���;
PH��sv�y)�$�!k疊$)_6r2Ks���lm�R�����k#�] 	�� ܻ"&��f��{P�=޸v�$k��R6��7L{�Am��Tֿ�v�/�B���N�9���s��$ S��mi�gT����^*aG�Y����0��%5�~!��N^����.ȝ�GDV��w;F]���a�p�
�:��F��w��׍B0��Eh=v��W?����?z��,�v�Zjo۫Է��c8�q�{��C���3����Z�1�s�ٟ��`�k�8
�]瞏q?-3��w_n���!w���� U�r�n�zX����e��<����Սq�<�<����_��ͶG��G$�	Z0�|���G�������%��<&��������.���r����$��Rk��bW>�#��^��̯n��=*���d0�!�mߕ=)�u�QIu�nE�h�F_�HA����`K���� ���O��;�9��������P����n!��"�
��v�f�M�Gg�t�ۺ���vP�P�[�{cH�Y���U�bT�)R23�AP�좁��:���T�(�vT�I��wVg�������tx�2ys� �
(��O �����j���XEG��9O�3�Qߣ&��E�����ޯ�j�e1��w��a ��W����kPxj
V
���e��m��+ؾ�E�~gD.TrUz,ˀ��5�V� x��՗x$]����������������Ȕ3Fp�^�,1�{���₵��=:0��7���F����JQ���-k�6���)L�_\�h��#|���ؠ\��g=?/�8;5pk�Ϋh��\`�����ڑ�S�Ў�JB���a6��2}���XEt}�<m������8�4�%zG���n|�?���ڻ5
�Ø� p2��}�G����3D�0�РYY�=���cw�t�c���� .h��m|q(� t���Y I�X��+ ����}D]C"��L+��qҼ"n}ӯD߾�m�z�Ɇ�:A�P������-�6E��0%N��v۷?lc�.;'H����n�5���d?�� �yo�NBe�|��(%!��CPj�J��i����+�����m��]st���.G��D*�D��/!o@Ϧ kP&�N����}{��Q���8A2�"s�2}�Ǿm�Õ�E'�~�Ci�=M<�`��%k��gy���4�! .�4�S�U��
9J�$��#�CJ�]�şi��s��io�,!��?v��?y��l^��M��n'7��3��&L�*�Ҽ[(�W�bL]�z�A,���P=�ct@(���g��[;�X�0�T���gt	�r��ie�ϒ�����45��ӿ*��y�LV��$]y�∵    HZ�3j�pM�Q�0ߣw�&d�+Y{�����^*�j��09���o�J��׼�0vPI�bwa��"n@a��l��<���pz������/��̄�E ��'a�h�$�g���w�H孱�܊V��O�@���+H�&��T�+<�Wۜ��t�&�=ZBP���j¢����{�]�ߞ�:��*�����1"mV���qock_��n��tA�x� ���D���/-��L�ح�ќ�h�� �z�����6h�6�\B�*{~Y�֋7�P�%B��R��B�/��V�����H����湅��{+`�%R<o�*d�������T]2�;�QAl}�MAUÂ����s@`����f�e
�� ��=��h��P��C�D=��g$i���h�.90���l�IZ�-���v2������{kMPp��elw.u
L"=�q������e.�5��a�-$���qt��T��c�M���"9_a&�brS��b?���ђJ���<f&l�-�Lk�>�8�&	;w7����S�B��u�� �g�w�U��{�-/s����Ծx=e'd$iBj����E΃<�a�Α���,�u[)%�,#��>j�"ӌ��C���ÓlZ�|���WUP ��K���+�w&X0f�Bo,�M�I���7��$�0�:�p+�#"൵��}g��YQ�'�ۍ������&`���9�:Β���*�%���4�O�@�S�r�~���H���_��$c�2h�6�m��J�>�s(d�o_��uh'�B��m'+P�7u�g�7��ӗ�����?�^��D�^��B���Y����x�����_���l�� ���L���	�Q� �r]�\C��� U!�~ci���%2F �>��]HI��/�D�䆹N��H_�)�o.T(xk��v=��U�ΨψJ�Ԁ$]ZJ���WeN�/���ǩ����b���R8�P'e�wUb��1��LQV*��u�Y۽�g�-�g݉�b�
��b5�p��PG$k�ES9�2���Bz�e�۳q�Qb�`�l��A�_M},�<��y���4��:xB�۞Ɛ�ʩַvW�b����)[���C�����s�ب*}R�t��UE�=�]SWU�e(pv;�\U�d��g�F��`�o@�qW^�mO�>#�8N��
M�_��w~��L�-ǜ�K}����
̞4�	��p����}�G7�]G�yĳ0O��NTu��Q1���|���o���҆�A��Η���:/���a�!�y�:�S�t�X��M�zq��PEva>�ؔ+7��,
j��q	F��=d,�*l~l�Du�M�nt��Οu�K]|���Ks�%s�}��B�r�*��kH���j�$-,��:nf���n��7���'�Pih��O�<��˱���̭�O��G�&51i�CE�)�{�, �h�ה��>��ݶ4�R������$ݻ
�Mx#JK�y��O��1�~��h;���\��� ��K���l	�"LT�4����5g���E�=QZ���J�j;%���v_�=]��8y�8�� ��٘r��~jٹ�R-�8����.,����6Sخ�7O���;�} HGmГ}�-�AJ��?�N\�'$��/���V�nwy=Φ�"z�D#��!T�W
�̧=ڞ�\4�m�����$5'�N���5MR�$q3eڳU�ζ�������F���8������dđj%e$��[�?}�W�R�{� %��%L��(drS�l�e)v�/��l�Z�&�"�x�7�������8IA�}ns�����	Z�G��M�\>R���^|��
�T-X���̛胒i5(������a��
���BD�?�	&�Tyݼ~P�p!���� )��s>��>�!�:�M|t�u)�����[���:1O��D��)v"D�AR�@�KԶ���|�ߌ"��$ݛ9^���kh�P���2�Q�]7dɽ��	ٟB�6E�ʂH���!�'��\�1�Y�ԛ���zFaS��~����[�=GR��ʈz�:�X�����qx��ӆ���y����s �ѐ��en����c
�����voo�`�����!a��-.�����WƛZ�Q6�}��lVP_�,_�a���5D�ק��`ui��k����u˻�TC����$����-`��ܳ�oC�vCf�!A��s%�p�{�4B&jP?(Ŷ��?�]�9��+�U�����,n9�����n͏����k���!�����Msɪ��[%�"&�79��O��Is�Z_āέpz�����NK��%+�������zz�0wS����>zz�����U���.��r��i��u�W�F��I����P�X�s���W���,����<�L�^��	��>:"	a�-9B��������%	)�fۈ��7KQ�P�P�];��=Fq�w��n���2��н0���@���k_�+�k��B����25��� �Nϐi3���^@ŧ�u?<;7D�����6�̼�}�n�2�F��6�_!���l쟞j�Xw��a-�5PF���s �5��(�R�'w�{t��oᖂ�\���{,!����ܫ�=e���L�t�7#J����+`�.)�6c�f�H
R�K�Ӳ�H�x�wnc2^m�Eb�[���� ���(��ŎgI}X�����n����\{���Sv>	�fn�RѤ���a�H�e[m3ENok�4���<�q%�(,:���^RZ�/��Xک;5CH5:PΌ�g��'����}t0�Y'7�G�r��c;�_��aU�2�������y�[N��=���%��>ND)~��	�
�TK��pf2U,#-��(���u�iRK*O>u�YbB�6�έ`yX@7$�"�-E�������T�A%�����~zؓ!����b�}��}Y	.�	 s�z��L&��$��!�8x㊑B»�@�� 
��+��o'�@{\ߴd��½������,
�8���E.^2@� ����$P���eR���X�v�7��S��4F� v��0�_x�����t)�_�ގ���I�-<��7�����"�7<_B�tC|���tV|v��Y���ў��d;,�W�5��@�k�,
A1��ܺ��~?W繷��`��j�a���p �����@�F 	���B
_��f��m�*����/���&�����F"�b^��������[I�b��`C�8��=�֗��=z2OL��#��4?��Eiτu�u�%t��P���޶Ro�4��N�τfwU�6`�T�orMբ�����a�������l��aM#PD�n���di�T��AOń�m�*"eP�݅e�b�O�S�挹0$�B�����pt���aҢ=�j�8��5��8�
���汫	v����媮���Lʅ�o�h��3����� �C���H�z�%��o��dr�R��聿^נ�^��6���zH߀ҵנ��cx���r&Ej��FE�-z)e��{=���N<�#97���M�w�&���!k�)ka�����w�V�Z�I^�EF���R�`��kA��ס7qS"�:������W-�����M"Js���
,q��:�x�B��C=� w�z���q E�����g|�X��gw_�i@֝f�(�t'J8asy�4�?|�eB�g���h�/Q���s�y��89X�e.�DQ��N}t�%*�^�P�h��xO<�6��K�2I��٫zT*�Z{62��ه*@e�پ^QW'�H�f�績j����9WD��GZa�ػ��=�
�D����U��Eo�ۿ�����S��
4��F@!$�]1TeM��x�S�G��7�B����/��:K�޶�!����C��v;�c}���퍵�����R���u&�n�ξ��,��ak�W�����.��Qn~R�w�8F�O]�v��,_��x�Ժ�v�S7�u�(|��AԨ��"ro4kPD�1be{Z�����쇡�$ݙ�r�g7����r��פ��v3�y�*2�p_�@����D7ܠF�W��y�
�( V�UH4����~���    (�PT�s[�W��_�+��x7;&%w�;kP��7�
E��Q؍�/L�	��=�Q�c�m������_:���R9�<�n:������������ǖ� ���a���l�J蚡:^��zg��Jg��0�	c����e�Y�%���u</	��L��Ĵ}{Q���^�%�C!�E�!-E]�^�P�Nu���ǲFc�y��~v�v��R�T&��,��I�d?ۄZu��Sg��	��}�m���M�770��qr��f/���Ԙ�;n�U��<8��0}�A�C,2�Әkm ���Ly��ͪѳ��sD��b��1@��?�Ӭz
���{��쑬y��_��/�2�k�b��J�l�7���6ن��.W�t�O����O��w�N�@x��I�~���(>��sp&Ը����h9�P�n�g	�NTQ<Z�$�PX�R���"xw,fF�i(�w��P��������L$�zX����%Rs� ��#��R�ILA����1���!jxk Hƞ�R���H୦�n��Po��u�^�7�C��{�{��#�x=�CR���JXq�w����N�	�ۀa���\�t	�o�\��E�I�."y�n�y_�xU�P�.�yT+_�rB��^l�_�`�R
�I��i�K{r�w�{98����LYu=w�Dn�������9엨K�d\X4a���Ϳw����"F/2��n�F&����7vU�1D���U�K^�)���M�*읬�ra��<�_�/���/c��.�c��[�a-m��Y��[�F)����M$�ɚ}˂���|zA {T�3�M}�̄Z�cd#ξ�y9�"V&uW�u'�t�w>�2ߪDT��b0K��4��6j�UG@m�U#r�	�ժ9�i�o�:�<�g��6��C��nQ�H%�qbCP�����*�rǩa�`F��+�֏��4�C� ,�����Ce���b���X����>�Ѻ��z�P�Y�A�@�\L��M+�7�v���/�9wʹ��c>�y�fZ&�v�c�,K����ȯd��t]3˒���8���ٴ�{����]�/�>�Hl�3��J�5%Uђ	�@yEF�d��5<�X^M�P�-�&�m�E#��O�d2��ϝ�X�cL�So�]�GBE�l������p�����E�ܸyV��m�Jm�FQ0�|�s;lܘ�A6�9�4�	I.E�u��j����?����� �������l(�(�R�*�X�/Ш�V��~�T�߫5�^ܺ�jt'�!�%َiƷ��h3�|�%`�%���fx��5q�c5����CC`i��Q��#�ٽ�v Po �>��UI�&H,*L�1d
��,���L|~��u(��v���.�C��|�k $M�v����8��z�� �3��rI�;�nm0R��g��F1��5>��c$�+B	�QG�~�rU#|�/`��Q|᮵�/�//تm�)e������0e�}���O �˸�B���9�@�Fg.*��Jj��	�܂X?�0��G_F����[(�^}A��Bts��~a\Q�8NO���0f��1�.1ی�?�E��ƌ91�&��#iv�d�S����� cj!I{��5aD�%��#I�K��|>�Z&ѧ4 �Z�pr��K1XF�ջ��H�{�A�`�sj��e��J�87"k���S�6Do3���g�rj�|�n��>��� �AH�E���;ً��Ӏ��1����rfJ����^�7�����U؎A7������"�s@����H,�v-2^�&�FAQ&�<!�ؿ�m�g��p� p�����xQ�pH���b��4w�e���y��i��tlW(��y2�[&�>v���"�o��=���^�u÷?>�`]BT�/�J�+��ОL+��c���.
��h1��	O�?pU�\�Rd����uv(�L�音��䚮�C7qO絰1����ԩ���&$�J*� ��"��Z�����[!�����Fr�\��%���9��Kv������KL|8���)PS���&��8BP���e/��<��Y�]b{w���7��F�@�:��HP���uT����PMN������Z���+���N~8l%z'���v��o��B�nD�=��ҐȾ��mQP�mOiH8߲�Ķ3��c�Ks���m'ir��G484y��( `�elծ8,v���%�k��߽��Hu̚�oU�ag�$�׽�XH	��!⏦�:���XV���\Gs>D�u��Rg�0�S�d��Òk��(��aݵ:HF8?�#(� H��WZ"J���uMV|2���l�V���7�GNn���cu���}�$�Hx�O$�B�te��"�3�fLKRի�q'�5h����R!J4 ������*H t69�3�?ʏ0]������MD���0�	S����*+���`����-���ݜ���K8�P�a�cD����N��h!��kX�'XMɑ�u�|UG�q��4ޤx�V*� 08�IU�����a,�����pH�!3�/pD��:1�T��/�jf���.�M�j��tB)�}6��s�nu����x9���c���r0��b��<��6�;Q�b��>���l��)�1�'kjs��M3F�K� �R*`�B�(���[��	y��&�@Y�C��P�����,��)�81����+���fޝ�W��!:͞�.M
��%&v�Oa�:���[6��e�(�?�g�3)#$�.���:�bI �Э@_c>�9Pr���
�Z޸���x�gD����E�j�lRG_`�E@��0�l���v���Zʲ�z��/�yyP�|޿�2Qu��?o�E��y�L�%�/k�����eN�	D�#aR��M�]J�P�@U�-s�leż�i�ߐ�i����ɜ�K��'��AV|��:����x�
em	�
��K���y��C�2��0W�T�Lj� ��= <��r�|u���A!y��A��*%�����4��.'*�W�&��Nj|+�\�����|qu"7��; ֩W��Vv�2��m���<�'6����Bo�:�������XWzS����� C4��(;�r�?�����7{5���w�i���1�==E �8���+8���>��0�n���|}��C�O��FhB�6�6�AE6��Ҕ��p�*P��F��S����jZ�kﻻ����r7ta�dYȳw/ޚ`�I�EqW*��+��q7���3�y��j�*]���&#�1������ǅ�G��NmB�+_ꭻ�ߕ��K�(�K��y~ˎ$\�3�x����	Al�4'L��w��?$uG���1�;�y�Ԃ8�l/7əm��m&#=e[�_a�g�d�bz62���%E�|�Jr�ݽ�d����H�D���m���RF3сE���C&{�z��Tb��虥�	�~�r���^x�$Q�KK�m����iŧ���Z�շo5m4_}��R��n�"."�����x�|�����*�[�����ɽd�i/��ƃ�`p3xv>�K�H�߲�"�&Y�a:	
Ù�����1+�1�P���*)��wU��A���v6�2D��~�X���-+�b� '��#�k�	fN���c�.�݆}���w�My�S3O��x�K�4�w��!�����Ǹ�I�-$)k�Ix-|�A�O%�*�s��m��{�s�FOx6>f����k8@���[���1��Q��{��qo/3�!\�(ؑ�9��[w�q��/���OD�- '�y��OA�߀��4±1 ���?�>���c���X����O+88���Q��`���"AYU6D�Vpt����Y��f��������}mZ��1@r!�50�(��ݢ,:n����[�G=��sc��B�dRXqڬ�E�v��:e�é	Z�X�p���:��*��jgA�� �Ye��h�q�F�Z��������.P{Y�S�M�(�p��+�U�ߙ��3
�K��iw�iDVh���Hr�N��!�P-w��tn7��ʴ����ΫT�Gp�    �c��p,K:�
��-�.b�	�^����.h�Q��-v=�Ҏ��=ܹ'a��J�:�"��{,|x
`���f�)m����	ک�x����u:�G]�����n0*_��fO�%�߸�ˆ)���F�](f5�LT&�p�bc<T9��}j������oY�$_���ـb�lHP�4���AX�ޓ�a<���Iej��2b��7M�{&f\,��=ܔ�Mn�.�ۧ���[ �%��4�N$M�yw�LmX��~a-���R�/u���|��,aB�F�FG�(s����bK-���cT����F�O�٢ ��/ѝQY{�M�(�h��\3��C,;x],��Z/y9F��,�3�W��ѥT������OY�����Mя��ZgfG�l˯f`�B�y�z1��d�ƍ�����<�3���to�\P/�k���.���	,hw6
�gy&em�0��2>�5͘\F�L�Q����0Ì��v@��B� f��CCY�IdS��)�u��&��j��L	E[(o�HB�)��������W��b��9���
���Gɲ�8�~�L�g-y+dE���b�)��f����W�����5�r��~[ �M_�)�U>S�[<땠���Ms��~N�i���]���f��ʂ7>��!,��6�sY.��n�}[[��|��Q�EV֬<##̮Q��a�9���T�C���~Ŗ �u�P�)L �~W�(��� �ǆ���z�hV��p�x�W�C3x��0m�AU����h�}7Ľ�,�*8!�}�e��pC�{��ۙW��}�[7տ����N�|�������]
�ĝ���D�M�s]����ݤ�x����k�Y�9Y?\V�� �f���z�.暚�W;qb�xBDb%V����~��w��|������ֶ<$���PM2oz@��Q �]�cj�n@� ��=���4�Q�z����4�w�f����0��T3غ��f�"q��i��!G����r��}��f������`��a�8g������O���"�VP��'CX�~g]&9���I2�SI� b	�P��{0(��Ā�j�y����ը��[k]	9	��4��5JN������E�D�8�O#Y��e�w����l�	!g:hN�AIu2o�t��}0��܀�{ڠGN���u��4c�fup4�dɣ����m���F4�.|o]�a�y*�s�=GANN;��/6 ��T�� ���q�%ߜ����$���l1�F�b@�譓�m5��_�ϭ���^q�ƭx4�QX$�7�9ЍA$��V%�[�W���Β7J{�b�7D":L��$'��*��7�E�k������n��9����-��'@�8�+�[#Q�k��I�P��>��"�X�Ĺ�y.�h��foXt�.�;�E�l�ZE�̵��G{Ns��y�df{��p��7Ej���\�� �mͥL���YI����ݫ�ݍE!�kg���� R�I5��#pN�3Ef�G����`��_r�U����̊n~�."����{�f�rQ��k�1���F�D�x_�
#�L�+�'�u~��ɟ&�[\+�"Cxq����z����Q�@�I�׺#rr�ĝO�Lij�M�.:;	�V�ꝗD.4c�*b�"�jL��V<��'Tӏ�U���04���"���������Pz"}n5�0��Q�"��~�W$M�g��ɒ�U`�ԾR�ŖP+z��@c�;�3��:^sR�m�����+/C(���$d�j������Kc~�]E����1�Dl�Ȣ_W��A��1�=9é�(���HԶ%� F6K�`�������إ+-�عǂ\�XS����{5�j���ۭ��ڭ~N����A(ڣo��lF�q�5.��Fp�JҫY��\�I޶c/�H��/n*���'`#�#YAr�U`Q�4��+�&{��l�ӂ�m!#D;�o��dؒ�m�?4P�H#F���J���nrwWF}��Z	�r��kߡCeC�Ѯ��ߵ�5:9�BQA�|=ŉ.E"��4�G��D.׳8��_jA6%����R��"s+�^#v��Q�h6vddH�T�!���)T�b?`A�3��g~D"�ǈ��9y�#䱏�P��泛oo��d�T
R�=�k����w��W��+HDF�^�[H�E�W��|��w��6�Ȟ��Ƣ
r�=7��\�������_l�� ��dm�KA�0L���F���$uE�-EƐ>��R{VmB��� �ℛC1��k�|�_HC�D��+K�k���Ր`�X�0�{�s��Z�2��}4�Ҏ��ٍg��D{��fiS��Kt��R{m��I�@�b�.E֐��κD
rz��LX87<�ƹ�e�X�Hc�����4�܏5(��ϦB�3d��&k�k������� �G�"��p�wT��@G�Û�������~��jA���>�V8��f��kr�Į��dY6M� Ax�0O��W�t-|B��FH{�ͤ��d�r�N�� ŕa��f�(��� �n��V�l;������D��ݜ߂�V���"��n�6�Q���:�Q{A
�XK/ں�-�^���q�[}�Ox��϶ ���vº���D�q}�aU#�!|>{kێ�X�`�xn��!H&|�5� ���]�;i.�Ѣ�v��¡0�Wz�M�����L��D����A�K)��"5`8�����h.�k����Xgv�|����Q9i�:�iuI�yOQ1�`,
�1�uUolX�=��ؙ]`�t�ףy\������5qE�1^�z��䍁�U�Y!�JH��jʅ�~Q��f�:|�ϵ�������ýA�V�Ja�+��)�T������h�2�A�{�o*Hv��w ��#���/KiUzr����|�g�����ق!\������}�O���u��O�K$5��c�[Y���q�]�|����im4XR�p9�{��q9q�1|$�������z��r�q��Ͷ�>�1y�"�w�zt�#ł?b;,A��2,³�%�z�!�Qg�*$��^m���L�1�P���b�0���	�6$��ĸ�X��I��7���*v�:��\����
���0�E0�EQ�8؏����4ާގ�\]��zW��9���>g2wv�rC��^�E����������T��Ae��g����&��@�wcU������I:�j��L�s�>Ȑ�D��̀f�,t����M��E��+s��XW)!�"M&�����^�p_�A1�4S���z,Q��>��E��*����䬜m�u�7���:[��	" �6�n��q-Sӱ_�y��l}�
�#d`�VR�� p$J��f�mǅ�.�	�Lⵀ����,[�LX�.x��J%3s���(P�fa�"�b�����H��t��"�e����!��ev�K�2���@\�Η���+N~2����fX5�����ƮM&yG<������"Y���QGO	��弢^�n�;��Щ+����|ŊS�.~ۿ2�Y�,Ic�V�"ܽj���!�	�~>N���к�`�z�$���O�J��u����݇V7�c�{�dc��7\�ķ��1:o�`���2.��gs��y+�������.$T��m%L�sF�5���
�-�"�Y��?>�R]f��\ܒ��_�5 ��v�іiAy2�����X�tn���CP����Ű��"��5H��'L0a��y�N��#ҮASŊ"{y��糷#RՌ����S���~`@��>8V�������j�=�eD��B|!H#"��f�d��P�i�V�O�7�X���0N�+@��%�~Q��r��������^N��bC�5�.���Y]�
ß-W��gӼ���(�k5*�6?���L�ě�ptVQ���iG-� ���5X!֬�nL<G�rk��n��ʁ1��[�NX�pm���B�Z�������T�ѽ��X���+�l	S�e����\vj\5/�}
���S�I��	����N����/���1���;�c:<+Z�M�+�Lp�!��X�V��>?�9؛1#���x�h��d �  ~ܢPk��"(���f\��N��9���<�h�{�`K4����,;IV�[�}�H���$�mE�g���(��|r����eJ~x*\P����lދ$j�(�X��?���]r��i]=���鲽���~\�]�$��o_7�]�[ݖ���n��wk��r��Q��֝�鱳rpq�}��T���4<ƛ��lS��o�>�q)X3X�}|{~�����tg��J;�����U�ӫ��&Jڷk�4%�c�k���@��G˔��;�&��ɢ%���`Kurݑ#]��φ�_���0,t�����g�̻���O�y���n ��]HC�`${o�2_������O����,�
v�U�!�l�M�U�2��B������z�Ϻ뽚�2ej��$�+�0�n�v)k��=D����v�V)�����ɴ��R�hC����������o��C6�K      ;      x������ � �      9      x������ � �      5      x������ � �      7   �   x���Mk1�ϳ���0�O��� ����e\u쪸z��F,ؖ�ބ�H�^��>5�C�g>ܓY�qjE}쀤�Å��@{��)k�͍/����$J5A;A�B>�i���w�X���7���Č�$4��:�R�6]�X�|��rl�a�<X�m�'Nמkn��C��S+Q@Њ�(k��+i(��e�ȅ~�����@�\�^h�4�q�JE�	f1{/     