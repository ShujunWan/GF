--# -path=.:../romance:../abstract:../../prelude

concrete BasicSpa of Basic = CategoriesSpa ** open ParadigmsSpa, BeschSpa in {

-- words contributed by Ana Bove, May 2005
---- TO CHECK: verb conjugations marked ----V

flags 
  startcat=Phr ; lexer=textlit ; unlexer=text ;
  optimize=values ;

lin
   airplane_N = regN "aeroplano" ;	-- avi�n  is masculine
   answer_V2S = mkV2S (regV "responder") dative ;
   apartment_N = regN "apartamento" ;
   apple_N = regN "manzana" ;
   art_N = regN "arte" ;	
   ask_V2Q = mkV2Q (regV "preguntar") dative ;
   baby_N = regN "beb�" ;		-- can be used for both fem. & masc.
   bad_ADeg = prefADeg (mkADeg (regA "malo") (regA "peor")) ;
   bank_N = regN "banco" ;
   beautiful_ADeg = prefADeg (regADeg "bello") ;	-- bella
   become_VA = regV "conventir" ;  --- convertirse en, volverse, ponerse
   beer_N = regN "cerveza" ;
   beg_V2V = mkV2V (regV "rogar") accusative dative ;   -- pedir
   big_ADeg = prefADeg (regADeg "grande") ;
   bike_N = regN "bicicleta" ;
   bird_N = regN "p�jaro" ;
   black_ADeg = regADeg "negro" ;	-- negra
   blue_ADeg = regADeg "azul" ;
   boat_N = regN "bote" ;
   book_N = regN "libro" ;
   boot_N = regN "bota" ;
   boss_N = regN "jefe" ;
   boy_N = regN "ni�o" ;
   bread_N = regN "pan" ;
   break_V2 = dirV2 (special_ppV (regV "romper") "roto") ;
   broad_ADeg = regADeg "ancho" ;
   brother_N2 = deN2 (regN "hermano") ;
   brown_ADeg = regADeg "marr�n" ; --- *
   butter_N = regN "manteca" ;
   buy_V2 = dirV2 (regV "comprar") ;
   camera_N = regN "c�mara" ; -- ["m�quina fotogr�fica"]
   cap_N = regN "gorra" ;
   car_N = regN "auto" ;
   carpet_N = regN "alfombra" ;
   cat_N = regN "gato" ;		-- gata
   ceiling_N = regN "techo" ;
   chair_N = regN "silla" ;
   cheese_N = regN "queso" ;
   child_N = regN "ni�o" ;		-- ni�a
   church_N = regN "iglesia" ;
   city_N = femN (regN "ciudad") ;		-- fem
   clean_ADeg = regADeg "limpio" ;
   clever_ADeg = regADeg "inteligente" ;
   close_V2 = dirV2 (regV "cerrar") ;
   coat_N = regN "abrigo" ;
   cold_ADeg = regADeg "fr�o" ;		-- fr�a
   come_V = verboV (venir_82 "venir") ;
   computer_N = regN "computadora" ;		-- also computador, ordenador in Spain
   country_N = regN "pa�s" ;		-- masc
   cousin_N = regN "primo" ;
   cow_N = regN "vaca" ;
   die_V = verboV (morir_35b "morir") ;
   dirty_ADeg = regADeg "sucio" ;
   distance_N3 = mkN3 (regN "distancia") genitive dative ;
   doctor_N = regN "m�dico" ;		-- m�dica
   dog_N = regN "perro" ;		-- perra
   door_N = regN "puerta" ;
   drink_V2 = dirV2 (regV "tomar") ;     -- beber
   easy_A2V = mkA2V (regA "f�cil") dative genitive ;
   eat_V2 = dirV2 (regV "comer") ;
   empty_ADeg = regADeg "vac�o" ;
   enemy_N = regN "enemigo" ;		-- enemiga
   factory_N = regN "f�brica" ;	
   father_N2 = deN2 (regN "padre") ;
   fear_VS = mkVS (regV "temer") ;
   find_V2 = dirV2 (regV "encontrar") ;
   fish_N = mascN (regN "pez") ;
   floor_N = regN "suelo" ;		-- piso
   forget_V2 = dirV2 (regV "olvidar") ;
   fridge_N = regN "heladera" ;
   friend_N = regN "amigo" ;		-- amiga
   fruit_N = regN "fruta" ;
   fun_AV = mkAV (regA "divertido") genitive ;		-- entretenido
   garden_N = regN "jard�n" ;
   girl_N = regN "ni�a" ;
   glove_N = regN "guante" ;
   gold_N = regN "oro" ;
   good_ADeg = prefADeg (mkADeg (regA "bueno") (regA "mejor")) ; ---- adv?
   go_V = (verboV (ir_46 "ir")) ;
   green_ADeg = regADeg "verde" ;
   harbour_N = regN "puerto" ;
   hate_V2 = dirV2 (regV "odiar") ;
   hat_N = regN "sombrero" ;
   have_V2 = dirV2 (verboV (tener_4 "tener")) ;
   hear_V2 = mkV2 (regV "escuchar") dative ; -- o�r_51 
   hill_N = regN "colina" ;
   hope_VS = mkVS (regV "esperar") ;
   horse_N = regN "caballo" ;
   hot_ADeg = regADeg "caliente" ;
   house_N = regN "casa" ;
   important_ADeg = regADeg "importante" ;
   industry_N = regN "industria" ;
   iron_N = regN "fierro" ;
   king_N = regN "rey" ;
   know_V2 = dirV2 (verboV (saber_71 "saber")) ; --   conocer
   lake_N = regN "lago" ;
   lamp_N = regN "l�mpara" ;
   learn_V2 = dirV2 (regV "aprender") ;
   leather_N = regN "cuero" ;
   leave_V2 = dirV2 (regV "partir") ;	-- irse, dejar
   like_V2 = dirV2 (regV "gustar") ;
   listen_V2 = dirV2 (regV "escuchar") ;
   live_V = verboV (vivir_7 "vivir") ;
   long_ADeg = regADeg "largo" ;
   lose_V2 = dirV2 (verboV (defender_29 "perder")) ;
   love_N = regN "amor" ;
   love_V2 = dirV2 (regV "amar") ;
   man_N = regN "hombre" ;		-- masc
   married_A2 = mkA2 (regA "casado") dative ;
   meat_N = femN (regN "carne") ;
   milk_N = femN (regN "leche") ;
   moon_N = regN "luna" ;
   mother_N2 = deN2 (femN (regN "madre")) ;	-- fem
   mountain_N = regN "monta�a" ;
   music_N = regN "m�sica" ;
   narrow_ADeg = regADeg "estrecho" ;
   new_ADeg = prefADeg (regADeg "nuevo") ;
   newspaper_N = regN "peri�dico" ;		-- diario  
   oil_N = regN "aceite" ;
   old_ADeg =  prefADeg (regADeg "viejo") ;
   open_V2 = dirV2 (special_ppV (regV "abrir") "abierto") ;
   paint_V2A = mkV2A (regV "pintar") accusative ;
   paper_N = regN "papel" ;
   peace_N = femN (regN "paz") ;
   pen_N = regN "lapicera" ;
   planet_N = mascN (regN "planeta") ;
   plastic_N = regN "pl�stico" ;
   play_V2 = dirV2 (verboV (jugar_47 "jugar")) ;
   policeman_N = mascN (regN "polic�a") ;	-- fem refers to the institution
   priest_N = mascN (regN "cura") ;		-- masc
   probable_AS = mkAS (regA "probable") ;	
   queen_N = regN "reina" ;
   radio_N = femN (regN "radio") ;
   rain_V0 = mkV0 (verboV (llover_89 "llover")) ;
   read_V2 = dirV2 (verboV (creer_26 "leer")) ;
   red_ADeg = regADeg "rojo" ;
   religion_N = mkN "religi�n" "religiones" feminine ;
   restaurant_N = regN "restaurante" ;		-- restor�n, restaur�n, masc
   river_N = regN "r�o" ;
   rock_N = regN "roca" ;
   roof_N = regN "techo" ;
   rubber_N = regN "goma" ;
   run_V = regV "correr" ;
   say_VS = mkVS (verboV (decir_28 "decir")) ;
   school_N = regN "escuela" ;
   science_N = regN "ciencia" ;
   sea_N = regN "mar" ;			-- masc & fem 
   seek_V2 = dirV2 (regV "buscar") ;
   see_V2 = dirV2 (verboV (ver_83 "ver")) ;
   sell_V3 = dirV3 (regV "vender") dative ;
   send_V3 = dirV3 (regV "mandar") dative ;
   sheep_N = regN "oveja" ;
   ship_N = femN (regN "nave") ;
   shirt_N = regN "camisa" ;
   shoe_N = regN "zapato" ;
   shop_N = regN "negocio" ;
   short_ADeg = regADeg "corto" ; --- breve
   silver_N = regN "plata" ;
   sister_N = regN "hermana" ;
   sleep_V = verboV (dormir_35 "dormir") ;
   small_ADeg = prefADeg (regADeg "peque�o") ;
   snake_N = femN (regN "serpiente") ;		-- fem
   sock_N = regN "media" ;
   speak_V2 = dirV2 (regV "hablar") ;
   star_N = regN "estrella" ;
   steel_N = regN "acero" ;
   stone_N = regN "piedra" ;
   stove_N = regN "horno" ;		-- estufa
   student_N = regN "estudiante" ;	-- used both for fem & masc
   stupid_ADeg = regADeg "est�pido" ;
   sun_N = regN "sol" ;	
   switch8off_V2 = dirV2 (regV "apagar") ;
   switch8on_V2 = dirV2 (regV "prender") ;
   table_N = regN "mesa" ; 
   talk_V3 = mkV3 (regV "hablar") dative genitive ;
   teacher_N = regN "maestro" ;		-- maestra
   teach_V2 = dirV2 (regV "ense�ar") ;
   television_N = mkN "televisi�n" "televisiones" feminine ;	-- televisor masc
   thick_ADeg = regADeg "grueso" ;
   thin_ADeg = regADeg "fino" ;			-- delgado
   train_N = regN "tren" ;
   travel_V = regV "viajar" ;
   tree_N = regN "�rbol" ;
  --- trousers_N = regN "pantal�n" ;	-- masc
   ugly_ADeg = regADeg "feo" ;
   understand_V2 = dirV2 (regV "entender") ;
   university_N = femN (regN "universidad") ;
   village_N = regN "pueblo" ;
   wait_V2 = mkV2 (regV "esperar") dative ;
   walk_V = regV "caminar" ;
   warm_ADeg = regADeg "tibio" ;
   war_N = regN "guerra" ;
   watch_V2 = dirV2 (regV "mirar") ;		-- ver
   water_N = mascN (regN "agua") ;
   white_ADeg = compADeg (regA "blanco") ;
   window_N = regN "ventana" ;
   wine_N = regN "vino" ;
   win_V2 = dirV2 (regV "ganar") ;
   woman_N = regN "mujer" ;		-- fem
   wonder_VQ = mkVQ (regV "preguntar") ; ---- preguntarse 
   wood_N = regN "madera" ;
   write_V2 = dirV2 (special_ppV (regV "escribir") "escrito") ;
   yellow_ADeg = regADeg "amarillo" ;
   young_ADeg = prefADeg (regADeg "joven") ;

   do_V2 =  dirV2 (verboV (hacer_44 "hacer")) ;
   now_Adv = mkAdv "ahora" ;
   already_Adv = mkAdv "ya" ;
   song_N = mkN "canci�n" "canciones" feminine ;
   add_V3 = dirV3 (regV "sumar") dative ;
   number_N = regN "n�mero" ;
   put_V2 = dirV2 (verboV (poner_60 "poner")) ;
   stop_V = regV "parar" ; 
   jump_V = regV "saltar" ;
   here_Adv = mkAdv "aqu�" ;		-- ac�
   here7to_Adv = mkAdv ["para ac�"] ;
   here7from_Adv = mkAdv ["de ac�"] ;
   there_Adv = mkAdv "all�" ;		-- all�
   there7to_Adv = mkAdv ["para all�"] ;
   there7from_Adv = mkAdv ["de all�"] ;	

} ;
