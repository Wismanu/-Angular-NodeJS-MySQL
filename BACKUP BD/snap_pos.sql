toc.dat                                                                                             0000600 0004000 0002000 00000054452 14534373341 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           .                {            snap_pos    15.3    15.3 L    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         Z           1262    933127    snap_pos    DATABASE     {   CREATE DATABASE snap_pos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE snap_pos;
                postgres    false                     2615    933128    snap_pos    SCHEMA        CREATE SCHEMA snap_pos;
    DROP SCHEMA snap_pos;
                postgres    false         �            1259    933206    acceso    TABLE     [   CREATE TABLE snap_pos.acceso (
    codigo_acceso integer NOT NULL,
    descripcion text
);
    DROP TABLE snap_pos.acceso;
       snap_pos         heap    postgres    false    6         �            1259    933205    acceso_codigo_acceso_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.acceso_codigo_acceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE snap_pos.acceso_codigo_acceso_seq;
       snap_pos          postgres    false    218    6         [           0    0    acceso_codigo_acceso_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE snap_pos.acceso_codigo_acceso_seq OWNED BY snap_pos.acceso.codigo_acceso;
          snap_pos          postgres    false    217         �            1259    933197    cargo    TABLE     ^   CREATE TABLE snap_pos.cargo (
    cargo_id integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE snap_pos.cargo;
       snap_pos         heap    postgres    false    6         �            1259    933196    cargo_cargo_id_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.cargo_cargo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE snap_pos.cargo_cargo_id_seq;
       snap_pos          postgres    false    6    216         \           0    0    cargo_cargo_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE snap_pos.cargo_cargo_id_seq OWNED BY snap_pos.cargo.cargo_id;
          snap_pos          postgres    false    215         �            1259    933257    cliente    TABLE     �   CREATE TABLE snap_pos.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    dni character varying(20),
    telefono character varying(20),
    direccion text
);
    DROP TABLE snap_pos.cliente;
       snap_pos         heap    postgres    false    6         �            1259    933256    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE snap_pos.cliente_id_cliente_seq;
       snap_pos          postgres    false    6    222         ]           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE snap_pos.cliente_id_cliente_seq OWNED BY snap_pos.cliente.id_cliente;
          snap_pos          postgres    false    221         �            1259    933355    detalle_factura    TABLE     �   CREATE TABLE snap_pos.detalle_factura (
    consecutivo integer NOT NULL,
    cod_producto integer NOT NULL,
    cantidad integer,
    valor_venta numeric,
    subtotal numeric
);
 %   DROP TABLE snap_pos.detalle_factura;
       snap_pos         heap    postgres    false    6         �            1259    933311    detalle_pedido    TABLE     �   CREATE TABLE snap_pos.detalle_pedido (
    num_mesa integer NOT NULL,
    cod_producto integer NOT NULL,
    cantidad integer,
    subtotal numeric
);
 $   DROP TABLE snap_pos.detalle_pedido;
       snap_pos         heap    postgres    false    6         �            1259    933238    empleado    TABLE       CREATE TABLE snap_pos.empleado (
    empleado_id integer NOT NULL,
    cargo_id integer NOT NULL,
    codigo_acceso integer NOT NULL,
    dni character varying(20),
    nombre character varying(255),
    apellido character varying(255),
    direccion text
);
    DROP TABLE snap_pos.empleado;
       snap_pos         heap    postgres    false    6         �            1259    933237    empleado_empleado_id_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.empleado_empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE snap_pos.empleado_empleado_id_seq;
       snap_pos          postgres    false    6    220         ^           0    0    empleado_empleado_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE snap_pos.empleado_empleado_id_seq OWNED BY snap_pos.empleado.empleado_id;
          snap_pos          postgres    false    219         �            1259    933337    factura    TABLE     �   CREATE TABLE snap_pos.factura (
    consecutivo integer NOT NULL,
    id_cliente integer NOT NULL,
    id_pedido integer NOT NULL,
    fecha_compra date NOT NULL,
    total numeric
);
    DROP TABLE snap_pos.factura;
       snap_pos         heap    postgres    false    6         �            1259    933336    factura_consecutivo_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.factura_consecutivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE snap_pos.factura_consecutivo_seq;
       snap_pos          postgres    false    231    6         _           0    0    factura_consecutivo_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE snap_pos.factura_consecutivo_seq OWNED BY snap_pos.factura.consecutivo;
          snap_pos          postgres    false    230         �            1259    933266    mesa    TABLE     T   CREATE TABLE snap_pos.mesa (
    num_mesa integer NOT NULL,
    descripcion text
);
    DROP TABLE snap_pos.mesa;
       snap_pos         heap    postgres    false    6         �            1259    933265    mesa_num_mesa_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.mesa_num_mesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE snap_pos.mesa_num_mesa_seq;
       snap_pos          postgres    false    224    6         `           0    0    mesa_num_mesa_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE snap_pos.mesa_num_mesa_seq OWNED BY snap_pos.mesa.num_mesa;
          snap_pos          postgres    false    223         �            1259    933275    pedido    TABLE     �   CREATE TABLE snap_pos.pedido (
    id_pedido integer NOT NULL,
    id_empleado integer NOT NULL,
    num_mesa integer NOT NULL
);
    DROP TABLE snap_pos.pedido;
       snap_pos         heap    postgres    false    6         �            1259    933274    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE snap_pos.pedido_id_pedido_seq;
       snap_pos          postgres    false    6    226         a           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE snap_pos.pedido_id_pedido_seq OWNED BY snap_pos.pedido.id_pedido;
          snap_pos          postgres    false    225         �            1259    933302    producto    TABLE     �   CREATE TABLE snap_pos.producto (
    cod_producto integer NOT NULL,
    nombre character varying(255),
    precio_unitario numeric
);
    DROP TABLE snap_pos.producto;
       snap_pos         heap    postgres    false    6         �            1259    933301    producto_cod_producto_seq    SEQUENCE     �   CREATE SEQUENCE snap_pos.producto_cod_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE snap_pos.producto_cod_producto_seq;
       snap_pos          postgres    false    228    6         b           0    0    producto_cod_producto_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE snap_pos.producto_cod_producto_seq OWNED BY snap_pos.producto.cod_producto;
          snap_pos          postgres    false    227         �           2604    933209    acceso codigo_acceso    DEFAULT     �   ALTER TABLE ONLY snap_pos.acceso ALTER COLUMN codigo_acceso SET DEFAULT nextval('snap_pos.acceso_codigo_acceso_seq'::regclass);
 E   ALTER TABLE snap_pos.acceso ALTER COLUMN codigo_acceso DROP DEFAULT;
       snap_pos          postgres    false    218    217    218         �           2604    933200    cargo cargo_id    DEFAULT     t   ALTER TABLE ONLY snap_pos.cargo ALTER COLUMN cargo_id SET DEFAULT nextval('snap_pos.cargo_cargo_id_seq'::regclass);
 ?   ALTER TABLE snap_pos.cargo ALTER COLUMN cargo_id DROP DEFAULT;
       snap_pos          postgres    false    215    216    216         �           2604    933260    cliente id_cliente    DEFAULT     |   ALTER TABLE ONLY snap_pos.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('snap_pos.cliente_id_cliente_seq'::regclass);
 C   ALTER TABLE snap_pos.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       snap_pos          postgres    false    221    222    222         �           2604    933241    empleado empleado_id    DEFAULT     �   ALTER TABLE ONLY snap_pos.empleado ALTER COLUMN empleado_id SET DEFAULT nextval('snap_pos.empleado_empleado_id_seq'::regclass);
 E   ALTER TABLE snap_pos.empleado ALTER COLUMN empleado_id DROP DEFAULT;
       snap_pos          postgres    false    219    220    220         �           2604    933340    factura consecutivo    DEFAULT     ~   ALTER TABLE ONLY snap_pos.factura ALTER COLUMN consecutivo SET DEFAULT nextval('snap_pos.factura_consecutivo_seq'::regclass);
 D   ALTER TABLE snap_pos.factura ALTER COLUMN consecutivo DROP DEFAULT;
       snap_pos          postgres    false    230    231    231         �           2604    933269    mesa num_mesa    DEFAULT     r   ALTER TABLE ONLY snap_pos.mesa ALTER COLUMN num_mesa SET DEFAULT nextval('snap_pos.mesa_num_mesa_seq'::regclass);
 >   ALTER TABLE snap_pos.mesa ALTER COLUMN num_mesa DROP DEFAULT;
       snap_pos          postgres    false    223    224    224         �           2604    933278    pedido id_pedido    DEFAULT     x   ALTER TABLE ONLY snap_pos.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('snap_pos.pedido_id_pedido_seq'::regclass);
 A   ALTER TABLE snap_pos.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       snap_pos          postgres    false    225    226    226         �           2604    933305    producto cod_producto    DEFAULT     �   ALTER TABLE ONLY snap_pos.producto ALTER COLUMN cod_producto SET DEFAULT nextval('snap_pos.producto_cod_producto_seq'::regclass);
 F   ALTER TABLE snap_pos.producto ALTER COLUMN cod_producto DROP DEFAULT;
       snap_pos          postgres    false    228    227    228         F          0    933206    acceso 
   TABLE DATA           >   COPY snap_pos.acceso (codigo_acceso, descripcion) FROM stdin;
    snap_pos          postgres    false    218       3398.dat D          0    933197    cargo 
   TABLE DATA           8   COPY snap_pos.cargo (cargo_id, descripcion) FROM stdin;
    snap_pos          postgres    false    216       3396.dat J          0    933257    cliente 
   TABLE DATA           [   COPY snap_pos.cliente (id_cliente, nombre, apellido, dni, telefono, direccion) FROM stdin;
    snap_pos          postgres    false    222       3402.dat T          0    933355    detalle_factura 
   TABLE DATA           g   COPY snap_pos.detalle_factura (consecutivo, cod_producto, cantidad, valor_venta, subtotal) FROM stdin;
    snap_pos          postgres    false    232       3412.dat Q          0    933311    detalle_pedido 
   TABLE DATA           V   COPY snap_pos.detalle_pedido (num_mesa, cod_producto, cantidad, subtotal) FROM stdin;
    snap_pos          postgres    false    229       3409.dat H          0    933238    empleado 
   TABLE DATA           l   COPY snap_pos.empleado (empleado_id, cargo_id, codigo_acceso, dni, nombre, apellido, direccion) FROM stdin;
    snap_pos          postgres    false    220       3400.dat S          0    933337    factura 
   TABLE DATA           \   COPY snap_pos.factura (consecutivo, id_cliente, id_pedido, fecha_compra, total) FROM stdin;
    snap_pos          postgres    false    231       3411.dat L          0    933266    mesa 
   TABLE DATA           7   COPY snap_pos.mesa (num_mesa, descripcion) FROM stdin;
    snap_pos          postgres    false    224       3404.dat N          0    933275    pedido 
   TABLE DATA           D   COPY snap_pos.pedido (id_pedido, id_empleado, num_mesa) FROM stdin;
    snap_pos          postgres    false    226       3406.dat P          0    933302    producto 
   TABLE DATA           K   COPY snap_pos.producto (cod_producto, nombre, precio_unitario) FROM stdin;
    snap_pos          postgres    false    228       3408.dat c           0    0    acceso_codigo_acceso_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('snap_pos.acceso_codigo_acceso_seq', 10, true);
          snap_pos          postgres    false    217         d           0    0    cargo_cargo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('snap_pos.cargo_cargo_id_seq', 10, true);
          snap_pos          postgres    false    215         e           0    0    cliente_id_cliente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('snap_pos.cliente_id_cliente_seq', 10, true);
          snap_pos          postgres    false    221         f           0    0    empleado_empleado_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('snap_pos.empleado_empleado_id_seq', 10, true);
          snap_pos          postgres    false    219         g           0    0    factura_consecutivo_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('snap_pos.factura_consecutivo_seq', 9, true);
          snap_pos          postgres    false    230         h           0    0    mesa_num_mesa_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('snap_pos.mesa_num_mesa_seq', 10, true);
          snap_pos          postgres    false    223         i           0    0    pedido_id_pedido_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('snap_pos.pedido_id_pedido_seq', 10, true);
          snap_pos          postgres    false    225         j           0    0    producto_cod_producto_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('snap_pos.producto_cod_producto_seq', 10, true);
          snap_pos          postgres    false    227         �           2606    933213    acceso acceso_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY snap_pos.acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (codigo_acceso);
 >   ALTER TABLE ONLY snap_pos.acceso DROP CONSTRAINT acceso_pkey;
       snap_pos            postgres    false    218         �           2606    933204    cargo cargo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY snap_pos.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (cargo_id);
 <   ALTER TABLE ONLY snap_pos.cargo DROP CONSTRAINT cargo_pkey;
       snap_pos            postgres    false    216         �           2606    933264    cliente cliente_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY snap_pos.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY snap_pos.cliente DROP CONSTRAINT cliente_pkey;
       snap_pos            postgres    false    222         �           2606    933361 $   detalle_factura detalle_factura_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY snap_pos.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (consecutivo, cod_producto);
 P   ALTER TABLE ONLY snap_pos.detalle_factura DROP CONSTRAINT detalle_factura_pkey;
       snap_pos            postgres    false    232    232         �           2606    933245    empleado empleado_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY snap_pos.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (empleado_id);
 B   ALTER TABLE ONLY snap_pos.empleado DROP CONSTRAINT empleado_pkey;
       snap_pos            postgres    false    220         �           2606    933344    factura factura_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY snap_pos.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (consecutivo);
 @   ALTER TABLE ONLY snap_pos.factura DROP CONSTRAINT factura_pkey;
       snap_pos            postgres    false    231         �           2606    933273    mesa mesa_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY snap_pos.mesa
    ADD CONSTRAINT mesa_pkey PRIMARY KEY (num_mesa);
 :   ALTER TABLE ONLY snap_pos.mesa DROP CONSTRAINT mesa_pkey;
       snap_pos            postgres    false    224         �           2606    933280    pedido pedido_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY snap_pos.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 >   ALTER TABLE ONLY snap_pos.pedido DROP CONSTRAINT pedido_pkey;
       snap_pos            postgres    false    226         �           2606    933309    producto producto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY snap_pos.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (cod_producto);
 B   ALTER TABLE ONLY snap_pos.producto DROP CONSTRAINT producto_pkey;
       snap_pos            postgres    false    228         �           2606    933367 1   detalle_factura detalle_factura_cod_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.detalle_factura
    ADD CONSTRAINT detalle_factura_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES snap_pos.producto(cod_producto);
 ]   ALTER TABLE ONLY snap_pos.detalle_factura DROP CONSTRAINT detalle_factura_cod_producto_fkey;
       snap_pos          postgres    false    3238    232    228         �           2606    933362 0   detalle_factura detalle_factura_consecutivo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.detalle_factura
    ADD CONSTRAINT detalle_factura_consecutivo_fkey FOREIGN KEY (consecutivo) REFERENCES snap_pos.factura(consecutivo);
 \   ALTER TABLE ONLY snap_pos.detalle_factura DROP CONSTRAINT detalle_factura_consecutivo_fkey;
       snap_pos          postgres    false    231    232    3240         �           2606    933321 /   detalle_pedido detalle_pedido_cod_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.detalle_pedido
    ADD CONSTRAINT detalle_pedido_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES snap_pos.producto(cod_producto);
 [   ALTER TABLE ONLY snap_pos.detalle_pedido DROP CONSTRAINT detalle_pedido_cod_producto_fkey;
       snap_pos          postgres    false    228    3238    229         �           2606    933316 +   detalle_pedido detalle_pedido_num_mesa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.detalle_pedido
    ADD CONSTRAINT detalle_pedido_num_mesa_fkey FOREIGN KEY (num_mesa) REFERENCES snap_pos.mesa(num_mesa);
 W   ALTER TABLE ONLY snap_pos.detalle_pedido DROP CONSTRAINT detalle_pedido_num_mesa_fkey;
       snap_pos          postgres    false    229    224    3234         �           2606    933246    empleado empleado_cargo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.empleado
    ADD CONSTRAINT empleado_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES snap_pos.cargo(cargo_id);
 K   ALTER TABLE ONLY snap_pos.empleado DROP CONSTRAINT empleado_cargo_id_fkey;
       snap_pos          postgres    false    220    216    3226         �           2606    933251 $   empleado empleado_codigo_acceso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.empleado
    ADD CONSTRAINT empleado_codigo_acceso_fkey FOREIGN KEY (codigo_acceso) REFERENCES snap_pos.acceso(codigo_acceso);
 P   ALTER TABLE ONLY snap_pos.empleado DROP CONSTRAINT empleado_codigo_acceso_fkey;
       snap_pos          postgres    false    220    218    3228         �           2606    933345    factura factura_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES snap_pos.cliente(id_cliente);
 K   ALTER TABLE ONLY snap_pos.factura DROP CONSTRAINT factura_id_cliente_fkey;
       snap_pos          postgres    false    222    3232    231         �           2606    933350    factura factura_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.factura
    ADD CONSTRAINT factura_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES snap_pos.pedido(id_pedido);
 J   ALTER TABLE ONLY snap_pos.factura DROP CONSTRAINT factura_id_pedido_fkey;
       snap_pos          postgres    false    3236    231    226         �           2606    933281    pedido pedido_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.pedido
    ADD CONSTRAINT pedido_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES snap_pos.empleado(empleado_id);
 J   ALTER TABLE ONLY snap_pos.pedido DROP CONSTRAINT pedido_id_empleado_fkey;
       snap_pos          postgres    false    226    220    3230         �           2606    933286    pedido pedido_num_mesa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY snap_pos.pedido
    ADD CONSTRAINT pedido_num_mesa_fkey FOREIGN KEY (num_mesa) REFERENCES snap_pos.mesa(num_mesa);
 G   ALTER TABLE ONLY snap_pos.pedido DROP CONSTRAINT pedido_num_mesa_fkey;
       snap_pos          postgres    false    3234    224    226                                                                                                                                                                                                                              3398.dat                                                                                            0000600 0004000 0002000 00000000164 14534373341 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Admin
2	Empleado
3	Invitado
4	Supervisor
5	Cajero
6	Cocinero
7	Repartidor
8	Almacenero
9	Cliente
10	Limpieza
\.


                                                                                                                                                                                                                                                                                                                                                                                                            3396.dat                                                                                            0000600 0004000 0002000 00000000171 14534373341 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Gerente
2	Cajero
3	Repartidor
4	Supervisor
5	Almacenero
6	Vendedor
7	Contador
8	Jefe de cocina
9	Mozo
10	Limpieza
\.


                                                                                                                                                                                                                                                                                                                                                                                                       3402.dat                                                                                            0000600 0004000 0002000 00000001075 14534373341 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Carlos	Lopez	456789012	555-1234	Calle Residencial 789
2	Maria	Rodriguez	654321098	555-5678	Avenida Comercial 234
3	Pablo	Gutierrez	789012345	555-9876	Calle Principal 901
4	Isabel	Santos	987654321	555-4321	Avenida Secundaria 234
5	Luisa	Flores	123456789	555-8765	Calle Comercial 567
6	Diego	Chavez	234567890	555-2345	Avenida Residencial 890
7	Eva	Fernandez	345678901	555-6789	Calle Secundaria 123
8	Roberto	Perez	456789012	555-3456	Avenida Principal 456
9	Julia	Garcia	567890123	555-7890	Calle Residencial 789
10	Hector	Lopez	678901234	555-0123	Avenida Comercial 234
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   3412.dat                                                                                            0000600 0004000 0002000 00000000005 14534373341 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3409.dat                                                                                            0000600 0004000 0002000 00000000176 14534373341 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	2	21.98
2	3	1	8.75
3	5	3	16.50
4	2	2	31.00
5	8	1	20.50
6	4	2	25.98
7	7	3	29.97
8	10	1	18.99
9	6	2	15.50
10	9	1	15.75
\.


                                                                                                                                                                                                                                                                                                                                                                                                  3400.dat                                                                                            0000600 0004000 0002000 00000000777 14534373341 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	123456789	Juan	Perez	Calle Principal 123
2	2	2	987654321	Ana	Gomez	Avenida Secundaria 456
3	3	3	111223344	Pedro	Lopez	Calle Comercial 789
4	4	4	555666777	Luis	Martinez	Avenida Residencial 012
5	5	5	999888777	Sofia	Torres	Calle Secundaria 345
6	6	6	777666555	Elena	Ramirez	Avenida Principal 678
7	7	7	333444555	Carlos	Hernandez	Calle Residencial 901
8	8	8	888777666	Laura	Diaz	Avenida Comercial 234
9	9	9	222333444	Mario	Castro	Calle Principal 567
10	10	10	444555666	Rosa	Vega	Avenida Residencial 890
\.


 3411.dat                                                                                            0000600 0004000 0002000 00000000323 14534373341 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	2023-12-07	21.98
2	2	2	2023-12-07	8.75
3	3	3	2023-12-07	16.50
4	4	4	2023-12-07	31.00
5	5	5	2023-12-07	20.50
6	6	6	2023-12-07	25.98
7	7	7	2023-12-07	29.97
8	8	8	2023-12-07	18.99
9	9	9	2023-12-07	18.99
\.


                                                                                                                                                                                                                                                                                                             3404.dat                                                                                            0000600 0004000 0002000 00000000141 14534373341 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Mesa 1
2	Mesa 2
3	Mesa 3
4	Mesa 4
5	Mesa 5
6	Mesa 6
7	Mesa 7
8	Mesa 8
9	Mesa 9
10	Mesa 10
\.


                                                                                                                                                                                                                                                                                                                                                                                                                               3406.dat                                                                                            0000600 0004000 0002000 00000000104 14534373341 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                            3408.dat                                                                                            0000600 0004000 0002000 00000000257 14534373341 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Hamburguesa	10.99
2	Pizza	15.50
3	Papas Fritas	8.75
4	Hot Dog	12.99
5	Refresco	5.50
6	Ensalada	7.75
7	Tacos	9.99
8	Alitas de Pollo	20.50
9	Nachos	15.75
10	Helado	18.99
\.


                                                                                                                                                                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000043231 14534373341 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE snap_pos;
--
-- Name: snap_pos; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE snap_pos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE snap_pos OWNER TO postgres;

\connect snap_pos

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: snap_pos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA snap_pos;


ALTER SCHEMA snap_pos OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acceso; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.acceso (
    codigo_acceso integer NOT NULL,
    descripcion text
);


ALTER TABLE snap_pos.acceso OWNER TO postgres;

--
-- Name: acceso_codigo_acceso_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.acceso_codigo_acceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.acceso_codigo_acceso_seq OWNER TO postgres;

--
-- Name: acceso_codigo_acceso_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.acceso_codigo_acceso_seq OWNED BY snap_pos.acceso.codigo_acceso;


--
-- Name: cargo; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.cargo (
    cargo_id integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE snap_pos.cargo OWNER TO postgres;

--
-- Name: cargo_cargo_id_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.cargo_cargo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.cargo_cargo_id_seq OWNER TO postgres;

--
-- Name: cargo_cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.cargo_cargo_id_seq OWNED BY snap_pos.cargo.cargo_id;


--
-- Name: cliente; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    dni character varying(20),
    telefono character varying(20),
    direccion text
);


ALTER TABLE snap_pos.cliente OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.cliente_id_cliente_seq OWNED BY snap_pos.cliente.id_cliente;


--
-- Name: detalle_factura; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.detalle_factura (
    consecutivo integer NOT NULL,
    cod_producto integer NOT NULL,
    cantidad integer,
    valor_venta numeric,
    subtotal numeric
);


ALTER TABLE snap_pos.detalle_factura OWNER TO postgres;

--
-- Name: detalle_pedido; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.detalle_pedido (
    num_mesa integer NOT NULL,
    cod_producto integer NOT NULL,
    cantidad integer,
    subtotal numeric
);


ALTER TABLE snap_pos.detalle_pedido OWNER TO postgres;

--
-- Name: empleado; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.empleado (
    empleado_id integer NOT NULL,
    cargo_id integer NOT NULL,
    codigo_acceso integer NOT NULL,
    dni character varying(20),
    nombre character varying(255),
    apellido character varying(255),
    direccion text
);


ALTER TABLE snap_pos.empleado OWNER TO postgres;

--
-- Name: empleado_empleado_id_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.empleado_empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.empleado_empleado_id_seq OWNER TO postgres;

--
-- Name: empleado_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.empleado_empleado_id_seq OWNED BY snap_pos.empleado.empleado_id;


--
-- Name: factura; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.factura (
    consecutivo integer NOT NULL,
    id_cliente integer NOT NULL,
    id_pedido integer NOT NULL,
    fecha_compra date NOT NULL,
    total numeric
);


ALTER TABLE snap_pos.factura OWNER TO postgres;

--
-- Name: factura_consecutivo_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.factura_consecutivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.factura_consecutivo_seq OWNER TO postgres;

--
-- Name: factura_consecutivo_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.factura_consecutivo_seq OWNED BY snap_pos.factura.consecutivo;


--
-- Name: mesa; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.mesa (
    num_mesa integer NOT NULL,
    descripcion text
);


ALTER TABLE snap_pos.mesa OWNER TO postgres;

--
-- Name: mesa_num_mesa_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.mesa_num_mesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.mesa_num_mesa_seq OWNER TO postgres;

--
-- Name: mesa_num_mesa_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.mesa_num_mesa_seq OWNED BY snap_pos.mesa.num_mesa;


--
-- Name: pedido; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.pedido (
    id_pedido integer NOT NULL,
    id_empleado integer NOT NULL,
    num_mesa integer NOT NULL
);


ALTER TABLE snap_pos.pedido OWNER TO postgres;

--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.pedido_id_pedido_seq OWNER TO postgres;

--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.pedido_id_pedido_seq OWNED BY snap_pos.pedido.id_pedido;


--
-- Name: producto; Type: TABLE; Schema: snap_pos; Owner: postgres
--

CREATE TABLE snap_pos.producto (
    cod_producto integer NOT NULL,
    nombre character varying(255),
    precio_unitario numeric
);


ALTER TABLE snap_pos.producto OWNER TO postgres;

--
-- Name: producto_cod_producto_seq; Type: SEQUENCE; Schema: snap_pos; Owner: postgres
--

CREATE SEQUENCE snap_pos.producto_cod_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snap_pos.producto_cod_producto_seq OWNER TO postgres;

--
-- Name: producto_cod_producto_seq; Type: SEQUENCE OWNED BY; Schema: snap_pos; Owner: postgres
--

ALTER SEQUENCE snap_pos.producto_cod_producto_seq OWNED BY snap_pos.producto.cod_producto;


--
-- Name: acceso codigo_acceso; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.acceso ALTER COLUMN codigo_acceso SET DEFAULT nextval('snap_pos.acceso_codigo_acceso_seq'::regclass);


--
-- Name: cargo cargo_id; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.cargo ALTER COLUMN cargo_id SET DEFAULT nextval('snap_pos.cargo_cargo_id_seq'::regclass);


--
-- Name: cliente id_cliente; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('snap_pos.cliente_id_cliente_seq'::regclass);


--
-- Name: empleado empleado_id; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.empleado ALTER COLUMN empleado_id SET DEFAULT nextval('snap_pos.empleado_empleado_id_seq'::regclass);


--
-- Name: factura consecutivo; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.factura ALTER COLUMN consecutivo SET DEFAULT nextval('snap_pos.factura_consecutivo_seq'::regclass);


--
-- Name: mesa num_mesa; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.mesa ALTER COLUMN num_mesa SET DEFAULT nextval('snap_pos.mesa_num_mesa_seq'::regclass);


--
-- Name: pedido id_pedido; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('snap_pos.pedido_id_pedido_seq'::regclass);


--
-- Name: producto cod_producto; Type: DEFAULT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.producto ALTER COLUMN cod_producto SET DEFAULT nextval('snap_pos.producto_cod_producto_seq'::regclass);


--
-- Data for Name: acceso; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.acceso (codigo_acceso, descripcion) FROM stdin;
\.
COPY snap_pos.acceso (codigo_acceso, descripcion) FROM '$$PATH$$/3398.dat';

--
-- Data for Name: cargo; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.cargo (cargo_id, descripcion) FROM stdin;
\.
COPY snap_pos.cargo (cargo_id, descripcion) FROM '$$PATH$$/3396.dat';

--
-- Data for Name: cliente; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.cliente (id_cliente, nombre, apellido, dni, telefono, direccion) FROM stdin;
\.
COPY snap_pos.cliente (id_cliente, nombre, apellido, dni, telefono, direccion) FROM '$$PATH$$/3402.dat';

--
-- Data for Name: detalle_factura; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.detalle_factura (consecutivo, cod_producto, cantidad, valor_venta, subtotal) FROM stdin;
\.
COPY snap_pos.detalle_factura (consecutivo, cod_producto, cantidad, valor_venta, subtotal) FROM '$$PATH$$/3412.dat';

--
-- Data for Name: detalle_pedido; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.detalle_pedido (num_mesa, cod_producto, cantidad, subtotal) FROM stdin;
\.
COPY snap_pos.detalle_pedido (num_mesa, cod_producto, cantidad, subtotal) FROM '$$PATH$$/3409.dat';

--
-- Data for Name: empleado; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.empleado (empleado_id, cargo_id, codigo_acceso, dni, nombre, apellido, direccion) FROM stdin;
\.
COPY snap_pos.empleado (empleado_id, cargo_id, codigo_acceso, dni, nombre, apellido, direccion) FROM '$$PATH$$/3400.dat';

--
-- Data for Name: factura; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.factura (consecutivo, id_cliente, id_pedido, fecha_compra, total) FROM stdin;
\.
COPY snap_pos.factura (consecutivo, id_cliente, id_pedido, fecha_compra, total) FROM '$$PATH$$/3411.dat';

--
-- Data for Name: mesa; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.mesa (num_mesa, descripcion) FROM stdin;
\.
COPY snap_pos.mesa (num_mesa, descripcion) FROM '$$PATH$$/3404.dat';

--
-- Data for Name: pedido; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.pedido (id_pedido, id_empleado, num_mesa) FROM stdin;
\.
COPY snap_pos.pedido (id_pedido, id_empleado, num_mesa) FROM '$$PATH$$/3406.dat';

--
-- Data for Name: producto; Type: TABLE DATA; Schema: snap_pos; Owner: postgres
--

COPY snap_pos.producto (cod_producto, nombre, precio_unitario) FROM stdin;
\.
COPY snap_pos.producto (cod_producto, nombre, precio_unitario) FROM '$$PATH$$/3408.dat';

--
-- Name: acceso_codigo_acceso_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.acceso_codigo_acceso_seq', 10, true);


--
-- Name: cargo_cargo_id_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.cargo_cargo_id_seq', 10, true);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.cliente_id_cliente_seq', 10, true);


--
-- Name: empleado_empleado_id_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.empleado_empleado_id_seq', 10, true);


--
-- Name: factura_consecutivo_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.factura_consecutivo_seq', 9, true);


--
-- Name: mesa_num_mesa_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.mesa_num_mesa_seq', 10, true);


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.pedido_id_pedido_seq', 10, true);


--
-- Name: producto_cod_producto_seq; Type: SEQUENCE SET; Schema: snap_pos; Owner: postgres
--

SELECT pg_catalog.setval('snap_pos.producto_cod_producto_seq', 10, true);


--
-- Name: acceso acceso_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (codigo_acceso);


--
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (cargo_id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: detalle_factura detalle_factura_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (consecutivo, cod_producto);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (empleado_id);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (consecutivo);


--
-- Name: mesa mesa_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.mesa
    ADD CONSTRAINT mesa_pkey PRIMARY KEY (num_mesa);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (cod_producto);


--
-- Name: detalle_factura detalle_factura_cod_producto_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.detalle_factura
    ADD CONSTRAINT detalle_factura_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES snap_pos.producto(cod_producto);


--
-- Name: detalle_factura detalle_factura_consecutivo_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.detalle_factura
    ADD CONSTRAINT detalle_factura_consecutivo_fkey FOREIGN KEY (consecutivo) REFERENCES snap_pos.factura(consecutivo);


--
-- Name: detalle_pedido detalle_pedido_cod_producto_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.detalle_pedido
    ADD CONSTRAINT detalle_pedido_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES snap_pos.producto(cod_producto);


--
-- Name: detalle_pedido detalle_pedido_num_mesa_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.detalle_pedido
    ADD CONSTRAINT detalle_pedido_num_mesa_fkey FOREIGN KEY (num_mesa) REFERENCES snap_pos.mesa(num_mesa);


--
-- Name: empleado empleado_cargo_id_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.empleado
    ADD CONSTRAINT empleado_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES snap_pos.cargo(cargo_id);


--
-- Name: empleado empleado_codigo_acceso_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.empleado
    ADD CONSTRAINT empleado_codigo_acceso_fkey FOREIGN KEY (codigo_acceso) REFERENCES snap_pos.acceso(codigo_acceso);


--
-- Name: factura factura_id_cliente_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES snap_pos.cliente(id_cliente);


--
-- Name: factura factura_id_pedido_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.factura
    ADD CONSTRAINT factura_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES snap_pos.pedido(id_pedido);


--
-- Name: pedido pedido_id_empleado_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.pedido
    ADD CONSTRAINT pedido_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES snap_pos.empleado(empleado_id);


--
-- Name: pedido pedido_num_mesa_fkey; Type: FK CONSTRAINT; Schema: snap_pos; Owner: postgres
--

ALTER TABLE ONLY snap_pos.pedido
    ADD CONSTRAINT pedido_num_mesa_fkey FOREIGN KEY (num_mesa) REFERENCES snap_pos.mesa(num_mesa);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       