PGDMP  8    1            
    |            bon_deal_db     16.4 (Ubuntu 16.4-1.pgdg24.04+2)     16.4 (Ubuntu 16.4-1.pgdg24.04+2)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16504    bon_deal_db    DATABASE     w   CREATE DATABASE bon_deal_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'fr_FR.UTF-8';
    DROP DATABASE bon_deal_db;
                admin_bon_deal    false                        3079    16505 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16526    orders    TABLE       CREATE TABLE public.orders (
    order_number bigint NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deliver_ato date,
    user_uuid uuid
);
    DROP TABLE public.orders;
       public         heap    admin_bon_deal    false            �            1259    16525    orders_order_number_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.orders_order_number_seq;
       public          admin_bon_deal    false    218            �           0    0    orders_order_number_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;
          public          admin_bon_deal    false    217            �            1259    16552    orders_products    TABLE     j   CREATE TABLE public.orders_products (
    order_number bigint NOT NULL,
    product_uuid uuid NOT NULL
);
 #   DROP TABLE public.orders_products;
       public         heap    admin_bon_deal    false            �            1259    16551     orders_products_order_number_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_products_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.orders_products_order_number_seq;
       public          admin_bon_deal    false    221            �           0    0     orders_products_order_number_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.orders_products_order_number_seq OWNED BY public.orders_products.order_number;
          public          admin_bon_deal    false    220            �            1259    16541    products    TABLE     �  CREATE TABLE public.products (
    product_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(100) NOT NULL,
    product_description character varying(500),
    product_price numeric(10,2) NOT NULL,
    product_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.products;
       public         heap    admin_bon_deal    false    2            �            1259    16516    users    TABLE     <  CREATE TABLE public.users (
    user_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    user_password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.users;
       public         heap    admin_bon_deal    false    2            �           2604    16529    orders order_number    DEFAULT     z   ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);
 B   ALTER TABLE public.orders ALTER COLUMN order_number DROP DEFAULT;
       public          admin_bon_deal    false    217    218    218            �           2604    16555    orders_products order_number    DEFAULT     �   ALTER TABLE ONLY public.orders_products ALTER COLUMN order_number SET DEFAULT nextval('public.orders_products_order_number_seq'::regclass);
 K   ALTER TABLE public.orders_products ALTER COLUMN order_number DROP DEFAULT;
       public          admin_bon_deal    false    221    220    221            �          0    16526    orders 
   TABLE DATA           }   COPY public.orders (order_number, order_total_cost_ht, order_total_quantity, created_at, deliver_ato, user_uuid) FROM stdin;
    public          admin_bon_deal    false    218            �          0    16552    orders_products 
   TABLE DATA           E   COPY public.orders_products (order_number, product_uuid) FROM stdin;
    public          admin_bon_deal    false    221            �          0    16541    products 
   TABLE DATA           �   COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
    public          admin_bon_deal    false    219            �          0    16516    users 
   TABLE DATA           \   COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
    public          admin_bon_deal    false    216            �           0    0    orders_order_number_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.orders_order_number_seq', 10, true);
          public          admin_bon_deal    false    217            �           0    0     orders_products_order_number_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.orders_products_order_number_seq', 1, false);
          public          admin_bon_deal    false    220                       2606    16532    orders orders_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            admin_bon_deal    false    218                       2606    16557 $   orders_products orders_products_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (order_number, product_uuid);
 N   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_pkey;
       public            admin_bon_deal    false    221    221                       2606    16550    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            admin_bon_deal    false    219            �           2606    16522    users users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            admin_bon_deal    false    216                        2606    16524    users users_user_pseudo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_pseudo_key UNIQUE (user_pseudo);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_pseudo_key;
       public            admin_bon_deal    false    216                       2606    16558 1   orders_products orders_products_order_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_number_fkey FOREIGN KEY (order_number) REFERENCES public.orders(order_number);
 [   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_order_number_fkey;
       public          admin_bon_deal    false    218    221    3330            	           2606    16563 1   orders_products orders_products_product_uuid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);
 [   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_product_uuid_fkey;
       public          admin_bon_deal    false    219    3332    221                       2606    16533    orders orders_user_uuid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_uuid_fkey;
       public          admin_bon_deal    false    3326    218    216            �   e  x���˭�0E�tn�I�
�F���K���L�@��=8�0XHIC
��9;i�|՞Y��c�IhJ�X�)���Zf� �� h��2��T�Q7��_�qR�$A؋���St�����|�[�"�.�x��,(u_0�.���Z�]ω�y�����TW�!��n̸8���I���[K�q}�kk\^r��,�N�%z��j�F�3�ƨ6��I掣��~ҭ�C�,���,*?~�:��m�l:'�^������Ɩz�mNT����m�K��pĪ��#���1�#Y�i�����D��H�yH]e8�9f�����dG:�6�b:ǕccZ�֒�|����T���@?e۶���H      �   �   x��ϱ1D����@ �'p��/�*��͟]����"�C/xx��Z��`�)�1��x�� �
S�$"���2\n�$��3K�*���eE�1E`q���~��p�m�k�դ�v�i�Y���z����~�1�0^y�      �     x�U�͎�6���S���I��n�6@�ā��/-��Q����I��Ӝ�wb@$T�Uu�%�u�jU���9E}�*#yBoZ'��R�"�|O�W�~��8q\�mS���aY_$m���.�r��e]�,i�"��5Z���V�ӡ��~
���i�6h3�=%�m��*$T����>d���x�|�6fy<�z*��z�yL���5��/E�;x-�.�	�s�Y}?J�R�j�AC)��1+�ciT��0��<$�A�4�-g��e�L���LzЭh���V��l`;w`�*ntg|=��Q���`T�T�3�5:����T΅2w�.�e�u�}����D�ܮ>��kگkh��5o!k��º������qhB���ze����a�1i�2h&��:�:ǉ^����^+5 ,
)%�b�G��!T�sO����l���J:�6x�Q�X�i9m��4ɧ�f�D�V�����Z'k�ؽ3��[Юѹ���B�H�FM �CO��0��H��\��u�i��cQe��^֒�_��W�'~�M�^�K:�k�������}w�1o5}`w�Ɓ��=��H+��A�-��bH>z�ֶ���(�$?���ܢ6������
oI�^�-�oqXv�d-��)cy����
:1��"0Z���о���_�R�7]���ܒ�i�9�6�tE�h�H#��g�N�GߦN�i�>��0X����R�U�!�8����������ee����T��e�n�G<x'��ו��/� ]W�x��4�M��;�      �   �  x�=�Is�:���Wxq�v�	� �p	C�mdYv�ƌ���ܐ*-t��������C"��J`�nns�D�sM�cκʋ3t�O}����.��� �3�{�d��j;�#=�X8�ˏ�b�|�J��R���s��g���CLD�q1�ޡ�%#�L0����@G��b%	�P+�|�����������������!���v�G<G0;x�k��u=�ܮ�	
S�7�m08�̅�CD�Vcl����X *j0� �[#ht��c��;���6�j���&ga�8��s��/7:���ܷvRT��;���5�WO�`�',>�Ey����)���u����	3D&��
#��EAJc� s6M.�8�*;�ם;o��F����[�n�4�*���c"�Ր��|>E�>����!*L�N��"��$�&�B�a��`K2�#cQ���6mi��$���8�P8��>u��	6����0ӏ�_�8á�$ݼ��v|W�.�zܚ�W/��=�zco[.�-`�"u�
D�-�rb-$n`� "V��D�$���S��yf+挲[d�O���<��t֭dx���|�~���ж�}�˷Q0��8���S�u�&�uϳ"r��`ѡ���A<�Mch��JR	V��8�LA'N���Vi��nn�Wx �_�jU��z�/�V��y�|,����5���b2�.�0m���7���$
�r�������R8Mt��6�Q!�fѬ���TV�;��]zț�f���T�����R���էIQ��תo?V~�{���&���x]����ŰiO��L��A 
K���
am(RH$��۴:n�}��������Yc�-�x<��͟���of���H�f�^�K�W=�ʏ��K2\MŪ��1G�댾i n�Q�R��H֬9��J�Jj�@�B��M��8)�).*����"}�2�:��-]n����6��j�o1����s^ʔn���������ל�f��ڭV��ʔ�          �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16504    bon_deal_db    DATABASE     w   CREATE DATABASE bon_deal_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'fr_FR.UTF-8';
    DROP DATABASE bon_deal_db;
                admin_bon_deal    false                        3079    16505 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16526    orders    TABLE       CREATE TABLE public.orders (
    order_number bigint NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deliver_ato date,
    user_uuid uuid
);
    DROP TABLE public.orders;
       public         heap    admin_bon_deal    false            �            1259    16525    orders_order_number_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.orders_order_number_seq;
       public          admin_bon_deal    false    218            �           0    0    orders_order_number_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;
          public          admin_bon_deal    false    217            �            1259    16552    orders_products    TABLE     j   CREATE TABLE public.orders_products (
    order_number bigint NOT NULL,
    product_uuid uuid NOT NULL
);
 #   DROP TABLE public.orders_products;
       public         heap    admin_bon_deal    false            �            1259    16551     orders_products_order_number_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_products_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.orders_products_order_number_seq;
       public          admin_bon_deal    false    221            �           0    0     orders_products_order_number_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.orders_products_order_number_seq OWNED BY public.orders_products.order_number;
          public          admin_bon_deal    false    220            �            1259    16541    products    TABLE     �  CREATE TABLE public.products (
    product_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(100) NOT NULL,
    product_description character varying(500),
    product_price numeric(10,2) NOT NULL,
    product_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.products;
       public         heap    admin_bon_deal    false    2            �            1259    16516    users    TABLE     <  CREATE TABLE public.users (
    user_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    user_password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.users;
       public         heap    admin_bon_deal    false    2            �           2604    16529    orders order_number    DEFAULT     z   ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);
 B   ALTER TABLE public.orders ALTER COLUMN order_number DROP DEFAULT;
       public          admin_bon_deal    false    217    218    218            �           2604    16555    orders_products order_number    DEFAULT     �   ALTER TABLE ONLY public.orders_products ALTER COLUMN order_number SET DEFAULT nextval('public.orders_products_order_number_seq'::regclass);
 K   ALTER TABLE public.orders_products ALTER COLUMN order_number DROP DEFAULT;
       public          admin_bon_deal    false    221    220    221            �          0    16526    orders 
   TABLE DATA           }   COPY public.orders (order_number, order_total_cost_ht, order_total_quantity, created_at, deliver_ato, user_uuid) FROM stdin;
    public          admin_bon_deal    false    218   d%       �          0    16552    orders_products 
   TABLE DATA           E   COPY public.orders_products (order_number, product_uuid) FROM stdin;
    public          admin_bon_deal    false    221   �&       �          0    16541    products 
   TABLE DATA           �   COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
    public          admin_bon_deal    false    219   v'       �          0    16516    users 
   TABLE DATA           \   COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
    public          admin_bon_deal    false    216   �*       �           0    0    orders_order_number_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.orders_order_number_seq', 10, true);
          public          admin_bon_deal    false    217            �           0    0     orders_products_order_number_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.orders_products_order_number_seq', 1, false);
          public          admin_bon_deal    false    220                       2606    16532    orders orders_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            admin_bon_deal    false    218                       2606    16557 $   orders_products orders_products_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (order_number, product_uuid);
 N   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_pkey;
       public            admin_bon_deal    false    221    221                       2606    16550    products products_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            admin_bon_deal    false    219            �           2606    16522    users users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            admin_bon_deal    false    216                        2606    16524    users users_user_pseudo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_pseudo_key UNIQUE (user_pseudo);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_pseudo_key;
       public            admin_bon_deal    false    216                       2606    16558 1   orders_products orders_products_order_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_number_fkey FOREIGN KEY (order_number) REFERENCES public.orders(order_number);
 [   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_order_number_fkey;
       public          admin_bon_deal    false    218    221    3330            	           2606    16563 1   orders_products orders_products_product_uuid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);
 [   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_product_uuid_fkey;
       public          admin_bon_deal    false    219    3332    221                       2606    16533    orders orders_user_uuid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_uuid_fkey FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_uuid_fkey;
       public          admin_bon_deal    false    3326    218    216           