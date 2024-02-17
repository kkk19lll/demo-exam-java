PGDMP  %        
            |            request_remont_db    16.1    16.1 ]    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            >           1262    41852    request_remont_db    DATABASE     �   CREATE DATABASE request_remont_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 !   DROP DATABASE request_remont_db;
                postgres    false            �            1259    41899    cause_of_malfunctions    TABLE     i   CREATE TABLE public.cause_of_malfunctions (
    id integer NOT NULL,
    name character varying(1000)
);
 )   DROP TABLE public.cause_of_malfunctions;
       public         heap    postgres    false            �            1259    41898    cause_of_malfunctions_id_seq    SEQUENCE     �   ALTER TABLE public.cause_of_malfunctions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cause_of_malfunctions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    41973 
   equipments    TABLE     h  CREATE TABLE public.equipments (
    id integer NOT NULL,
    name character varying(1000),
    description character varying(1000),
    type_equipment_id integer,
    serial_number character varying(1000),
    date_of_purchase date,
    date_of_last_repair date,
    status_of_equipment_id integer,
    remont_id integer,
    other character varying(1000)
);
    DROP TABLE public.equipments;
       public         heap    postgres    false            �            1259    41972    equipments_id_seq    SEQUENCE     �   ALTER TABLE public.equipments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.equipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            �            1259    41996 	   executors    TABLE     �   CREATE TABLE public.executors (
    id integer NOT NULL,
    last_name character varying(1000),
    first_name character varying(1000),
    middle_name character varying(1000)
);
    DROP TABLE public.executors;
       public         heap    postgres    false            �            1259    41995    executors_id_seq    SEQUENCE     �   ALTER TABLE public.executors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.executors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    41931 	   materials    TABLE     �   CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(1000),
    description character varying(1000),
    price character varying(1000)
);
    DROP TABLE public.materials;
       public         heap    postgres    false            �            1259    41930    materials_id_seq    SEQUENCE     �   ALTER TABLE public.materials ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    41957    materials_remonts    TABLE     s   CREATE TABLE public.materials_remonts (
    id integer NOT NULL,
    remont_id integer,
    material_id integer
);
 %   DROP TABLE public.materials_remonts;
       public         heap    postgres    false            �            1259    41956    materials_remonts_id_seq    SEQUENCE     �   ALTER TABLE public.materials_remonts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materials_remonts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    41883 
   prioritets    TABLE     ^   CREATE TABLE public.prioritets (
    id integer NOT NULL,
    name character varying(1000)
);
    DROP TABLE public.prioritets;
       public         heap    postgres    false            �            1259    41882    prioritets_id_seq    SEQUENCE     �   ALTER TABLE public.prioritets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.prioritets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    41939    remonts    TABLE       CREATE TABLE public.remonts (
    id integer NOT NULL,
    name character varying(1000),
    description character varying(1000),
    time_remont time without time zone,
    price_of_remont integer,
    status_remont_id integer,
    cause_of_malfunction_id integer
);
    DROP TABLE public.remonts;
       public         heap    postgres    false            �            1259    41938    remonts_id_seq    SEQUENCE     �   ALTER TABLE public.remonts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.remonts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    42004    requests    TABLE     )  CREATE TABLE public.requests (
    id integer NOT NULL,
    date_update date,
    equipment_id integer,
    type_of_malfunction_id integer,
    description_of_problem character varying(1000),
    user_id integer,
    executor_id integer,
    prioritet_id integer,
    status_request_id integer
);
    DROP TABLE public.requests;
       public         heap    postgres    false            �            1259    42003    requests_id_seq    SEQUENCE     �   ALTER TABLE public.requests ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    41854    roles    TABLE     Y   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(1000)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    41853    roles_id_seq    SEQUENCE     �   ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    41915    statuses_equipment    TABLE     f   CREATE TABLE public.statuses_equipment (
    id integer NOT NULL,
    name character varying(1000)
);
 &   DROP TABLE public.statuses_equipment;
       public         heap    postgres    false            �            1259    41914    statuses_equipment_id_seq    SEQUENCE     �   ALTER TABLE public.statuses_equipment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    41907    statuses_remont    TABLE     c   CREATE TABLE public.statuses_remont (
    id integer NOT NULL,
    name character varying(1000)
);
 #   DROP TABLE public.statuses_remont;
       public         heap    postgres    false            �            1259    41906    statuses_remont_id_seq    SEQUENCE     �   ALTER TABLE public.statuses_remont ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_remont_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    41875    statuses_request    TABLE     d   CREATE TABLE public.statuses_request (
    id integer NOT NULL,
    name character varying(1000)
);
 $   DROP TABLE public.statuses_request;
       public         heap    postgres    false            �            1259    41874    statuses_request_id_seq    SEQUENCE     �   ALTER TABLE public.statuses_request ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    41891    type_of_malfunctions    TABLE     h   CREATE TABLE public.type_of_malfunctions (
    id integer NOT NULL,
    name character varying(1000)
);
 (   DROP TABLE public.type_of_malfunctions;
       public         heap    postgres    false            �            1259    41890    type_of_malfunctions_id_seq    SEQUENCE     �   ALTER TABLE public.type_of_malfunctions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.type_of_malfunctions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    41923    types_equipment    TABLE     c   CREATE TABLE public.types_equipment (
    id integer NOT NULL,
    name character varying(1000)
);
 #   DROP TABLE public.types_equipment;
       public         heap    postgres    false            �            1259    41922    types_equipment_id_seq    SEQUENCE     �   ALTER TABLE public.types_equipment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.types_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    41862    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    last_name character varying(1000),
    first_name character varying(1000),
    middle_name character varying(1000),
    login character varying(1000),
    password character varying(1000),
    role_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    41861    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            &          0    41899    cause_of_malfunctions 
   TABLE DATA                 public          postgres    false    226   �k       4          0    41973 
   equipments 
   TABLE DATA                 public          postgres    false    240   am       6          0    41996 	   executors 
   TABLE DATA                 public          postgres    false    242   �o       .          0    41931 	   materials 
   TABLE DATA                 public          postgres    false    234   Gp       2          0    41957    materials_remonts 
   TABLE DATA                 public          postgres    false    238   �q       "          0    41883 
   prioritets 
   TABLE DATA                 public          postgres    false    222   �r       0          0    41939    remonts 
   TABLE DATA                 public          postgres    false    236   $s       8          0    42004    requests 
   TABLE DATA                 public          postgres    false    244   �u                 0    41854    roles 
   TABLE DATA                 public          postgres    false    216   �v       *          0    41915    statuses_equipment 
   TABLE DATA                 public          postgres    false    230   �w       (          0    41907    statuses_remont 
   TABLE DATA                 public          postgres    false    228   Jx                  0    41875    statuses_request 
   TABLE DATA                 public          postgres    false    220   �x       $          0    41891    type_of_malfunctions 
   TABLE DATA                 public          postgres    false    224   �y       ,          0    41923    types_equipment 
   TABLE DATA                 public          postgres    false    232   ]z                 0    41862    users 
   TABLE DATA                 public          postgres    false    218   G{       ?           0    0    cause_of_malfunctions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.cause_of_malfunctions_id_seq', 10, true);
          public          postgres    false    225            @           0    0    equipments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.equipments_id_seq', 10, true);
          public          postgres    false    239            A           0    0    executors_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.executors_id_seq', 2, true);
          public          postgres    false    241            B           0    0    materials_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.materials_id_seq', 7, true);
          public          postgres    false    233            C           0    0    materials_remonts_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.materials_remonts_id_seq', 10, true);
          public          postgres    false    237            D           0    0    prioritets_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.prioritets_id_seq', 3, true);
          public          postgres    false    221            E           0    0    remonts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.remonts_id_seq', 10, true);
          public          postgres    false    235            F           0    0    requests_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.requests_id_seq', 10, true);
          public          postgres    false    243            G           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 4, true);
          public          postgres    false    215            H           0    0    statuses_equipment_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.statuses_equipment_id_seq', 2, true);
          public          postgres    false    229            I           0    0    statuses_remont_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.statuses_remont_id_seq', 3, true);
          public          postgres    false    227            J           0    0    statuses_request_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.statuses_request_id_seq', 3, true);
          public          postgres    false    219            K           0    0    type_of_malfunctions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.type_of_malfunctions_id_seq', 3, true);
          public          postgres    false    223            L           0    0    types_equipment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.types_equipment_id_seq', 5, true);
          public          postgres    false    231            M           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    217            k           2606    41905 0   cause_of_malfunctions cause_of_malfunctions_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.cause_of_malfunctions
    ADD CONSTRAINT cause_of_malfunctions_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.cause_of_malfunctions DROP CONSTRAINT cause_of_malfunctions_pkey;
       public            postgres    false    226            y           2606    41979    equipments equipments_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_pkey;
       public            postgres    false    240            {           2606    42002    executors executors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.executors
    ADD CONSTRAINT executors_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.executors DROP CONSTRAINT executors_pkey;
       public            postgres    false    242            s           2606    41937    materials materials_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            postgres    false    234            w           2606    41961 (   materials_remonts materials_remonts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.materials_remonts
    ADD CONSTRAINT materials_remonts_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.materials_remonts DROP CONSTRAINT materials_remonts_pkey;
       public            postgres    false    238            g           2606    41889    prioritets prioritets_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.prioritets
    ADD CONSTRAINT prioritets_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.prioritets DROP CONSTRAINT prioritets_pkey;
       public            postgres    false    222            u           2606    41945    remonts remonts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.remonts
    ADD CONSTRAINT remonts_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.remonts DROP CONSTRAINT remonts_pkey;
       public            postgres    false    236            }           2606    42010    requests requests_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_pkey;
       public            postgres    false    244            a           2606    41860    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            o           2606    41921 *   statuses_equipment statuses_equipment_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.statuses_equipment
    ADD CONSTRAINT statuses_equipment_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.statuses_equipment DROP CONSTRAINT statuses_equipment_pkey;
       public            postgres    false    230            m           2606    41913 $   statuses_remont statuses_remont_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.statuses_remont
    ADD CONSTRAINT statuses_remont_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.statuses_remont DROP CONSTRAINT statuses_remont_pkey;
       public            postgres    false    228            e           2606    41881 &   statuses_request statuses_request_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.statuses_request
    ADD CONSTRAINT statuses_request_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.statuses_request DROP CONSTRAINT statuses_request_pkey;
       public            postgres    false    220            i           2606    41897 .   type_of_malfunctions type_of_malfunctions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.type_of_malfunctions
    ADD CONSTRAINT type_of_malfunctions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.type_of_malfunctions DROP CONSTRAINT type_of_malfunctions_pkey;
       public            postgres    false    224            q           2606    41929 $   types_equipment types_equipment_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.types_equipment
    ADD CONSTRAINT types_equipment_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.types_equipment DROP CONSTRAINT types_equipment_pkey;
       public            postgres    false    232            c           2606    41868    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           2606    41990 $   equipments equipments_remont_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_remont_id_fkey FOREIGN KEY (remont_id) REFERENCES public.remonts(id);
 N   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_remont_id_fkey;
       public          postgres    false    236    4725    240            �           2606    41985 1   equipments equipments_status_of_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_status_of_equipment_id_fkey FOREIGN KEY (status_of_equipment_id) REFERENCES public.statuses_equipment(id);
 [   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_status_of_equipment_id_fkey;
       public          postgres    false    240    230    4719            �           2606    41980 ,   equipments equipments_type_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_type_equipment_id_fkey FOREIGN KEY (type_equipment_id) REFERENCES public.types_equipment(id);
 V   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_type_equipment_id_fkey;
       public          postgres    false    240    4721    232            �           2606    41967 4   materials_remonts materials_remonts_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_remonts
    ADD CONSTRAINT materials_remonts_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);
 ^   ALTER TABLE ONLY public.materials_remonts DROP CONSTRAINT materials_remonts_material_id_fkey;
       public          postgres    false    234    4723    238            �           2606    41962 2   materials_remonts materials_remonts_remont_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_remonts
    ADD CONSTRAINT materials_remonts_remont_id_fkey FOREIGN KEY (remont_id) REFERENCES public.remonts(id);
 \   ALTER TABLE ONLY public.materials_remonts DROP CONSTRAINT materials_remonts_remont_id_fkey;
       public          postgres    false    4725    238    236                       2606    41951 ,   remonts remonts_cause_of_malfunction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remonts
    ADD CONSTRAINT remonts_cause_of_malfunction_id_fkey FOREIGN KEY (cause_of_malfunction_id) REFERENCES public.cause_of_malfunctions(id);
 V   ALTER TABLE ONLY public.remonts DROP CONSTRAINT remonts_cause_of_malfunction_id_fkey;
       public          postgres    false    4715    236    226            �           2606    41946 %   remonts remonts_status_remont_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remonts
    ADD CONSTRAINT remonts_status_remont_id_fkey FOREIGN KEY (status_remont_id) REFERENCES public.statuses_remont(id);
 O   ALTER TABLE ONLY public.remonts DROP CONSTRAINT remonts_status_remont_id_fkey;
       public          postgres    false    228    4717    236            �           2606    42011 #   requests requests_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipments(id);
 M   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_equipment_id_fkey;
       public          postgres    false    244    240    4729            �           2606    42026 "   requests requests_executor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_executor_id_fkey FOREIGN KEY (executor_id) REFERENCES public.executors(id);
 L   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_executor_id_fkey;
       public          postgres    false    242    4731    244            �           2606    42031 #   requests requests_prioritet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_prioritet_id_fkey FOREIGN KEY (prioritet_id) REFERENCES public.prioritets(id);
 M   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_prioritet_id_fkey;
       public          postgres    false    4711    222    244            �           2606    42036 (   requests requests_status_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_status_request_id_fkey FOREIGN KEY (status_request_id) REFERENCES public.statuses_request(id);
 R   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_status_request_id_fkey;
       public          postgres    false    220    244    4709            �           2606    42016 -   requests requests_type_of_malfunction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_type_of_malfunction_id_fkey FOREIGN KEY (type_of_malfunction_id) REFERENCES public.type_of_malfunctions(id);
 W   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_type_of_malfunction_id_fkey;
       public          postgres    false    224    4713    244            �           2606    42021    requests requests_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_user_id_fkey;
       public          postgres    false    218    4707    244            ~           2606    41869    users users_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    4705    216    218            &   ]  x����j�P��>��T�R�_�*4�@�`�Е�VA�`��S�`���WH�B��+̼QϽB76tu7C&9p�;srݒ�T�䖪ez>tڍ��?4��V��wZ�^���(�~,P��6�T�9��{單ɻ���-�.o�m�(W,P�?dĊ?y�+�eN���d�rL��"���������k��`���1�L�x�3ٲ>��ɮ5q�C'�w�܏���O80{����`�j��eeT�HN�H"trr Q+�mQ��M�J��Ϡd�7y'4d
���Y�X"����b0
1��h�P���9��`����+4��I2T�o��,р�-�����
�
4�\��4��>j�      4     x����n�@ �;O��H$c6�T)(��	h��,�LK,��Co8i�HDɫ8�D��
3o��%ո=������_l5ۍV�f����v�����d��i0p�D�3t}���@���G�m�ͣ�N�D�S�c�{���"�{��q�����q1,�0
���o�I�����߇�F�eZ�#hlw�������k����������7M�C�p��	�_�1dF�2M1����;(�"?h�YЍ�^�*�24�?V���Y��5�%
ݱK:���}6��t�ZK��9F��HM�''5�#年!c��g'�d��X�|�A&Β�������4M����fy喠�x�(����{aYNXV���J���	
%��F4�\�~�ҙH�#v+ᄵgE�1�<�/�߽ʻ*�ͪr���������?�59fM9��
3A�+^�h4��LL��V���AS��i�a���X��֕�-�;k^`�}`cvŮ��x�Da�|������'|}����$<8      6   �   x���v
Q���W((M��L�K�HM.-�/*V��L�Q�I,.��K�M�QH�,��s3SRrR�M�0נ OO?w����W_�0G�PW��a���~aƅM6\�{a߅M�H|u4�;.��kZsy��eF �g]l�� ��bǅP��v��ta����V����!܍\\ K��      .   �  x�͔�N�@��<�܀�1 �O&6��BH���&��4F*�R��Jiy��7rvj���&��ݝ�~��ר��Z�J�
���������juG��:�[=S��9j��غ�k0Zm3զ^��F��W��~͓�K=n�+j��F�\ь�Y��b@�gГ�*�+�O�w;Im�P��3F����&��}�2jD����S�,)�� ,�v��ete,��x��|v2�d�(���w�'f��zL����~g̕��D��=J]QY��l΄���J4�)K
艵��`Q�R1�	�*���6�2z�`a����(9֒�8�6��#�z���{#|�;I��k?�")���p��$A*3�֐�ٖ -�������'��p2K      2   �   x����
�P��>�Y*��O�*�J�^\��A+�޿	�830��qtf�)��"��}���jh�v�~��vx>�	nw',G�]|x�Ke�>��[�B�Q�O�L7 po�迳�N,��8�+d�+"DR}�\�T_	KIym	�@��R)��g+i�q>L(R�      "   �   x���v
Q���W((M��L�+(��/�,I-)V��L�Q�K�M�T�s
�t��sW�q�Us�	u���
�:
��^�qa��]@r���5�'�7��bÅ��\�Ku�A�O��}���>�빸 
Ud�      0   �  x�͖�n�P��<�ّHVu�=��RQ��	h��"Y
aP�	5U�v�E����XuMm^a�u��B�F������y>���+�z��`�j�'�.���Q�7�uv�u�o��
�t��H��A_ac��mzA
��v�9�o���x���M*�nMt�k]^L�m������\�U^T�/Y�m�Q~�Ξ�zS��uv�*,-������#����)n�?�e`��1�`0� ��c\#��ƴT�4V��``�I��]��r�</q�0|\��Y��`���&��v��/�@�7��B��lW|K\�=���26��!-�.|�L�qe�q�{���P7��w�3�"��͐u�>�o�2U2�p_Rل3��0Z�KO .,ldφ�}����z�W�[:y_A����G�4�E����3:ˀ�-�x���[1g8x9��G��@�={*b�'W!��F$����O�S�����6��d>2o8���#*F�� �H��{�%�R�h�ۑ�6k�:�a�O�R�lg��άD��H4&���Ƀ� �ӏ��s�����(���_J8���p9r0�uʒ��2��+\r�X�!d�&�h#=j�ߕ�S���ֵs�\NJ�16�?c��_��c�7`E�g�Q�!���85�%R^92I�� �D5=      8   .  x����j�0 �{�"w��#F�ʮ�!l�v%VS�������s)�,b�#��9!��2-*���Pq�I�����3���t��kAo,B<���_�ӵ��*Ɩ�i���[F��/aʦK��3��ĭ��:��L�p�~s�s�����iQd�Y����J�������}	v�lQ�B���v�'������?Z���"݊�ɶX�V_���I����k�[��`K�!5��PY�m�b=�փ��Cs���HY���ٯ�n��NZc�j8ѭ��&�	dH^=��2�n�����o�x�*         �   x���v
Q���W((M��L�+��I-V��L�Q�K�M�T�s
�t��sW�q�Us�	u���
�:
�&\�raυ�^�q��b�ņ.6]�w�A]Ӛ˓
��lY4h��f�m@�.좖�� �g\l���¾���h�����=Բ�d�,��;����2�� ����      *   �   x���v
Q���W((M��L�+.I,)-N-�O-,�,�M�+Q��L�Q�K�M�T�s
�t��sW�q�Us�	u���
�:
�/쾰�.�U״��%F@K.� Z��bВM�B,�� �RJ�      (   �   x���v
Q���W((M��L�+.I,)-N-�/J���+Q��L�Q�K�M�T�s
�t��sW�q�Us�	u���
�:
��]�vaǅ-�^lR��pa�=@���.lP״�򤪅F ')\��h��6���/l���� { �P R���v��^��\\ ���          �   x���v
Q���W((M��L�+.I,)-N-�/J-,M-.Q��L�Q�K�M�T�s
�t��sW�q�Us�	u���
�:
�&)\���¾�m�^l��xa���5�'um2�4h͎{/�_l�����,�4|ׅ�6\�{a+�-�� XsK      $   �   x���v
Q���W((M��L�+�,H��O��M�I+�K.���+V��L�Q�K�M�T�s
�t��sW�q�Us�	u���
�:
��^�}a�]�.6\�q���֋�v]�qa���5�'�-5Y:hM����Jc�����wa3��=@��b7�:.. ���      ,   �   x�����P�}�bvHDⶲ�h�$TҖ�J\�hBS��XTxE��+̼�9,�@mff����Pu�f���t�v75��֨e'�;��1��^���J@���(	�F�0�*4�������I�a@>y��=�hK���Ƌf��%�4�9�Y{�o���jV�wv�>�-8�'��E^�t�xN�W6�\|MvB�����=w�EC����'�/�(onߧ         �  x����J�@ �{�bom!H6iSœ`����Ԃ'��J �!�xm+�AO"(*���
�`�<�����֪xN.��]
�,�1ʦ^�!�\��noǱwz^��Pζ$�4���v�ՔО���mYNSNg�nK���ÎK��v�m�Q��W�ƪQ^C�Y�7P}e}S�M����%9�W�!�O����r#`��;�ɐ�!�7zs��0�,�28��1lCa�8�A�'�9U��XNU�'^�9����W�9VY�AI�\`�k��p�3����-�B��0��/����ȱ����{�x4�8VU�`K��F���}�y8�����b8��w�/���`�)�/�;wDw3ݽٹ:��n��U��x($� ���"�'.�����N�CZ��'��P�E4E���|     