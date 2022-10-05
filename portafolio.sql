PGDMP                     	    z        
   Portafolio    14.5    14.4 N    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395 
   Portafolio    DATABASE     h   CREATE DATABASE "Portafolio" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "Portafolio";
                postgres    false                        3079    16661    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1259    16420    datos_adicionales    TABLE     �   CREATE TABLE public.datos_adicionales (
    id_datos_adicionales numeric NOT NULL,
    rut character varying NOT NULL,
    razon_social character varying NOT NULL,
    giro character varying NOT NULL
);
 %   DROP TABLE public.datos_adicionales;
       public         heap    postgres    false            �            1259    16456    detalle_pago    TABLE     �   CREATE TABLE public.detalle_pago (
    id_pago numeric NOT NULL,
    descripcion character varying NOT NULL,
    id_venta numeric NOT NULL
);
     DROP TABLE public.detalle_pago;
       public         heap    postgres    false            �            1259    16426    detalle_venta    TABLE     �   CREATE TABLE public.detalle_venta (
    observacion character varying,
    id_producto numeric NOT NULL,
    id_venta numeric NOT NULL,
    cantidad numeric NOT NULL
);
 !   DROP TABLE public.detalle_venta;
       public         heap    postgres    false            �            1259    16710    insumo_proveedor    TABLE     {   CREATE TABLE public.insumo_proveedor (
    id_insumo numeric NOT NULL,
    rut_proveedor character varying(10) NOT NULL
);
 $   DROP TABLE public.insumo_proveedor;
       public         heap    postgres    false            �            1259    16614    insumos_bodega    TABLE     �   CREATE TABLE public.insumos_bodega (
    id_producto numeric NOT NULL,
    producto character varying NOT NULL,
    stock numeric NOT NULL,
    precio numeric NOT NULL
);
 "   DROP TABLE public.insumos_bodega;
       public         heap    postgres    false            �            1259    16601    mesa    TABLE     �   CREATE TABLE public.mesa (
    id_mesa numeric NOT NULL,
    cant_personas numeric NOT NULL,
    ubicacion character varying(150) NOT NULL,
    disponible boolean NOT NULL
);
    DROP TABLE public.mesa;
       public         heap    postgres    false            �            1259    16462    pago    TABLE     �   CREATE TABLE public.pago (
    id_pago numeric NOT NULL,
    tipo_pago character varying NOT NULL,
    sub_total numeric NOT NULL,
    iva numeric NOT NULL,
    total numeric NOT NULL,
    propina numeric
);
    DROP TABLE public.pago;
       public         heap    postgres    false            �            1259    16438    procedencia_local    TABLE     �   CREATE TABLE public.procedencia_local (
    id_procedencia_local numeric NOT NULL,
    area_interna character varying NOT NULL
);
 %   DROP TABLE public.procedencia_local;
       public         heap    postgres    false            �            1259    16432    producto    TABLE     -  CREATE TABLE public.producto (
    id_producto numeric NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying NOT NULL,
    id_procedencia_local numeric NOT NULL,
    "Stock" numeric NOT NULL,
    ruta_imagen character varying(300) NOT NULL,
    precio numeric NOT NULL
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16621 	   proveedor    TABLE     �   CREATE TABLE public.proveedor (
    rut_proveedor character varying NOT NULL,
    nombre character varying NOT NULL,
    telefono numeric NOT NULL,
    email character varying NOT NULL,
    direccion character varying NOT NULL
);
    DROP TABLE public.proveedor;
       public         heap    postgres    false            �            1259    16634    reportes_mensuales    TABLE       CREATE TABLE public.reportes_mensuales (
    numero_reporte character varying NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date NOT NULL,
    subtotal_ventas numeric NOT NULL,
    total_iva numeric NOT NULL,
    total_mes numeric NOT NULL
);
 &   DROP TABLE public.reportes_mensuales;
       public         heap    postgres    false            �            1259    16414    tipo_documento    TABLE     �   CREATE TABLE public.tipo_documento (
    id_tipo_documento numeric NOT NULL,
    descripcion character varying NOT NULL,
    id_datos_adicionales numeric
);
 "   DROP TABLE public.tipo_documento;
       public         heap    postgres    false            �            1259    16402    tipo_usuario    TABLE     o   CREATE TABLE public.tipo_usuario (
    id_tipo numeric NOT NULL,
    descripcion character varying NOT NULL
);
     DROP TABLE public.tipo_usuario;
       public         heap    postgres    false            �            1259    16396    usuario    TABLE     �   CREATE TABLE public.usuario (
    rut_usuario character varying(10) NOT NULL,
    nombres character varying,
    apellidos character varying,
    id_tipo numeric NOT NULL,
    email character varying,
    contrasena character varying(255)
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16408    venta    TABLE     "  CREATE TABLE public.venta (
    id_venta numeric NOT NULL,
    fecha character varying NOT NULL,
    rut_usuario character varying NOT NULL,
    descripcion character varying,
    id_tipo_documento numeric NOT NULL,
    hora time without time zone NOT NULL,
    id_mesa numeric NOT NULL
);
    DROP TABLE public.venta;
       public         heap    postgres    false            }          0    16420    datos_adicionales 
   TABLE DATA           Z   COPY public.datos_adicionales (id_datos_adicionales, rut, razon_social, giro) FROM stdin;
    public          postgres    false    214   J\       �          0    16456    detalle_pago 
   TABLE DATA           F   COPY public.detalle_pago (id_pago, descripcion, id_venta) FROM stdin;
    public          postgres    false    218   �\       ~          0    16426    detalle_venta 
   TABLE DATA           U   COPY public.detalle_venta (observacion, id_producto, id_venta, cantidad) FROM stdin;
    public          postgres    false    215   �\       �          0    16710    insumo_proveedor 
   TABLE DATA           D   COPY public.insumo_proveedor (id_insumo, rut_proveedor) FROM stdin;
    public          postgres    false    224   "]       �          0    16614    insumos_bodega 
   TABLE DATA           N   COPY public.insumos_bodega (id_producto, producto, stock, precio) FROM stdin;
    public          postgres    false    221   p]       �          0    16601    mesa 
   TABLE DATA           M   COPY public.mesa (id_mesa, cant_personas, ubicacion, disponible) FROM stdin;
    public          postgres    false    220   �]       �          0    16462    pago 
   TABLE DATA           R   COPY public.pago (id_pago, tipo_pago, sub_total, iva, total, propina) FROM stdin;
    public          postgres    false    219   )^       �          0    16438    procedencia_local 
   TABLE DATA           O   COPY public.procedencia_local (id_procedencia_local, area_interna) FROM stdin;
    public          postgres    false    217   }^                 0    16432    producto 
   TABLE DATA           x   COPY public.producto (id_producto, nombre, descripcion, id_procedencia_local, "Stock", ruta_imagen, precio) FROM stdin;
    public          postgres    false    216   �^       �          0    16621 	   proveedor 
   TABLE DATA           V   COPY public.proveedor (rut_proveedor, nombre, telefono, email, direccion) FROM stdin;
    public          postgres    false    222   T_       �          0    16634    reportes_mensuales 
   TABLE DATA           �   COPY public.reportes_mensuales (numero_reporte, fecha_inicio, fecha_termino, subtotal_ventas, total_iva, total_mes) FROM stdin;
    public          postgres    false    223   >`       |          0    16414    tipo_documento 
   TABLE DATA           ^   COPY public.tipo_documento (id_tipo_documento, descripcion, id_datos_adicionales) FROM stdin;
    public          postgres    false    213   [`       z          0    16402    tipo_usuario 
   TABLE DATA           <   COPY public.tipo_usuario (id_tipo, descripcion) FROM stdin;
    public          postgres    false    211   �`       y          0    16396    usuario 
   TABLE DATA           ^   COPY public.usuario (rut_usuario, nombres, apellidos, id_tipo, email, contrasena) FROM stdin;
    public          postgres    false    210   a       {          0    16408    venta 
   TABLE DATA           l   COPY public.venta (id_venta, fecha, rut_usuario, descripcion, id_tipo_documento, hora, id_mesa) FROM stdin;
    public          postgres    false    212   �d       �           2606    16607    mesa Mesa_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT "Mesa_pkey" PRIMARY KEY (id_mesa);
 :   ALTER TABLE ONLY public.mesa DROP CONSTRAINT "Mesa_pkey";
       public            postgres    false    220            �           2606    16627    proveedor Proveedor_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY (rut_proveedor);
 D   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT "Proveedor_pkey";
       public            postgres    false    222            �           2606    16640 *   reportes_mensuales Reportes_mensuales_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.reportes_mensuales
    ADD CONSTRAINT "Reportes_mensuales_pkey" PRIMARY KEY (numero_reporte);
 V   ALTER TABLE ONLY public.reportes_mensuales DROP CONSTRAINT "Reportes_mensuales_pkey";
       public            postgres    false    223            �           2606    16491 (   datos_adicionales datos_adicionales_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.datos_adicionales
    ADD CONSTRAINT datos_adicionales_pkey PRIMARY KEY (id_datos_adicionales);
 R   ALTER TABLE ONLY public.datos_adicionales DROP CONSTRAINT datos_adicionales_pkey;
       public            postgres    false    214            �           2606    16620    insumos_bodega id_bodega 
   CONSTRAINT     _   ALTER TABLE ONLY public.insumos_bodega
    ADD CONSTRAINT id_bodega PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.insumos_bodega DROP CONSTRAINT id_bodega;
       public            postgres    false    221            �           2606    16481    pago pago_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public            postgres    false    219            �           2606    16479 (   procedencia_local procedencia_local_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.procedencia_local
    ADD CONSTRAINT procedencia_local_pkey PRIMARY KEY (id_procedencia_local);
 R   ALTER TABLE ONLY public.procedencia_local DROP CONSTRAINT procedencia_local_pkey;
       public            postgres    false    217            �           2606    16477    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    216            �           2606    16473 "   tipo_documento tipo_documento_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento);
 L   ALTER TABLE ONLY public.tipo_documento DROP CONSTRAINT tipo_documento_pkey;
       public            postgres    false    213            �           2606    16475    tipo_usuario tipo_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id_tipo);
 @   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_pkey;
       public            postgres    false    211            �           2606    16642    usuario usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (rut_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    210            �           2606    16469    venta venta_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pkey;
       public            postgres    false    212            �           1259    16425 *   datos_adicionales_id_datos_adicionales_idx    INDEX        CREATE UNIQUE INDEX datos_adicionales_id_datos_adicionales_idx ON public.datos_adicionales USING btree (id_datos_adicionales);
 >   DROP INDEX public.datos_adicionales_id_datos_adicionales_idx;
       public            postgres    false    214            �           1259    16720    fki_fk_bodega    INDEX     O   CREATE INDEX fki_fk_bodega ON public.insumo_proveedor USING btree (id_insumo);
 !   DROP INDEX public.fki_fk_bodega;
       public            postgres    false    224            �           1259    16559    fki_fk_datos_adicionales    INDEX     c   CREATE INDEX fki_fk_datos_adicionales ON public.tipo_documento USING btree (id_datos_adicionales);
 ,   DROP INDEX public.fki_fk_datos_adicionales;
       public            postgres    false    213            �           1259    16698    fki_fk_fecha    INDEX     ?   CREATE INDEX fki_fk_fecha ON public.venta USING btree (fecha);
     DROP INDEX public.fki_fk_fecha;
       public            postgres    false    212            �           1259    16613    fki_fk_mesa    INDEX     @   CREATE INDEX fki_fk_mesa ON public.venta USING btree (id_mesa);
    DROP INDEX public.fki_fk_mesa;
       public            postgres    false    212            �           1259    16588    fki_fk_pago    INDEX     G   CREATE INDEX fki_fk_pago ON public.detalle_pago USING btree (id_pago);
    DROP INDEX public.fki_fk_pago;
       public            postgres    false    218            �           1259    16565    fki_fk_procedencia_local    INDEX     ]   CREATE INDEX fki_fk_procedencia_local ON public.producto USING btree (id_procedencia_local);
 ,   DROP INDEX public.fki_fk_procedencia_local;
       public            postgres    false    216            �           1259    16571    fki_fk_producto    INDEX     P   CREATE INDEX fki_fk_producto ON public.detalle_venta USING btree (id_producto);
 #   DROP INDEX public.fki_fk_producto;
       public            postgres    false    215            �           1259    16726    fki_fk_proveedor    INDEX     V   CREATE INDEX fki_fk_proveedor ON public.insumo_proveedor USING btree (rut_proveedor);
 $   DROP INDEX public.fki_fk_proveedor;
       public            postgres    false    224            �           1259    16553    fki_fk_tipo_documento    INDEX     T   CREATE INDEX fki_fk_tipo_documento ON public.venta USING btree (id_tipo_documento);
 )   DROP INDEX public.fki_fk_tipo_documento;
       public            postgres    false    212            �           1259    16547    fki_fk_tipo_usuario    INDEX     J   CREATE INDEX fki_fk_tipo_usuario ON public.usuario USING btree (id_tipo);
 '   DROP INDEX public.fki_fk_tipo_usuario;
       public            postgres    false    210            �           1259    16595    fki_fk_usuario    INDEX     G   CREATE INDEX fki_fk_usuario ON public.venta USING btree (rut_usuario);
 "   DROP INDEX public.fki_fk_usuario;
       public            postgres    false    212            �           1259    16577    fki_fk_venta    INDEX     J   CREATE INDEX fki_fk_venta ON public.detalle_venta USING btree (id_venta);
     DROP INDEX public.fki_fk_venta;
       public            postgres    false    215            �           1259    16467    pago_id_pago_idx    INDEX     K   CREATE UNIQUE INDEX pago_id_pago_idx ON public.pago USING btree (id_pago);
 $   DROP INDEX public.pago_id_pago_idx;
       public            postgres    false    219            �           1259    16443 *   procedencia_local_id_procedencia_local_idx    INDEX        CREATE UNIQUE INDEX procedencia_local_id_procedencia_local_idx ON public.procedencia_local USING btree (id_procedencia_local);
 >   DROP INDEX public.procedencia_local_id_procedencia_local_idx;
       public            postgres    false    217            �           1259    16437    producto_id_producto_idx    INDEX     [   CREATE UNIQUE INDEX producto_id_producto_idx ON public.producto USING btree (id_producto);
 ,   DROP INDEX public.producto_id_producto_idx;
       public            postgres    false    216            �           1259    16419 $   tipo_documento_id_tipo_documento_idx    INDEX     s   CREATE UNIQUE INDEX tipo_documento_id_tipo_documento_idx ON public.tipo_documento USING btree (id_tipo_documento);
 8   DROP INDEX public.tipo_documento_id_tipo_documento_idx;
       public            postgres    false    213            �           1259    16407    tipo_id_tipo_idx    INDEX     S   CREATE UNIQUE INDEX tipo_id_tipo_idx ON public.tipo_usuario USING btree (id_tipo);
 $   DROP INDEX public.tipo_id_tipo_idx;
       public            postgres    false    211            �           2606    16554 #   tipo_documento fk_datos_adicionales    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT fk_datos_adicionales FOREIGN KEY (id_datos_adicionales) REFERENCES public.datos_adicionales(id_datos_adicionales);
 M   ALTER TABLE ONLY public.tipo_documento DROP CONSTRAINT fk_datos_adicionales;
       public          postgres    false    3272    213    214            �           2606    16715    insumo_proveedor fk_insumo    FK CONSTRAINT     �   ALTER TABLE ONLY public.insumo_proveedor
    ADD CONSTRAINT fk_insumo FOREIGN KEY (id_insumo) REFERENCES public.insumos_bodega(id_producto);
 D   ALTER TABLE ONLY public.insumo_proveedor DROP CONSTRAINT fk_insumo;
       public          postgres    false    224    3291    221            �           2606    16608    venta fk_mesa    FK CONSTRAINT     p   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fk_mesa FOREIGN KEY (id_mesa) REFERENCES public.mesa(id_mesa);
 7   ALTER TABLE ONLY public.venta DROP CONSTRAINT fk_mesa;
       public          postgres    false    220    3289    212            �           2606    16583    detalle_pago fk_pago    FK CONSTRAINT     w   ALTER TABLE ONLY public.detalle_pago
    ADD CONSTRAINT fk_pago FOREIGN KEY (id_pago) REFERENCES public.pago(id_pago);
 >   ALTER TABLE ONLY public.detalle_pago DROP CONSTRAINT fk_pago;
       public          postgres    false    218    3285    219            �           2606    16560    producto fk_procedencia_local    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_procedencia_local FOREIGN KEY (id_procedencia_local) REFERENCES public.procedencia_local(id_procedencia_local);
 G   ALTER TABLE ONLY public.producto DROP CONSTRAINT fk_procedencia_local;
       public          postgres    false    3281    216    217            �           2606    16566    detalle_venta fk_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 C   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT fk_producto;
       public          postgres    false    3278    215    216            �           2606    16721    insumo_proveedor fk_proveedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.insumo_proveedor
    ADD CONSTRAINT fk_proveedor FOREIGN KEY (rut_proveedor) REFERENCES public.proveedor(rut_proveedor);
 G   ALTER TABLE ONLY public.insumo_proveedor DROP CONSTRAINT fk_proveedor;
       public          postgres    false    224    3293    222            �           2606    16548    venta fk_tipo_documento    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fk_tipo_documento FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);
 A   ALTER TABLE ONLY public.venta DROP CONSTRAINT fk_tipo_documento;
       public          postgres    false    3269    213    212            �           2606    16542    usuario fk_tipo_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_tipo_usuario FOREIGN KEY (id_tipo) REFERENCES public.tipo_usuario(id_tipo);
 A   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_tipo_usuario;
       public          postgres    false    211    210    3259            �           2606    16643    venta fk_usuario    FK CONSTRAINT     ~   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fk_usuario FOREIGN KEY (rut_usuario) REFERENCES public.usuario(rut_usuario);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT fk_usuario;
       public          postgres    false    210    3258    212            �           2606    16572    detalle_venta fk_venta    FK CONSTRAINT     |   ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT fk_venta FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta);
 @   ALTER TABLE ONLY public.detalle_venta DROP CONSTRAINT fk_venta;
       public          postgres    false    212    3267    215            �           2606    16578    detalle_pago fk_venta    FK CONSTRAINT     {   ALTER TABLE ONLY public.detalle_pago
    ADD CONSTRAINT fk_venta FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta);
 ?   ALTER TABLE ONLY public.detalle_pago DROP CONSTRAINT fk_venta;
       public          postgres    false    218    3267    212            }   C   x�3�473�033��5�t��+.)*M.�/JT �%�
9%)�p����<��T�Ԕ̴L ��+F��� �4Q      �   3   x�3�HL�W(�/RH��-(JT(JM�ɬJLI�4�2�#k�e�W6F��� ��]      ~   2   x�+�S(�I,����W(��S�(M-��4B#�?N#�1!=... ��      �   >   x�M���0�7׋-��b��aEy�vݺ2���К��c|�Q2�nd���<�k�o      �   `   x�U�1
�0�W�+9
~��C���[��V�b��M��n��k�>f$�MJ���c�	{�պ}B�/2�2Gy�F5��n�t*�}��dy��9��      �   9   x�3�4�K�+I�K�,�2�4A��ș �BR���9ӸL�r��\	W� 1�|      �   D   x�3�t.JM�,��44 NCK!�|.CN��$������4��q���&�d��s�d����qqq �R�      �      x�3�t�O��K�2�tJ,*J����� DWg         �   x�u�1�0F�zs�=�J@����+���1d3I�����۾7���$v�A�h� z�W�3���88x3`���Β���oq�HT�NӐsH�����7n�k���m�����u#�"��:9:�[��ߑ�$PEe��k���w����l�R_]�<'      �   �   x�U�Mj�0�t
 ��H�.�]t[��f�� p4A?���7��{|��Y ��vFL���b�l?h0ⶤ����a��u!��J�W���C˨.4+/c��H��VT]���bt,�t9�����m�?��(�ᠾ0Ոg�N���Cg�;%�0����G�T�_��a��6���c¢@�{��z�y!k�k���v;���<���*eI      �      x������ � �      |   %   x�3�t��I-I���2�tKL.)-J�4����� wS<      z   k   x�E��
�@F���Sh�m����(�t&��&�\�����ǁsmZD%�d�[�س)��hQ��T�,�p�2�����#w³�s�5�)^����0�a�M����� �W.      y   �  x����n[G��GO�p�!gH�.ES��.�!GP [��A����EѦ�Bq�|�/*����7e��d�����!�������~ot�<^��xz5�wۻw�'�Cā}Jh5�8I��!HP�� ��ȅս͡-��4�ɫ�e��9���2�\��I��Yɳ2hQD��ŠV,}WZA��o��{{8���>���o���n����������t��j�����{A�כ`{�Q����d���c��c"�j4�J�)�F �-�uTź|vf���Y�J�%5E[&ȵ9�И���'��ۛc����x��b�x��j����֮���'�ϟ���D�Ҥ+���a�
W$�E՚M��^�.S�rY���	�U*��x�>"�]�l�B]2A��U���4Cm�7�c5o 5�IU���IQZ���ʔ�h�i��ѺU�u�Q�Qx��0Q{:�95�j���)���G�p_�L��{
����R���"]2�m$~R^k�Z�Ī��ɩcHrxZ��W3��emD#�iY�X�LX}��L�h�@%ӳ�I�^tMp����Ui�)�Ҵ:�ܥ�_�$/T�Gk`i��=gi�Z��tT�2�J��hB�h��i�sv
z�Jڮ�.����L�zɳE5���K!�,�\֤TvC�}���z���?�i����t<��u�p<|�/�~�����+�]�ԋ�M�n㯂�nc����<7���7"4֙��Z�s���pQ�QL[cy��ڜ�P򢥆n+5.L���=k�l��T��}�ّ�c�����i��eX����m�ćO���m{���\�l@�����޳ѸҘ��+Ðlv����=*2"�jS�O }V��iǬ��=��8g�J��~$���!�|f5�K��_+2��{�j���ts�      {   v   x�}�1�0 ��yE>�(vl+��XYx(Ji��GbF�����힊?���m9��"�a]������w�6ow��K뀀���$!�H� ;��!�Uu�?}�\�Pє@�)8�>�m-�     