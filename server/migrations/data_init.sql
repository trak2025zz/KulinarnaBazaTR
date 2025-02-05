--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: przepis; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.przepis (
    id_przepisu integer NOT NULL,
    tytul text NOT NULL,
    opis text NOT NULL,
    czas_przygotowania numeric,
    cena numeric,
    wyswietlenia integer,
    autor integer NOT NULL,
    zdjecie text,
    data_publikacji date NOT NULL
);


ALTER TABLE public.przepis OWNER TO kulinarna;

--
-- Name: Przepis_id_przepisu_seq; Type: SEQUENCE; Schema: public; Owner: kulinarna
--

CREATE SEQUENCE public."Przepis_id_przepisu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Przepis_id_przepisu_seq" OWNER TO kulinarna;

--
-- Name: Przepis_id_przepisu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kulinarna
--

ALTER SEQUENCE public."Przepis_id_przepisu_seq" OWNED BY public.przepis.id_przepisu;


--
-- Name: artykul; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.artykul (
    id_artykulu integer NOT NULL,
    tytul text NOT NULL,
    opis text NOT NULL,
    zdjecie bytea,
    autor integer NOT NULL,
    data_publikacji date
);


ALTER TABLE public.artykul OWNER TO kulinarna;

--
-- Name: artykul_id_artykulu_seq; Type: SEQUENCE; Schema: public; Owner: kulinarna
--

CREATE SEQUENCE public.artykul_id_artykulu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artykul_id_artykulu_seq OWNER TO kulinarna;

--
-- Name: artykul_id_artykulu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kulinarna
--

ALTER SEQUENCE public.artykul_id_artykulu_seq OWNED BY public.artykul.id_artykulu;


--
-- Name: komentarz; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.komentarz (
    id_komentarza integer NOT NULL,
    opis text NOT NULL,
    id_uzytkownika integer NOT NULL,
    id_artykulu integer,
    id_przepisu integer
);


ALTER TABLE public.komentarz OWNER TO kulinarna;

--
-- Name: komentarz_id_komentarza_seq; Type: SEQUENCE; Schema: public; Owner: kulinarna
--

CREATE SEQUENCE public.komentarz_id_komentarza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.komentarz_id_komentarza_seq OWNER TO kulinarna;

--
-- Name: komentarz_id_komentarza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kulinarna
--

ALTER SEQUENCE public.komentarz_id_komentarza_seq OWNED BY public.komentarz.id_komentarza;


--
-- Name: plan; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.plan (
    id_uzytkownika integer NOT NULL,
    data date NOT NULL,
    id_przepisu integer NOT NULL
);


ALTER TABLE public.plan OWNER TO kulinarna;

--
-- Name: skladnik; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.skladnik (
    id_skladnik integer NOT NULL,
    nazwa text NOT NULL,
    cena numeric
);


ALTER TABLE public.skladnik OWNER TO kulinarna;

--
-- Name: skladnik_id_skladnik_seq; Type: SEQUENCE; Schema: public; Owner: kulinarna
--

CREATE SEQUENCE public.skladnik_id_skladnik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skladnik_id_skladnik_seq OWNER TO kulinarna;

--
-- Name: skladnik_id_skladnik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kulinarna
--

ALTER SEQUENCE public.skladnik_id_skladnik_seq OWNED BY public.skladnik.id_skladnik;


--
-- Name: skladnik_w_lodowce; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.skladnik_w_lodowce (
    id_uzytkownika integer NOT NULL,
    id_skladnik integer NOT NULL
);


ALTER TABLE public.skladnik_w_lodowce OWNER TO kulinarna;

--
-- Name: skladnik_w_przepisie; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.skladnik_w_przepisie (
    id_przepisu integer NOT NULL,
    id_skladnika integer NOT NULL,
    ilosc text
);


ALTER TABLE public.skladnik_w_przepisie OWNER TO kulinarna;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.tag (
    id_tagu integer NOT NULL,
    nazwa text NOT NULL
);


ALTER TABLE public.tag OWNER TO kulinarna;

--
-- Name: tag_id_tagu_seq; Type: SEQUENCE; Schema: public; Owner: kulinarna
--

CREATE SEQUENCE public.tag_id_tagu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_tagu_seq OWNER TO kulinarna;

--
-- Name: tag_id_tagu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kulinarna
--

ALTER SEQUENCE public.tag_id_tagu_seq OWNED BY public.tag.id_tagu;


--
-- Name: tag_w_przepisie; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.tag_w_przepisie (
    id_tagu integer,
    id_przepisu integer
);


ALTER TABLE public.tag_w_przepisie OWNER TO kulinarna;

--
-- Name: ulubione; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.ulubione (
    id_przepisu integer NOT NULL,
    id_uzytkownika integer NOT NULL
);


ALTER TABLE public.ulubione OWNER TO kulinarna;

--
-- Name: uzytkownik; Type: TABLE; Schema: public; Owner: kulinarna
--

CREATE TABLE public.uzytkownik (
    id_uzytkownika integer NOT NULL,
    imie character varying(50) NOT NULL,
    nazwisko character varying(50) NOT NULL,
    haslo character varying(200) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.uzytkownik OWNER TO kulinarna;

--
-- Name: uzytkownik_id_uzytkownika_seq; Type: SEQUENCE; Schema: public; Owner: kulinarna
--

CREATE SEQUENCE public.uzytkownik_id_uzytkownika_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.uzytkownik_id_uzytkownika_seq OWNER TO kulinarna;

--
-- Name: uzytkownik_id_uzytkownika_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kulinarna
--

ALTER SEQUENCE public.uzytkownik_id_uzytkownika_seq OWNED BY public.uzytkownik.id_uzytkownika;


--
-- Name: artykul id_artykulu; Type: DEFAULT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.artykul ALTER COLUMN id_artykulu SET DEFAULT nextval('public.artykul_id_artykulu_seq'::regclass);


--
-- Name: komentarz id_komentarza; Type: DEFAULT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.komentarz ALTER COLUMN id_komentarza SET DEFAULT nextval('public.komentarz_id_komentarza_seq'::regclass);


--
-- Name: przepis id_przepisu; Type: DEFAULT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.przepis ALTER COLUMN id_przepisu SET DEFAULT nextval('public."Przepis_id_przepisu_seq"'::regclass);


--
-- Name: skladnik id_skladnik; Type: DEFAULT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.skladnik ALTER COLUMN id_skladnik SET DEFAULT nextval('public.skladnik_id_skladnik_seq'::regclass);


--
-- Name: tag id_tagu; Type: DEFAULT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.tag ALTER COLUMN id_tagu SET DEFAULT nextval('public.tag_id_tagu_seq'::regclass);


--
-- Name: uzytkownik id_uzytkownika; Type: DEFAULT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.uzytkownik ALTER COLUMN id_uzytkownika SET DEFAULT nextval('public.uzytkownik_id_uzytkownika_seq'::regclass);


--
-- Data for Name: artykul; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.artykul (id_artykulu, tytul, opis, zdjecie, autor, data_publikacji) FROM stdin;
1	Najlepsza mąka do chleba	O przeznaczeniu mąki mówi liczba, którą znajdziemy na opakowaniu, czyli tak zwany typ. Im wyższa jest ta wartość, tym więcej składników mineralnych zawiera mąka. Do wypieku pieczywa najlepsze są mąki o wyższym typie. Mąka pszenna typ 650, czyli mąka bułkowa, będzie dobra do wypieku chleba i bułek. Najbardziej popularna i uniwersalna jest mąka chlebowa, czyli typy 750-850, która sprawdzi się w przepisach na chleb i ciasta. Mąka pszenna typu graham (1850) nadaje się do wypieku bułek oraz chleba mieszanego i pełnoziarnistego. Pieczywo pełnoziarniste i mieszane zrobimy także z mąki pszennej typu 2000 – to mąka razowa lub pełnoziarnista, o ciemnym kolorze i największej zawartości błonnika oraz innych składników mineralnych, w porównaniu do innych mąk. Mąka pszenna ma gluten, dzięki któremu ciasto ładnie rośnie.\n\n	\\x2e2f696d616765732f61727469636c655f315f7468756d626e61696c2e706e67	37	2024-05-27
2	lorem ipsum	lorem ipsum 	\\x2e2f696d616765732f61727469636c655f325f7468756d626e61696c2e706e67	38	2024-05-27
\.


--
-- Data for Name: komentarz; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.komentarz (id_komentarza, opis, id_uzytkownika, id_artykulu, id_przepisu) FROM stdin;
1	witam, czy zamiast mąki można użyć azbestu? pozdrawiam cieplutko z całą rodzinką 👌	37	\N	5
3	bardzo dobry	38	2	\N
4	 aaaa	40	1	\N
\.


--
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.plan (id_uzytkownika, data, id_przepisu) FROM stdin;
39	2024-06-07	2
40	2024-10-09	1
\.


--
-- Data for Name: przepis; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.przepis (id_przepisu, tytul, opis, czas_przygotowania, cena, wyswietlenia, autor, zdjecie, data_publikacji) FROM stdin;
3	Naleśniki z serem	1 - 500 gramów twarogu zmiel w maszynce na średnich oczkach lub tylko ugnieć dokładnie widelcem. Gładkiego sera twarogowego śmietankowego oraz takiego z kubełka nie trzeba już mielić. Do twarogu dodaj też żółtko jajka (można pominąć); minimum trzy łyżki cukru; dwie łyżki kwaśnej śmietany lub kremowego jogurtu naturalnego oraz odrobinę nasion z laski wanilii, lub tez pastę albo esencję waniliową. Bardzo dokładnie wymieszaj słodki twaróg do naleśników. 2 - 500 gramów twarogu zmiel w maszynce na średnich oczkach lub tylko ugnieć dokładnie widelcem. Gładkiego sera twarogowego śmietankowego oraz takiego z kubełka nie trzeba już mielić. Do twarogu dodaj też żółtko jajka (można pominąć); minimum trzy łyżki cukru; dwie łyżki kwaśnej śmietany lub kremowego jogurtu naturalnego oraz odrobinę nasion z laski wanilii, lub tez pastę albo esencję waniliową. Bardzo dokładnie wymieszaj słodki twaróg do naleśników. Do dużej miski wsyp 210 gramów mąki pszennej np. tortowej. Wbij trzy jajka trzymane w temperaturze pokojowej. Wlej też szklankę ciepłej wody i pół szklanki ciepłego mleka. Do tego jeszcze łyżka drobnego cukru i ewentualnie szczypta soli. Całość wymieszaj dokładnie przy pomocy miksera lub blendera ręcznego typu żyrafa. Na koniec wlej masło. Roztopione masło wlewaj do ciasta cienką strużką. Ciasto naleśnikowe mieszaj dalej jeszcze chwilę. Możesz je odstawić na 10 minut, by odpoczęło. Nie jest to jednak konieczne, jeśli tylko mleko i woda nie były zimne. 3 - Do dużej miski wsyp 210 gramów mąki pszennej np. tortowej. Wbij trzy jajka trzymane w temperaturze pokojowej. Wlej też szklankę ciepłej wody i pół szklanki ciepłego mleka. Do tego jeszcze łyżka drobnego cukru i ewentualnie szczypta soli. Całość wymieszaj dokładnie przy pomocy miksera lub blendera ręcznego typu żyrafa. Na koniec wlej masło. Roztopione masło wlewaj do ciasta cienką strużką. Ciasto naleśnikowe mieszaj dalej jeszcze chwilę. Możesz je odstawić na 10 minut, by odpoczęło. Nie jest to jednak konieczne, jeśli tylko mleko i woda nie były zimne. Zamieszaj ciasto i małą chochlą odmierz porcję na naleśnika. Wylej na patelnię tyle ciasta, by masa swobodnie przykryła powierzchnię patelni. Placki na naleśniki z serem smażę trochę grubsze niż zawsze. Przy każdym nalewaniu porcji na naleśnika podnoszę patelnię nad palnik. Od razu poruszam patelnią tak, by ciasto rozeszło się po całej powierzchni. Po około minucie przewracaj placek na drugą stronę. Druga strona potrzebuje zazwyczaj trochę mniej czasu, czyli około 30-40 sekund. Tutaj może Ci się przydać płaska łopatka do przewracania naleśników	50	40	1	37	./images/recipeid_3_thumbnail.png	2024-05-27
1	Chlebek bananowy	1 - Aby upiec perfekcyjny chlebek bananowy bardzo ważne jest to, by użyć odpowiednią ilość rozgniecionych bananów. Potrzebujesz zatem trzy duże, bardzo dojrzałe banany. Ponieważ wielkość i grubość bananów bywa różna, to dla ułatwienia możesz przełożyć ugniecione widelcem banany do szklanki o pojemności 250 ml. Powinno Ci wyjść około 1,5 szklanki rozgniecionych bananów. Jeśli masz wagę, to będzie to 350 gramów pulpy bananowej. 2 - Masło roztop w mikrofalówce i dodaj do miski z rozgniecionymi bananami. Potrzebujesz około 1/3 kostki masła (masło o wadze 200 gramów). Ja odmierzam zawsze 70 gramów masła. Roztopione masło dodaję lekko ciepłe. 3 - Do osobnej miseczki dodaj mniej więcej połowę szklanki drobnego cukru. Będzie to około 130 gramów cukru. Wbij też jedno duże jajko. Jajko z cukrem roztrzep dokładnie widelcem. Użycie miksera nie jest konieczne, jednak jeśli możesz i masz ochotę, to polecam zmiksować jajko z cukrem, by powstała puszysta, jasna piana. Ciasto wyrasta wówczas jeszcze wyższe. Mieszankę jajka z cukrem dodaj do bananów z masłem i wymieszaj. 4 - Do osobnej miseczki dodaj mniej więcej połowę szklanki drobnego cukru. Będzie to około 130 gramów cukru. Wbij też jedno duże jajko. Jajko z cukrem roztrzep dokładnie widelcem. Użycie miksera nie jest konieczne, jednak jeśli możesz i masz ochotę, to polecam zmiksować jajko z cukrem, by powstała puszysta, jasna piana. Ciasto wyrasta wówczas jeszcze wyższe. Mieszankę jajka z cukrem dodaj do bananów z masłem i wymieszaj. 5 - Przy pomocy łyżki lub szpatułki wymieszaj ciasto. Powstanie ciasto gęstsze od budyniu. Ciasto przełóż do formy delikatnie wysmarowanej od środka np. resztkami masła i obsypanej odrobiną bułki tartej. Jeśli został Ci jeszcze jakiś banan, to możesz przekroić go wzdłuż i ułożyć na cieście. 6 - Formę z ciastem umieść na środkowej półce, w piekarniku nagrzanym do 170 stopni. Ustaw opcję pieczenia góra/dół. Ciasto piecz 55-60 minut. Po około 50 minutach sprawdź, czy ciasto jest już upieczone. Ostrożnie uchyl drzwi piekarnika i wbij w ciasto drewniany patyczek do szaszłyków. Jeśli po wyjęciu patyczek jest suchy, to znaczy, że chlebek bananowy jest już upieczony	75	20	13	37	./images/recipeid_1_thumbnail.png	2024-05-27
5	Ciasto z truskawkami	1 - Do średniej wielkości szklanego lub metalowego naczynia wsyp około 3/4 szklanki drobnego cukru. Będzie to 170-180 gramów cukru. Wbij pięć średniej wielkości jajek. Cukier z jajkami ubijaj mikserem na wysokich obrotach przez kilka minut. Cukier powinien całkowicie rozpuścić się w jajkach. Pod koniec ubijania ma powstać puszysta i jasna masa. Kostkę prawdziwego masła, czyli 200 gramów roztop w mikrofalówce, w  rondelku na minimalnej mocy palnika lub w kąpieli wodnej. Przestudź je, by nie było gorące. Tak samo możesz użyć i roztopić olej kokosowy. Kostkę prawdziwego masła, czyli 200 gramów roztop w mikrofalówce, w  rondelku na minimalnej mocy palnika lub w kąpieli wodnej. Przestudź je, by nie było gorące. Tak samo możesz użyć i roztopić olej kokosowy. Do miski z puchem jajecznym zacznij wlewać masło lub ewentualnie olej w tej samej ilości co masło (kujawski, ryżowy lub z pestek winogron). Masło lub olej wlewaj cienką strużką. Puch cały czas ubijaj na wysokich obrotach. Tak więc polecam masło, ale możesz też użyć olej kokosowy lub inny olej roślinny. 2 - Gotowe do pieczenia ciasto przelej do formy. Użyłam blaszki o wymiarach 24 x 24 cm. Idealna będzie też tortownica o średnicy 24 lub 25 cm. Na dno wyłóż papier do pieczenia. Formę od wewnątrz wysmaruj odrobiną oleju lub masła i obsyp bułką tartą. Gotowe do pieczenia ciasto przelej do formy. Użyłam blaszki o wymiarach 24 x 24 cm. Idealna będzie też tortownica o średnicy 24 lub 25 cm. Na dno wyłóż papier do pieczenia. Formę od wewnątrz wysmaruj odrobiną oleju lub masła i obsyp bułką tartą. 3 - Świeże truskawki umyj pod zimną, bieżącą wodą i zdejmij szypułki. Truskawki osusz delikatnie ręcznikiem papierowym. Układaj je jedna obok drugiej na cieście. Potem już kładź truskawki jedna na drugiej. Nie wciskaj truskawek w ciasto. One i tak same lekko zapadną się w cieście w trakcie pieczenia. 4 - Formę z ciastem truskawkowym umieść na środkowej półce, w piekarniku nagrzanym do 180 stopni. Ustaw opcję pieczenia góra/dół. Ciasto piecz do 50 minut. Po około 40-45 minutach sprawdź, czy ciasto jest już upieczone. Ostrożnie uchyl drzwi piekarnika i wbij w ciasto drewniany patyczek do szaszłyków. Jeśli po wyjęciu patyczek jest suchy, to znaczy, że ciasto z truskawkami jest już upieczone. Moje było upieczone po 50 minutach. Po upieczeniu lekko uchyl drzwi piekarnika. Polecam zablokować drzwiczki rękawicą kuchenną, by zrobić tylko małą szparkę. Po 10 minutach otwórz drzwi do połowy a po chwili wyjmij ciasto z pieca. Uwolnij je z foremki i przełóż na kratkę do przestudzenia.	110	50	4	37	./images/recipeid_5_thumbnail.png	2024-05-27
8	Uszka z grzybami	1 - Możesz zacząć od przygotowania ciasta na uszka. Do szerokiej miski przesiej mąkę - 320 gramów. Dodaj 1/3 płaskiej łyżeczki soli oraz dwie łyżki oleju np. rzepakowego. Olej z pestek winogron oraz inne oleje o delikatnym smaku również się sprawdzą. Wlej jeszcze 170 ml gorącej wody - około 2/3 szklanki  i wyrabiaj chwilę ciasto - najlepiej ręcznie. Na początku, jeśli ciasto jest gorące, możesz je zamieszać łyżką a potem już wyrabiać chwilę w misie miksera z hakami do ciasta drożdżowego. 2 - Ciasto sobie odpoczywa, więc pora na farsz grzybowy. Sięgam najczęściej po suszone kapelusze podgrzybków. Jeśli masz suszone prawdziwki.. to jeszcze lepiej. 60 gramów suszonych grzybów, to mniej więcej dwie garście grzybków. Ja użyłam tym razem 40 gramów suszonych prawdziwków oraz 20 gramów suszonych podgrzybków. Suszone grzyby umieść w większym naczyniu i zalej dwiema szklankami zimnej wody... może być woda z kranu. Miseczkę przykryj np. talerzykiem i odstaw w suche i chłodne miejsce minimum na godzinę. W tym czasie grzyby wchłoną część wody i zmiękną. Po tym czasie grzybki razem z wodą przełóż do małego garnuszka (lub od razu mocz je w garnku) i zagotuj. Zmniejsz moc palnika do minimum i gotuj tak grzybki przez 20 minut, najlepiej pod przykryciem. 3 - Wodę z moczenia grzybów przelej do małego naczynia. Będzie to mniej więcej szklanka ciemniej wody (lub mniej, jeśli odparowała). Nie wylewaj jej. Woda po moczeniu grzybów jest idealna do bigosu lub barszczu albo żurku. Odsączone grzybki pokrój w cienkie paseczki a potem posiekaj jeszcze drobniej. Po namoczeniu/ugotowaniu wyszło mi około 230 gramów grzybków. Sporą cebulę o wadze do 300 gramów obierz i bardzo drobno poszatkuj. Na nagrzaną patelnię wylej trzy łyżki oleju do smażenia. Dodaj poszatkowaną cebulę i podsmażaj ją na średniej mocy palnika przez około 10 minut. Po tym czasie dodaj też super drobno posiekane grzyby oraz  1/4 płaskiej łyżeczki soli i pół płaskiej łyżeczki pieprzu i podsmażaj całość jeszcze dodatkowe pięć minut. Od czasu do czasu zamieszaj całość drewnianą łyżką. Farsz na uszka jest już prawie gotowy. Całą zawartość patelni przełóż do miski. Po przestudzeniu dodaj jedno żółtko surowego jajka oraz płaską łyżkę bułki tartej. Cały farsz bardzo dokładnie wymieszaj. 4 - Przygotuj sobie stolnicę. Wysyp trochę mąki. Obok postaw farsz z grzybów oraz wykrawaczkę o średnicy nie większej niż 5 cm i wałek. Ciasto podziel na trzy części. Dwie części przykryj lekko wilgotną ściereczką. Z trzeciej części uformuj kulę gotową do wałkowania. Ciasto będzie lekko klejące - tak może być. Po podsypaniu mąką będzie się fantastycznie wałkować. Pod kulę z ciasta wysyp trochę mąki. Daj też mąkę na kulę i lekko ją spłaszcz. Na środek każdego placuszka pod uszko nakładaj malutką łyżeczkę farszu z grzybów i cebuli. Uszka składaj na pół i sklejaj boki. Wystarczy już tylko złączyć ze sobą oba końce i gotowe. Jeśli formujesz uszka z kwadracików ciasta, to otrzymasz bardziej odstające i spiczaste uszko, które możesz jeszcze lekko wywinąć na zewnątrz. Uszka z grzybami układaj obok siebie na desce. Aby oczekujące na gotowanie uszka nie schły, przykryj je lekko wilgotną bawełnianą ściereczką. Ciasto po wykrawaniu uszek zagniataj ponownie, wałkuj i wycinaj kolejne uszka. 5 - Każdą serię, po około 35 sztuk na raz, umieszczaj w dużym garnku z osoloną, gotującą się wodą. Woda nie powinna się za mocno/gwałtownie gotować. Po chwili uszka z grzybami wypłyną na powierzchnię. Uszka wigilijne wyławiaj po około maksymalnie 2 minutach od ich wypłynięcia na powierzchnię. W ten sposób ugotuj wszystkie serie przygotowanych uszek. Uszka polecam podawać np. z barszczem lub inną czystą (np. nie zabielaną) zupą. Według mnie najlepsza wersja to barszcz z uszkami.	120	40	0	37	./images/recipeid_8_thumbnail.png	2024-05-27
10	Ciasto rurociąg	1 - Przygotuj formę. U mnie była to forma 21/26 cm (wymiary wewnętrzne). Użyłam zwykłej blaszki, ale bez zaokrąglonych kątów, by łatwiej było układać w niej herbatniki. Może to być blaszka metalowa z odpinanymi bokami lub forma ceramiczna, czy szklana. Sprawdzą się też foremki o wymiarach 20/30 cm lub też 24/24 cm. Na dnie oraz na bokach wyłóż papier do pieczenia. Jeśli nie masz odpinanych boków, to w formie umieść wyższe paski. U mnie dodatkowo nachodzą na siebie, bym mogła potem za nie złapać i w całości wyciągnąć ciasto z blaszki. Aby papier nie odstawał polecam też boki formy wysmarować wcześniej odrobiną masła lub margaryny (paski papieru przyklejają się i łatwiej jest pracować z ciastem). 2 - Zrobienie jasnej masy jest bardzo proste i szybkie. W pierwszej kolejności przygotuj sobie żelatynę. Szklankę o pojemności 250 ml wypełnij do połowy wrzątkiem (dopiero co przegotowana woda). Od razu wsyp też trzy płaskie łyżki żelatyny. Natychmiast mieszaj całość, aż do całkowitego rozpuszczenia się żelatyny.  Może Ci się wydawać, że nie da rady rozpuścić tak dużej ilości żelatyny w 125 ml wrzątku, jednak z minuty na minutę zauważysz, że drobinki żelatyny stopniowo się rozpuszczają. Jeśli po kilku minutach nadal widzisz drobinki żelatyny, to w razie potrzeby możesz dolać jeszcze odrobinę wrzątku. Cały czas mieszaj płyn, aż zrobi się jednolity i bez drobinek żelatyny. Odstaw go do lekkiego przestudzenia (wystarczy kilka minut). W wysokim naczyniu umieść razem 500 gramów zimnego (z lodówki) serka mascarpone, 800 ml śmietanki 30 % (również schłodzona), 400 gramów serka homogenizowanego waniliowego (też prosto z lodówki). Wsyp 120 gramów cukru pudru, czyli około 6 łyżek oraz dwie saszetki śmietan fix. Całość zacznij miksować na niskich obrotach. Jak już masa się połączy i śmietanka przestanie chlapać, zwiększ obroty do maksymalnych i miksuj masę przez minutę (albo i krócej). Powinna zrobić się gęsta i jednolita. Do masy wlej rozpuszczoną i przestudzoną żelatynę. Krem miksuj krótko, tylko po połączenia się składników. 3 - Na masę śmietankową wyłóż rurki waflowe z ulubionym kremem. Ja wymieszałam sobie rurki waniliowe i kakaowe. Wyłożyłam je na przemian oraz tak, by nie trzeba było ich łamać. Tak naprawdę ułożenie rurek oraz ich ilość jest całkowicie dowolna. 4 - Na warstwę rurek wyłóż ostrożnie pozostałą 1/3 jednej porcji masy serowej (zostaje Ci jeszcze połowa całej masy, której użyjesz do drugiej warstwy). Tą 1/3 masy wypełniasz głównie przestrzenie między rurkami i wyrównujesz powierzchnię. Dodatkowo całość obsypałam resztkami połamanych herbatników. Starłam też kilka kafelków czekolady mlecznej. 5 - Na warstwę rurek wyłóż ostrożnie pozostałą 1/3 jednej porcji masy serowej (zostaje Ci jeszcze połowa całej masy, której użyjesz do drugiej warstwy). Tą 1/3 masy wypełniasz głównie przestrzenie między rurkami i wyrównujesz powierzchnię. Dodatkowo całość obsypałam resztkami połamanych herbatników. Starłam też kilka kafelków czekolady mlecznej.	60	70	32	37	./images/recipeid_10_thumbnail.png	2024-05-27
11	Zupa pomidorowa	1 - W jednym garnku umieść razem: około kilograma mięsa (tylko z kurczaka lub z dodatkiem wołowiny z kością); dwie obrane marchewki; korzeń pietruszki; cebulę; kawałek korzenia selera. Dodaj też dwa ziarna ziela angielskiego, listek laurowy, łyżeczkę soli oraz pół łyżeczki pieprzu. Wlej 1500 ml wody. Garnek przykryj przykrywką i zagotuj zupę. Zmniejsz moc palnika do takiej, by zupa tylko mrugała i gotuj ją przez 90 minut - jeśli dodany był tylko kurczak, lub 120 minut - jeśli użyta była też wołowina z kością.2 - Po dwóch godzinach z brzegów garnka usuń szumowiny. Przy pomocy cedzaka wyłów z zupy całe mięso, warzywa i przyprawy. Powinno zostać około 1200 ml bulionu. Jeśli odparowało więcej wywaru, to ubytek uzupełnij wrzątkiem. Warzywa i mięso z rosołu można zmielić i wykorzystać do zrobienia pasztetu, czy też jako farsz do pierogów lub naleśników. 3 - Do bulionu dodaj mały słoik koncentratu pomidorowego o wadze 200 gramów. Zanim pomidorówka zacznie się ponownie gotować wlej cztery łyżki (lub więcej) śmietanki kremówki 30 %. Jeśli używasz śmietany kwaśnej 18 %, to przed dodaniem należy ja zahartować. Zamieszaj zupę i sprawdź jej smak. W razie potrzeby dopraw ją solą, pieprzem, może odrobiną cukru. 4 - Pomidorową podawaj z ulubionym makaronem lub ryżem oraz ze świeżą natką pietruszki, odrobiną świeżych listków lubczyku ogrodowego lub z koperkiem. 	120	1500	4	37	./images/recipeid_11_thumbnail.png	2024-05-27
4	Sałatka z tuńczykiem	1 - Ugotuj jedną saszetkę suchego ryżu o wadze 100 gramów. Użyłam ryżu jaśminowego, ale można też sięgnąć np. po ryż basmati. Ryż ugotuj do miękkości w osolonej wodzie, zgodnie z instrukcją na opakowaniu. Po ugotowaniu ryż ważył u mnie niecałe 280 gramów. Basmati zaś chłonie więcej wody i wychodzi go zawsze o około 20 gramów więcej, niż jaśminowego. Ugotowany ryż odłóż do przestudzenia. 2 - Ugotuj na twardo trzy jajka. Średnie sztuki gotowałam tym razem około ośmiu minut. Po ugotowaniu przelałam je zimną wodą z kranu, by zatrzymać proces gotowania. Obiłam skorupkę o wewnętrzną stronę zlewu i raz jeszcze przelałam zimną wodą. Obrałam ze skorupiki i pokroiłam na mniejsze kawałki. Najlepszy będzie tuńczyk jednolity lub ewentualnie w kawałkach. Z małej puszki o wadze do 200 gramów otrzymuję około 150 gramów tuńczyka (po odlaniu zalewy). Dodaj tyle samo kukurydzy konserwowej, czyli około 150 gramów po odsączeniu zalewy. 200 gramów ogórków kiszonych obierz i pokrój w kosteczkę, lub pokrój je bez obierania. Sporą garść szczypiorku posiekaj drobno. 3 - Wszystkie składniki sałatki umieść w większej misce. Dodaj też trzy łyżki kremowego jogurtu naturalnego, czyli około 50 gramów jogurtu oraz czubatą łyżkę ulubionego majonezu, czyli około 30 gramów. Na koniec jeszcze po 1/4 łyżeczce soli i pieprzu. 4 - Całość delikatnie mieszam i obowiązkowo sprawdzam smak sałatki. W razie potrzeby dodaję więcej soli lub pieprzu. Sałatka z tuńczyka z ryżem jest gotowa do zjedzenia od razu po przyrządzeniu. Jeśli nie zostanie zjedzona w dniu szykowania, to należy odłożyć ją do lodówki. Świeżość i dobry smak zachowa śmiało przez trzy dni (szklane naczyniem z przykryciem).	30	1500	2	37	./images/recipeid_4_thumbnail.png	2024-05-27
2	Chleb na zakwasie	Całość wymieszaj i wyrabiaj chwilę (wystarczy kilka minut ręcznie lub mikserem z hakami do ciasta drożdżowego), tylko do dokładnego połączenia wszystkich składników na jednolite, gęste, ale nie zwarte ciasto chlebowe (konsystencja nie powinna pozwolić na to by, już na tym etapie można było uformować nieodkształcający się bochenek). Wyrobione ciasto przykryj ściereczką lub przezroczystą folią spożywczą i odstaw na bok, na około godzinę. Zatem piekarnik nagrzewam do 240 stopni (może być i 250 stopni, ale u mnie przy 240 stopniach już bardzo mocno się nagrzewa) z opcją pieczenia góra/dół lub 230 stopni z termoobiegiem.    Przygotuj podkładkę pod gorące garnki oraz porządne rękawice kuchenne. Gdy piekarnik i naczynie są już mocno nagrzane, to sprawnie ale super ostrożnie otwórz drzwi pieca i wyjmij nagrzane naczynie. Zamknij piekarnik, by ciepło nie uciekało. Ciasto przełóż sprawnie na otwartą dłoń i od razu umieść w nagrzanym naczyniu (spodem do góry). Przed pieczeniem można jeszcze ponacinać górę chleba. Nie musi to być specjalny skalpel do nacinania wypieków. Wystarczy ostry nóż, który przed nacinaniem chleba należy zamoczyć w wodzie. Wówczas ciasto chlebowe  kroi się, a nie ciągnie.	60	30	4	37	./images/recipeid_2_thumbnail.png	2024-05-27
6	Sałatka owocowa	1 - Aby przygotować sałatkę owocową z miętą, najpierw umyj jabłko, obierz je i pokrój w kostkę. Następnie obierz banana i pokrój go w plasterki. Kiwi także obierz i pokrój w półplasterki. Pomarańczę obierz, podziel na cząstki i każdą cząstkę przekrój na pół. Borówki i truskawki umyj, a truskawki pokrój na połówki. Wszystkie przygotowane owoce przełóż do dużej miski. 2 - Aby zapobiec ciemnieniu owoców, skrop je sokiem z cytryny. Następnie drobno posiekaj listki mięty i dodaj je do sałatki. Delikatnie wymieszaj całość, aby składniki równomiernie się połączyły. Jeśli chcesz, aby sałatka była słodsza, możesz dodać łyżeczkę miodu. Podawaj sałatkę od razu po przygotowaniu, aby owoce były świeże i soczyste. Ta sałatka jest idealna na letnie śniadanie, przekąskę lub deser.	30	1500	2	37	./images/recipeid_6_thumbnail.png	2024-05-27
9	Sałatka jarzynowa	1 - W pierwszej kolejności umyj dokładnie marchewki, korzenie pietruszki oraz kawałek selera (możesz go pominąć). Nie obieraj ich ze skórki. Tak samo ziemniaki (jeśli dodajesz je do sałatki). Warzywa umieść w garnku i gotuj pod przykryciem do miękkości. Nie gotuj ich jednak za długo, by były jędrne i nie rozpadały się w sałatce. Zazwyczaj nie gotują się dłużej niż 30 minut. Dużo zależy od grubości warzyw. Po ugotowaniu od razu wyjmij warzywa z wody i odłóż do lekkiego przestudzenia. Obierz je ze skórki i posiekaj drobno. Cztery średniej wielkości jajka ugotuj na twardo. Zobacz jak ugotować jajka na twardo. Na szybko: Jajka umieść w garnku z jeszcze zimną wodą. Czas odmierzasz od momentu zagotowania się wody w garnku. Pilnuj wówczas, by woda cały czas się gotowała, jednak nie za mocno. Średnie jajka nie gotują się na twardo dłużej niż dziewięć minut. Po ugotowaniu polecam od razu zalać jajka zimną wodą, jednocześnie lekko obijając skorupkę jajka. Po chwili możesz je obrać i odłożyć na talerz do przestudzenia a potem do posiekania. 2 - W mojej sałatce zazwyczaj jest por. Odcinek około 10 cm, czyli mniej więcej 50 gramów. Biały odcinek pora szatkuję i sparz na sitku wrzątkiem. Sitko trzymam zawsze w zlewie. Przelewam pora wrzątkiem z czajniczka. Po przestudzeniu por jest już gotowy do dodania do sałatki. Zamiast pora możesz poszatkować małą cebulę lub też pominąć pora oraz cebulę. 3 - Ogórki kiszone obierz cienko ze skóry i odetnij końce. Poszatkuj je w drobną kosteczkę. Soczyste, twarde i najlepiej lekko kwaśne jabłko obierz i wytnij całe gniazdo nasienne. Pokrój je podobnie jak ogórki. Ja daję jedno małe jabłko, ale śmiało możesz dać większe jabłko oraz więcej ogórków kiszonych. 4 - Groszek konserwowy odcedź z zalewy i umieść w misce z pozostałymi składnikami sałatki jarzynowej. Dodaj cztery łyżki dobrej jakości majonezu oraz tyle samo jogurtu naturalnego. Całość delikatnie, ale dokładnie wymieszaj i sprawdź smak sałatki. Dodaj pół płaskiej łyżeczki soli oraz 1/4 płaskiej łyżeczki pieprzu i jeszcze raz wszystko zamieszaj. 5 - W razie potrzeby lub upodobań smakowych możesz dodać więcej soli i pieprzu. Pamiętaj jednak o tym, że warto dodawać przyprawy po troszeczku a następnie smakować i decydować o tym, czy jeszcze czegoś nam brakuje.	40	1500	7	37	./images/recipeid_9_thumbnail.png	2024-05-27
12	borgar	borger dobry mmmmm	12	1000000	1	39	./images/recipeid_12_thumbnail.png	2024-06-10
\.


--
-- Data for Name: skladnik; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.skladnik (id_skladnik, nazwa, cena) FROM stdin;
79	Agrest	33
80	Aloes	1
81	Ananas	63
82	Arbuz	69
83	Awokado	86
84	Banan	59
85	Borówki	12
86	Brzoskwinia	4
87	Chia	25
88	Cytryna	31
89	Czarna porzeczka	9
90	Czerwona porzeczka	11
91	Czereśnie	64
92	Figa	96
93	Granat	43
94	Grejpfrut	6
95	Gruszka	66
96	Jabłko	78
97	Jagody	78
98	Jeżyny	91
99	Kaki	58
100	Kasztany jadalne	72
101	Kiwi	84
102	Kokos	68
103	Limonka	59
104	Maliny	48
105	Mandarynka	30
106	Mango	85
107	Marakuja	46
108	Melon	7
109	Morela	56
110	Nektarynka	48
111	Oliwki	92
112	Owoce leśne	72
113	Papaja	47
114	Pigwa	31
115	Pomarańcza	37
116	Pomelo	96
117	Porzeczka	13
118	Poziomka	36
119	Rabarbar	79
120	Śliwka	22
121	Truskawka	13
122	Winogrono	13
123	Wiśnia	96
124	Żurawina	66
125	Bakłażan	80
126	Bataty	14
127	Bób	32
128	Botwinka	83
129	Brokuły	12
130	Brukselka	39
131	Burak	56
132	Cebula	78
133	Chrzan	6
134	Ciecierzyca	13
135	Czosnek	38
136	Cukinia	29
137	Cykoria	7
138	Dynia	69
139	Fasola	88
140	Fasolka szparagowa	60
141	Groch	16
142	Groszek	3
143	Jarmuż	2
144	Kabaczek	32
145	Kalafior	66
146	Kalarepa	27
147	Kapusta czerwona	56
148	Kapusta biała	28
149	Młoda kapusta	29
150	Kapusta pekińska	65
151	Karczochy	40
152	Koper włoski	3
153	Korniszon	69
154	Kukurydza	83
155	Kwiaty cukinii	17
156	Marchewka	1
157	Ogórek	82
158	Ogórek kiszony	76
159	Ogórek konserwowy	87
160	Pak choi	47
161	Papryczka chili	12
162	Papryczka jalapeño	95
163	Papryka	53
164	Pietruszka	5
165	Pomidory	19
166	Por	14
167	Rukola	29
168	Roszponka	47
169	Rzodkiewka	93
170	Sałata	83
171	Sałata lodowa	2
172	Seler	60
173	Seler korzeniowy	49
174	Seler naciowy	45
175	Soczewica	19
176	Szczaw	14
177	Szczypiorek	95
178	Szparagi	17
179	Szpinak	99
180	Topinambur	67
181	Wężymord	14
182	Ziemniaki	25
183	Bakalie	17
184	Daktyle	74
185	Orzechy laskowe	82
186	Migdały	36
187	Pini	97
188	Pistacje	21
189	Słonecznik	67
190	Orzechy włoskie	68
191	Orzeszki ziemne	80
192	Bulgur	35
193	Cukier	7
194	Cukier biały	73
195	Cukier puder	25
196	Cukier trzcinowy	55
197	Grysik	62
198	Kasza	3
199	Kasza jaglana	46
200	Kasza gryczana	12
201	Kasza jęczmienna	21
202	Kasza manna	98
203	Kasza orkiszowa	98
204	Kasza pęczak	70
205	Kuskus	82
206	Komosa ryżowa	21
207	Makaron	43
208	Makaron lasagne	76
209	Mak	39
210	Makaron spaghetti	94
211	Mąka	79
212	Mąka kokosowa	41
213	Mąka kukurydziana	67
214	Mąka orkiszowa	68
215	Mąka pszenna	93
216	Mąka ziemniaczana	31
217	Mąka żytnia	52
218	Otręby	80
219	Pęczak	76
220	Ryż	54
221	Ryż biały	22
222	Ryż czerwony	66
223	Ryż czarny	36
224	Bita śmietana	53
225	Camembert	94
226	Cheddar	13
227	Feta	24
228	Gouda	81
229	Jajko	78
230	Jogurt	44
231	Jogurt grecki	57
232	Kefir	84
233	Margaryna	97
234	Mascarpone	33
235	Masło	42
236	Maślanka	34
237	Mleko	24
238	Mozzarella	94
239	Parmezan	51
240	Ser biały	37
241	Ser pleśniowy	70
242	Serek homogenizowany	5
243	Serek kanapkowy	11
244	Serek wiejski	29
245	Ser żółty	56
246	Śmietana	5
247	Twaróg	34
248	Antrykot	32
249	Biała kiełbasa	93
250	Boczek	64
251	Boczek gotowany	66
252	Boczek wędzony	39
253	Cielęcina	92
254	Dziczyzna	73
255	Gęsina	46
256	Golonka	60
257	Indyk	35
258	Jagnięcina	0
259	Kabanosy	30
260	Kaczka	36
261	Karkówka	99
262	Kiełbasa	59
263	Kiełbasa wędzona	66
264	Kebab	61
265	Królik	38
266	Kurczak	9
267	Mięso dzika	0
268	Mięso mielone	80
269	Mięso mielone drobiowe	33
270	Mięso mielone wołowe	79
271	Mięso mielone wieprzowe	50
272	Mięso mielone wieprzowo – wołowe	17
273	Pasztet	52
274	Parówki	96
275	Perliczka	1
276	Pieczone mięso	83
277	Podroby	25
278	Rostbef	58
279	Salami	86
280	Sarnina	50
281	Schab	87
282	Smalec	47
283	Stek	32
284	Szynka	72
285	Szynka parmeńska	88
286	Szynka wędzona	70
287	T-bone	5
288	Wieprzowina	10
289	Wołowina	60
290	Żeberka	92
291	Amur	9
292	Barramundi	47
293	Dorada	3
294	Dorsz	34
295	Halibut	42
296	Homar	52
297	Kalmary	69
298	Karp	41
299	Krab	46
300	Krewetki	68
301	Langusta	24
302	Łosoś	85
303	Łosoś wędzony	19
304	Małże	47
305	Mintaj	24
306	Makrela	80
307	Ośmiornica	52
308	Przegrzebki	63
309	Pstrąg	14
310	Sandacz	92
311	Sola	4
312	Szczupak	74
313	Szprotki	91
314	Śledzie	26
315	Tuńczyk	24
316	Żabnica	51
317	Anyż	97
318	Bazylia	17
319	Chili	11
320	Cukier wanilinowy	66
321	Curry	90
322	Cynamon	87
323	Cząber	71
324	Gałka muszkatołowa	37
325	Goździk	32
326	Imbir	100
327	Kakao	91
328	Kolendra	70
329	Koper	0
330	Koperek	4
331	Ksylitol	62
332	Kumin	42
333	Kurkuma	53
334	Kwiat lipy	77
335	Majeranek	62
336	Mięta	29
337	Natka pietruszki	18
338	Oregano	100
339	Pieprz czarny	66
340	Rozmaryn	58
341	Sól	88
342	Tymianek	93
343	Wanilia	19
344	Ziele angielskie	94
345	Borowik	22
346	Boczniak	56
347	Grzyby marynowane	13
348	Grzyby suszone	9
349	Kurka	34
350	Maślak	23
351	Mun	40
352	Opieniek	3
353	Pieczarka	62
354	Podgrzybek	16
355	Prawdziwek	23
356	Rydz	88
357	Trufla	15
358	Shitake	75
359	Biała czekolada	2
360	Bułka tarta	46
361	Czekolada	6
362	Czekolada mleczna	35
363	Drożdże	32
364	Dżem	60
365	Gorzka czekolada	68
366	Herbata	58
367	Hibiskus	64
368	Karmel	54
369	Kawa	10
370	Kiełki	16
371	Marcepan	21
372	Melisa	55
373	Miód	97
374	Mleko kokosowe	13
375	Mleko migdałowe	84
376	Mleko skondensowane	98
377	Mleko sojowe	61
378	Mleko w proszku	84
379	Ocet	75
380	Rodzynki	32
381	Sezam	34
382	Soda oczyszczona	100
383	Syrop klonowy	86
384	Szałwia	24
385	Trawa cytrynowa	91
386	Zielona herbata	19
387	Żelatyna	23
388	Beza	50
389	Biszkopt	33
390	Bolognese	38
391	Bruschetta	91
392	Bryndza	59
393	Budyń	74
394	Bulion	77
395	Bulion drobiowy	27
396	Bulion Warzywny	81
397	Bulion wołowy	24
398	Chałwa	16
399	Frytki	2
400	Galaretka	62
401	Gofry	27
402	Grzanki	11
403	Ketchup	45
404	Kisiel	70
405	Kiszona kapusta	14
406	Majonez	16
407	Musztarda	97
408	Nutella	25
409	Olej	88
410	Olej kokosowy	21
411	Oliwa	50
412	Prażona cebula	59
413	Rosół	29
414	Skwarki	14
415	Sos sojowy	8
416	Advocaat	47
417	Adwokat	83
418	Amaretto	98
419	Baileys	54
420	Becherovka	85
421	Biały rum	18
422	Brandy	79
423	Burbon	15
424	Bourbon	2
425	Champagne	15
426	Cognac	31
427	Gin	0
428	Jagermeister	43
429	Koniak	87
430	Likier	36
431	Metaxa	79
432	Nalewka	0
433	Piwo	8
434	Prosecco	88
435	Rum	18
436	Sangria	1
437	Spirytus	73
438	Szampan	99
439	Tequila	74
440	Wermut	61
441	Whiskey	96
442	Whisky	60
443	Wino	76
444	Wino białe	17
445	Wino czerwone	46
446	Wino musujące	95
447	Wino różowe	40
448	Wódka	88
449	Bagietka	51
450	Bułka	13
451	Bułka hamburgerowa	47
452	Bułka wieloziarnista	57
453	Chałka	0
454	Chleb	44
455	Chleb wieloziarnisty	77
456	Chleb tostowy	53
457	Chleb graham	76
458	Chleb pszenny	62
459	Chleb żytni	36
460	Pita	56
461	Tortilla	31
462	Składniki odżywcze	92
463	Białko	94
464	Biotyna	18
465	Błonnik	40
466	Chlorek	64
467	Cholesterol	56
468	Chrom	33
469	Cukry	78
470	Cynk	2
471	Fosfor	52
472	Jod	50
473	Kalorie	72
474	Kwas foliowy	39
475	Kwas pantotenowy	34
476	Magnes	74
477	Mangan	85
478	Miedź	50
479	Molibden	96
480	Niacyna	14
481	Potas	90
482	Ryboflawina	1
483	Selen	55
484	Sód	72
485	Tłuszcze	41
486	Tłuszcze nasycone	8
487	Tłuszcze nienasycone	54
488	Tłuszcze trans	43
489	Tiamina	50
490	Wapno	69
491	Węglowodany	17
492	Witamina A	99
493	Witamina B6	86
494	Witamina B12	57
495	Witamina C	81
496	Witamina D	53
497	Witamina E	33
498	Witamina K	55
499	Żelazo	19
520	Jajka	31
521	Kabanos	100
522	Magnez	48
\.


--
-- Data for Name: skladnik_w_lodowce; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.skladnik_w_lodowce (id_uzytkownika, id_skladnik) FROM stdin;
\.


--
-- Data for Name: skladnik_w_przepisie; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.skladnik_w_przepisie (id_przepisu, id_skladnika, ilosc) FROM stdin;
1	84	350
1	215	240
1	235	70
1	193	130
1	229	80
1	341	5
2	215	600
2	341	10
3	215	210
3	520	180
3	237	150
3	235	50
3	193	20
3	247	500
3	246	30
3	193	30
4	220	100
4	315	170
4	520	180
4	158	200
4	231	50
4	406	30
4	177	50
4	339	5
5	215	320
5	235	200
5	520	300
5	193	170
5	121	800
6	96	200
6	84	120
6	101	80
6	115	200
6	85	100
6	121	150
6	88	5
6	336	5
8	215	320
8	409	80
8	341	5
8	348	60
8	132	300
8	409	80
8	229	60
8	360	20
9	182	350
9	156	450
9	337	200
9	137	60
9	158	200
9	166	50
9	142	400
9	406	80
10	243	500
10	242	400
10	246	800
10	195	120
10	387	30
11	387	400
11	312	100
12	267	1kg
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.tag (id_tagu, nazwa) FROM stdin;
1	Śniadania
2	Zupy
3	Dania główne
4	Pieczywo
5	Desery
6	Napoje
7	Przekąski
8	Sałatki
9	Przetwory
10	Dodatki
11	Wędliny
12	Ciasta
13	Wielkanoc
14	Boże Narodzenie
15	Impreza
16	Grill
17	Tłusty czwartek
18	Walentynki
19	Halloween
20	Komunia
21	Do pracy
22	Amerykańska
23	Azjatycka
24	Czeska
25	Polska
26	Włoska
27	Meksykańska
28	Indyjska
29	Francuska
30	Chińska
31	Grecka
32	Bałkańska
33	Tajska
34	Węgierska
35	Śródziemnomorska
36	Ukraińska
37	Żydowska
38	Kasze i ryż
39	Makaron
40	Warzywa
41	Owoce
42	Nabiał
43	Mięso
44	Ryby
45	Owoce morza
46	Grzyby
47	Orzechy
48	Przyprawy
49	Bez glutenu
50	Bez laktozy
51	Bez cukru
52	Dla dzieci
53	Dietetyczne
54	Wegetariańskie
55	Wegańskie
56	Dla zdrowia
57	Keto
\.


--
-- Data for Name: tag_w_przepisie; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.tag_w_przepisie (id_tagu, id_przepisu) FROM stdin;
54	1
53	1
12	1
4	1
1	1
20	2
13	2
4	2
25	2
1	3
42	3
52	3
1	3
1	3
1	3
1	3
44	4
54	4
40	4
15	4
8	4
38	4
5	5
41	5
52	5
18	5
15	5
41	6
1	6
7	6
5	6
53	6
54	6
55	6
54	8
46	8
25	8
14	8
2	8
3	8
8	9
10	9
13	9
14	9
15	9
16	9
20	9
21	9
25	9
40	9
5	10
10	10
15	10
20	10
12	10
13	10
14	10
22	12
\.


--
-- Data for Name: ulubione; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.ulubione (id_przepisu, id_uzytkownika) FROM stdin;
1	37
4	38
\.


--
-- Data for Name: uzytkownik; Type: TABLE DATA; Schema: public; Owner: kulinarna
--

COPY public.uzytkownik (id_uzytkownika, imie, nazwisko, haslo, email) FROM stdin;
37	Jakub	Misina	$2b$10$P8/uzJAPjr3g/vOKKgzZde5Q8q8u8SmQUdpFfIgR1xrTYnWfm/FtS	xd@xd.xd
38	Jakub	Misina	$2b$10$1BMFQsvuPdfS95BesQFUkeTbbFXM8aGnx0AvMEnJAp3Rk8YzR4Cau	abcd@efgh.pl
39	Józef	Piłsudski	$2b$10$a/xQXw9JkGFRmJ34pEImUeC4hP1c4LOxlXxuLayyGArDP4uudAX9q	qwerty@uio.pl
40	Karol	Michoński	$2b$10$7KIv8abtR5V9tMeMpdL8WewSXnpHFB2mIhaYv9ktp0GXa0A8xtKGe	trak@gmail.com
\.


--
-- Name: Przepis_id_przepisu_seq; Type: SEQUENCE SET; Schema: public; Owner: kulinarna
--

SELECT pg_catalog.setval('public."Przepis_id_przepisu_seq"', 1, true);


--
-- Name: artykul_id_artykulu_seq; Type: SEQUENCE SET; Schema: public; Owner: kulinarna
--

SELECT pg_catalog.setval('public.artykul_id_artykulu_seq', 1, false);


--
-- Name: komentarz_id_komentarza_seq; Type: SEQUENCE SET; Schema: public; Owner: kulinarna
--

SELECT pg_catalog.setval('public.komentarz_id_komentarza_seq', 4, true);


--
-- Name: skladnik_id_skladnik_seq; Type: SEQUENCE SET; Schema: public; Owner: kulinarna
--

SELECT pg_catalog.setval('public.skladnik_id_skladnik_seq', 1, false);


--
-- Name: tag_id_tagu_seq; Type: SEQUENCE SET; Schema: public; Owner: kulinarna
--

SELECT pg_catalog.setval('public.tag_id_tagu_seq', 3, true);


--
-- Name: uzytkownik_id_uzytkownika_seq; Type: SEQUENCE SET; Schema: public; Owner: kulinarna
--

SELECT pg_catalog.setval('public.uzytkownik_id_uzytkownika_seq', 40, true);


--
-- Name: przepis Przepis_pkey; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.przepis
    ADD CONSTRAINT "Przepis_pkey" PRIMARY KEY (id_przepisu);


--
-- Name: artykul artykul_pkey; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.artykul
    ADD CONSTRAINT artykul_pkey PRIMARY KEY (id_artykulu);


--
-- Name: komentarz komentarz_pkey; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT komentarz_pkey PRIMARY KEY (id_komentarza);


--
-- Name: skladnik skladnik_pkey; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.skladnik
    ADD CONSTRAINT skladnik_pkey PRIMARY KEY (id_skladnik);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id_tagu);


--
-- Name: uzytkownik uzytkownik_email_key; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT uzytkownik_email_key UNIQUE (email);


--
-- Name: uzytkownik uzytkownik_pkey; Type: CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT uzytkownik_pkey PRIMARY KEY (id_uzytkownika);


--
-- Name: przepis autor_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.przepis
    ADD CONSTRAINT "autor_FK" FOREIGN KEY (autor) REFERENCES public.uzytkownik(id_uzytkownika) NOT VALID;


--
-- Name: komentarz id_artykulu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT "id_artykulu_FK" FOREIGN KEY (id_artykulu) REFERENCES public.artykul(id_artykulu);


--
-- Name: ulubione id_przepisu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.ulubione
    ADD CONSTRAINT "id_przepisu_FK" FOREIGN KEY (id_przepisu) REFERENCES public.przepis(id_przepisu);


--
-- Name: plan id_przepisu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT "id_przepisu_FK" FOREIGN KEY (id_przepisu) REFERENCES public.przepis(id_przepisu);


--
-- Name: skladnik_w_przepisie id_przepisu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.skladnik_w_przepisie
    ADD CONSTRAINT "id_przepisu_FK" FOREIGN KEY (id_przepisu) REFERENCES public.przepis(id_przepisu) NOT VALID;


--
-- Name: tag_w_przepisie id_przepisu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.tag_w_przepisie
    ADD CONSTRAINT "id_przepisu_FK" FOREIGN KEY (id_przepisu) REFERENCES public.przepis(id_przepisu);


--
-- Name: komentarz id_przepisu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT "id_przepisu_FK" FOREIGN KEY (id_przepisu) REFERENCES public.przepis(id_przepisu);


--
-- Name: skladnik_w_lodowce id_skladnik; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.skladnik_w_lodowce
    ADD CONSTRAINT id_skladnik FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika) NOT VALID;


--
-- Name: skladnik_w_przepisie id_skladnika_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.skladnik_w_przepisie
    ADD CONSTRAINT "id_skladnika_FK" FOREIGN KEY (id_skladnika) REFERENCES public.skladnik(id_skladnik) NOT VALID;


--
-- Name: tag_w_przepisie id_tagu_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.tag_w_przepisie
    ADD CONSTRAINT "id_tagu_FK" FOREIGN KEY (id_tagu) REFERENCES public.tag(id_tagu);


--
-- Name: ulubione id_uzytkownika_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.ulubione
    ADD CONSTRAINT "id_uzytkownika_FK" FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- Name: plan id_uzytkownika_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT "id_uzytkownika_FK" FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- Name: artykul id_uzytkownika_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.artykul
    ADD CONSTRAINT "id_uzytkownika_FK" FOREIGN KEY (autor) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- Name: skladnik_w_lodowce id_uzytkownika_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.skladnik_w_lodowce
    ADD CONSTRAINT "id_uzytkownika_FK" FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika) NOT VALID;


--
-- Name: komentarz id_uzytkownika_FK; Type: FK CONSTRAINT; Schema: public; Owner: kulinarna
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT "id_uzytkownika_FK" FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- PostgreSQL database dump complete
--

