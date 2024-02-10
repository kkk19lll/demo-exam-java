PGDMP         %        	        |            request_remont_db    15.1    15.1 W    {           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            |           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            }           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ~           1262    44808    request_remont_db    DATABASE     �   CREATE DATABASE request_remont_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 !   DROP DATABASE request_remont_db;
                postgres    false            �            1259    44855    cause_of_malfunctions    TABLE     i   CREATE TABLE public.cause_of_malfunctions (
    id integer NOT NULL,
    name character varying(1000)
);
 )   DROP TABLE public.cause_of_malfunctions;
       public         heap    postgres    false            �            1259    44854    cause_of_malfunctions_id_seq    SEQUENCE     �   ALTER TABLE public.cause_of_malfunctions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cause_of_malfunctions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    44929 
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
       public         heap    postgres    false            �            1259    44928    equipments_id_seq    SEQUENCE     �   ALTER TABLE public.equipments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.equipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    44887 	   materials    TABLE     �   CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(1000),
    description character varying(1000),
    price character varying(1000)
);
    DROP TABLE public.materials;
       public         heap    postgres    false            �            1259    44886    materials_id_seq    SEQUENCE     �   ALTER TABLE public.materials ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    44913    materials_remonts    TABLE     s   CREATE TABLE public.materials_remonts (
    id integer NOT NULL,
    remont_id integer,
    material_id integer
);
 %   DROP TABLE public.materials_remonts;
       public         heap    postgres    false            �            1259    44912    materials_remonts_id_seq    SEQUENCE     �   ALTER TABLE public.materials_remonts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materials_remonts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    44839 
   prioritets    TABLE     ^   CREATE TABLE public.prioritets (
    id integer NOT NULL,
    name character varying(1000)
);
    DROP TABLE public.prioritets;
       public         heap    postgres    false            �            1259    44838    prioritets_id_seq    SEQUENCE     �   ALTER TABLE public.prioritets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.prioritets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    44895    remonts    TABLE       CREATE TABLE public.remonts (
    id integer NOT NULL,
    name character varying(1000),
    description character varying(1000),
    time_remont time without time zone,
    price_of_remont integer,
    status_remont_id integer,
    cause_of_malfunction_id integer
);
    DROP TABLE public.remonts;
       public         heap    postgres    false            �            1259    44894    remonts_id_seq    SEQUENCE     �   ALTER TABLE public.remonts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.remonts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    44952    requests    TABLE       CREATE TABLE public.requests (
    id integer NOT NULL,
    date_update date,
    equipment_id integer,
    type_of_malfunction_id integer,
    description_of_problem character varying(1000),
    user_id integer,
    prioritet_id integer,
    status_request_id integer
);
    DROP TABLE public.requests;
       public         heap    postgres    false            �            1259    44951    requests_id_seq    SEQUENCE     �   ALTER TABLE public.requests ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    44810    roles    TABLE     Y   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(1000)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    44809    roles_id_seq    SEQUENCE     �   ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    44871    statuses_equipment    TABLE     f   CREATE TABLE public.statuses_equipment (
    id integer NOT NULL,
    name character varying(1000)
);
 &   DROP TABLE public.statuses_equipment;
       public         heap    postgres    false            �            1259    44870    statuses_equipment_id_seq    SEQUENCE     �   ALTER TABLE public.statuses_equipment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    44863    statuses_remont    TABLE     c   CREATE TABLE public.statuses_remont (
    id integer NOT NULL,
    name character varying(1000)
);
 #   DROP TABLE public.statuses_remont;
       public         heap    postgres    false            �            1259    44862    statuses_remont_id_seq    SEQUENCE     �   ALTER TABLE public.statuses_remont ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_remont_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    44831    statuses_request    TABLE     d   CREATE TABLE public.statuses_request (
    id integer NOT NULL,
    name character varying(1000)
);
 $   DROP TABLE public.statuses_request;
       public         heap    postgres    false            �            1259    44830    statuses_request_id_seq    SEQUENCE     �   ALTER TABLE public.statuses_request ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    44847    type_of_malfunctions    TABLE     h   CREATE TABLE public.type_of_malfunctions (
    id integer NOT NULL,
    name character varying(1000)
);
 (   DROP TABLE public.type_of_malfunctions;
       public         heap    postgres    false            �            1259    44846    type_of_malfunctions_id_seq    SEQUENCE     �   ALTER TABLE public.type_of_malfunctions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.type_of_malfunctions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    44879    types_equipment    TABLE     c   CREATE TABLE public.types_equipment (
    id integer NOT NULL,
    name character varying(1000)
);
 #   DROP TABLE public.types_equipment;
       public         heap    postgres    false            �            1259    44878    types_equipment_id_seq    SEQUENCE     �   ALTER TABLE public.types_equipment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.types_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    44818    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    last_name character varying(1000),
    first_name character varying(1000),
    middle_name character varying(1000),
    login character varying(1000),
    password character varying(1000),
    role_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    44817    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            h          0    44855    cause_of_malfunctions 
   TABLE DATA                 public          postgres    false    225   e       v          0    44929 
   equipments 
   TABLE DATA                 public          postgres    false    239   "e       p          0    44887 	   materials 
   TABLE DATA                 public          postgres    false    233   <e       t          0    44913    materials_remonts 
   TABLE DATA                 public          postgres    false    237   Ve       d          0    44839 
   prioritets 
   TABLE DATA                 public          postgres    false    221   pe       r          0    44895    remonts 
   TABLE DATA                 public          postgres    false    235   �e       x          0    44952    requests 
   TABLE DATA                 public          postgres    false    241   �e       ^          0    44810    roles 
   TABLE DATA                 public          postgres    false    215   �e       l          0    44871    statuses_equipment 
   TABLE DATA                 public          postgres    false    229   �e       j          0    44863    statuses_remont 
   TABLE DATA                 public          postgres    false    227   �e       b          0    44831    statuses_request 
   TABLE DATA                 public          postgres    false    219   f       f          0    44847    type_of_malfunctions 
   TABLE DATA                 public          postgres    false    223   &f       n          0    44879    types_equipment 
   TABLE DATA                 public          postgres    false    231   @f       `          0    44818    users 
   TABLE DATA                 public          postgres    false    217   Zf                  0    0    cause_of_malfunctions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.cause_of_malfunctions_id_seq', 1, false);
          public          postgres    false    224            �           0    0    equipments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.equipments_id_seq', 1, false);
          public          postgres    false    238            �           0    0    materials_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.materials_id_seq', 1, false);
          public          postgres    false    232            �           0    0    materials_remonts_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.materials_remonts_id_seq', 1, false);
          public          postgres    false    236            �           0    0    prioritets_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.prioritets_id_seq', 1, false);
          public          postgres    false    220            �           0    0    remonts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.remonts_id_seq', 1, false);
          public          postgres    false    234            �           0    0    requests_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.requests_id_seq', 1, false);
          public          postgres    false    240            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    214            �           0    0    statuses_equipment_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.statuses_equipment_id_seq', 1, false);
          public          postgres    false    228            �           0    0    statuses_remont_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.statuses_remont_id_seq', 1, false);
          public          postgres    false    226            �           0    0    statuses_request_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.statuses_request_id_seq', 1, false);
          public          postgres    false    218            �           0    0    type_of_malfunctions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.type_of_malfunctions_id_seq', 1, false);
          public          postgres    false    222            �           0    0    types_equipment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.types_equipment_id_seq', 1, false);
          public          postgres    false    230            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    216            �           2606    44861 0   cause_of_malfunctions cause_of_malfunctions_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.cause_of_malfunctions
    ADD CONSTRAINT cause_of_malfunctions_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.cause_of_malfunctions DROP CONSTRAINT cause_of_malfunctions_pkey;
       public            postgres    false    225            �           2606    44935    equipments equipments_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_pkey;
       public            postgres    false    239            �           2606    44893    materials materials_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            postgres    false    233            �           2606    44917 (   materials_remonts materials_remonts_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.materials_remonts
    ADD CONSTRAINT materials_remonts_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.materials_remonts DROP CONSTRAINT materials_remonts_pkey;
       public            postgres    false    237            �           2606    44845    prioritets prioritets_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.prioritets
    ADD CONSTRAINT prioritets_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.prioritets DROP CONSTRAINT prioritets_pkey;
       public            postgres    false    221            �           2606    44901    remonts remonts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.remonts
    ADD CONSTRAINT remonts_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.remonts DROP CONSTRAINT remonts_pkey;
       public            postgres    false    235            �           2606    44958    requests requests_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_pkey;
       public            postgres    false    241            �           2606    44816    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    215            �           2606    44877 *   statuses_equipment statuses_equipment_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.statuses_equipment
    ADD CONSTRAINT statuses_equipment_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.statuses_equipment DROP CONSTRAINT statuses_equipment_pkey;
       public            postgres    false    229            �           2606    44869 $   statuses_remont statuses_remont_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.statuses_remont
    ADD CONSTRAINT statuses_remont_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.statuses_remont DROP CONSTRAINT statuses_remont_pkey;
       public            postgres    false    227            �           2606    44837 &   statuses_request statuses_request_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.statuses_request
    ADD CONSTRAINT statuses_request_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.statuses_request DROP CONSTRAINT statuses_request_pkey;
       public            postgres    false    219            �           2606    44853 .   type_of_malfunctions type_of_malfunctions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.type_of_malfunctions
    ADD CONSTRAINT type_of_malfunctions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.type_of_malfunctions DROP CONSTRAINT type_of_malfunctions_pkey;
       public            postgres    false    223            �           2606    44885 $   types_equipment types_equipment_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.types_equipment
    ADD CONSTRAINT types_equipment_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.types_equipment DROP CONSTRAINT types_equipment_pkey;
       public            postgres    false    231            �           2606    44824    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           2606    44946 $   equipments equipments_remont_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_remont_id_fkey FOREIGN KEY (remont_id) REFERENCES public.remonts(id);
 N   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_remont_id_fkey;
       public          postgres    false    235    239    3259            �           2606    44941 1   equipments equipments_status_of_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_status_of_equipment_id_fkey FOREIGN KEY (status_of_equipment_id) REFERENCES public.statuses_equipment(id);
 [   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_status_of_equipment_id_fkey;
       public          postgres    false    229    239    3253            �           2606    44936 ,   equipments equipments_type_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_type_equipment_id_fkey FOREIGN KEY (type_equipment_id) REFERENCES public.types_equipment(id);
 V   ALTER TABLE ONLY public.equipments DROP CONSTRAINT equipments_type_equipment_id_fkey;
       public          postgres    false    231    239    3255            �           2606    44923 4   materials_remonts materials_remonts_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_remonts
    ADD CONSTRAINT materials_remonts_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);
 ^   ALTER TABLE ONLY public.materials_remonts DROP CONSTRAINT materials_remonts_material_id_fkey;
       public          postgres    false    237    3257    233            �           2606    44918 2   materials_remonts materials_remonts_remont_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_remonts
    ADD CONSTRAINT materials_remonts_remont_id_fkey FOREIGN KEY (remont_id) REFERENCES public.remonts(id);
 \   ALTER TABLE ONLY public.materials_remonts DROP CONSTRAINT materials_remonts_remont_id_fkey;
       public          postgres    false    237    235    3259            �           2606    44907 ,   remonts remonts_cause_of_malfunction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remonts
    ADD CONSTRAINT remonts_cause_of_malfunction_id_fkey FOREIGN KEY (cause_of_malfunction_id) REFERENCES public.cause_of_malfunctions(id);
 V   ALTER TABLE ONLY public.remonts DROP CONSTRAINT remonts_cause_of_malfunction_id_fkey;
       public          postgres    false    235    225    3249            �           2606    44902 %   remonts remonts_status_remont_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remonts
    ADD CONSTRAINT remonts_status_remont_id_fkey FOREIGN KEY (status_remont_id) REFERENCES public.statuses_remont(id);
 O   ALTER TABLE ONLY public.remonts DROP CONSTRAINT remonts_status_remont_id_fkey;
       public          postgres    false    3251    235    227            �           2606    44959 #   requests requests_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipments(id);
 M   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_equipment_id_fkey;
       public          postgres    false    3263    239    241            �           2606    44974 #   requests requests_prioritet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_prioritet_id_fkey FOREIGN KEY (prioritet_id) REFERENCES public.prioritets(id);
 M   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_prioritet_id_fkey;
       public          postgres    false    221    241    3245            �           2606    44979 (   requests requests_status_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_status_request_id_fkey FOREIGN KEY (status_request_id) REFERENCES public.statuses_request(id);
 R   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_status_request_id_fkey;
       public          postgres    false    3243    241    219            �           2606    44964 -   requests requests_type_of_malfunction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_type_of_malfunction_id_fkey FOREIGN KEY (type_of_malfunction_id) REFERENCES public.type_of_malfunctions(id);
 W   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_type_of_malfunction_id_fkey;
       public          postgres    false    3247    223    241            �           2606    44969    requests requests_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_user_id_fkey;
       public          postgres    false    217    3241    241            �           2606    44825    users users_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    215    3239    217            h   
   x���          v   
   x���          p   
   x���          t   
   x���          d   
   x���          r   
   x���          x   
   x���          ^   
   x���          l   
   x���          j   
   x���          b   
   x���          f   
   x���          n   
   x���          `   
   x���         