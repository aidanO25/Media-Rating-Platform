
CREATE USER reviewer WITH PASSWORD 'capping2024';
GRANT ALL PRIVILEGES ON DATABASE opinionate TO reviewer;
GRANT CONNECT ON DATABASE opinionate to reviewer;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: albums; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.albums (
    "mediaID" bigint NOT NULL,
    "gID" bigint,
    artist character varying,
    tracks character varying[],
    cover_url character varying
);


ALTER TABLE public.albums OWNER TO reviewer;

--
-- Name: bookmark; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.bookmark (
    "userID" bigint NOT NULL,
    "mediaID" bigint NOT NULL
);


ALTER TABLE public.bookmark OWNER TO reviewer;

--
-- Name: books; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.books (
    "mediaID" bigint NOT NULL,
    "gID" bigint,
    author character varying,
    cover_url character varying,
    year character varying
);


ALTER TABLE public.books OWNER TO reviewer;

--
-- Name: friends; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.friends (
    "fID" bigint NOT NULL,
    username character varying NOT NULL
);


ALTER TABLE public.friends OWNER TO reviewer;

--
-- Name: friendsList; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public."friendsList" (
    "userID" bigint NOT NULL,
    "fID" bigint NOT NULL
);


ALTER TABLE public."friendsList" OWNER TO reviewer;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.genres (
    "gID" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.genres OWNER TO reviewer;

--
-- Name: media; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.media (
    "mediaId" bigint NOT NULL,
    title character varying NOT NULL,
    description text,
    "mediaImage" bytea,
    "releaseDate" date
);


ALTER TABLE public.media OWNER TO reviewer;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.movies (
    "mediaID" bigint NOT NULL,
    "gID" bigint,
    studio character varying,
    "cast" character varying[],
    director character varying,
    poster_url character varying
);


ALTER TABLE public.movies OWNER TO reviewer;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.reviews (
    "userID" bigint NOT NULL,
    "mediaID" bigint NOT NULL,
    "ratingTxt" text,
    "ratingStar" bigint,
    review_id bigint NOT NULL
);


ALTER TABLE public.reviews OWNER TO reviewer;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: reviewer
--

ALTER TABLE public.reviews ALTER COLUMN review_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public.users (
    "userID" bigint NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    "profilePicture" bytea,
    description text
);


ALTER TABLE public.users OWNER TO reviewer;

--
-- Name: users_userID_seq; Type: SEQUENCE; Schema: public; Owner: reviewer
--

ALTER TABLE public.users ALTER COLUMN "userID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."users_userID_seq"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: videoGames; Type: TABLE; Schema: public; Owner: reviewer
--

CREATE TABLE public."videoGames" (
    "mediaID" bigint NOT NULL,
    "gID" bigint,
    developer character varying,
    publisher character varying,
    poster_url character varying
);


ALTER TABLE public."videoGames" OWNER TO reviewer;

--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.albums ("mediaID", "gID", artist, tracks, cover_url) FROM stdin;
203	\N	Drake	{Survival,Nonstop,Elevate,Emotionless,"God's Plan","I'm Upset","8 Out Of 10","Mob Ties","Can’t Take A Joke","Sandra’s Rose","Talk Up (feat. Jay-Z)","Is There More",Peak,"Summer Games",Jaded,"Nice For What",Finesse,"Ratchet Happy Birthday","That’s How You Feel","Blue Tint","In My Feelings","Don’t Matter To Me (with Michael Jackson)","After Dark (feat. Static Major & Ty Dolla $ign)","Final Fantasy","March 14"}	https://i.scdn.co/image/ab67616d0000b273f907de96b9a4fbc04accc0d5
204	\N	Drake	{"Champagne Poetry","Papi’s Home","Girls Want Girls (with Lil Baby)","In The Bible (with Lil Durk & Giveon)","Love All (with JAY-Z)","Fair Trade (with Travis Scott)","Way 2 Sexy (with Future & Young Thug)",TSU,"N 2 Deep","Pipe Down","Yebba’s Heartbreak","No Friends In The Industry","Knife Talk (with 21 Savage ft. Project Pat)","7am On Bridle Path","Race My Mind","Fountains (with Tems)","Get Along Better","You Only Live Twice (with Lil Wayne & Rick Ross)","IMY2 (with Kid Cudi)","F*****g Fans","The Remorse"}	https://i.scdn.co/image/ab67616d0000b273cd945b4e3de57edd28481a3f
205	\N	Drake	{"Keep The Family Close",9,"U With Me?","Feel No Ways",Hype,"Weston Road Flows",Redemption,"With You",Faithful,"Still Here",Controlla,"One Dance",Grammys,"Childs Play","Pop Style","Too Good","Summers Over Interlude","Fire & Desire",Views,"Hotline Bling"}	https://i.scdn.co/image/ab67616d0000b2739416ed64daf84936d89e671c
206	\N	Weezer	{"Don't Let Go",Photograph,"Hash Pipe","Island In The Sun",Crab,"Knockdown Dragout",Smile,"Simple Pages","Glorious Day","O Girlfriend"}	https://i.scdn.co/image/ab67616d0000b2731e0dc5baaabda304b0ad1815
201	\N	SZA	{SOS,"Kill Bill","Seek & Destroy",Low,"Love Language",Blind,"Used (feat. Don Toliver)",Snooze,"Notice Me","Gone Girl","Smoking on my Ex Pack","Ghost in the Machine (feat. Phoebe Bridgers)",F2F,"Nobody Gets Me",Conceited,Special,"Too Late",Far,Shirt,"Open Arms (feat. Travis Scott)","I Hate U","Good Days","Forgiveless (feat. Ol' Dirty Bastard)"}	https://i.scdn.co/image/ab67616d0000b2730c471c36970b9406233842a5
202	\N	Kali Uchis	{"in My Garden...","I Wish you Roses","Worth the Wait (feat. Omar Apollo)","Love Between...","All Mine","Fantasy (feat. Don Toliver)","Como Te Quiero Yo","Hasta Cuando",Endlessly,"Moral Conscience","Not Too Late (interlude)",Blue,"Deserve Me (with Summer Walker)",Moonlight,"Happy Now"}	https://i.scdn.co/image/ab67616d0000b27381fccd758776d16b87721b17
207	\N	Troye Sivan	{Rush,"What's The Time Where You Are?","One Of Your Girls","In My Room","Still Got It","Can't Go Back, Baby","Got Me Started",Silly,Honey,"How To Stay With You"}	https://i.scdn.co/image/ab67616d0000b27367103283a4eb57578a428252
208	\N	Tyler, The Creator	{"BEST INTEREST"}	https://i.scdn.co/image/ab67616d0000b273ab8995f18dc3dd9f34a6acd4
209	\N	Tame Impala	{"It Is Not Meant To Be","Desire Be Desire Go","Alter Ego",Lucidity,"Why Won't You Make Up Your Mind?","Solitude Is Bliss","Jeremy's Storm",Expectation,"The Bold Arrow Of Time","Runway Houses City Clouds","I Don't Really Mind"}	https://i.scdn.co/image/ab67616d0000b273176e82d09ac75d62810f0056
210	\N	Mac Miller	{"Kickin' Incredibly Dope Shit (Intro)",Outside,"Get Em Up","Nikes on My Feet","Senior Skip Day","The Spins","Don't Mind If I Do","Paper Route (feat. Chevy Woods)","Good Evening","Ride Around","Knock Knock","Mad Flava, Heavy Flow (Interlude) [feat. DJ Bonics]","Kool Aid & Frozen Pizza","All I Want Is You",Poppy,"Face In The Crowd"}	https://i.scdn.co/image/ab67616d0000b2739d37f979163154904099eece
211	\N	Father John Misty	{"Funtimes in Babylon","Nancy From Now On","Hollywood Forever Cemetery Sings","I'm Writing a Novel","O I Long to Feel Your Arms Around Me","Misty's Nightmares 1 & 2","Only Son of the Ladiesman","This Is Sally Hatchet","Well, You Can Do It Without Me","Now I'm Learning to Love the War","Tee Pees 1-12","Everyman Needs a Companion"}	https://i.scdn.co/image/ab67616d0000b273f81572e9a17c58d81b0f70e9
212	\N	Beach House	{"Dark Spring","Pay No Mind","Lemon Glow",L'Inconnue,"Drunk In LA",Dive,"Black Car","Lose Your Smile",Woo,"Girl Of The Year","Last Ride"}	https://i.scdn.co/image/ab67616d0000b2730af2276ae66a42e73eb07683
213	\N	Weezer	{"Tired Of Sex",Getchoo,"No Other One","Why Bother?","Across The Sea","The Good Life","El Scorcho","Pink Triangle","Falling For You",Butterfly}	https://i.scdn.co/image/ab67616d0000b273f4f9accdc0fb8ddee29e32b7
214	\N	The Beatles	{"Back In The U.S.S.R. - Remastered 2009","Dear Prudence - Remastered 2009","Glass Onion - Remastered 2009","Ob-La-Di, Ob-La-Da - Remastered 2009","Wild Honey Pie - Remastered 2009","The Continuing Story Of Bungalow Bill - Remastered 2009","While My Guitar Gently Weeps - Remastered 2009","Happiness Is A Warm Gun - Remastered 2009","Martha My Dear - Remastered 2009","I'm So Tired - Remastered 2009","Blackbird - Remastered 2009","Piggies - Remastered 2009","Rocky Raccoon - Remastered 2009","Don't Pass Me By - Remastered 2009","Why Don't We Do It In The Road? - Remastered 2009","I Will - Remastered 2009","Julia - Remastered 2009","Birthday - Remastered 2009","Yer Blues - Remastered 2009","Mother Nature's Son - Remastered 2009","Everybody's Got Something To Hide Except Me And My Monkey - Remastered 2009","Sexy Sadie - Remastered 2009","Helter Skelter - Remastered 2009","Long, Long, Long - Remastered 2009","Revolution 1 - Remastered 2009","Honey Pie - Remastered 2009","Savoy Truffle - Remastered 2009","Cry Baby Cry - Remastered 2009","Revolution 9 - Remastered 2009","Good Night - Remastered 2009"}	https://i.scdn.co/image/ab67616d0000b2734ce8b4e42588bf18182a1ad2
215	\N	100 gecs	{"745 sticky","money machine","800 db cloud","I Need Help Immediately","stupid horse",xXXi_wud_nvrstøp_ÜXXx,ringtone,gecgecgec,"hand crushed by a mallet","gec 2 Ü"}	https://i.scdn.co/image/ab67616d0000b2734123c0f9b6689205d20f350f
216	\N	Alvvays	{"Adult Diversion","Archie, Marry Me","Ones Who Love You","Next of Kin","Party Police","The Agency Group",Dives,"Atop a Cake","Red Planet"}	https://i.scdn.co/image/ab67616d0000b273c026df4196939fd87a2dc6d8
217	\N	Kid Cudi	{Intro,"Down & Out","Is There Any Love","CuDi Get","Man On The Moon (The Anthem)","The Prayer","Day ‘n’ Nite","Embrace The Martian","Maui Wowie",Whenever,"Pillow Talk","Save My Soul (The CuDi Confession)",T.G.I.F.,"CuDi Spazzin'","Cleveland Is The Reason","Heaven At Nite"}	https://i.scdn.co/image/ab67616d0000b273cd4666c02c9749c71dabb8ea
218	\N	Geese	{2122,"3D Country","Cowboy Nudes","I See Myself",Undoer,Crusades,"Gravity Blues","Mysterious Love",Domoto,"Tomorrow's Crusades","St. Elmo"}	https://i.scdn.co/image/ab67616d0000b273441e6e776be5e5a4b6c2b9de
219	\N	JAY-Z	{Interlude,"December 4th","What More Can I Say",Encore,"Change Clothes","Dirt Off Your Shoulder",Threat,"Moment Of Clarity","99 Problems","Public Service Announcement (Interlude)","Justify My Thug",Lucifer,Allure,"My 1st Song"}	https://i.scdn.co/image/ab67616d0000b273c528802c308a1e0e4d9945dd
220	\N	Radiohead	{"Everything In Its Right Place","Kid A","The National Anthem","How to Disappear Completely",Treefingers,Optimistic,"In Limbo",Idioteque,"Morning Bell","Motion Picture Soundtrack",Untitled}	https://i.scdn.co/image/ab67616d0000b2736c7112082b63beefffe40151
221	\N	James Blake	{"Radio Silence",Points,"Love Me In Whatever Way",Timeless,f.o.r.e.v.e.r.,"Put That Away And Talk To Me","I Hope My Life - 1-800 Mix","Waves Know Shores","My Willing Heart","Choose Me","I Need A Forest Fire","Noise Above Our Heads","The Colour In Anything","Two Men Down","Modern Soul",Always,"Meet You In The Maze"}	https://i.scdn.co/image/ab67616d0000b273559bd53b0292ed01f789a0d8
222	\N	Poppy	{"Church Outfit",Knockoff,Hard,"What It Becomes",Flicker,"1s + 0s",Zig,Linger,"The Attic",Motorbike,"Prove It"}	https://i.scdn.co/image/ab67616d0000b2739bba19a42303a242b6d9700f
223	\N	MIKE	{"Intro with Klein",Dambe,Zap!,"African Sex Freak Fantasy","Snake Charm","plz don’t cut my wings (feat. Earl Sweatshirt)","REAL LOVE with Fashionspitta","U think Maybe? (feat. Liv.e and Venna)",Zombie,"Set the Mood","Billboards with Anuoluwapo “Sandra” Majekodunmi",98,"Do you Believe?","Burning Desire","THEY DON’T STOP IN THE RAIN with TAKA","Baby Jesus",Ho-Rizin,"Mussel Beach (feat. El Cousteau and Niontay)",Sixteens,"should be! (feat. Lila Ramani)","What U Say U Are","Golden Hour (feat. Larry June)","Playtime (Interlude)","Let's Have a Ball (feat. mark william lewis)"}	https://i.scdn.co/image/ab67616d0000b273640dcdba6913efcb8ef1afcd
224	\N	blink-182	{Dumpweed,"Don't Leave Me","Aliens Exist","Going Away To College","What's My Age Again?","Dysentery Gary","Adam's Song","All The Small Things","The Party Song",Mutt,"Wendy Clear",Anthem}	https://i.scdn.co/image/ab67616d0000b2736da502e35a7a3e48de2b0f74
225	\N	blink-182	{Cynical,"Bored to Death","She's Out Of Her Mind","Los Angeles",Sober,"Built This Pool","No Future","Home Is Such a Lonely Place","Kings of the Weekend","Teenage Satellites","Left Alone","Rabbit Hole (Explicit)","San Diego","The Only Thing That Matters",California,"Brohemian Rhapsody"}	https://i.scdn.co/image/ab67616d0000b273975116f966d8d19ff955029c
250	\N	Sabrina Carpenter	{Taste,"Please Please Please","Good Graces","Sharpest Tool",Coincidence,"Bed Chem",Espresso,"Dumb & Poetic","Slim Pickins",Juno,"Lie To Girls","Don’t Smile"}	https://i.scdn.co/image/ab67616d0000b273fd8d7a8d96871e791cb1f626
251	\N	Frank Ocean	{Nikes,Ivy,"Pink + White","Be Yourself",Solo,"Skyline To","Self Control","Good Guy",Nights,"Solo (Reprise)","Pretty Sweet","Facebook Story","Close To You","White Ferrari",Seigfried,Godspeed,"Futura Free"}	https://i.scdn.co/image/ab67616d0000b273c5649add07ed3720be9d5526
252	\N	Kendrick Lamar	{BLOOD.,DNA.,YAH.,ELEMENT.,FEEL.,"LOYALTY. FEAT. RIHANNA.",PRIDE.,HUMBLE.,LUST.,"LOVE. FEAT. ZACARI.","XXX. FEAT. U2.",FEAR.,GOD.,DUCKWORTH.}	https://i.scdn.co/image/ab67616d0000b2738b52c6b9bc4e43d873869699
253	\N	Olivia Rodrigo	{brutal,traitor,"drivers license","1 step forward, 3 steps back","deja vu","good 4 u","enough for you",happier,"jealousy, jealousy","favorite crime","hope ur ok"}	https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a
254	\N	Noah Kahan	{"Northern Attitude","Stick Season","All My Love","She Calls Me Back","Come Over","New Perspective","Everywhere, Everything","Orange Juice","Strawberry Wine","Growing Sideways",Halloween,Homesick,Still,"The View Between Villages"}	https://i.scdn.co/image/ab67616d0000b2736ee35072df1af802cca09918
255	\N	Post Malone	{"Wrong Ones (Feat. Tim McGraw)","Finer Things (Feat. Hank Williams Jr.)","I Had Some Help (Feat. Morgan Wallen)","Pour Me A Drink (Feat. Blake Shelton)","Have The Heart (Feat. Dolly Parton)","What Don't Belong To Me","Goes Without Saying (Feat. Brad Paisley)","Guy For That (Feat. Luke Combs)","Nosedive (Feat. Lainey Wilson)","Losers (Feat. Jelly Roll)","Devil I've Been (Feat. ERNEST)","Never Love You Again (Feat. Sierra Ferrell)","Missin’ You Like This (Feat. Luke Combs)","California Sober (Feat. Chris Stapleton)","Hide My Gun (Feat. HARDY)","Right About You","M-E-X-I-C-O (Feat. Billy Strings)",Yours}	https://i.scdn.co/image/ab67616d0000b27388208159b1b3c69eefdeb2e0
256	\N	Travis Scott	{HYAENA,"THANK GOD","MODERN JAM (feat. Teezo Touchdown)","MY EYES","GOD'S COUNTRY",SIRENS,"MELTDOWN (feat. Drake)","FE!N (feat. Playboi Carti)","DELRESTO (ECHOES) (feat. Beyoncé)","I KNOW ?","TOPIA TWINS (feat. Rob49 & 21 Savage)","CIRCUS MAXIMUS (feat. The Weeknd & Swae Lee)","PARASAIL (feat. Yung Lean & Dave Chappelle)","SKITZO (feat. Young Thug)","LOST FOREVER (feat. Westside Gunn)","LOOOVE (feat. Kid Cudi)","K-POP (feat. Bad Bunny & The Weeknd)","TELEKINESIS (feat. SZA & Future)","TIL FURTHER NOTICE (feat. James Blake & 21 Savage)"}	https://i.scdn.co/image/ab67616d0000b273881d8d8378cd01099babcd44
257	\N	Tyler, The Creator	{"St. Chroma (feat. Daniel Caesar)","Rah Tah Tah",Noid,"Darling, I (feat. Teezo Touchdown)","Hey Jane","I Killed You","Judge Judy","Sticky (feat. GloRilla, Sexyy Red & Lil Wayne)","Take Your Mask Off (feat. Daniel Caesar & LaToiya Williams)",Tomorrow,"Thought I Was Dead (feat. ScHoolboy Q & Santigold)","Like Him (feat. Lola Young)","Balloon (feat. Doechii)","I Hope You Find Your Way Home"}	https://i.scdn.co/image/ab67616d0000b273124e9249fada4ff3c3a0739c
258	\N	Billie Eilish	{SKINNY,LUNCH,CHIHIRO,"BIRDS OF A FEATHER",WILDFLOWER,"THE GREATEST","L’AMOUR DE MA VIE","THE DINER",BITTERSUITE,BLUE}	https://i.scdn.co/image/ab67616d0000b27371d62ea7ea8a5be92d3c1f62
259	\N	Gracie Abrams	{"Felt Good About You",Risk,"Blowing Smoke","I Love You, I'm Sorry","us. (feat. Taylor Swift)","Let It Happen","Tough Love","I Knew It, I Know You","Gave You I Gave You I","Normal Thing","Good Luck Charlie","Free Now","Close To You",Cool,"That’s So True","I Told You Things","Packing It Up","I Love You, I'm Sorry - Live From Vevo","I Knew It, I Know You - Live From Vevo","Free Now - Live From Vevo"}	https://i.scdn.co/image/ab67616d0000b2731dac3694b3289cd903cb3acf
260	\N	Morgan Wallen	{"Born With A Beer In My Hand","Last Night","Everything I Love","Man Made A Bar (feat. Eric Church)","Devil Don’t Know","One Thing At A Time","’98 Braves","Ain’t That Some","I Wrote The Book","Tennessee Numbers","Hope That’s True","Whiskey Friends",Sunrise,"Keith Whitley","In The Bible (feat. HARDY)","You Proof","Thought You Should Know",F150-50,"Neon Star (Country Boy Lullaby)","I Deserve A Drink","Wine Into Water","Me + All Your Reasons","Tennessee Fan","Money On Me","Thinkin’ Bout Me","Single Than She Was","Days That End In Why","Last Drive Down Main","Me To Me","Don't Think Jesus","180 (Lifestyle)","Had It","Cowgirls (feat. ERNEST)","Good Girl Gone Missin’",Outlook,"Dying Man"}	https://i.scdn.co/image/ab67616d0000b273705079df9a25a28b452c1fc9
261	\N	Lil Uzi Vert	{"We Good","Light Year (Practice)","Meteor Man","Paars In The Mars","The Rush (feat. Big Time Rush)","Not An Option","She Stank","Mr Chow","Lyft Em Up","Chips and Dip","Black Hole","Chill Bae","Goddard Song",PerkySex,Conceited,"Space High"}	https://i.scdn.co/image/ab67616d0000b2730e4e16d910115fead3e83496
262	\N	Kanye West	{"Good Morning",Champion,Stronger,"I Wonder","Good Life","Can't Tell Me Nothing","Barry Bonds","Drunk and Hot Girls","Flashing Lights","Everything I Am","The Glory",Homecoming,"Big Brother","Good Night"}	https://i.scdn.co/image/ab67616d0000b27326f7f19c7f0381e56156c94a
263	\N	Kanye West	{"Every Hour",Selah,"Follow God","Closed On Sunday","On God","Everything We Need",Water,"God Is","Hands On","Use This Gospel","Jesus Is Lord"}	https://i.scdn.co/image/ab67616d0000b2731bb797bbfe2480650b6c2964
264	\N	Kanye West	{"Ultralight Beam","Father Stretch My Hands Pt. 1","Pt. 2",Famous,Feedback,"Low Lights",Highlights,"Freestyle 4","I Love Kanye",Waves,FML,"Real Friends",Wolves,"Frank's Track","Siiiiiiiiilver Surffffeeeeer Intermission","30 Hours","No More Parties In LA","Facts (Charlie Heat Version)",Fade,"Saint Pablo"}	https://i.scdn.co/image/ab67616d0000b2732a7db835b912dc5014bd37f4
265	\N	Kanye West	{"On Sight","Black Skinhead","I Am A God","New Slaves","Hold My Liquor","I'm In It","Blood On The Leaves","Guilt Trip","Send It Up","Bound 2"}	https://i.scdn.co/image/ab67616d0000b2731dacfbc31cc873d132958af9
266	\N	One Direction	{"What Makes You Beautiful","Gotta Be You","One Thing","More Than This","Up All Night","I Wish","Tell Me a Lie",Taken,"I Want","Everything About You","Same Mistakes","Save You Tonight","Stole My Heart","Stand Up",Moments,"Another World","Na Na Na","I Should Have Kissed You"}	https://i.scdn.co/image/ab67616d0000b2734a5584795dc73860653a9a3e
267	\N	One Direction	{"Steal My Girl","Ready to Run","Where Do Broken Hearts Go",18,"Girl Almighty","Fool's Gold","Night Changes","No Control",Fireproof,Spaces,"Stockholm Syndrome",Clouds,"Change Your Ticket",Illusion,"Once in a Lifetime","Act My Age"}	https://i.scdn.co/image/ab67616d0000b273d304ba2d71de306812eebaf4
268	\N	Harry Styles	{Golden,"Watermelon Sugar","Adore You","Lights Up",Cherry,Falling,"To Be So Lonely",She,"Sunflower, Vol. 6","Canyon Moon","Treat People With Kindness","Fine Line"}	https://i.scdn.co/image/ab67616d0000b27377fdcfda6535601aff081b6a
269	\N	Harry Styles	{"Music For a Sushi Restaurant","Late Night Talking",Grapejuice,"As It Was",Daylight,"Little Freak",Matilda,Cinema,Daydreaming,"Keep Driving",Satellite,Boyfriends,"Love Of My Life"}	https://i.scdn.co/image/ab67616d0000b2732e8ed79e177ff6011076f5f0
270	\N	One Direction	{"Hey Angel","Drag Me Down",Perfect,Infinity,"End of the Day","If I Could Fly","Long Way Down","Never Enough",Olivia,"What a Feeling","Love You Goodbye","I Want to Write You a Song",History,"Temporary Fix","Walking in the Wind",Wolves,A.M.}	https://i.scdn.co/image/ab67616d0000b273241e4fe75732c9c4b49b94c3
271	\N	Big Time Rush	{"Til I Forget About You",Boyfriend,"City Is Ours","Nothing Even Matters",Worldwide,"Halfway There","Big Night","Oh Yeah","Count On You (feat. Jordin Sparks)","I Know You Know (feat. Cymphonique)","Big Time Rush"}	https://i.scdn.co/image/ab67616d0000b27350acd1f66ebd5b84630c7129
272	\N	Big Time Rush	{Paralyzed}	https://i.scdn.co/image/ab67616d0000b2739e7977ad935795ecb3807195
273	\N	Big Time Rush	{"Can't Get Enough",Waves,"I Just Want To (Party All the Time)",Weekends,"Work for It","Forget You Now","Brand New","Ask You Tonight",Superstitious,"Another Life","Shot In The Dark","Learn To Love",Dreamworld,"Your Way","Weekends (Acoustic)"}	https://i.scdn.co/image/ab67616d0000b273a2c61a0bb250e23954ec0b20
274	\N	Big Time Rush	{"Can't Get Enough",Waves,"I Just Want To (Party All the Time)",Weekends,"Work for It","Forget You Now","Brand New","Ask You Tonight",Superstitious,"Another Life","Shot In The Dark","Learn To Love",Dreamworld,"Your Way","Weekends (Acoustic)"}	https://i.scdn.co/image/ab67616d0000b273a2c61a0bb250e23954ec0b20
275	\N	Kesha	{"Your Love Is My Drug","TiK ToK","Take It Off","Kiss N Tell",Stephen,"Blah Blah Blah (feat. 3OH!3)",Hungover,"Party At A Rich Dude's House",Backstabber,Blind,Dinosaur,"Dancing With Tears In My Eyes","Boots & Boys",Animal,VIP,"c u next tuesday","TiK ToK - Wolfedelic Club Mix","TiK ToK - Fred Falke Club Remix"}	https://i.scdn.co/image/ab67616d0000b2737a6339d6ddfd579f77559b3c
276	\N	Kesha	{"Your Love Is My Drug","TiK ToK","Take It Off","Kiss N Tell",Stephen,"Blah Blah Blah (feat. 3OH!3)",Hungover,"Party At A Rich Dude's House",Backstabber,Blind,Dinosaur,"Dancing With Tears In My Eyes","Boots & Boys",Animal,VIP,"c u next tuesday","TiK ToK - Wolfedelic Club Mix","TiK ToK - Fred Falke Club Remix"}	https://i.scdn.co/image/ab67616d0000b2737a6339d6ddfd579f77559b3c
277	\N	Lemonade Mouth	{"Turn Up the Music",Somebody,"And the Crowd Goes","Determinate - From \\"Lemonade Mouth\\"","Here We Go","She's So Gone","More Than a Band","Don't Ya Wish U Were Us?",Breakthrough,"Livin' On a High Wire"}	https://i.scdn.co/image/ab67616d0000b273d9a239d0a67fc31a9b9fff59
278	\N	blink-182	{"Feeling This",Obvious,"I Miss You",Violence,"Stockholm Syndrome Interlude","Stockholm Syndrome",Down,"The Fallen Interlude",Go,Asthenia,Always,"Easy Target","All Of This","Here's Your Letter","I'm Lost Without You"}	https://i.scdn.co/image/ab67616d0000b2730a4ae12eb3a9fb7e3815001c
279	\N	Metallica	{"Enter Sandman (Remastered)","Sad But True (Remastered)","Holier Than Thou (Remastered)","The Unforgiven (Remastered)","Wherever I May Roam (Remastered)","Don't Tread on Me (Remastered)","Through the Never (Remastered)","Nothing Else Matters (Remastered)","Of Wolf and Man (Remastered)","The God That Failed (Remastered)","My Friend of Misery (Remastered)","The Struggle Within (Remastered)"}	https://i.scdn.co/image/ab67616d0000b2731f9edf15e43f4c2f4938b869
280	\N	Metallica	{"Fight Fire With Fire (Remastered)","Ride The Lightning (Remastered)","For Whom The Bell Tolls (Remastered)","Fade To Black (Remastered)","Trapped Under Ice (Remastered)","Escape (Remastered)","Creeping Death (Remastered)","The Call Of Ktulu (Remastered)"}	https://i.scdn.co/image/ab67616d0000b273b09e5084136821bf64d327f4
281	\N	Megadeth	{"Holy Wars...The Punishment Due","Hangar 18","Take No Prisoners","Five Magics","Poison Was The Cure",Lucretia,"Tornado Of Souls","Dawn Patrol","Rust In Peace...Polaris"}	https://i.scdn.co/image/ab67616d0000b27342be808911785ceb13140edc
282	\N	Megadeth	{"Skin O' My Teeth - 2004 Remastered","Symphony Of Destruction","Architecture Of Aggression","Foreclosure Of A Dream - 2004 Remastered","Sweating Bullets - Remastered 2004","This Was My Life","Countdown To Extinction","High Speed Dirt",Psychotron,"Captive Honour","Ashes In Your Mouth - 2004 Remastered","Crown Of Worms - 2004 Remaster","Countdown To Extinction - Demo","Symphony Of Destruction - Demo","Psychotron - Demo"}	https://i.scdn.co/image/ab67616d0000b2737b178f928742be1492c6fba2
283	\N	Metallica	{"Hit The Lights (Remastered)","The Four Horsemen (Remastered)","Motorbreath (Remastered)","Jump In The Fire (Remastered)","(Anesthesia)--Pulling Teeth (Remastered)","Whiplash (Remastered)","Phantom Lord (Remastered)","No Remorse (Remastered)","Seek & Destroy (Remastered)","Metal Militia (Remastered)"}	https://i.scdn.co/image/ab67616d0000b27320292e6cce666a69ba5a86fb
284	\N	Metallica	{"Battery (Remastered)","Master of Puppets (Remastered)","The Thing That Should Not Be (Remastered)","Welcome Home (Sanitarium) (Remastered)","Disposable Heroes (Remastered)","Leper Messiah (Remastered)","Orion (Remastered)","Damage, Inc. (Remastered)","Battery (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Master of Puppets (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","For Whom The Bell Tolls (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Welcome Home (Sanitarium) (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","The Thing That Should Not Be (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","(Anesthesia) - Pulling Teeth (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Damage, Inc. (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Fade to Black (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Seek & Destroy (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Creeping Death (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","The Four Horsemen (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Guitar Solo (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Am I Evil? (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Whiplash (Live at the Aragon Ballroom, Chicago, IL - May 25th, 1986)","Battery (October 1985, Work in Progress Rough Mix)","Master of Puppets (November 1985, Work in Progress Rough Mix)","The Thing That Should Not Be (December 1985, Work in Progress Rough Mix)","Welcome Home (Sanitarium) (November 1985, Work in Progress Rough Mix)","Disposable Heroes (November 1985, Work in Progress Rough Mix)","Leper Messiah (December 1985, Work in Progress Rough Mix)","Orion (November 1985, Work in Progress Rough Mix)","Damage, Inc. (October 1985, Work in Progress Rough Mix)","The Money Will Roll Right In (Work in Progress Rough Mix)","The Prince (Work in Progress Rough Mix)","Battery (1985, from James' Riff Tapes)","Battery (1985, from James' Riff Tapes II)","Master of Puppets (1985, from Kirk's Riff Tapes)","Master of Puppets (1985, from James' Riff Tapes)","Master of Puppets (1985, from James' Riff Tapes II)","The Thing That Should Not Be (1985, from James' Riff Tapes)","Welcome Home (Sanitarium) (1985, from James' Riff Tapes)","Welcome Home (Sanitarium) (1985, from James' Riff Tapes II)","Disposable Heroes (1985, from Kirk's Riff Tapes)","Disposable Heroes (1985, from James' Riff Tapes)","Leper Messiah (1985, from James' Riff Tapes)","Leper Messiah (1985, from James' Riff Tapes II)","Orion (1985, from James' Riff Tapes)","Damage, Inc. (1985, from James' Riff Tapes)","Disposable Heroes (May 1985, Writing in Progress)","Battery (May 1985, Writing in Progress)","Welcome Home (Sanitarium) (May 1985, Writing in Progress)","Disposable Heroes (May 1985, Writing in Progress II)"}	https://i.scdn.co/image/ab67616d0000b273cad4832cb7b5844343278daa
285	\N	Metallica	{Fuel,"The Memory Remains","Devil's Dance","The Unforgiven II","Better Than You",Slither,"Carpe Diem Baby","Bad Seed","Where The Wild Things Are","Prince Charming","Low Man's Lyric",Attitude,Fixxxer}	https://i.scdn.co/image/ab67616d0000b273a49eff6d64cafc2551553380
286	\N	Metallica	{"Ain't My B*tch","2 X 4","The House Jack Built","Until It Sleeps","King Nothing","Hero Of The Day","Bleeding Me",Cure,"Poor Twisted Me","Wasting My Hate","Mama Said","Thorn Within",Ronnie,"The Outlaw Torn"}	https://i.scdn.co/image/ab67616d0000b2730a3eb7ef6df5732fc6fa77ec
287	\N	Metallica	{"Ain't My B*tch","2 X 4","The House Jack Built","Until It Sleeps","King Nothing","Hero Of The Day","Bleeding Me",Cure,"Poor Twisted Me","Wasting My Hate","Mama Said","Thorn Within",Ronnie,"The Outlaw Torn"}	https://i.scdn.co/image/ab67616d0000b2730a3eb7ef6df5732fc6fa77ec
288	\N	Metallica	{"Ain't My B*tch","2 X 4","The House Jack Built","Until It Sleeps","King Nothing","Hero Of The Day","Bleeding Me",Cure,"Poor Twisted Me","Wasting My Hate","Mama Said","Thorn Within",Ronnie,"The Outlaw Torn"}	https://i.scdn.co/image/ab67616d0000b2730a3eb7ef6df5732fc6fa77ec
289	\N	Future	{"Rent Money","Good Dope",Zoom,Draco,"Super Trapper",POA,"Mask Off","High Demand","Outta Time",Scrape,"I'm so Groovy","Might as Well","Poppin' Tags","Massage In My Room",Flip,"When I Was Broke","Feds Did a Sweep","Used to This (feat. Drake)","Mask Off (feat. Kendrick Lamar) - Remix","Extra Luv (feat. YG)"}	https://i.scdn.co/image/ab67616d0000b273e0b64c8be3c4e804abcb2696
290	\N	Tyler, The Creator	{"Foreword (feat. Rex Orange County)","Where This Flower Blooms (feat. Frank Ocean)",Sometimes...,"See You Again (feat. Kali Uchis)","Who Dat Boy (feat. A$AP Rocky)","Pothole (feat. Jaden Smith)","Garden Shed (feat. Estelle)","Boredom (feat. Rex Orange County & Anna of the North)","I Ain't Got Time!","911 / Mr. Lonely (feat. Frank Ocean & Steve Lacy)","Droppin' Seeds (feat. Lil' Wayne)",November,Glitter,"Enjoy Right Now, Today"}	https://i.scdn.co/image/ab67616d0000b2738940ac99f49e44f59e6f7fb3
291	\N	Playboi Carti	{Location,Magnolia,Lookin,wokeuplikethis*,"Let It Go","Half & Half","New Choppa","Other Shit","NO. 9",dothatshit!,"Lame Niggaz","Yah Mean",Flex,"Kelly K","Had 2"}	https://i.scdn.co/image/ab67616d0000b273e31a279d267f3b3d8912e6f1
292	\N	Childish Gambino	{"The Library (Intro)",I.Crawl,"II. Worldstar","Dial Up","I. The Worst Guys","II. Shadows","III. Telegraph Ave. (\\"Oakland\\" by Lloyd)","IV. Sweatpants",3005,"Playing Around Before the Party Starts","I. The Party","II. No Exit","Death By Numbers","I. Flight of the Navigator","II. Zealots of Stockholm [Free Information]","III. Urn","I. Pink Toes","II. Earth: The Oldest Computer (The Last Night)","III. Life: The Biggest Troll [Andrew Auernheimer]"}	https://i.scdn.co/image/ab67616d0000b27321b2b485aef32bcc96c1875c
293	\N	Steve Lacy	{Static,Helmet,Mercury,Buttons,"Bad Habit","2Gether (Enterlude)","Cody Freestyle",Amber,"Sunshine (feat. Fousheé)","Give You the World"}	https://i.scdn.co/image/ab67616d0000b27368968350c2550e36d96344ee
294	\N	Wale	{"The Intro About Nothing","The Helium Balloon","The White Shoes","The Pessimist (feat. J. Cole)","The Middle Finger","The One Time in Houston","The Girls on Drugs","The God Smile","The Need to Know (feat. SZA)","The Success","The Glass Egg","The Bloom (AG3)","The Matrimony (feat. Usher)","The Body (feat. Jeremih)"}	https://i.scdn.co/image/ab67616d0000b2739510ea130a19b0566021942c
295	\N	Playboi Carti	{"Long Time - Intro",R.I.P.,"Lean 4 Real (feat. Skepta)","Old Money","Love Hurts (feat. Travis Scott)","Shoota (feat. Lil Uzi Vert)","Right Now (feat. Pi'erre Bourne)","Poke It Out (with Nicki Minaj)","Home (KOD)","Fell In Luv (feat. Bryson Tiller)",Foreign,"Pull Up","Mileage (feat. Chief Keef)","FlatBed Freestyle","No Time (feat. Gunna)","Middle Of The Summer (feat. Red Coldhearted)","Choppa Won't Miss (feat. Young Thug)","R.I.P. Fredo (feat. Young Nudy) - Notice Me","Top (feat. Pi'erre Bourne)"}	https://i.scdn.co/image/ab67616d0000b273a1e867d40e7bb29ced5c0194
296	\N	Mac Miller	{"Inside Outside","Here We Go","Friends (feat. ScHoolboy Q)","Angel Dust",Malibu,"What Do You Do (feat. Sir Michael Rocks)","It Just Doesn’t Matter",Therapy,"Polo Jeans (feat. Earl Sweatshirt)","Happy Birthday",Wedding,Funeral,Diablo,"Ave Maria",55,"San Francisco","Colors and Shapes","Insomniak (feat. Rick Ross)","Uber (feat. Mike Jones)","Rain (feat. Vince Staples)",Apparition,Thumbalina,"New Faces v2 (feat. Earl Sweatshirt and Da$h)","Grand Finale","Yeah - bonus"}	https://i.scdn.co/image/ab67616d0000b273e4251cf5331ad74eaaeca36e
297	\N	Gunna	{ARGENTINA,GIMMICK,MOTW,FEIGNING,"DOLLAZ ON MY HEAD (feat. Young Thug)","ADDYS (feat. Nechie)",SKYBOX,WUNNA,"BLINDFOLD (feat. Lil Baby)","ROCKSTAR BIKERS & CHAINS","MET GALA","NASTY GIRL / ON CAMERA","COOLER THAN A BITCH (feat. Roddy Ricch)","I'M ON SOME","TOP FLOOR (feat. Travis Scott)","DON'T PLAY AROUND","DO BETTER","FAR (feat. Young Thug)"}	https://i.scdn.co/image/ab67616d0000b2730c44c5aeade167d1266b915d
298	\N	MF DOOM	{"Beef Rapp","Hoe Cakes",Potholderz,"One Beer","Deep Fried Frenz","Poo-Putt Platter",Fillet-O-Rapper,Gumbo,"Fig Leaf Bi-Carbonate","Kon Karne",Guinnessez,"Kon Queso","Rapp Snitch Knishes",Vomitspit,Kookies}	https://i.scdn.co/image/ab67616d0000b27352f194d02c39909d1b284799
299	\N	Megadeth	{"Reckoning Day - Remastered 2004","Train Of Consequences","Addicted To Chaos","A Tout Le Monde","Elysian Fields","The Killing Road","Blood Of Heroes","Family Tree",Youthanasia,"I Thought I Knew It All","Black Curtains",Victory}	https://i.scdn.co/image/ab67616d0000b2731d9c7b91334880fb1700dc00
519	\N	Chance the Rapper	{"Good Ass Intro","Pusha Man",Paranoia,"Cocoa Butter Kisses",Juice,Lost,"Everybody's Something","Interlude (That's Love)","Favorite Song",NaNa,"Smoke Again","Acid Rain","Chain Smoker","Everything's Good (Good Ass Outro)"}	https://i.scdn.co/image/ab67616d0000b273d95ab48a8a9de3c4a2cbfe80
520	\N	Chance the Rapper	{"All Day Long","Do You Remember",Eternal,"Hot Shower","We Go High","I Got You (Always and Forever)","Photo Ops (Skit)",Roo,"The Big Day","Let's Go On The Run",Handsome,"Big Fish","Ballin Flossin","4 Quarters In The Black (Skit)","5 Year Plan","Get A Bag","Slide Around","Sun Come Down","Found A Good One (Single No More)","Town On The Hill","Our House (Skit)","Zanies and Fools"}	https://i.scdn.co/image/ab67616d0000b273a29ab3b0e07c6191f7d3ca6b
521	\N	Yellowcard	{"Way Away",Breathing,"Ocean Avenue","Empty Apartment","Life Of A Salesman","Only One","Miles Apart",Twentythree,"View From Heaven","Inside Out",Believe,"One Year, Six Months","Back Home"}	https://i.scdn.co/image/ab67616d0000b273d1fd8f264564d9eef7617a45
522	\N	Yellowcard	{"Three Flights Up - Instrumental","Lights And Sounds","Down On My Head","Sure Thing Falling","City Of Devils","Rough Landing, Holly","Two Weeks From Twenty","Waiting Game","Martin Sheen Or JFK","Space Travel",Grey,"Words, Hands, Hearts","How I Go","Holly Wood Died"}	https://i.scdn.co/image/ab67616d0000b2735c6f9b09bf2035d181e19aac
\.


--
-- Data for Name: bookmark; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.bookmark ("userID", "mediaID") FROM stdin;
2	12
2	205
2	315
2	434
2	20
2	202
2	312
2	431
3	90
2	59
3	203
3	205
3	311
3	404
2	411
2	71
2	464
2	5
2	68
18	9
18	326
32	3
27	494
39	80
27	67
27	10
32	214
32	417
32	28
2	28
26	35
32	404
32	206
27	416
32	15
32	82
2	93
26	252
41	34
41	20
42	405
41	71
33	84
33	85
32	30
32	333
44	3
32	423
32	22
27	329
47	262
47	494
33	87
32	93
32	290
32	49
32	2
27	52
32	29
41	431
27	446
27	448
32	221
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.books ("mediaID", "gID", author, cover_url, year) FROM stdin;
300	\N		https://via.placeholder.com/150	1968
301	\N		https://covers.openlibrary.org/b/id/8741178-L.jpg	N/A
302	\N	Unknown	https://covers.openlibrary.org/b/id/12714937-L.jpg	N/A
303	\N		https://covers.openlibrary.org/b/id/14809759-L.jpg	N/A
304	\N		https://covers.openlibrary.org/b/id/8600810-L.jpg	N/A
305	\N	Unknown	https://covers.openlibrary.org/b/id/11403085-L.jpg	N/A
306	\N		https://covers.openlibrary.org/b/id/5605078-L.jpg	N/A
307	\N		https://covers.openlibrary.org/b/id/1611308-L.jpg	N/A
308	\N		https://via.placeholder.com/150	N/A
309	\N		https://covers.openlibrary.org/b/id/1845533-L.jpg	1913
312	\N	, 	https://covers.openlibrary.org/b/id/6424160-L.jpg	September 9, 2005
313	\N		https://covers.openlibrary.org/b/id/11261770-L.jpg	1997
314	\N		https://covers.openlibrary.org/b/id/6633571-L.jpg	N/A
315	\N		https://covers.openlibrary.org/b/id/368945-L.jpg	N/A
316	\N		https://covers.openlibrary.org/b/id/8231759-L.jpg	N/A
317	\N		https://covers.openlibrary.org/b/id/14651714-L.jpg	N/A
318	\N		https://covers.openlibrary.org/b/id/7075869-L.jpg	N/A
319	\N		https://covers.openlibrary.org/b/id/12015639-L.jpg	N/A
320	\N		https://covers.openlibrary.org/b/id/759779-L.jpg	N/A
321	\N	Unknown	https://covers.openlibrary.org/b/id/9669645-L.jpg	N/A
322	\N		https://covers.openlibrary.org/b/id/6879263-L.jpg	N/A
323	\N	Unknown	https://covers.openlibrary.org/b/id/8784580-L.jpg	N/A
333	\N		https://covers.openlibrary.org/b/id/10110415-L.jpg	N/A
334	\N		https://covers.openlibrary.org/b/id/7247522-L.jpg	N/A
335	\N		https://covers.openlibrary.org/b/id/7888937-L.jpg	N/A
336	\N		https://covers.openlibrary.org/b/id/12366143-L.jpg	N/A
337	\N		https://covers.openlibrary.org/b/id/10323405-L.jpg	N/A
338	\N		https://covers.openlibrary.org/b/id/8314206-L.jpg	N/A
339	\N		https://covers.openlibrary.org/b/id/8542270-L.jpg	N/A
340	\N		https://covers.openlibrary.org/b/id/7316502-L.jpg	N/A
341	\N		https://covers.openlibrary.org/b/id/14419326-L.jpg	N/A
342	\N		https://covers.openlibrary.org/b/id/2480247-L.jpg	N/A
343	\N		https://covers.openlibrary.org/b/id/278778-L.jpg	N/A
344	\N		https://covers.openlibrary.org/b/id/278779-L.jpg	N/A
345	\N		https://covers.openlibrary.org/b/id/278780-L.jpg	N/A
346	\N		https://covers.openlibrary.org/b/id/6390410-L.jpg	N/A
347	\N		https://covers.openlibrary.org/b/id/12646537-L.jpg	N/A
348	\N		https://covers.openlibrary.org/b/id/12646539-L.jpg	N/A
349	\N		https://covers.openlibrary.org/b/id/12646459-L.jpg	N/A
350	\N		https://covers.openlibrary.org/b/id/6636110-L.jpg	N/A
310	\N	Daniel Defoe	https://covers.openlibrary.org/b/id/4309075-L.jpg	N/A
311	\N	James Clear	https://covers.openlibrary.org/b/id/12539702-L.jpg	N/A
332	\N	J.K. Rowling	https://covers.openlibrary.org/b/id/12059372-L.jpg	2000
329	\N	James Dashner	https://covers.openlibrary.org/b/id/10464801-L.jpg	2009
330	\N	Jeff Kinney	https://covers.openlibrary.org/b/id/9407045-L.jpg	2007
331	\N	J.K. Rowling	https://covers.openlibrary.org/b/id/10580435-L.jpg	1999
326	\N	J.K. Rowling	https://covers.openlibrary.org/b/id/14815558-L.jpg	1997
327	\N	J.K. Rowling	https://covers.openlibrary.org/b/id/14648524-L.jpg	2003
328	\N	J.K. Rowling	https://covers.openlibrary.org/b/id/10716273-L.jpg	2005
324	\N	Daisy Meadows	https://covers.openlibrary.org/b/id/9214389-L.jpg	2015
325	\N	Olivia George	https://covers.openlibrary.org/b/id/1263668-L.jpg	2005
351	\N		https://covers.openlibrary.org/b/id/8281954-L.jpg	1950
352	\N		https://covers.openlibrary.org/b/id/11446715-L.jpg	N/A
353	\N	Unknown	https://covers.openlibrary.org/b/id/7285167-L.jpg	N/A
\.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.friends ("fID", username) FROM stdin;
\.


--
-- Data for Name: friendsList; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public."friendsList" ("userID", "fID") FROM stdin;
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.genres ("gID", name) FROM stdin;
4	Pop
3	Thriller
2	Superhero
1	Horror
0	Action-Adventure
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.media ("mediaId", title, description, "mediaImage", "releaseDate") FROM stdin;
206	Weezer	\N	\N	2001-05-15
208	BEST INTEREST	\N	\N	2020-01-25
213	Pinkerton	\N	\N	1996-09-24
218	3D Country	\N	\N	2023-06-23
223	Burning Desire	\N	\N	2023-10-13
406	God of War Ragnarök	Kratos' adventures through Norse mythology comes to an end in God of War Ragnarök.	\N	2022-11-09
1	Fight Club	A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.	\N	1999-10-15
2	Spider-Man	After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.	\N	2002-05-01
3	Interstellar	The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.	\N	2014-11-05
4	The Dark Knight	Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.	\N	2008-07-16
5	Raiders of the Lost Ark	When Dr. Indiana Jones – the tweed-suited professor who just happens to be a celebrated archaeologist – is hired by the government to locate the legendary Ark of the Covenant, he finds himself up against the entire Nazi regime.	\N	1981-06-12
6	Indiana Jones and the Temple of Doom	After arriving in India, Indiana Jones is asked by a desperate village to find a mystical stone. He agrees – and stumbles upon a secret cult plotting a terrible plan in the catacombs of an ancient palace.	\N	1984-05-23
7	Dirty Dancing	Expecting the usual tedium that accompanies a summer in the Catskills with her family, 17-year-old Frances 'Baby' Houseman is surprised to find herself stepping into the shoes of a professional hoofer—and unexpectedly falling in love.	\N	1987-08-21
8	Indiana Jones and the Last Crusade	In 1938, an art collector appeals to eminent archaeologist Dr. Indiana Jones to embark on a search for the Holy Grail. Indy learns that a medieval historian has vanished while searching for it, and the missing man is his own father, Dr. Henry Jones Sr.. He sets out to rescue his father by following clues in the old man's notebook, which his father had mailed to him before he went missing. Indy arrives in Venice, where he enlists the help of a beautiful academic, Dr. Elsa Schneider, along with Marcus Brody and Sallah. Together they must stop the Nazis from recovering the power of eternal life and taking over the world!	\N	1989-05-24
9	Toy Story	Led by Woody, Andy's toys live happily in his room until Andy's birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy's heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.	\N	1995-10-30
10	Toy Story 2	Andy heads off to Cowboy Camp, leaving his toys to their own devices. Things shift into high gear when an obsessive toy collector named Al McWhiggen, owner of Al's Toy Barn kidnaps Woody. Andy's toys mount a daring rescue mission, Buzz Lightyear meets his match and Woody has to decide where he and his heart truly belong.	\N	1999-10-30
11	Toy Story 3	Woody, Buzz, and the rest of Andy's toys haven't been played with in years. With Andy about to go to college, the gang find themselves accidentally left at a nefarious day care center. The toys must band together to escape and return home to Andy.	\N	2010-06-16
12	Toy Story 4	Woody has always been confident about his place in the world and that his priority is taking care of his kid, whether that's Andy or Bonnie. But when Bonnie adds a reluctant new toy called "Forky" to her room, a road trip adventure alongside old and new friends will show Woody how big the world can be for a toy.	\N	2019-06-19
13	Tangled	Feisty teenager Rapunzel, who has long and magical hair, wants to go and see sky lanterns on her eighteenth birthday, but she's bound to a tower by her overprotective mother. She strikes a deal with Flynn Rider, a charming wanted thief, and the duo set off on an action-packed escapade.	\N	2010-11-24
14	WALL·E	What if mankind had to leave Earth and somebody forgot to turn the last robot off? After hundreds of years doing what he was built for, WALL•E discovers a new purpose in life when he meets a sleek search robot named EVE. EVE comes to realize that WALL•E has inadvertently stumbled upon the key to the planet's future, and races back to space to report to the humans. Meanwhile, WALL•E chases EVE across the galaxy and sets into motion one of the most imaginative adventures ever brought to the big screen.	\N	2008-06-22
15	Oppenheimer	The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.	\N	2023-07-19
16	Blade Runner	In the smog-choked dystopian Los Angeles of 2019, blade runner Rick Deckard is called out of retirement to terminate a quartet of replicants who have escaped to Earth seeking their creator for a way to extend their short life spans.	\N	1982-06-25
17	Blade Runner 2049	Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what's left of society into chaos. K's discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.	\N	2017-10-04
18	Dune	Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.	\N	2021-09-15
19	Dune: Part Two	Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.	\N	2024-02-27
20	Back to the Future	Eighties teenager Marty McFly is accidentally sent back in time to 1955, inadvertently disrupting his parents' first meeting and attracting his mother's romantic interest. Marty must repair the damage to history by rekindling his parents' romance and - with the help of his eccentric inventor friend Doc Brown - return to 1985.	\N	1985-07-03
21	Alien	During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.	\N	1979-05-25
22	Aliens	Ripley, the sole survivor of the Nostromo's deadly encounter with the monstrous Alien, returns to Earth after drifting through space in hypersleep for 57 years. Although her story is initially met with skepticism, she agrees to accompany a team of Colonial Marines back to LV-426.	\N	1986-07-18
23	War of the Worlds	Ray Ferrier is a divorced dockworker and less-than-perfect father. Soon after his ex-wife and her new husband drop off his teenage son and young daughter for a rare weekend visit, a strange and powerful lightning storm touches down.	\N	2005-06-13
24	E.T. the Extra-Terrestrial	An alien is left behind on Earth and saved by the 10-year-old Elliot who decides to keep him hidden in his home. While a task force hunts for the extra-terrestrial, Elliot, his brother, and his little sister Gertie form an emotional bond with their new friend, and try to help him find his way home.	\N	1982-06-11
25	How to Train Your Dragon	As the son of a Viking leader on the cusp of manhood, shy Hiccup Horrendous Haddock III faces a rite of passage: he must kill a dragon to prove his warrior mettle. But after downing a feared dragon, he realizes that he no longer wants to destroy it, and instead befriends the beast – which he names Toothless – much to the chagrin of his warrior father.	\N	2010-03-18
26	How to Train Your Dragon 2	Five years have passed since Hiccup and Toothless united the dragons and Vikings of Berk. Now, they spend their time charting unmapped territories. During one of their adventures, the pair discover a secret cave that houses hundreds of wild dragons -- and a mysterious dragon rider who turns out to be Hiccup's mother, Valka. Hiccup and Toothless then find themselves at the center of a battle to protect Berk from a power-hungry warrior named Drago.	\N	2014-06-05
27	How to Train Your Dragon: The Hidden World	As Hiccup fulfills his dream of creating a peaceful dragon utopia, Toothless’ discovery of an untamed, elusive mate draws the Night Fury away. When danger mounts at home and Hiccup’s reign as village chief is tested, both dragon and rider must make impossible decisions to save their kind.	\N	2019-01-03
28	TRON: Legacy	Sam Flynn, the tech-savvy and daring son of Kevin Flynn, investigates his father's disappearance and is pulled into The Grid. With the help of a mysterious program named Quorra, Sam quests to stop evil dictator Clu from crossing into the real world.	\N	2010-12-14
29	The Nice Guys	A private eye investigates the apparent suicide of a fading porn star in 1970s Los Angeles and uncovers a conspiracy.	\N	2016-05-15
30	Spider-Man 2	Peter Parker is going through a major identity crisis. Burned out from being Spider-Man, he decides to shelve his superhero alter ego, which leaves the city suffering in the wake of carnage left by the evil Doc Ock. In the meantime, Parker still can't act on his feelings for Mary Jane Watson, a girl he's loved since childhood. A certain anger begins to brew in his best friend Harry Osborn as well...	\N	2004-06-25
31	Spider-Man 3	The seemingly invincible Spider-Man goes up against an all-new crop of villains—including the shape-shifting Sandman. While Spider-Man’s superpowers are altered by an alien organism, his alter ego, Peter Parker, deals with nemesis Eddie Brock and also gets caught up in a love triangle.	\N	2007-05-01
32	The SpongeBob SquarePants Movie	There's trouble brewing in Bikini Bottom. Someone has stolen King Neptune's crown, and it looks like Mr. Krab, SpongeBob's boss, is the culprit. Though he's just been passed over for the promotion of his dreams, SpongeBob stands by his boss, and along with his best pal Patrick, sets out on a treacherous mission to Shell City to reclaim the crown and save Mr. Krab's life.	\N	2004-11-14
33	Jerry Maguire	Jerry Maguire used to be a typical sports agent: willing to do just about anything he could to get the biggest possible contracts for his clients, plus a nice commission for himself. Then, one day, he suddenly has second thoughts about what he's really doing. When he voices these doubts, he ends up losing his job and all of his clients, save Rod Tidwell, an egomaniacal football player.	\N	1996-12-13
34	Star Wars	Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.	\N	1977-05-25
35	The Empire Strikes Back	The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.	\N	1980-05-20
36	Return of the Jedi	Luke Skywalker leads a mission to rescue his friend Han Solo from the clutches of Jabba the Hutt, while the Emperor seeks to destroy the Rebellion once and for all with a second dreaded Death Star.	\N	1983-05-25
37	Superman	Mild-mannered Clark Kent works as a reporter at the Daily Planet alongside his crush, Lois Lane. Clark must summon his superhero alter-ego when the nefarious Lex Luthor launches a plan to take over the world.	\N	1978-12-14
38	Iron Man	After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.	\N	2008-04-30
39	Captain America: The Winter Soldier	After the cataclysmic events in New York with The Avengers, Steve Rogers, aka Captain America is living quietly in Washington, D.C. and trying to adjust to the modern world. But when a S.H.I.E.L.D. colleague comes under attack, Steve becomes embroiled in a web of intrigue that threatens to put the world at risk. Joining forces with the Black Widow, Captain America struggles to expose the ever-widening conspiracy while fighting off professional assassins sent to silence him at every turn. When the full scope of the villainous plot is revealed, Captain America and the Black Widow enlist the help of a new ally, the Falcon. However, they soon find themselves up against an unexpected and formidable enemy—the Winter Soldier.	\N	2014-03-20
40	Captain America: Civil War	Following the events of Age of Ultron, the collective governments of the world pass an act designed to regulate all superhuman activity. This polarizes opinion amongst the Avengers, causing two factions to side with Iron Man or Captain America, which causes an epic battle between former allies.	\N	2016-04-27
41	The Avengers	When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!	\N	2012-04-25
42	Avengers: Infinity War	As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.	\N	2018-04-25
43	Avengers: Endgame	After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.	\N	2019-04-24
44	Up	Carl Fredricksen spent his entire life dreaming of exploring the globe and experiencing life to its fullest. But at age 78, life seems to have passed him by, until a twist of fate (and a persistent 8-year old Wilderness Explorer named Russell) gives him a new lease on life.	\N	2009-05-28
45	The Incredibles	Bob Parr has given up his superhero days to log in time as an insurance adjuster and raise his three children with his formerly heroic wife in suburbia. But when he receives a mysterious assignment, it's time to get back into costume.	\N	2004-10-27
46	Mission: Impossible - Rogue Nation	Ethan and team take on their most impossible mission yet—eradicating 'The Syndicate', an International and highly-skilled rogue organization committed to destroying the IMF.	\N	2015-07-23
47	Mission: Impossible - Fallout	When an IMF mission ends badly, the world is faced with dire consequences. As Ethan Hunt takes it upon himself to fulfill his original briefing, the CIA begin to question his loyalty and his motives. The IMF team find themselves in a race against time, hunted by assassins while trying to prevent a global catastrophe.	\N	2018-07-13
48	Heat	Obsessive master thief Neil McCauley leads a top-notch crew on various daring heists throughout Los Angeles while determined detective Vincent Hanna pursues him without rest. Each man recognizes and respects the ability and the dedication of the other even though they are aware their cat-and-mouse game may end in violence.	\N	1995-12-15
49	Pulp Fiction	A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.	\N	1994-09-10
50	2001: A Space Odyssey	Humanity finds a mysterious object buried beneath the lunar surface and sets off to find its origins with the help of HAL 9000, the world's most advanced super computer.	\N	1968-04-02
51	Jurassic Park	A wealthy entrepreneur secretly creates a theme park featuring living dinosaurs drawn from prehistoric DNA. Before opening day, he invites a team of experts and his two eager grandchildren to experience the park and help calm anxious investors. However, the park is anything but amusing as the security systems go off-line and the dinosaurs escape.	\N	1993-06-11
52	Jaws	When the seaside community of Amity finds itself under attack by a dangerous great white shark, the town's chief of police, a young marine biologist, and a grizzled hunter embark on a desperate quest to destroy the beast before it strikes again.	\N	1975-06-20
53	Batman Begins	Driven by tragedy, billionaire Bruce Wayne dedicates his life to uncovering and defeating the corruption that plagues his home, Gotham City.  Unable to work within the system, he instead creates a new identity, a symbol of fear for the criminal underworld - The Batman.	\N	2005-06-10
54	The Dark Knight Rises	Following the death of District Attorney Harvey Dent, Batman assumes responsibility for Dent's crimes to protect the late attorney's reputation and is subsequently hunted by the Gotham City Police Department. Eight years later, Batman encounters the mysterious Selina Kyle and the villainous Bane, a new terrorist leader who overwhelms Gotham's finest. The Dark Knight resurfaces to protect a city that has branded him an enemy.	\N	2012-07-17
55	Casino Royale	Le Chiffre, a banker to the world's terrorists, is scheduled to participate in a high-stakes poker game in Montenegro, where he intends to use his winnings to establish his financial grip on the terrorist market. M sends Bond—on his maiden mission as a 00 Agent—to attend this game and prevent Le Chiffre from winning. With the help of Vesper Lynd and Felix Leiter, Bond enters the most important poker game in his already dangerous career.	\N	2006-11-14
56	No Time to Die	Bond has left active service and is enjoying a tranquil life in Jamaica. His peace is short-lived when his old friend Felix Leiter from the CIA turns up asking for help. The mission to rescue a kidnapped scientist turns out to be far more treacherous than expected, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.	\N	2021-09-29
57	Oblivion	Jack Harper is one of the last few drone repairmen stationed on Earth. Part of a massive operation to extract vital resources after decades of war with a terrifying threat known as the Scavs, Jack’s mission is nearly complete. His existence is brought crashing down when he rescues a beautiful  stranger from a downed spacecraft. Her arrival triggers a chain of events that  forces him to question everything he knows and puts the fate of humanity in his hands.	\N	2013-04-10
58	Titanic	101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later. A young Rose boards the ship with her mother and fiancé. Meanwhile, Jack Dawson and Fabrizio De Rossi win third-class tickets aboard the ship. Rose tells the whole story from Titanic's departure through to its death—on its first and last voyage—on April 15, 1912.	\N	1997-11-18
59	Zodiac	The zodiac murders cause the lives of Paul Avery, David Toschi and Robert Graysmith to intersect.	\N	2007-03-02
60	Gone Girl	With his wife's disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it's suspected that he may not be innocent.	\N	2014-10-01
61	The Girl with the Dragon Tattoo	Disgraced journalist Mikael Blomkvist investigates the disappearance of a weary patriarch's niece from 40 years ago. He is aided by the pierced, tattooed, punk computer hacker named Lisbeth Salander. As they work together in the investigation, Blomkvist and Salander uncover immense corruption beyond anything they have ever imagined.	\N	2011-12-14
62	Drive	Driver is a skilled Hollywood stuntman who moonlights as a getaway driver for criminals. Though he projects an icy exterior, lately he's been warming up to a pretty neighbor named Irene and her young son, Benicio. When Irene's husband gets out of jail, he enlists Driver's help in a million-dollar heist. The job goes horribly wrong, and Driver must risk his life to protect Irene and Benicio from the vengeful masterminds behind the robbery.	\N	2011-09-15
201	SOS	\N	\N	2022-12-08
209	InnerSpeaker	\N	\N	2010-05-21
214	The Beatles (Remastered)	\N	\N	1968-11-22
219	The Black Album	\N	\N	2003-11-14
63	The Martian	During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet. With only meager supplies, he must draw upon his ingenuity, wit and spirit to subsist and find a way to signal to Earth that he is alive.	\N	2015-09-30
64	The Fugitive	Wrongfully convicted of murdering his wife and sentenced to death, Richard Kimble escapes from the law in an attempt to find the real killer and clear his name.	\N	1993-08-06
65	Spider-Man: Into the Spider-Verse	Struggling to find his place in the world while juggling school and family, Brooklyn teenager Miles Morales is unexpectedly bitten by a radioactive spider and develops unfathomable powers just like the one and only Spider-Man. While wrestling with the implications of his new abilities, Miles discovers a super collider created by the madman Wilson "Kingpin" Fisk, causing others from across the Spider-Verse to be inadvertently transported to his dimension.	\N	2018-12-06
66	Spider-Man: Across the Spider-Verse	After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.	\N	2023-05-31
67	Whiplash	Under the direction of a ruthless instructor, a talented young drummer begins to pursue perfection at any cost, even his humanity.	\N	2014-10-10
68	The Lord of the Rings: The Fellowship of the Ring	Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.	\N	2001-12-18
69	The Lord of the Rings: The Two Towers	Frodo Baggins and the other members of the Fellowship continue on their sacred quest to destroy the One Ring--but on separate paths. Their destinies lie at two towers--Orthanc Tower in Isengard, where the corrupt wizard Saruman awaits, and Sauron's fortress at Barad-dur, deep within the dark lands of Mordor. Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard.	\N	2002-12-18
203	Scorpion	\N	\N	2018-06-29
70	The Lord of the Rings: The Return of the King	As armies mass for a final battle that will decide the fate of the world--and powerful, ancient forces of Light and Dark compete to determine the outcome--one member of the Fellowship of the Ring is revealed as the noble heir to the throne of the Kings of Men. Yet, the sole hope for triumph over evil lies with a brave hobbit, Frodo, who, accompanied by his loyal friend Sam and the hideous, wretched Gollum, ventures deep into the very dark heart of Mordor on his seemingly impossible quest to destroy the Ring of Power.​	\N	2003-12-17
71	Guardians of the Galaxy	Light years from Earth, 26 years after being abducted, Peter Quill finds himself the prime target of a manhunt after discovering an orb wanted by Ronan the Accuser.	\N	2014-07-30
72	Guardians of the Galaxy Vol. 2	The Guardians must fight to keep their newfound family together as they unravel the mysteries of Peter Quill's true parentage.	\N	2017-04-19
73	Guardians of the Galaxy Vol. 3	Peter Quill, still reeling from the loss of Gamora, must rally his team around him to defend the universe along with protecting one of their own. A mission that, if not completed successfully, could quite possibly lead to the end of the Guardians as we know them.	\N	2023-05-03
74	Schindler's List	The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.	\N	1993-12-15
75	Inception	Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person's idea into a target's subconscious.	\N	2010-07-15
76	The Matrix	Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.	\N	1999-03-31
77	The Prestige	A mysterious story of two magicians whose intense rivalry leads them on a life-long battle for supremacy -- full of obsession, deceit and jealousy with dangerous and deadly consequences.	\N	2006-10-17
78	Good Will Hunting	When professors discover that an aimless janitor is also a math genius, a therapist helps the young man confront the demons that are holding him back.	\N	1997-12-05
79	Pirates of the Caribbean: Dead Man's Chest	Captain Jack Sparrow works his way out of a blood debt with the ghostly Davy Jones to avoid eternal damnation.	\N	2006-07-06
80	Pirates of the Caribbean: The Curse of the Black Pearl	After Port Royal is attacked and pillaged by a mysterious pirate crew, capturing the governor's daughter Elizabeth Swann in the process, William Turner asks free-willing pirate Jack Sparrow to help him locate the crew's ship—The Black Pearl—so that he can rescue the woman he loves.	\N	2003-07-09
81	Pirates of the Caribbean: At World's End	Will Turner and Elizabeth Swann join forces with the revived Captain Barbossa to free Jack Sparrow from Davy Jones' locker. The group must navigate dangerous waters, confront many foes and, ultimately, choose sides in a battle wherein piracy itself hangs in the balance.	\N	2007-05-19
82	Aladdin	Princess Jasmine grows tired of being forced to remain in the palace, so she sneaks out into the marketplace, in disguise, where she meets street urchin Aladdin. The couple falls in love, although Jasmine may only marry a prince. After being thrown in jail, Aladdin becomes embroiled in a plot to find a mysterious lamp, with which the evil Jafar hopes to rule the land.	\N	1992-11-25
83	The Little Mermaid	This colorful adventure tells the story of an impetuous mermaid princess named Ariel who falls in love with the very human Prince Eric and puts everything on the line for the chance to be with him. Memorable songs and characters -- including the villainous sea witch Ursula.	\N	1989-11-17
202	Red Moon In Venus	\N	\N	2023-03-03
210	K.I.D.S.	\N	\N	2010-08-13
215	1000 gecs	\N	\N	2019-05-31
220	Kid A	\N	\N	2000-10-02
224	Enema Of The State	\N	\N	1999-06-01
401	Uncharted: Drake's Fortune	Become Nathan Drake, a treasure hunter and descendant of famed explorer Sir Francis Drake as he searches for the lost treasure of El Dorado.	\N	2007-11-19
84	Harry Potter and the Philosopher's Stone	Harry Potter has lived under the stairs at his aunt and uncle's house his whole life. But on his 11th birthday, he learns he's a powerful wizard—with a place waiting for him at the Hogwarts School of Witchcraft and Wizardry. As he learns to harness his newfound powers with the help of the school's kindly headmaster, Harry uncovers the truth about his parents' deaths—and about the villain who's to blame.	\N	2001-11-16
85	Harry Potter and the Chamber of Secrets	Cars fly, trees fight back, and a mysterious house-elf comes to warn Harry Potter at the start of his second year at Hogwarts. Adventure and danger await when bloody writing on a wall announces: The Chamber Of Secrets Has Been Opened. To save Hogwarts will require all of Harry, Ron and Hermione’s magical abilities and courage.	\N	2002-11-13
86	Harry Potter and the Prisoner of Azkaban	Year three at Hogwarts means new fun and challenges as Harry learns the delicate art of approaching a Hippogriff, transforming shape-shifting Boggarts into hilarity and even turning back time. But the term also brings danger: soul-sucking Dementors hover over the school, an ally of the accursed He-Who-Cannot-Be-Named lurks within the castle walls, and fearsome wizard Sirius Black escapes Azkaban. And Harry will confront them all.	\N	2004-05-31
87	Harry Potter and the Goblet of Fire	When Harry Potter's name emerges from the Goblet of Fire, he becomes a competitor in a grueling battle for glory among three wizarding schools—the Triwizard Tournament. But since Harry never submitted his name for the Tournament, who did? Now Harry must confront a deadly dragon, fierce water demons and an enchanted maze only to find himself in the cruel grasp of He Who Must Not Be Named.	\N	2005-11-16
88	Harry Potter and the Order of the Phoenix	Returning for his fifth year of study at Hogwarts, Harry is stunned to find that his warnings about the return of Lord Voldemort have been ignored. Left with no choice, Harry takes matters into his own hands, training a small group of students to defend themselves against the dark arts.	\N	2007-07-08
89	Harry Potter and the Half-Blood Prince	As Lord Voldemort tightens his grip on both the Muggle and wizarding worlds, Hogwarts is no longer a safe haven. Harry suspects perils may even lie within the castle, but Dumbledore is more intent upon preparing him for the final battle fast approaching. Together they work to find the key to unlock Voldemorts defenses and to this end, Dumbledore recruits his old friend and colleague Horace Slughorn, whom he believes holds crucial information. Even as the decisive showdown looms, romance blossoms for Harry, Ron, Hermione and their classmates. Love is in the air, but danger lies ahead and Hogwarts may never be the same again.	\N	2009-07-15
90	Harry Potter and the Deathly Hallows: Part 1	Harry, Ron and Hermione walk away from their last year at Hogwarts to find and destroy the remaining Horcruxes, putting an end to Voldemort's bid for immortality. But with Harry's beloved Dumbledore dead and Voldemort's unscrupulous Death Eaters on the loose, the world is more dangerous than ever.	\N	2010-11-17
91	Harry Potter and the Deathly Hallows: Part 2	Harry, Ron and Hermione continue their quest to vanquish the evil Voldemort once and for all. Just as things begin to look hopeless for the young wizards, Harry discovers a trio of magical objects that endow him with powers to rival Voldemort's formidable skills.	\N	2011-07-12
92	Alien: Romulus	While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.	\N	2024-08-13
93	Frozen	Young princess Anna of Arendelle dreams about finding true love at her sister Elsa’s coronation. Fate takes her on a dangerous journey in an attempt to end the eternal winter that has fallen over the kingdom. She's accompanied by ice delivery man Kristoff, his reindeer Sven, and snowman Olaf. On an adventure where she will find out what friendship, courage, family, and true love really means.	\N	2013-11-20
94	Scream	A year after the murder of her mother, a teenage girl is terrorized by a masked killer who targets her and her friends by using scary movies as part of a deadly game.	\N	1996-12-20
95	American Psycho	A wealthy New York investment banking executive hides his alternate psychopathic ego from his co-workers and friends as he escalates deeper into his illogical, gratuitous fantasies.	\N	2000-04-13
96	Knives Out	When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate. From Harlan's dysfunctional family to his devoted staff, Blanc sifts through a web of red herrings and self-serving lies to uncover the truth behind Harlan's untimely death.	\N	2019-11-27
97	John Wick	Ex-hitman John Wick comes out of retirement to track down the gangsters that took everything from him.	\N	2014-10-22
98	Se7en	Two homicide detectives are on a desperate hunt for a serial killer whose crimes are based on the "seven deadly sins" in this dark and haunting film that takes viewers from the tortured remains of one victim to the next. The seasoned Det. Sommerset researches each sin in an effort to get inside the killer's mind, while his novice partner, Mills, scoffs at his efforts to unravel the case.	\N	1995-09-22
99	Prisoners	Keller Dover is facing every parent’s worst nightmare. His six-year-old daughter, Anna, is missing, together with her young friend, Joy, and as minutes turn to hours, panic sets in. The only lead is a dilapidated RV that had earlier been parked on their street.	\N	2013-09-19
100	The Lion King	Taking inspiration from Shakespeare's Hamlet, a young lion prince grows up in exile after his father is killed by his villainous uncle, and returns years later to reclaim his throne.	\N	1994-06-24
204	Certified Lover Boy	\N	\N	2021-09-03
101	The Wizard of Oz	Young Dorothy finds herself in a magical world where she makes friends with a lion, a scarecrow and a tin man as they make their way along the yellow brick road to talk with the Wizard and ask for the things they miss most in their lives. The Wicked Witch of the West is the only thing that could stop them.	\N	1939-08-15
211	Fear Fun	\N	\N	2012-05-01
216	Alvvays	\N	\N	2014-07-22
221	The Colour In Anything	\N	\N	2016-05-05
225	California	\N	\N	2016-07-01
403	Uncharted 3: Drake's Deception	On an expedition to find the mythical "Atlantis of the Sands" in the heart of the Arabian Desert, Nathan Drake and his partner, Victor Sullivan, encounter a deceptive organization led by a ruthless dictator. Terrible secrets unfold, causing Drake's quest to descend into a bid for survival.	\N	2011-11-01
302	Pride and Prejudice	No description available.	\N	\N
205	Views	\N	\N	2016-05-06
102	Sunrise: A Song of Two Humans	A married farmer falls under the spell of a slatternly woman from the city, who tries to convince him to drown his wife.	\N	1927-11-04
207	Something To Give Each Other	\N	\N	2023-10-13
212	7	\N	\N	2018-05-11
217	A Kid Named Cudi	\N	\N	2022-07-15
222	Zig	\N	\N	2023-10-27
400	The Chessmaster 2000	The Chessmaster 2000 is the chess game that began the Chessmaster franchise. It was developed by The Software Toolworks, featuring a chess engine written by David Kittinger.	\N	\N
402	Uncharted 2: Among Thieves	Nathan Drake returns to find the lost secret of Marco Polo, in this sequel to the 2007 sleeper hit Uncharted: Drake's Fortune.	\N	2009-10-13
404	Uncharted 4: A Thief's End	Naughty Dog charts treasure hunter Nathan Drake's final adventure in the fourth entry of this action-adventure, swash-buckling saga.	\N	2016-05-10
405	God of War	God of War is a soft reboot on the franchise of the same name. It sees Kratos and his son Atreus traverse a world of Norse myths.	\N	2018-04-20
407	Mass Effect	Humanity is still a newcomer on the futuristic galactic stage, and it's up to the charismatic Commander Shepard to investigate the actions of a rogue agent while under threat from a dangerous synthetic race known as the Geth.	\N	2007-11-20
408	Mass Effect 2	After a violent death by an unknown force and a timely reanimation by the human supremacist organization Cerberus, Commander Shepard must assemble a new squad in the seedier side of the galaxy for a suicide mission in the second installment of the "Mass Effect" trilogy.	\N	2010-01-26
409	Mass Effect 3	When Earth begins to fall in an ancient cycle of destruction, Commander Shepard must unite the forces of the galaxy to stop the Reapers in the final chapter of the original Mass Effect trilogy.	\N	2012-03-06
410	Mass Effect Legendary Edition	An enhanced 4K Ultra-HD compilation of the original Mass Effect trilogy of sci-fi third-person action RPGs, chronicling Commander Shepard's investigation of the Reapers in the 22nd century.	\N	2021-05-14
411	The Last of Us	Joel and Ellie must survive in a post-apocalyptic world where a deadly parasitic fungus infects people's brains in this  PS3 exclusive third-person action-adventure game from Naughty Dog.	\N	2013-06-14
412	Marvel's Spider-Man	An Insomniac game exclusively for PlayStation 4 where Spider-Man strives to stop Mister Negative's terrorist plot against the city of New York.	\N	2018-09-07
413	Marvel's Spider-Man: Miles Morales	The second entry in Insomniac Games' Spider-Man franchise shifts the focus from Peter Parker to Miles Morales.	\N	2020-11-12
414	Marvel's Spider-Man 2	Marvel's Spider-Man 2 sees the return of Peter Parker and Miles Morales as they team up to face Venom and Kraven the Hunter.	\N	2023-10-20
415	Bloodborne	An action role playing game by FromSoftware, marking the studio's debut on the PlayStation 4. It shares creative roots, as well as gameplay elements, with the Souls series.	\N	2015-03-24
416	Subnautica	An underwater open world game focusing on exploration, and building.	\N	2018-01-23
417	Red Dead Redemption	Red Dead Redemption is the spiritual successor to 2004's Red Dead Revolver, featuring a vibrant, open world set in the decline of the American Wild West. Players take on the role of former outlaw John Marston, who is forced to hunt down his former gang to regain his family.	\N	2010-05-18
418	Red Dead Redemption II	The third game in Rockstar's Wild West-themed series is a prequel to the events of Red Dead Redemption, returning to the open-world action of its predecessor.	\N	2018-10-26
419	The Legend of Zelda: Breath of the Wild	The first HD installment of the Zelda series developed for the Wii U and Nintendo Switch that returns to the open-world design of the original NES title, with a focus on free exploration of a large scale environment as well as dangerous enemies.	\N	2017-03-03
420	The Legend of Zelda: Tears of the Kingdom	A direct sequel to Breath of the Wild, featuring a completely new set of abilities and expanding the world to the skies above and caverns below the surface.	\N	2023-05-12
421	Resident Evil 2	A remake of the 1998 survival horror classic, Resident Evil 2.	\N	2019-01-25
422	Final Fantasy VII Remake	Teased since the PlayStation 3's debut, Square Enix finally delivers a complete remake of the fan favorite Final Fantasy from 1997.	\N	2020-04-10
103	Deadpool	The origin story of former Special Forces operative turned mercenary Wade Wilson, who, after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.	\N	2016-02-09
423	The Walking Dead	Presenting an original story in the same franchise as the comic book series of the same name, The Walking Dead is a five-part adventure game from Telltale that follows the story of a convicted murderer, his guardianship over a young girl, and his co-operation with a roaming group of survivors in a zombie apocalypse.	\N	2012-11-21
300	Sonette, Epen und die kleineren Dichtungen	No description available.	\N	\N
301	Moby-Dick, or, The whale	Scanning errors make Chapter 1 unreadable.	\N	\N
303	Fear no evil	No description available.	\N	\N
304	The jungle	No description available.	\N	\N
306	Joseph Conrad	No description available.	\N	\N
307	Sur Catherine de Médicis	No description available.	\N	\N
308	American literature as an expression of the national mind	No description available.	\N	\N
309	The amateur gentleman	IN WHICH BABNABAS KNOCKS DOWN HIS FATHER, THOUGH AS DUTIFULLY AS MAY BE	\N	\N
310	The history of the Devil, ancient and modern	No description available.	\N	\N
314	Treasure	A violent rise of fundamentalism in Mexico and Egypt has the United States captive inside its own borders, but when the Egyptian Secretary General of the United Nations survives a murderous plane crash in Greenland, Dirk Pitt is pulled into the storm.	\N	\N
305	The Adventures of Huckleberry Finn	MARK TWAIN was born Samuel Langhorne Clemens in Florida, Missouri, in 1835. He left school at the age of 12, was apprenticed to a printer and then went on to become a Mississippi riverboat pilot, journalist, humorist, travel writer, and publisher. Twain first won fame with his story "The Celebrated Jumping Frog of Calaveras County," published in 1865. The Adventures of Huckle- berry Finn was published in 1884. It is mainly on this work that Twain's literary reputation rests, for in it he created Huck Finn, one of fiction's most memorable characters. Although he made a fortune from his writing. Twain's involvement in various failed business schemes led him close to bankruptcy, and towards the end of his life he was forced to go oa lecture tours to pay his debts. Twain died in Redding, Connecticut, in 1910.\r\n--jacket	\N	\N
311	Atomic Habits	No matter your goals, Atomic Habits offers a proven framework for improving every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.	\N	\N
312	The 48 Laws of Power	Amoral, cunning, ruthless, and instructive, this piercing work distills three thousand years of the history of power in to forty-eight well explicated laws. As attention--grabbing in its design as it is in its content, this bold volume outlines the laws of power in their unvarnished essence, synthesizing the philosophies of Machiavelli, Sun-tzu, Carl von Clausewitz, and other great thinkers. Some laws teach the need for prudence ("Law 1: Never Outshine the Master"), the virtue of stealth ("Law 3: Conceal Your Intentions"), and many demand the total absence of mercy ("Law 15: Crush Your Enemy Totally"), but like it or not, all have applications in real life. Illustrated through the tactics of Queen Elizabeth I, Henry Kissinger, P. T. Barnum, and other famous figures who have wielded--or been victimized by--power, these laws will fascinate any reader interested in gaining, observing, or defending against ultimate control.	\N	\N
313	Animal Farm	Animal Farm is a brilliant political satire and a powerful and affecting story of revolutions and idealism, power and corruption. 'All animals are equal. But some animals are more equal than others.' Mr Jones of Manor Farm is so lazy and drunken that one day he forgets to feed his livestock. The ensuing rebellion under the leadership of the pigs Napoleon and Snowball leads to the animals taking over the farm. Vowing to eliminate the terrible inequities of the farmyard, the renamed Animal Farm is organised to benefit all who walk on four legs. But as time passes, the ideals of the rebellion are corrupted, then forgotten. And something new and unexpected emerges..	\N	\N
315	Pacific Vortex!	No description available.	\N	\N
316	Cyclops	No description available.	\N	\N
317	The Bachman Books	For years, readers wrote asking if Richard Bachman was really world-bestselling Stephen King writing under another name. Now the secret is out--and so, brought together for the first time in one volume, are these four spellbinding stories of future-shock and suspense.\r\n\r\nRAGE\r\nA high school teenager becomes a gang of one in a terrifying display of rebellion\r\n\r\nTHE LONG WALK\r\nA chilling look at the ultra-conservative America of the guture where a gruelling 450-mile marathon is the ultimate sports competition\r\n\r\nROADWORK\r\nAn immovable man refuses to surrender to the irresistible force of progress\r\n\r\nTHE RUNNING MAN\r\nTV's future-favourite game show, where contestants are hunted to death in the attempt to win a $ billion jackpot\r\n(back cover)	\N	\N
318	Inca Gold	Dirk Pitt is back, in an adventure that is perhaps the most inventive and most exciting of his career - a classic treasure hunt involving an ancient hoard of gold, the secrets of a lost civilization, and an international ring of smugglers, all brought together in a plot that only Clive Cussler could devise.\n\nInca Gold begins in 1532, when a fleet of ships sails in secret to an island in the middle of an inland sea. There they hide a magnificent treasure more vast than that of any pharaoh. Then they disappear, leaving only a great stone demon to guard their hoard.\n\nIn 1578 the legendary Sir Francis Drake captures a Spanish galleon filled with Inca gold and silver and the key to the lost treasure, which included a gigantic chain of gold that belonged to the last Inca king, a masterpiece of ancient technology so huge that it requires two hundred men to lift it. As the galleon is sailed by Drake's crew back to England, an underwater earthquake causes a massive tidal wave that sweeps it into the jungle. Only one man survives to tell the tale....\n\nIn 1998 a group of archaeologists is nearly drowned while diving into the depths of a sacrificial pool high in the Andes of Peru. They are saved by the timely arrival of Dirk Pitt, who is in the area on a marine expedition. Pitt soon finds out that his life has been placed in jeopardy as well by smugglers intent on uncovering the lost ancient Incan treasure. Soon, he, his faithful companions, and Dr.\n\nShannon Kelsey, a beautiful young archaeologist, are plunged into a vicious, no-holds-barred struggle to survive.\n\nFrom then on it becomes a battle of wits in a race against time and danger to find the golden chain, as Pitt finds himself caught up in a struggle with a sinister international family syndicate that deals in stolen works of art, the smuggling of ancient artifacts, and art forgery worth many hundreds of millions of dollars.\n\nThe clash between the art thieves, the FBI and the Customs Service, a tribe of local Indians, and Pitt, along with his friends from NUMA, two of whom are captured and threatened with execution, rushes toward a wild climax in a subterranean world of darkness and death - for the real key to the mystery, as it turns out, is a previously unknown, unexplored underground river that runs through the ancient treasure chamber. Inca Gold is Clive Cussler - and Dirk Pitt - at their very best.	\N	\N
319	The Shining / 'Salem's Lot / Night Shift / Carrie	The Shining\r\n\r\nThis masterpiece of modern horror builds relentlessly to an absolutely chilling and horrifying climax, as a little boy's psychic powers reveal the evil lurking in an old hotel.\r\n\r\n'Salem's Lot\r\n\r\nFar from the township, two frightened people share the unspeakable secrets of 'Salem's Lot. They know they must return — to confront the diabolical corruption and a hideous peril more dreadful than death.\r\n\r\nNight Shift\r\n\r\nAll manner of night creatures, vampires, demon lovers and things that live in closets, are waiting to make your blood run cold in these twenty spine-tingling tales.\r\n\r\nCarrie\r\n\r\nHumiliated at her senior prom, Carrie's secret power becomes a weapon of horror and destruction, turning a quiet New England town into a ghastly vision of hell.\r\n--front flap	\N	\N
320	Sahara	No description available.	\N	\N
321	Vixen 03	No description available.	\N	\N
322	Song of Susannah	The next-to-last novel in Stephen King's seven-volume magnum opus, Song of Susannah is at once a book of revelation, a fascinating key to the unfolding mystery of the Dark Tower, and a fast-paced story of double-barreled suspense.\r\n\r\nTo give birth to her "chap," demon-mother Mia has usurped the body of Susannah Dean and used the power of Black Thirteen to transport to New York City in the summer of 1999. The city is strange to Susannah . . . and terrifying to the "daughter of none" who shares her body and mind.\r\n\r\nSaving the Tower depends not only on rescuing Susannah but also on securing the vacant lot Calvin Tower owns before he loses it to the Sombra Corporation.\r\n\r\nEnlisting the aid of Manni senders, the remaining ka-tet climbs to the Doorway Cave . . . and discovers that magic has its own mind. It falls to the boy, the billy bumbler, and the fallen priest to find Susannah-Mia, who in a struggle to cope -- with each other and with an alien environment -- "go todash" to Castle Discordia on the border of End-World. In that forsaken place, Mia reveals her origins, her purpose, and her fierce desire to mother whatever creature the two of them have carried to term.\r\n\r\nEddie and Roland, meanwhile, tumble into western Maine in the summer of 1977, a world that should be idyllic but isn't. For one thing, it is real, and the bullets are flying. For another, it is inhabited by the author of a novel called 'Salem's Lot, a writer who turns out to be as shocked by them as they are by him.\r\n\r\nThese are the simple vectors of a story rich in complexity and conflict. Its dual climaxes, one at the entrance to a deadly dining establishment and the other appended to the pages of a writer's journal, will leave readers gasping for the saga's final volume (which, Dear Reader, follows soon, say thankya). \r\n(from the flap)	\N	\N
323	Vampire kisses 9 : immortal hearts	No description available.	\N	\N
324	Perrie the paramedic fairy	Perrie the Paramedic Fairy makes sure paramedics everywhere do a fantastic job looking after people. But when nasty Jack Frost steals her magical object, it all starts to go wrong! Can Rachel and Kirsty help their fairy friend put things right?	\N	\N
325	Copy Cat	A kitten longs to be like the big cats until it finds something they can all do together.	\N	\N
424	Final Fantasy VII	The seventh numbered entry in the Final Fantasy franchise brings the series into 3D with a landmark title that set new industry standards for cinematic storytelling. Mercenary Cloud Strife joins the rebel group AVALANCHE in their fight against the power-hungry Shinra Company, but their struggle soon becomes a race to save the entire Planet from an impending cataclysm.	\N	1997-01-31
425	Final Fantasy VII Rebirth	The second chapter of Square Enix's remake of Final Fantasy VII.	\N	2024-02-29
426	Resident Evil 4	A full remake and reimagining of 2005's Resident Evil 4.	\N	2023-03-24
427	Super Mario Galaxy	In Mario's first Wii adventure, the famed plumber travels throughout the universe on his latest quest to save Princess Peach from the evil Bowser.	\N	2007-11-01
428	The Legend of Zelda	A young boy explores a huge overworld filled with enemies and dungeons to find and rescue Princess Zelda from the evil Ganon.	\N	1986-02-21
429	Final Fantasy XVI	Taking place in the war-torn world of Valisthea, Final Fantasy XVI is the first mainline title in the series to fully embrace real-time combat.	\N	2023-06-22
430	Elden Ring	Elden Ring by FromSoftware is a collaboration between Hidetaka Miyazaki and George R.R. Martin.	\N	2022-02-25
431	Grand Theft Auto V	Rockstar returns to the fictional state of San Andreas with a crew of three criminal protagonists who work together to pull off a series of high-profile heists.	\N	2013-09-17
432	The Jackbox Party Pack 3	Brainstorm t-shirts, deceive your friends, and survive a night with a deadly trivia host in the third installment of Jackbox Games' annual party game pack.	\N	2016-10-17
433	Death Stranding	The first game from game director Hideo Kojima after his departure from Konami, Death Stranding is a third-person action-adventure game where the goal is to dredge through a ravaged wasteland to reconnect isolated cities and prevent a mass extinction.	\N	2019-11-08
434	Until Dawn	In this PlayStation 4 horror game, eight teenagers are being hunted while they stay at a mountain retreat.	\N	2015-08-25
435	Returnal	A roguelike third-person shooter from Housemarque.	\N	2021-04-30
436	LEGO Batman: The Videogame	LEGO Batman: The Video Game is an action adventure platformer focused on the combination of the popular Batman universe and the continued licensing of Lego-styled video games.	\N	2008-09-23
437	LEGO Batman 2: DC Super Heroes	Sequel to 2008's LEGO Batman, Batman and Robin are forced to work together alongside the likes of Superman, Wonder Woman and Green Lantern to help stop the combined tyranny of Lex Luthor and The Joker.	\N	2012-06-19
438	Mario Kart Wii	Get online and race in this Wii update of the long-running Mario Kart series. Mario Kart Wii is one of the best-selling games on the Nintendo Wii. It is the eighth installment of the series.	\N	2008-04-09
439	Mario Kart 8	Mario Kart returns and makes its HD-debut with gravity-defying hover vehicles, a new spin on the traditional track designs, ATVs, the return of classic Last Man Standing-Battle Mode, custom online tournaments and Mario Kart TV, which allows for sharing of highlight videos online.	\N	2014-05-29
440	Portal	A first-person puzzle game developed by Valve and graduates of DigiPen, Portal forces a human test subject to run a gauntlet of grueling spatial experiments administered by a malfunctioning, psychotic artificial intelligence named GLaDOS.	\N	2007-10-10
441	Portal 2	Portal 2 is the sequel to the acclaimed first-person puzzle game, carrying forward its love of mind-bending problems and its reckless disregard for the space-time continuum.	\N	2011-04-19
442	The Legend of Zelda: Ocarina of Time	The first 3D Legend of Zelda game, Ocarina of Time was created for the Nintendo 64 in 1998 and introduced innovative mechanics such as Z-targeting as well as many of the series' other trademarks. It has frequently been ranked as the greatest game of all time by many publications.	\N	1998-11-21
443	The Legend of Zelda: Skyward Sword	Link descends from his floating continent home to explore the dark and dangerous world below with the help of a magical sword, in this Wii installment of the Legend of Zelda series.	\N	2011-11-18
444	BioShock	Venture into the mysterious, Utopian underwater city of Rapture and discover what has turned it into ruin in this first-person epic.	\N	2007-08-21
445	BioShock 2	Ten years after the events of the first game, Subject Delta is awoken and must unravel the mystery behind the Big Sisters and his own past in the ruined underwater city of Rapture.	\N	2010-02-09
446	BioShock Infinite	The third game in the BioShock series leaves the bottom of the sea behind for an entirely new setting - the floating city of Columbia, circa 1912. Come to retrieve a girl named Elizabeth, ex-detective Booker DeWitt finds more in store for him there than he could ever imagine.	\N	2013-03-26
447	The Witcher 3: Wild Hunt	CD Projekt RED's third Witcher combines the series' non-linear storytelling with a sprawling open world that concludes the saga of Geralt of Rivia.	\N	2015-05-19
448	Cyberpunk 2077	An open-world action role-playing game by CD Projekt RED based on the pen and paper RPG Cyberpunk 2020.	\N	2020-12-10
449	Demon's Souls	Developed by Bluepoint, this is a full remake of FromSoftware's Demon's Souls from 2009. 	\N	2020-11-12
450	Detroit: Become Human	An interactive drama from the studio behind Heavy Rain, Detroit follows three androids in near-future 2038 as more androids in the city become fully sentient.	\N	2018-05-25
451	Spider-Man: Battle for New York	Spider-Man once again faces his nemesis in the form of a playable Green Goblin.	\N	2006-11-14
452	The Elder Scrolls V: Skyrim	The fifth installment in Bethesda's Elder Scrolls franchise is set in the eponymous province of Skyrim, where the ancient threat of dragons, led by the sinister Alduin, is rising again to threaten all mortal races. Only the player, as the prophesied hero the Dovahkiin, can save the world from destruction.	\N	2011-11-11
453	Fallout 4	The Fallout series continues in a post-apocalyptic Boston, Massachusetts.	\N	2015-11-10
454	Fallout: New Vegas	The post-apocalyptic Fallout universe expands into Nevada in this new title in the franchise. As a courier once left for dead by a mysterious man in a striped suit, the player must now set out to find their assailant and uncover the secrets of the enigmatic ruler of New Vegas.	\N	2010-10-19
455	Starfield	Starfield is a sci-fi role-playing game created by Bethesda Game Studios, the creators of The Elder Scrolls and recent Fallout games. This is the first new franchise from the studio in 25 years.	\N	2023-08-31
456	No Man's Sky	A procedurally generated space exploration game from Hello Games, the creators of Joe Danger.	\N	2016-08-09
457	Minecraft	A 3D procedurally-generated game of world exploration, resource harvesting, and freeform construction, featuring a unique block-based art style and online multiplayer. It received numerous ports and updates for nearly a decade after its initial release.	\N	2009-05-17
458	Terraria	The first major 2D entry into the world of "open world" sandbox action-adventure games, Terraria is inspired by 16-bit platformers and allows players to mine for ores, craft new equipment, and fight monstrous bosses in a large procedurally-generated world.	\N	2011-05-16
459	Stardew Valley	After escaping the burden of city life, an office worker begins their new life managing their grandfather's farmland in the rural region of Stardew Valley in this indie mix of top-down action-RPG and life simulation.	\N	2016-02-26
460	Super Mario 64	Super Mario 64 takes the Mario franchise into polygonal worlds, setting numerous standards for 3D game design along the way.	\N	1996-06-23
461	Pong	Pong, released in 1972, was the first commercially successful video game. Based on table tennis, players attempts to hit a ball past each other's paddles.	\N	1972-11-29
462	Asteroids	Atari's bestselling game of all time, Asteroids was one of the most influential releases of the Golden Age of Arcade Games. One of the first space shooters, it was the inspiration for many of the dual stick shooter games of the modern era, Geometry Wars chief among them.	\N	\N
285	Reload	\N	\N	1997-11-18
286	Load	\N	\N	1996-06-04
463	Tetris	The progenitor of the "falling block" puzzle game and the most well-known game to come from Soviet Russia, receiving numerous ports and a long-running series.	\N	1984-06-06
464	Grand Theft Auto IV	Take on the role of Niko Bellic, a Serbian immigrant who comes to the US at his cousin Roman's request, to find a better life, search for "that special someone" and participate in lawless activities in an upgraded generation of Liberty City.	\N	2008-04-29
465	Bully	Rockstar swaps gangsters for delinquents in their open-world formula, giving players control of a new student at a rough-and-tumble private school.	\N	2006-10-17
466	Metroid Prime	Take control of Samus Aran in her first 3D adventure as she battles the Space Pirates on Tallon IV while uncovering the mysterious disappearance of its inhabitants.	\N	2002-11-18
467	Doom	In a world with health regeneration and cover-based systems, one of the longest-running first-person shooter series returns to its brutal, fast-paced roots.	\N	2016-05-13
468	Doom Eternal	The direct sequel to the 2016 installment of Doom. Hell’s armies have invaded Earth. Become the Slayer in an epic single-player campaign to conquer demons across dimensions and stop the final destruction of humanity.	\N	2020-03-20
469	Halo: Combat Evolved	One of the launch titles of the original Xbox, Halo: Combat Evolved is a sci-fi first-person shooter telling the tale of an advanced cybernetic super-soldier known as the "Master Chief".	\N	2001-11-15
470	Halo 2	The sequel to Halo: Combat Evolved continues the epic story of humanity's last and best hope: the super-soldier Master Chief, as he defends Earth from a Covenant invasion and fights to prevent the activation of another Halo ring.	\N	2004-11-09
471	Halo 3	The conclusion to the original Halo trilogy has the super-soldier Master Chief joining forces with The Arbiter to finish off the threat of both the remaining Covenant Empire and the parasitic Flood, once and for all.	\N	2007-09-25
472	Gears of War	Gears of War is a tactical cover-based sci-fi shooter from Epic Games. The player controls Marcus Fenix, a COG soldier who fights the Locust aliens defending their home planet from the encroaching Human invaders.	\N	2006-11-07
473	Metal Gear Solid	Originally titled Metal Gear: Ghost Babel, Metal Gear Solid is a Game Boy Color spinoff of the popular stealth action game, Metal Gear Solid.	\N	2000-04-27
474	Silent Hill 2	A remake of 2001's Silent Hill 2 developed by Bloober Team.	\N	2024-10-08
475	Alan Wake	When famous novelist Alan Wake goes on vacation with his wife Alice, he has no idea that the idyllic town of Bright Falls will soon be the site of a terrible battle between light and dark that could threaten everything, even Wake's own sanity.	\N	2010-05-14
476	Alan Wake II	A survival-horror sequel to the 2010 action-adventure game Alan Wake, set 13 years after the titular writer became trapped in the Dark Place. With the help of an accomplished FBI agent, can Alan Wake truly escape the darkness?	\N	2023-10-27
477	Batman: Arkham Asylum	Batman: Arkham Asylum puts you behind the cowl of the iconic Dark Knight, fighting his way through Arkham Asylum to stop the Joker from enacting a sinister plot that would have grave consequences for Gotham City.	\N	2009-08-25
478	Batman: Arkham City	When Gotham City's slums have been transformed into a secluded super-prison, it's up to Batman to uncover its conspiracy in the sequel to 2009's Batman: Arkham Asylum.	\N	2011-10-18
479	Batman: Arkham Origins	Two years after beginning his crime-fighting career, Batman faces his toughest challenge ever when the crime lord known as Black Mask hires the eight deadliest assassins in the DC Universe to kill the vigilante who has been interfering in his operations.	\N	2013-10-25
480	Batman: Arkham Knight	Developer Rocksteady's return to the Batman series takes place one year after the events of Arkham City. It expands the open world from the previous game and allows players to finally drive the Batmobile throughout Gotham City's streets.	\N	2015-06-23
481	Days Gone	An open-world survival action game from Sony's Bend studio.	\N	2019-04-26
482	Horizon Zero Dawn	Explore a lush, post-apocalyptic world inhabited by robotic beasts while uncovering secrets of the past.	\N	2017-02-28
483	Horizon Forbidden West	Aloy ventures to the west coast of what was formerly America in this sequel to 2017's Horizon Zero Dawn.	\N	2022-02-18
484	Dark Souls	A quasi-sequel to From Software's action-RPG Demon's Souls, set in a new universe while retaining most of the basic gameplay and the high level of challenge. It features a less-linear world, a new checkpoint system in the form of bonfires, and the unique Humanity system.	\N	2011-09-22
485	Dark Souls II	Blood, souls, and tears are continually spent as players traverse the land of Drangleic in FromSoftware's third entry in the Souls series.	\N	2014-03-11
486	Dark Souls III	This game melds elements from all previous Souls games and concludes the Dark Souls trilogy.	\N	2016-03-24
487	Hades	Hades is a rogue-like dungeon crawler in which you defy the god of death as you hack and slash your way out of the Underworld of Greek myth.	\N	2020-09-17
488	Call of Duty 4: Modern Warfare	Nintendo DS-exclusive side story to the main Call of Duty 4 campaign.	\N	2007-11-05
489	Alien: Isolation	A survival horror game set fifteen years after the original Alien film. It stars Amanda Ripley, the daughter of the film's protagonist, Ellen Ripley.	\N	2014-10-07
490	Outer Wilds	Explore a solar system on the brink of collapse in this Seumas McNally Grand Prize Winner.	\N	2019-05-29
491	Shadow of the Colossus	Bluepoint's remake of the 2005 PlayStation 2 classic, Shadow of the Colossus.	\N	2018-02-06
492	Star Wars: Knights of the Old Republic	Taking place in the Old Republic era of Star Wars, around 4000 years before the events of the films, Knights of the Old Republic is a third-person turn-based RPG where players travel the galaxy as a mysterious Republic soldier, racing against time to thwart a massive Sith fleet.	\N	2003-07-15
493	Resident Evil 7 biohazard	Six years after the events of Resident Evil 6, newcomer Ethan receives a message from his presumed dead wife to reunite with her at the residence of the reclusive Baker family. The game features a first-person view and a return to traditional Survival Horror mechanics.	\N	2017-01-24
494	Sekiro: Shadows Die Twice	An action game by FromSoftware, the makers of Dark Souls.	\N	2019-03-22
495	Half-Life	Take on the role of Gordon Freeman as he escapes the disastrous aftermath of an experiment gone wrong in the Black Mesa Research Facility.	\N	1998-11-19
496	Half-Life 2	Several years after the Black Mesa disaster, Gordon Freeman awakens from stasis to aid a resistance movement against the Combine, a collective of trans-dimensional aliens that have conquered Earth.	\N	2004-11-16
497	Super Smash Bros. Ultimate	The Switch debut of Nintendo's flagship fighting game series brings together every character from the series' history, bringing the roster to over 70 fighters.	\N	2018-12-07
498	Super Mario Odyssey	Nintendo's favorite plumber and his new hat-shaped companion travel far beyond the Mushroom Kingdom in this Switch-exclusive 3D platformer.	\N	2017-10-27
499	Control	Dive into a dark and brutalist-inspired world where daily reality has been corrupted by an otherworldly force.	\N	2019-08-27
500	Little Nightmares	Platformer game for PS4, PC and Xbox One.	\N	2017-04-28
326	Harry Potter and the Sorcerer's Stone	No description available.	\N	\N
327	Harry Potter and the Order of the Phoenix	No description available.	\N	\N
328	Harry Potter and the Half-Blood Prince	One summer night, when Dumbledore arrives at Privet Drive to collect Harry Potter, his wand hand is blackened and shriveled, but he will not reveal why.\r\n\r\nRumours and suspicion spread through the wizarding world – it feels as if even Hogwarts itself might be under threat.\r\n\r\nHarry is convinced that Malfoy bears the Dark Mark: could there be a Death Eater amongst them?\r\n\r\nHe will need powerful magic and true friends as, with the help of Dumbledore, he investigates Voldemort’s darkest secrets.\r\n\r\n([source][2])\r\n\r\nPreceded by: [Harry Potter and the Order of the Phoenix][1]\r\nFollowed by: [Harry Potter and the Deathly Hallows][3]\r\n\r\n\r\n----------\r\nContains:\r\n[Harry Potter and the Half-Blood Prince [3/4]](https://openlibrary.org/works/OL27299760W)\r\n[Harry Potter and the Half-Blood Prince [4/4]](https://openlibrary.org/works/OL27294904W)\r\n\r\n  [1]: https://openlibrary.org/works/OL13716955W/Harry_Potter_and_the_Order_of_the_Phoenix\r\n  [2]: https://www.jkrowling.com/book/harry-potter-half-blood-prince/\r\n  [3]: https://openlibrary.org/works/OL82586W/Harry_Potter_and_the_Deathly_Hallows	\N	\N
329	The Maze Runner	When Thomas wakes up in the lift, the only thing he can remember is his first name.  His memory is blank.  But he's not alone.  When the lift's doors open, Thomas finds himself surrounded by kids who welcome him to the Glade--a large, open expanse surrounded by stone walls.  Just like Thomas, the Gladers don't know why or how they got to the Glade.  All they know is that every morning the stone doors to the maze that surrounds them have opened.  Every night they've closed tight.  And every 30 days a new boy has been delivered in the lift.  Thomas was expected.  But the next day, a girl is sent up--the first girl to ever arrive in the Glade.  And more surprising yet is the message she delivers.  Thomas might be more important than he could ever guess.  If only he could unlock the dark secrets buried within his mind.  From the Hardcover edition.	\N	\N
330	Diary Of A Wimpy Kid	No description available.	\N	\N
331	Harry Potter and the Prisoner of Azkaban	For Harry Potter, it’s the start of another far-from-ordinary year at Hogwarts when the Knight Bus crashes through the darkness and comes to an abrupt halt in front of him.\r\n\r\nIt turns out that Sirius Black, mass-murderer and follower of Lord Voldemort, has escaped – and they say he is coming after Harry.\r\n\r\nIn his first Divination class, Professor Trelawney sees an omen of death in Harry’s tea leaves.\r\n\r\nAnd perhaps most frightening of all are the Dementors patrolling the school grounds with their soul-sucking kiss – in search of fresh victims.\r\n\r\n([source][1])\r\n\r\n\r\n  [1]: https://www.jkrowling.com/book/harry-potter-prisoner-azkaban/	\N	\N
332	Harry Potter and the Goblet of Fire	The fourth book in the Harry Potter franchise sees Harry returning for his fourth year at Hogwarts School of Witchcraft and Wizardry, along with his friends, Ron and Hermione . There is an upcoming tournament between the three major schools of magic, with one participant selected from each school by the Goblet of Fire. When Harry's name is drawn, even though he is not eligible and is a fourth player, he must compete in the dangerous contest.\r\n\r\n\r\n----------\r\nContains:\r\n\r\n - [Harry Potter and the Goblet of Fire. 2/4](https://openlibrary.org/works/OL17910198W/Harry_Potter_and_the_Goblet_of_Fire._2_4)	\N	\N
333	Harry Potter and the Deathly Hallows	Harry Potter is leaving Privet Drive for the last time. But as he climbs into the sidecar of Hagrid’s motorbike and they take to the skies, he knows Lord Voldemort and the Death Eaters will not be far behind.\r\n\r\nThe protective charm that has kept him safe until now is broken. But the Dark Lord is breathing fear into everything he loves. And he knows he can’t keep hiding.\r\n\r\nTo stop Voldemort, Harry knows he must find the remaining Horcruxes and destroy them.\r\n\r\nHe will have to face his enemy in one final battle.\r\n\r\n([source][1])\r\n\r\n\r\n----------\r\nSee also:\r\n\r\n - [Harry Potter and the Deathly Hallows: 2/2][2]\r\n\r\n\r\n  [1]: https://www.jkrowling.com/book/harry-potter-deathly-hallows/\r\n  [2]: https://openlibrary.org/works/OL17922343W/Harry_Potter_and_the_Deathly_Hallows_Chapters_20-36	\N	\N
334	Cabin Fever	Greg Heffley is in big trouble. School property has been damaged, and Greg is the prime suspect. But the crazy thing is, he’s innocent. Or at least sort of.\r\n\r\nThe authorities are closing in, but when a surprise blizzard hits, the Heffley family is trapped indoors. Greg knows that when the snow melts he’s going to have to face the music, but could any punishment be worse than being stuck inside with your family for the holidays?	\N	\N
335	Double Down	The pressure's really piling up on Greg Heffley. His mom thinks video games are turning his brain to mush, so she wnats her son to put down the controller and explore his "creative side".\r\n\r\nAs if that's not scary enough, Halloween is just around the corner and the frights are coming at Greg from every angle.\r\n\r\nWhen he discovers a bag of gummy worms, it sparks an idea. Can Greg get his mom off his back by making a movie.... and will he become rich and famous in the progress? Or will doubling down on this path just double Greg's troubles?	\N	\N
336	Dog Days	In Dog Days, book 4 of the Diary of a Wimpy Kid series from #1 international bestselling author Jeff Kinney, it's summer vacation, the weather's great, and all the kids are having fun outside. So where's Greg Heffley?\r\n\r\nInside his house, playing video games with the shades drawn.\r\n\r\nGreg, a self-confessed "indoor person," is living out his ultimate summer fantasy: no responsibilities and no rules. But Greg's mom has a different vision for an ideal summer . . . one packed with outdoor activities and "family togetherness."\r\n\r\nWhose vision will win out? Or will a new addition to the Heffley family change everything?	\N	\N
337	The Deep End	An instant #1 USA Today, Wall Street Journal, and New York Times bestseller!\r\n\r\nIn The Deep End, book 15 of the Diary of a Wimpy Kid series from #1 international bestselling author Jeff Kinney, Greg Heffley and his family hit the road for a cross-country camping trip, ​ready for the adventure of a lifetime.\r\n\r\nBut things take an unexpected turn, and they find themselves stranded at an RV park that’s not exactly a summertime paradise. When the skies open up and the water starts to rise, the Heffleys wonder if they can save their vacation—or if they’re already in too deep.	\N	\N
338	Old School	Life was better in the old days. Or was it?\r\n\r\nThat’s the question Greg Heffley is asking as his town voluntarily unplugs and goes electronics-free. But modern life has its conveniences, and Greg isn’t cut out for an old-fashioned world.\r\n\r\nWith tension building inside and outside the Heffley home, will Greg find a way to survive? Or is going “old school” just too hard for a kid like Greg?	\N	\N
339	Rodrick Rules	Greg Heffley tells about his summer vacation and his attempts to steer clear of trouble when he returns to middle school and tries to keep his older brother Rodrick from telling everyone about Greg's most humiliating experience of the summer.	\N	\N
340	The Long Haul	A family road trip is supposed to be a lot of fun... Unless, of course, you’re the Heffleys. The journey starts off full of promise, then quickly takes several wrong turns. Gas station bathrooms, crazed seagulls, a fender bender, and a runaway pig — not exactly Greg Heffley’s idea of a good time. But even the worst road trip can turn into an adventure — and this is one the Heffleys won’t soon forget.	\N	\N
341	Fly Guy meets Fly Girl	Fly Guy has a new friend: Fly Girl!\r\nFly Guy has met his match, and her name is Fly Girl. Fly Guy can do fancy flying. Fly Girl can do fancier flying. Fly Guy can eat gross stuff. Fly Girl can eat grosser stuff. Fly Guy can say his boy's name--Buzzzzzz! And Fly Girl can say her girl's name--Lizzzzzzz! Fly Guy is totally impressed, and totally smitten. Will Fly Guy and Fly Girl get married and leave Buzz without his dear pet?Using hyperbole, puns, slapstick, and silly drawings, Tedd Arnold delivers an easy reader that is full of fun in his NEW YORK TIMES bestselling Fly Guy series.	\N	\N
342	Fly High, Fly Guy! (Fly Guy)	Buzz and Fly guy go on a trip but his parents don't want Fly guy to go but when they get lost Fly guy helps them find there way.	\N	\N
343	Hi, Fly Guy!	When Buzz captures a fly to enter in The Amazing Pet Show, his parents and the judges tell him that a fly cannot be a pet, but Fly Guy proves them wrong.	\N	\N
344	Super Fly Guy	Fly Guy visits the school cafeteria and gets the lunch lady fired.	\N	\N
345	Shoo, Fly Guy!	No description available.	\N	\N
346	Hooray for Fly Guy!	Fly Guy joins Buzz's football team, despite Coach's misgivings, and hits the field for a special, secret play.	\N	\N
347	The Hunger Games	The Hunger Games is a 2008 dystopian novel by the American writer Suzanne Collins. It is written in the perspective of 16-year-old Katniss Everdeen, who lives in the future, post-apocalyptic nation of Panem in North America. The Capitol, a highly advanced metropolis, exercises political control over the rest of the nation. The Hunger Games is an annual event in which one boy and one girl aged 12–18 from each of the twelve districts surrounding the Capitol are selected by lottery to compete in a televised battle royale to the death.\r\n\r\nThe book received critical acclaim from major reviewers and authors. It was praised for its plot and character development. In writing The Hunger Games, Collins drew upon Greek mythology, Roman gladiatorial games, and contemporary reality television for thematic content. The novel won many awards, including the California Young Reader Medal, and was named one of Publishers Weekly's "Best Books of the Year" in 2008.\r\n\r\nThe Hunger Games was first published in hardcover on September 14, 2008, by Scholastic, featuring a cover designed by Tim O'Brien.	\N	\N
348	Catching Fire	Against all odds, Katniss Everdeen has won the Hunger Games. She and fellow District 12 tribute Peeta Mellark are miraculously still alive. Katniss should be relieved, happy even. After all, she has returned to her family and her longtime friend, Gale. Yet nothing is the way Katniss wishes it to be. Gale holds her at an icy distance. Peeta has turned his back on her completely. And there are whispers of a rebellion against the Capitol—a rebellion that Katniss and Peeta may have helped create. \r\n\r\nMuch to her shock, Katniss has fueled an unrest that she's afraid she cannot stop. And what scares her even more is that she's not entirely convinced she should try. As time draws near for Katniss and Peeta to visit the districts on the Capitol's cruel Victory Tour, the stakes are higher than ever. If they can't prove, without a shadow of a doubt, that they are lost in their love for each other, the consequences will be horrifying.\r\n\r\nIn Catching Fire, the second novel of the Hunger Games trilogy, Suzanne Collins continues the story of Katniss Everdeen, testing her more than ever before . . . and surprising readers at every turn.	\N	\N
349	Mockingjay	Against all odds, Katniss Everdeen has survived the Hunger Games twice. But now that she's made it out of the bloody arena alive, she's still not safe. The Capitol is angry. The Capitol wants revenge. Who do they think should pay for the unrest? Katniss. And what's worse, President Snow has made it clear that no one else is safe either. Not Katniss's family, not her friends, not the people of District 12. Powerful and haunting, this is the thrilling final installment of Suzanne Collins's groundbreaking Hunger Games trilogy. - Publisher.	\N	\N
350	The Scorch Trials	Thomas was sure that escape from the Maze would mean freedom for him and the Gladers. But WICKED isn’t done yet. Phase Two has just begun. The Scorch. The Gladers have two weeks to cross through the Scorch—the most burned-out section of the world. And WICKED has made sure to adjust the variables and stack the odds against them. There are others now. Their survival depends on the Gladers’ destruction—and they’re determined to survive. \r\n\r\nFriendships will be tested. Loyalties will be broken. \r\n\r\nAll bets are off.	\N	\N
250	Short n' Sweet	\N	\N	2024-08-23
251	Blonde	\N	\N	2016-08-20
252	DAMN.	\N	\N	2017-04-14
253	SOUR	\N	\N	2021-05-21
254	Stick Season	\N	\N	2022-10-14
255	F-1 Trillion	\N	\N	2024-08-15
256	UTOPIA	\N	\N	2023-07-28
257	CHROMAKOPIA	\N	\N	2024-10-28
258	HIT ME HARD AND SOFT	\N	\N	2024-05-17
259	The Secret of Us (Deluxe)	\N	\N	2024-10-18
260	One Thing At A Time	\N	\N	2023-03-03
261	Eternal Atake 2	\N	\N	2024-11-01
262	Graduation	\N	\N	2007-09-11
263	JESUS IS KING	\N	\N	2019-10-25
264	The Life Of Pablo	\N	\N	2016-06-10
265	Yeezus	\N	\N	2013-06-18
266	Up All Night	\N	\N	2012-05-25
267	FOUR (Deluxe)	\N	\N	2014-11-17
268	Fine Line	\N	\N	2019-12-13
269	Harry's House	\N	\N	2022-05-20
270	Made In The A.M. (Deluxe Edition)	\N	\N	2015-11-13
271	BTR	\N	\N	2010-10-11
272	Paralyzed	\N	\N	2022-11-25
273	Another Life (Deluxe Version)	\N	\N	2023-11-10
274	Another Life (Deluxe Version)	\N	\N	2023-11-10
275	Animal (Expanded Edition)	\N	\N	2010-01-01
276	Animal (Expanded Edition)	\N	\N	2010-01-01
277	Lemonade Mouth	\N	\N	2011-01-01
278	blink-182	\N	\N	2003-01-01
279	Metallica (Remastered)	\N	\N	1991-08-12
280	Ride The Lightning (Remastered)	\N	\N	1984-07-27
281	Rust In Peace	\N	\N	1990-01-01
282	Countdown To Extinction (Expanded Edition - Remastered)	\N	\N	1992-07-14
283	Kill 'Em All (Remastered)	\N	\N	1983-07-25
284	Master of Puppets (Remastered Deluxe Box Set)	\N	\N	1986-03-03
287	Load	\N	\N	1996-06-04
288	Load	\N	\N	1996-06-04
289	FUTURE	\N	\N	2017-06-30
290	Flower Boy	\N	\N	2017-07-21
291	Playboi Carti	\N	\N	2017-04-14
292	Because the Internet	\N	\N	2013-12-10
293	Gemini Rights	\N	\N	2022-07-15
294	The Album About Nothing	\N	\N	2015-03-31
295	Die Lit	\N	\N	2018-05-11
296	Faces	\N	\N	2021-10-15
297	WUNNA	\N	\N	2020-05-22
298	MM..FOOD	\N	\N	2004-11-16
299	Youthanasia	\N	\N	1994-11-01
519	Acid Rap	\N	\N	2013-04-30
520	The Big Day	\N	\N	2019-07-26
521	Ocean Avenue	\N	\N	2003-01-01
522	Lights And Sounds	\N	\N	2006-01-01
351	Hamlet	In this quintessential Shakespeare tragedy, a young prince's halting pursuit of revenge for the murder of his father unfolds in a series of highly charged confrontations that have held audiences spellbound for nearly four centuries. Those fateful exchanges, and the anguished soliloquies that precede and follow them, probe depths of human feeling rarely sounded in any art. \r\nThe title role of Hamlet, perhaps the most demanding in all of Western drama, has provided generations of leading actors their greatest challenge. Yet all the roles in this towering drama are superbly delineated, and each of the key scenes offers actors a rare opportunity to create theatrical magic.\r\nAs if further evidence of Shakespeare's genius were needed, Hamlet is a unique pleasure to read as well as to see and hear performed. The full text of this extraordinary drama is reprinted here from an authoritative British edition complete with illuminating footnotes.\r\n(back cover)	\N	\N
352	Wonder	No description available.	\N	\N
353	The Fault in Our Stars	Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel’s story is about to be completely rewritten.\r\n\r\nInsightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning-author John Green’s most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love.	\N	\N
700	Moana 2	After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.	\N	2024-11-27
501	Call of Duty: Black Ops II	The Black Ops storyline continues, switching the past Cold War from the game's predecessor to future 2025, as a new Cold War between U.S.A. and China flares up due to the actions of one vengeful drug-runner.	\N	2012-11-13
502	Call of Duty: Black Ops III	Set 40 years after the events of Black Ops II, the twelfth installment of the Call of Duty series brings advanced robotics and biotic augmentations to the clandestine operations of the Black Ops storyline.	\N	2015-11-06
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.movies ("mediaID", "gID", studio, "cast", director, poster_url) FROM stdin;
1	\N	Fox 2000 Pictures	{"Edward Norton","Brad Pitt","Helena Bonham Carter","Meat Loaf"}	David Fincher	https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg
2	\N	Marvel Enterprises	{"Tobey Maguire","Willem Dafoe","Kirsten Dunst","James Franco"}	Sam Raimi	https://image.tmdb.org/t/p/w500/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg
3	\N	Legendary Pictures	{"Matthew McConaughey","Anne Hathaway","Michael Caine","Jessica Chastain"}	Christopher Nolan	https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg
4	\N	DC	{"Christian Bale","Heath Ledger","Aaron Eckhart","Michael Caine"}	Christopher Nolan	https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg
5	\N	Paramount Pictures	{"Harrison Ford","Karen Allen","Paul Freeman","John Rhys-Davies"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/ceG9VzoRAVGwivFU403Wc3AHRys.jpg
6	\N	Paramount Pictures	{"Harrison Ford","Kate Capshaw","Ke Huy Quan","Amrish Puri"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/om61eim8XwLfh6QXzh2r0Q4blBz.jpg
7	\N	Great American Films Limited Partnership	{"Jennifer Grey","Patrick Swayze","Jerry Orbach","Cynthia Rhodes"}	Emile Ardolino	https://image.tmdb.org/t/p/w500/9Jw6jys7q9gjzVX5zm1z0gC8gY9.jpg
8	\N	Paramount Pictures	{"Harrison Ford","Sean Connery","Denholm Elliott","Alison Doody"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/sizg1AU8f8JDZX4QIgE4pjUMBvx.jpg
9	\N	Pixar	{"Tom Hanks","Tim Allen","Don Rickles","Jim Varney"}	John Lasseter	https://image.tmdb.org/t/p/w500/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg
10	\N	Pixar	{"Tom Hanks","Tim Allen","Joan Cusack","Kelsey Grammer"}	John Lasseter	https://image.tmdb.org/t/p/w500/2MFIhZAW0CVlEQrFyqwa4U6zqJP.jpg
11	\N	Pixar	{"Tom Hanks","Tim Allen","Joan Cusack","Don Rickles"}	Lee Unkrich	https://image.tmdb.org/t/p/w500/AbbXspMOwdvwWZgVN0nabZq03Ec.jpg
12	\N	Walt Disney Pictures	{"Tom Hanks","Tim Allen","Annie Potts","Tony Hale"}	Josh Cooley	https://image.tmdb.org/t/p/w500/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg
13	\N	Walt Disney Animation Studios	{"Mandy Moore","Zachary Levi","Donna Murphy","Ron Perlman"}	Nathan Greno	https://image.tmdb.org/t/p/w500/ym7Kst6a4uodryxqbGOxmewF235.jpg
14	\N	Pixar	{"Ben Burtt","Elissa Knight","Jeff Garlin","Fred Willard"}	Andrew Stanton	https://image.tmdb.org/t/p/w500/hbhFnRzzg6ZDmm8YAmxBnQpQIPh.jpg
15	\N	Syncopy	{"Cillian Murphy","Emily Blunt","Matt Damon","Robert Downey Jr."}	Christopher Nolan	https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg
16	\N	Shaw Brothers	{"Harrison Ford","Rutger Hauer","Sean Young","Edward James Olmos"}	Ridley Scott	https://image.tmdb.org/t/p/w500/63N9uy8nd9j7Eog2axPQ8lbr3Wj.jpg
17	\N	Alcon Entertainment	{"Ryan Gosling","Harrison Ford","Ana de Armas","Dave Bautista"}	Denis Villeneuve	https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg
18	\N	Legendary Pictures	{"Timothée Chalamet","Rebecca Ferguson","Oscar Isaac","Jason Momoa"}	Denis Villeneuve	https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg
19	\N	Legendary Pictures	{"Timothée Chalamet",Zendaya,"Rebecca Ferguson","Javier Bardem"}	Denis Villeneuve	https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg
20	\N	Universal Pictures	{"Michael J. Fox","Christopher Lloyd","Crispin Glover","Lea Thompson"}	Robert Zemeckis	https://image.tmdb.org/t/p/w500/fNOH9f1aA7XRTzl1sAOx9iF553Q.jpg
21	\N	20th Century Fox	{"Tom Skerritt","Sigourney Weaver","Veronica Cartwright","Harry Dean Stanton"}	Ridley Scott	https://image.tmdb.org/t/p/w500/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg
22	\N	SLM Production Group	{"Sigourney Weaver","Carrie Henn","Michael Biehn","Paul Reiser"}	James Cameron	https://image.tmdb.org/t/p/w500/r1x5JGpyqZU8PYhbs4UcrO1Xb6x.jpg
23	\N	Paramount Pictures	{"Tom Cruise","Dakota Fanning","Justin Chatwin","Miranda Otto"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/6Biy7R9LfumYshur3YKhpj56MpB.jpg
24	\N	Universal Pictures	{"Henry Thomas","Drew Barrymore","Robert MacNaughton","Peter Coyote"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/an0nD6uq6byfxXCfk6lQBzdL2J1.jpg
25	\N	DreamWorks Animation	{"Jay Baruchel","Gerard Butler","Craig Ferguson","America Ferrera"}	Dean DeBlois	https://image.tmdb.org/t/p/w500/92olhXYaIX6lvB8jwFz4OSfPaKq.jpg
26	\N	DreamWorks Animation	{"Jay Baruchel","Cate Blanchett","Gerard Butler","Craig Ferguson"}	Dean DeBlois	https://image.tmdb.org/t/p/w500/d13Uj86LdbDLrfDoHR5aDOFYyJC.jpg
27	\N	DreamWorks Animation	{"Jay Baruchel","America Ferrera","F. Murray Abraham","Cate Blanchett"}	Dean DeBlois	https://image.tmdb.org/t/p/w500/xvx4Yhf0DVH8G4LzNISpMfFBDy2.jpg
28	\N	Walt Disney Pictures	{"Jeff Bridges","Garrett Hedlund","Olivia Wilde","Bruce Boxleitner"}	Joseph Kosinski	https://image.tmdb.org/t/p/w500/vuifSABRpSnxCAOxEnWpNbZSXpp.jpg
29	\N	Silver Pictures	{"Russell Crowe","Ryan Gosling","Angourie Rice","Matt Bomer"}	Shane Black	https://image.tmdb.org/t/p/w500/clq4So9spa9cXk3MZy2iMdqkxP2.jpg
30	\N	Marvel Enterprises	{"Tobey Maguire","Kirsten Dunst","James Franco","Alfred Molina"}	Sam Raimi	https://image.tmdb.org/t/p/w500/olxpyq9kJAZ2NU1siLshhhXEPR7.jpg
31	\N	Laura Ziskin Productions	{"Tobey Maguire","Kirsten Dunst","James Franco","Thomas Haden Church"}	Sam Raimi	https://image.tmdb.org/t/p/w500/qFmwhVUoUSXjkKRmca5yGDEXBIj.jpg
32	\N	Paramount Pictures	{"Tom Kenny","Clancy Brown","Rodger Bumpass","Bill Fagerbakke"}	Stephen Hillenburg	https://image.tmdb.org/t/p/w500/1rvzKV1d18EbDVaEd4VDzK3cgnY.jpg
33	\N	TriStar Pictures	{"Tom Cruise","Renée Zellweger","Cuba Gooding Jr.","Kelly Preston"}	Cameron Crowe	https://image.tmdb.org/t/p/w500/lABvGN7fDk5ifnwZoxij6G96t2w.jpg
34	\N	Lucasfilm Ltd.	{"Mark Hamill","Harrison Ford","Carrie Fisher","Peter Cushing"}	George Lucas	https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg
35	\N	Lucasfilm Ltd.	{"Mark Hamill","Harrison Ford","Carrie Fisher","Billy Dee Williams"}	Irvin Kershner	https://image.tmdb.org/t/p/w500/nNAeTmF4CtdSgMDplXTDPOpYzsX.jpg
36	\N	Lucasfilm Ltd.	{"Mark Hamill","Harrison Ford","Carrie Fisher","Billy Dee Williams"}	Richard Marquand	https://image.tmdb.org/t/p/w500/jQYlydvHm3kUix1f8prMucrplhm.jpg
37	\N	Dovemead Films	{"Christopher Reeve","Margot Kidder","Gene Hackman","Marlon Brando"}	Richard Donner	https://image.tmdb.org/t/p/w500/d7px1FQxW4tngdACVRsCSaZq0Xl.jpg
38	\N	Marvel Studios	{"Robert Downey Jr.","Terrence Howard","Jeff Bridges","Gwyneth Paltrow"}	Jon Favreau	https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg
39	\N	Marvel Studios	{"Chris Evans","Samuel L. Jackson","Scarlett Johansson","Robert Redford"}	Joe Russo	https://image.tmdb.org/t/p/w500/tVFRpFw3xTedgPGqxW0AOI8Qhh0.jpg
40	\N	Marvel Studios	{"Chris Evans","Robert Downey Jr.","Scarlett Johansson","Sebastian Stan"}	Joe Russo	https://image.tmdb.org/t/p/w500/rAGiXaUfPzY7CDEyNKUofk3Kw2e.jpg
41	\N	Marvel Studios	{"Robert Downey Jr.","Chris Evans","Mark Ruffalo","Chris Hemsworth"}	Joss Whedon	https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg
42	\N	Marvel Studios	{"Robert Downey Jr.","Chris Evans","Chris Hemsworth","Josh Brolin"}	Anthony Russo	https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg
43	\N	Marvel Studios	{"Robert Downey Jr.","Chris Evans","Mark Ruffalo","Chris Hemsworth"}	Joe Russo	https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg
44	\N	Pixar	{"Ed Asner","Christopher Plummer","Jordan Nagai","Bob Peterson"}	Pete Docter	https://image.tmdb.org/t/p/w500/mFvoEwSfLqbcWwFsDjQebn9bzFe.jpg
45	\N	Walt Disney Pictures	{"Craig T. Nelson","Holly Hunter","Sarah Vowell","Spencer Fox"}	Brad Bird	https://image.tmdb.org/t/p/w500/2LqaLgk4Z226KkgPJuiOQ58wvrm.jpg
46	\N	Paramount Pictures	{"Tom Cruise","Jeremy Renner","Simon Pegg","Rebecca Ferguson"}	Christopher McQuarrie	https://image.tmdb.org/t/p/w500/sGvcWcI99OTXLzghD7qXw00KaY5.jpg
47	\N	Paramount Pictures	{"Tom Cruise","Henry Cavill","Ving Rhames","Simon Pegg"}	Christopher McQuarrie	https://image.tmdb.org/t/p/w500/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg
48	\N	Warner Bros. Pictures	{"Al Pacino","Robert De Niro","Val Kilmer","Jon Voight"}	Michael Mann	https://image.tmdb.org/t/p/w500/umSVjVdbVwtx5ryCA2QXL44Durm.jpg
49	\N	Miramax	{"John Travolta","Samuel L. Jackson","Uma Thurman","Bruce Willis"}	Quentin Tarantino	https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg
50	\N	Kubrick Productions	{"Keir Dullea","Gary Lockwood","William Sylvester","Douglas Rain"}	Stanley Kubrick	https://image.tmdb.org/t/p/w500/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg
51	\N	Universal Pictures	{"Sam Neill","Laura Dern","Jeff Goldblum","Richard Attenborough"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/oU7Oq2kFAAlGqbU4VoAE36g4hoI.jpg
52	\N	Zanuck/Brown Productions	{"Roy Scheider","Robert Shaw","Richard Dreyfuss","Lorraine Gary"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/lxM6kqilAdpdhqUl2biYp5frUxE.jpg
53	\N	Warner Bros. Pictures	{"Christian Bale","Michael Caine","Liam Neeson","Katie Holmes"}	Christopher Nolan	https://image.tmdb.org/t/p/w500/4MpN4kIEqUjW8OPtOQJXlTdHiJV.jpg
54	\N	Syncopy	{"Christian Bale","Gary Oldman","Tom Hardy","Joseph Gordon-Levitt"}	Christopher Nolan	https://image.tmdb.org/t/p/w500/hr0L2aueqlP2BYUblTTjmtn0hw4.jpg
55	\N	Metro-Goldwyn-Mayer	{"Daniel Craig","Eva Green","Mads Mikkelsen","Judi Dench"}	Martin Campbell	https://image.tmdb.org/t/p/w500/lMrxYKKhd4lqRzwUHAy5gcx9PSO.jpg
56	\N	EON Productions	{"Daniel Craig","Léa Seydoux","Rami Malek","Lashana Lynch"}	Cary Joji Fukunaga	https://image.tmdb.org/t/p/w500/iUgygt3fscRoKWCV1d0C7FbM9TP.jpg
57	\N	Universal Pictures	{"Tom Cruise","Morgan Freeman","Olga Kurylenko","Andrea Riseborough"}	Joseph Kosinski	https://image.tmdb.org/t/p/w500/eO3r38fwnhb58M1YgcjQBd3VNcp.jpg
58	\N	Paramount Pictures	{"Leonardo DiCaprio","Kate Winslet","Billy Zane","Kathy Bates"}	James Cameron	https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg
59	\N	Paramount Pictures	{"Jake Gyllenhaal","Mark Ruffalo","Anthony Edwards","Robert Downey Jr."}	David Fincher	https://image.tmdb.org/t/p/w500/6YmeO4pB7XTh8P8F960O1uA14JO.jpg
60	\N	20th Century Fox	{"Ben Affleck","Rosamund Pike","Neil Patrick Harris","Tyler Perry"}	David Fincher	https://image.tmdb.org/t/p/w500/ts996lKsxvjkO2yiYG0ht4qAicO.jpg
61	\N	Columbia Pictures	{"Daniel Craig","Rooney Mara","Christopher Plummer","Stellan Skarsgård"}	David Fincher	https://image.tmdb.org/t/p/w500/8bokS83zGdhaXgN9tjidUKmAftW.jpg
62	\N	FilmDistrict	{"Ryan Gosling","Carey Mulligan","Bryan Cranston","Albert Brooks"}	Nicolas Winding Refn	https://image.tmdb.org/t/p/w500/602vevIURmpDfzbnv5Ubi6wIkQm.jpg
63	\N	Genre Films	{"Matt Damon","Jessica Chastain","Kristen Wiig","Jeff Daniels"}	Ridley Scott	https://image.tmdb.org/t/p/w500/5BHuvQ6p9kfc091Z8RiFNhCwL4b.jpg
64	\N	Warner Bros. Pictures	{"Harrison Ford","Tommy Lee Jones","Joe Pantoliano","Jeroen Krabbé"}	Andrew Davis	https://image.tmdb.org/t/p/w500/b3rEtLKyOnF89mcK75GXDXdmOEf.jpg
65	\N	Columbia Pictures	{"Shameik Moore","Jake Johnson","Hailee Steinfeld","Mahershala Ali"}	Bob Persichetti	https://image.tmdb.org/t/p/w500/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg
66	\N	Columbia Pictures	{"Shameik Moore","Hailee Steinfeld","Brian Tyree Henry","Luna Lauren Velez"}	Justin K. Thompson	https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg
67	\N	Bold Films	{"Miles Teller","J.K. Simmons","Paul Reiser","Melissa Benoist"}	Damien Chazelle	https://image.tmdb.org/t/p/w500/7fn624j5lj3xTme2SgiLCeuedmO.jpg
68	\N	New Line Cinema	{"Elijah Wood","Ian McKellen","Viggo Mortensen","Sean Astin"}	Peter Jackson	https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg
69	\N	New Line Cinema	{"Elijah Wood","Ian McKellen","Viggo Mortensen","Sean Astin"}	Peter Jackson	https://image.tmdb.org/t/p/w500/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg
70	\N	New Line Cinema	{"Elijah Wood","Ian McKellen","Viggo Mortensen","Sean Astin"}	Peter Jackson	https://image.tmdb.org/t/p/w500/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg
71	\N	Marvel Studios	{"Chris Pratt","Zoe Saldaña","Dave Bautista","Vin Diesel"}	James Gunn	https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg
72	\N	Marvel Studios	{"Chris Pratt","Zoe Saldaña","Dave Bautista","Vin Diesel"}	James Gunn	https://image.tmdb.org/t/p/w500/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg
73	\N	Marvel Studios	{"Chris Pratt","Zoe Saldaña","Dave Bautista","Karen Gillan"}	James Gunn	https://image.tmdb.org/t/p/w500/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg
74	\N	Amblin Entertainment	{"Liam Neeson","Ben Kingsley","Ralph Fiennes","Caroline Goodall"}	Steven Spielberg	https://image.tmdb.org/t/p/w500/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg
75	\N	Legendary Pictures	{"Leonardo DiCaprio","Joseph Gordon-Levitt","Ken Watanabe","Tom Hardy"}	Christopher Nolan	https://image.tmdb.org/t/p/w500/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg
76	\N	Village Roadshow Pictures	{"Keanu Reeves","Laurence Fishburne","Carrie-Anne Moss","Hugo Weaving"}	Lana Wachowski	https://image.tmdb.org/t/p/w500/p96dm7sCMn4VYAStA6siNz30G1r.jpg
77	\N	Warner Bros. Pictures	{"Hugh Jackman","Christian Bale","Michael Caine","Piper Perabo"}	Christopher Nolan	https://image.tmdb.org/t/p/w500/tRNlZbgNCNOpLpbPEz5L8G8A0JN.jpg
78	\N	Miramax	{"Matt Damon","Robin Williams","Ben Affleck","Stellan Skarsgård"}	Gus Van Sant	https://image.tmdb.org/t/p/w500/bABCBKYBK7A5G1x0FzoeoNfuj2.jpg
79	\N	Walt Disney Pictures	{"Johnny Depp","Orlando Bloom","Keira Knightley","Stellan Skarsgård"}	Gore Verbinski	https://image.tmdb.org/t/p/w500/uXEqmloGyP7UXAiphJUu2v2pcuE.jpg
80	\N	Walt Disney Pictures	{"Johnny Depp","Orlando Bloom","Keira Knightley","Geoffrey Rush"}	Gore Verbinski	https://image.tmdb.org/t/p/w500/poHwCZeWzJCShH7tOjg8RIoyjcw.jpg
81	\N	Jerry Bruckheimer Films	{"Johnny Depp","Orlando Bloom","Keira Knightley","Geoffrey Rush"}	Gore Verbinski	https://image.tmdb.org/t/p/w500/jGWpG4YhpQwVmjyHEGkxEkeRf0S.jpg
82	\N	Walt Disney Pictures	{"Scott Weinger","Robin Williams","Linda Larkin","Jonathan Freeman"}	Ron Clements	https://image.tmdb.org/t/p/w500/eLFfl7vS8dkeG1hKp5mwbm37V83.jpg
83	\N	Walt Disney Pictures	{"Jodi Benson","Samuel E. Wright","Pat Carroll","Christopher Daniel Barnes"}	John Musker	https://image.tmdb.org/t/p/w500/8qddUnMT7CgIISEpZi7VCAwDiei.jpg
84	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Rupert Grint","Emma Watson","Richard Harris"}	Chris Columbus	https://image.tmdb.org/t/p/w500/wuMc08IPKEatf9rnMNXvIDxqP4W.jpg
85	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Rupert Grint","Emma Watson","Kenneth Branagh"}	Chris Columbus	https://image.tmdb.org/t/p/w500/sdEOH0992YZ0QSxgXNIGLq1ToUi.jpg
86	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Rupert Grint","Emma Watson","Robbie Coltrane"}	Alfonso Cuarón	https://image.tmdb.org/t/p/w500/aWxwnYoe8p2d2fcxOqtvAtJ72Rw.jpg
87	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Rupert Grint","Emma Watson","Brendan Gleeson"}	Mike Newell	https://image.tmdb.org/t/p/w500/fECBtHlr0RB3foNHDiCBXeg9Bv9.jpg
88	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Rupert Grint","Emma Watson","Imelda Staunton"}	David Yates	https://image.tmdb.org/t/p/w500/5aOyriWkPec0zUDxmHFP9qMmBaj.jpg
89	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Rupert Grint","Emma Watson","Jim Broadbent"}	David Yates	https://image.tmdb.org/t/p/w500/z7uo9zmQdQwU5ZJHFpv2Upl30i1.jpg
90	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Emma Watson","Rupert Grint","Toby Jones"}	David Yates	https://image.tmdb.org/t/p/w500/iGoXIpQb7Pot00EEdwpwPajheZ5.jpg
91	\N	Warner Bros. Pictures	{"Daniel Radcliffe","Emma Watson","Rupert Grint","Ralph Fiennes"}	David Yates	https://image.tmdb.org/t/p/w500/c54HpQmuwXjHq2C9wmoACjxoom3.jpg
92	\N	20th Century Studios	{"Cailee Spaeny","David Jonsson","Archie Renaux","Isabela Merced"}	Fede Álvarez	https://image.tmdb.org/t/p/w500/b33nnKl1GSFbao4l3fZDDqsMx0F.jpg
93	\N	Walt Disney Pictures	{"Kristen Bell","Idina Menzel","Jonathan Groff","Josh Gad"}	Jennifer Lee	https://image.tmdb.org/t/p/w500/kgwjIb2JDHRhNk13lmSxiClFjVk.jpg
94	\N	Dimension Films	{"David Arquette","Neve Campbell","Courteney Cox","Matthew Lillard"}	Wes Craven	https://image.tmdb.org/t/p/w500/aXAByjBN8UhaYvotqRCwa5MsMGu.jpg
95	\N	Lionsgate	{"Christian Bale","Justin Theroux","Josh Lucas","Bill Sage"}	Mary Harron	https://image.tmdb.org/t/p/w500/9uGHEgsiUXjCNq8wdq4r49YL8A1.jpg
96	\N	Lionsgate	{"Daniel Craig","Chris Evans","Ana de Armas","Jamie Lee Curtis"}	Rian Johnson	https://image.tmdb.org/t/p/w500/pThyQovXQrw2m0s9x82twj48Jq4.jpg
97	\N	87Eleven	{"Keanu Reeves","Michael Nyqvist","Alfie Allen","Willem Dafoe"}	Chad Stahelski	https://image.tmdb.org/t/p/w500/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg
98	\N	New Line Cinema	{"Morgan Freeman","Brad Pitt","Gwyneth Paltrow","John Cassini"}	David Fincher	https://image.tmdb.org/t/p/w500/191nKfP0ehp3uIvWqgPbFmI4lv9.jpg
99	\N	Alcon Entertainment	{"Hugh Jackman","Jake Gyllenhaal","Viola Davis","Maria Bello"}	Denis Villeneuve	https://image.tmdb.org/t/p/w500/uhviyknTT5cEQXbn6vWIqfM4vGm.jpg
100	\N	Walt Disney Pictures	{"Matthew Broderick","Moira Kelly","Nathan Lane","Ernie Sabella"}	Roger Allers	https://image.tmdb.org/t/p/w500/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg
101	\N	Metro-Goldwyn-Mayer	{"Judy Garland","Ray Bolger","Jack Haley","Bert Lahr"}	Victor Fleming	https://image.tmdb.org/t/p/w500/pfAZFD7I2hxW9HCChTuAzsdE6UX.jpg
102	\N	Fox Film Corporation	{"George O’Brien","Janet Gaynor","Margaret Livingston","Bodil Rosing"}	F. W. Murnau	https://image.tmdb.org/t/p/w500/oj8ZW8jKXBSs8F1e5iWsTUeXSJW.jpg
103	\N	20th Century Fox	{"Ryan Reynolds","Morena Baccarin","Ed Skrein","T.J. Miller"}	Tim Miller	https://image.tmdb.org/t/p/w500/3E53WEZJqP6aM84D8CckXx4pIHw.jpg
700	\N	Walt Disney Pictures	{"Auliʻi Cravalho","Dwayne Johnson","Hualālai Chung","Rose Matafeo"}	David G. Derrick Jr.	https://image.tmdb.org/t/p/w500/yh64qw9mgXBvlaWDi7Q9tpUBAvH.jpg
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.reviews ("userID", "mediaID", "ratingTxt", "ratingStar", review_id) FROM stdin;
27	455	Bad game	1	1
27	203	Drake is overrated	1	2
27	71	I am groot.	5	3
32	71	This is a test!	3	4
27	103	Funny superhero guy, also why is the game delisted	5	5
27	206	test	3	7
27	4	WHERES THE GIRL!	5	8
32	205	Good Songs.	4	9
27	53	batman cool	5	10
27	336	loded diper	5	11
32	219	Great Stuff!	4	15
2	219		4	17
32	214	Classic!	4	18
32	67	This is a test for a longer review to see how it would display on various pages.	4	19
32	264	"This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages.""This is a test for a longer review to see how it would display on various pages."	4	20
2	20	best one out of the three	5	21
33	24	ETTTTTT PHONE HOME. This movie kinda scary, but I like ET he a cool dude	4	22
32	28	Extremely Underrated Sequel with and epic soundtrack	4	23
2	28	this was actually a heat movie\n	5	24
26	256	good mcdonalds meal	5	25
2	24	a classic	5	26
32	404	An uncompromised masterpiece in adventure story-telling. Highly recommended. 	5	27
32	206	Haven't listened to this one before.	2	28
2	12	pretty good	4	29
2	312	mid	3	32
2	431	when is gta6 comming out?	5	33
27	299	Best dave mustaine vocals	5	34
27	281	Best thrash album OAT	5	35
27	282	Watch him become a gawd	5	36
27	284	Rip cliff burton	5	37
27	285	Short hair metallica is lame	1	38
27	15	It was cool but was definitely too long	3	39
32	15	Jack is wrong	5	40
2	208	This is actually an amazing song. so good that I'm taking the time out of my day to review this	5	41
26	324	Like Homer's Odyssey but actually good	5	42
27	468	Pay mick gordon.	5	43
27	95	Let's see paul allen's review site	5	44
26	251	Loses a star because he hates his fans 	4	45
41	284	OH MY GOD THIS IS CRAZY STUFF!!! RIP Cliff Burton btw	5	47
32	3	Great!	5	48
41	20	The delorean is very cool!	3	49
42	405	Excellent!	5	50
42	404	Great Finale	5	51
43	59	haven't seen it	3	52
33	84	Favorite Harry Potter Movie. You're a Wizard Harry! IM A WHOT???	5	53
32	30	The greatest Spider-Man movie of all time.	5	54
32	333	Great Finale	5	56
44	3	A must watch!	5	58
32	423	Better than the show	5	59
32	22	The best film in the franchise.	5	61
27	494	Very hard but super smooth gameplay and cool bosses	5	62
27	262	Before kanye lost his mind	5	63
32	40	Great	5	64
33	93	LET IT LET IT GOOOOOO. I love this movie, it is the best Disney movie of all time. My Goat	4	65
32	49		5	66
32	2	This started it all	5	67
27	280	"WHERE'S RIDE THE LIGHTNING?!?!" -Kirk Hammett	5	68
33	32	I love sponge. Spongebob is super cool and I like the patty mobile.	5	69
26	254	Noah Kahan's Aunt was my spanish teacher in highschool	5	70
27	329	Classic summer reading choice	5	71
27	452	I used to be an adventurer like you... and then I took an arrow to the knee.	5	72
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public.users ("userID", email, password, username, "profilePicture", description) FROM stdin;
3	test2@email.com	5678	testUser2	\N	\N
18	something@gmail.com	4321	testUser3	\N	\N
19	something@gmail.com	8765	testUser4	\N	\N
20	something@gmail.com	1234	testUser5	\N	\N
21	something@gmail.com	1234	LastTest??	\N	\N
22	something@gmail.com	1234	okActuallyLastTest	\N	\N
23	something@gmail.com	1234	bru	\N	\N
24	something@gmail.com	1234	some	\N	\N
25	something@gmail.com	1234	s	\N	\N
26	max@gmail.com	1234	max	\N	\N
28	something@gmail.com	lil123	Lilly	\N	\N
29	something@gmail.com	1234	sessionTest	\N	\N
30	something@gmail.com	1234	finaltest	\N	\N
31	attigus.furganic1@marist.edu	stinker	Atticus	\N	\N
34	something@gmail.com	1234	Aidan	\N	\N
35	something@gmail.com	1234	last	\N	\N
36	something@gmail.com	1234	userSesh	\N	\N
37	something@gmail.com	1234	work?	\N	\N
38	something@gmail.com	1234	atest	\N	\N
33	sd148779@gmail.com	wow	Andrew_Luvs_Media	\\xffd8ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc00011080096009603012200021101031101ffc4001c0000010501010100000000000000000000060003040507080201ffc40040100002010302040501060403060701000001020300041105210612314107132251617114328191a1c1234252b124d1f015333462a2c2166372738292e1f1ffc400190100030101010000000000000000000000020304010500ffc4002a11000202020202010402010500000000000001021103211231044122132332510514816171b1c1f0ffda000c03010002110311003f00e65d2939ee914f75345366b332e1667500f41433a53797708d8cfa7183f5a33b34125afda6dd5847cc7994efc87ebdc7cd4f95d32cc18a4d72f449b5b69d8ffc5cc3ff0049ab8b5b095badfde7e12628725d7a1b494c4aa64902e720ed9f6a25d0b528751b62f01e5607054f553f340ad14478bd17361a74d0c334b6f733c922632b2be41539047e5fdab25b3b74bfbcd56689da2659bcd8f00742cddbf2adeb8721f392f33bf2c59fd0d603a2c727fb41ca2931e7d7ff005628a1db25c8bee1221d36fe77e786dddce7ca3e5c59c9c0ec07b77a24d1f82ae9ae216d5d65b1b690731664fe201d888db19cfc9ad77c13d2ed9f44bdbd9c94912f0282a0127f87edefb50bf19dfdf45ae5fcba9cb34f711b7282e376403d3f8631d2a5c99e76e2914e3c506f64eb1d3ac21d3e2b42c648631f74b72f39fea6c7734ec56da15b1cc7656425f7f2c313f3d09acdadefeef532f348d2450a920203edefee688b4420ba8f22653ff3a915166c3916e523a7e3cf14dd2418c773a7ac784b4b7419c9260007f6af33cfa74ea15a18083b0e78863f514c35adec918f2a38d797b1155efa75ec920ded6541f7a319c91f5a8f85fb2e94547490e5e699a74d1720b5458c9c931ec33d7a74a37f0ceca0d6b886ead7545b6b8b796d19238e4807a597ee95df63b9e959b4905c5a7126976d6eaec978c63f29739e6ed8c56dbc1da5a6802ef58d4e1bf13db2f95e5c16edcc85ba9c91bedec2abc38a5ca2ded1cbf2f24146514a982de15f04dbaf106a89ab5b457b13da4a2312c23955b3d47cd78f08787a2b6838aed6f6cc5c3b59178ccf0825701861491b1dc7e55b9e8eb633cf2dcda24ab38542ead9f4870186074dc547860d3ec2e2f8dac661b8f315246c97272036003d06f5d086271a6dfece5cb2a76abf473c7855a1c0dc21c6f0dddb092e7ec21a179a30cc9e97dd723639c74a0dd33c3e875be16d77569259e0b9d390cde5ac40ac808277dc72f43d077aeac11e9fa74f78d6d6b0c32cf73e4bab313e6ae0124293803d4761b553dddf693a15bcf159a5859c8f72639223bf98abb6483f5fa57b838d5c8d7914ae91c7cfc092b5a5bcf717b05ab4e82548d83c8c50e70c42a9e5ce0e32734ab4de3d3651ebd2c603cb6ebfeea356e58d01c9c05e9df19f614a83fb391741ac307b6619a04713ea110b82794729e51fcc33443a8eb0e1d6c3472002083220e9ee07c7cd0ddb248cea917df609f9019a25d32cd2dadc63d4e7ef3559349bb62f1e49463c63a062352b70e92302431049f8a23e15122ea71bc0e4119e7507671ec6aa75c8920bf05472f98bcc40f7a24e0db254c5d124b3657aec056beacc4eb46cdc069e643aa7521601b9fa3561bc38bcb25d1c7f47e1b3d6efe19faedf595236f2177ffed583e992880dce7b941fa3ff009d2e3a6cf2f9647ffbd1b5f869a84f67a18b58511bed33c921ca8f4f2281b1fa1a9fc5d07fe205b786f02b5c41098e396350acc8bee76c818277aa4f0fe2b4bae198669ef5a1963ba951200bb4a0f293939dba74c77ad3b41d0f429ac4cf7725f48190a1cc43917704f29cfd3f21517cde5a5d7fbffd033f331c67f4dae8e7e8f4ff00f65de5cdb44acc88c2540e00243283f3522c751b88e5679d0f2000851df2771f18eb46de2369b6167ae431d84b3c91b5ba826540a460903a75dbbd085cd93fd95d9e6e445c0cb0cec4feb4dce93ae474bc193947941e8b6b3e239afac248bcae52760c0f6a8ba769d343e6dc4eec8dccac1cbeea3f9874f567b7b531a6dc58c1a75cbb4d28b847e5504aa96c1eb9ec3bf4a22d356df533cc8c495fa67ea4541917d36f8ad1d5c6d6549c9ecf0f76b69ace8faa12d08b4ba8a4e7c6e14b056ffa49adf38ab52b5d4b8570ca65b59e3ce390f2be181d875db158e49a426a30cc921f4dac0f75b0ebe50e7c7e38c7e35d052d8589b4b522dc5ba60b2ac7b04e619c6c3e6acf0d4a50d74717f92708e4df6572c4d73c356296a92e122411a43e9279460861b6dd2ab1b4fd49a4b74b49d6dddf790c9fef1ca80017c6c700607c75a27b05b549268e3465037f513ca7dc8dbe99af10955d66e5a49015f2d027a0803af4ab258dcd6d9cdfa95e813e24d3ae2cadbed370e2e6e7ed066594008172a0637fa5669afccc350b969621ce64e5fbfb630a7b753f35b56a9e45edff0025c5b349142b95662c0331f603fbd066aa34a6bd964bae1f5619043cbe60e738033b76dbdaa4c9e25cdca2ebfcb09797182a918871958c8757652a11b943639b6dc7bd2a37e25d7e1975676b4e0fd3ee881cbe64cf286206dd0374a558b1a4aacdfeec5f48e6ad357fc53fb8441ff48abe8b651daa9ec1717771f1ca3f4ab85c7a76ab641c7b06b5e939f54703a2284fdff7a2ee127ce989f06822edfcebc9a473d58e3f6a2de10907d95d41dc1e946d69189ecdb3c2d606db59393bc49ff75602c794c98f7fdcd6efe18be2cb5a3ff969ff007560b2eccc490a09db3b64ef4a5db317e4cd638078874ed17812efed6b70d7af712ac051808f75190e3b83b56b1c23c6fa75c707092d6c637bdb58659992724249cb9240603aed5cc96d74a346fb232bb813f3f329c6e4631fa75a214e218b4ed2ac6cce9892882365cc8e4f3166ce4903b74a4ca324ee21ce1192bad9a87117134bc71c282f5f48b5d38d9dc000c658bb295df723a6e0fe159fead04d716f0202e1239332721c13b6d422ba86b5a9493a5b4c407d96ceddd91700e73ca4fa88fa9f7a34d06f5afb4d537000b94f4c807723bd0e54d54995788f4f1b5442b4b2d3e3675b882db38e93ce49f9c8037a2cd0b478adb508ef6009106888e588108e0f4d8ff7a8e9a0a6a37d05ccc5472f53dc63a1ab8d6754b3d16d0cd773a0441fe80f7350659b93a8becebe3518ab924a8afe2de273a2b2d95a98cc9788d0dc175ce2038e6c7c9e95b3bf16ea834d86f1752d2e3b3914323a5b96014e307ef74c571e6adac49ac6af2dec8300eeaa7f957b0fdeac746e31bdd2a08edcbb5cd9a9c181e56098ee300f43ec6ba18b04a10514e8e179597eae47289d5bc15c777b792dfaeb17303b4374f02c6b108fd20021b2327dfad5bf10718292d6da5ce22939431b8e4e7c0f6008ae6b878eaef515923b9be8becb21127232ac6518770463f43bf7abbb6b6b8d46d1ee6daeeceea27018c50dd07954677f4e7a8f6aa73c5637c633b4431e72dd5069c43c73aed8273da6b17b7acac7cc8e0853f86a3f98e10ec4e0567cfe20714371459c1aceb776b652dc2a4d18540c148e9b2edda8b75086df4ed1944768f14aca2377741e6b60e413b1ec06d9c500dcdb46fafc096d172cd701b2f1f2a3ec0f4c83cbf50335ce8e46db8db2d8e34d2b452eafe247145b6a9756b6dac5d40b148cbb2a293838eca3f5a555fe24e94f61776ac49e69b9d8a994c841c8ee40a556e28c6504c19d464d2076c7fe32f3ff00708feffe55684e177e8066aaf4e3cd35cb7f5487fb9a7b5694a59360950eca848ec09de98f6c15a285cb5d4f24a233ea39c28cd1370a95109c46509d8b76622ae2c6248628d6084018dd86001fe7505a686df5cb8b78394a3856217a2b8ce4fe23ad62c9c9d506f1f15766a9e1f832689c4281de22f0aa875d8aecdb8ac8f50b181e432472a4c3a8656d867dfda8be2e2b1c39c377f1c2aaf7b78cb1c618fdc5e539723bf5007c9a1bf0ab40978b78ce3d3c1758e48dde62bd0606067f122b38bb72022e9b4c6b47e45be4791731a6ea3380cd4fea6d7b2cc041112ac70a48c2ff00fca241c2b15b712eaba6348eed6370602fd39b1fd357771676ba542d218c4abcea18b6e4d4d3cf18cabd96430b946df400ae95730dd2f9d730bdcaff0013cb1942806fcc31bed45b760c725a6a3008dd27848b955db32ae327ea54e7f3a87ac3c31df2dc5bcf03221e7c88d438dba16c66a269d72d756b716ef98a3bcdd181cf96e3214fd08241ad6f9a323f0768b2b8e2392de22216317c3286359f6b1a94dabdfb4975219113ee82dd4d4ee24ff08c96acae2503d4327a7bfe35425c460b637ed9a6e2c3186e285e6f227934d9f6493cb381d0f5c530aec50f40a0ff002f4a9f6af25ddacd6d63a7cb72c57cc99f1cc571fcc31f740f7a7ed38675cbbd2e5bd874abb3631a190cde5e1480324e7bed4f728c7f2744fdf4448324e772b4fdbb3bcc046c507f503d2a3ae5211eec71536c808d03b3728cfdefd85633c8d5bc3e8b5ed6e16d3ac3ccbd3cbe622cd216e50bb1c1276ebd28cad3c34e269b58b5bcb8b08a2f28ee7cde5c8c7e3403e1af18b70bea0b756caac794a1126f907e3b568979e2f6b72314429167a72458dbb1dc548e38e2dca4862736aa2c5c53e16bebcf01bdd46cec9e1c8e5e5964ce71df940edda9542b9e32d1f508cb7146b7ad35c73028b6ccc1546f918200f6dc66950ac94be2b40bc726f7239db4739495bfe73532fa2f36d268f192cbb0f9ed50b421fe158fbb9fdaa7ddc861b49a45fbcaa48ab5f60a28e1d5efe18d624b87555d86db8fc69db6b936d1493e7fc43fdd63fa9a66685628d59a40f2b8e72a3a2e7dcfbd4492669090dfa74a3497a3cdbf65cd8e99ab7104ccf676b3dc8e85fa28fc4ed5d0fe06709c7c3129bb91c9be9caa3b1390a064903f4c9a1ff0bb48ba8f876c12e6168d9bd4411b85276cfe1dbe95b1e9d602cedc040081eac8af4da8c428c7d811c71c3b269bc6179ac88d8596a2558ba2921650304123a6719c9f7354ba8fd96e2da5fb41e58d473673f85742e9314834f8fce0199864823355bc45c33a5eb766f6f7b6d0a73edcf1a857fcc573b378dce5cd32bc5e4f05c5a392b892d6d5a3964d3e50dce3043d45f0f5edceb862b86739180ae0b0f903046f8f91deb4ee30f0ca2d1afe259f5ab482ca76e5864991b995fb2b11b63e76aaad2380350d36ee3ba9047346c098dad9d5c1f7dc5357c6342dfce560371a5dc7a8ea52da18f9521256194a10508ed9fe93ec7a6686b86f473acf12d8e933ca6d96e25f2d9f192bb12703b9db03e68eb8b65b5b7927b96b98a29e3259608e605a473b0e65538db73bd03691752e9faa5b6a5137f1e0956542db8c839de9b16dc1f11334948e8bd2f87edb4648348d0a04b789b06672bce71fd4ec06589ec2a36a5aed9c7a3dc4d01bb8a38a378d9e54e54947291d0f5acda7f16f5e31ba46b631963969122218febedb63da87752e37d6b55856defafcc96e011c8224191f271f35c98ff1f966ef27eff633ea45740cab0e4872360bbe3f0a77cdc3f3120b0d867a2fc015e2761e62f96aaa141c0029856e5c67393d0576c9cb9b7bb200d8b0fcaac351d50fd96277f35d1544642bfddc74fce86c4a476a9097424b79ad99f904ab80c7f9483907f30285c13094aba3c6a77570044c639a28cafa79fbff00a14aa3eab16b32c56ef3417ac02e036ee0fb631d295145468c7277d137435c590f96352b5151f62973d08c7eb5f3418f9ada353d32dfdcd4bd6a1e4b31ca362db9f6acf67902ae091d703f21457e1ef0b0d5f528aeee9435842c1b97a89483d3e99af7c3ba32ce3cc7581d01f5330e62bff280761f26b75f0f34389ac627318546dc003000ec051392412c77b65f68c4c4cab1c5ccaa06491deb43d1e28e783d71053ec0d575a58c11c622895860fa8e064d59492b4253c98b248c03b67f2a4397b631af48b6819980c8c7d6bc5cb087d6c3e05370dc30839e5465c7734c5ecd1c889234e813aae7f6ad6f42d2d998f8dd6f35c70d4b2326791d5f39c6003dab98ee2f276ba9009e508e3750c7047be2ba6bc67d4e38385ef833e51a2f2576eace4015cc9245891dc9f4f4fc2861ec29101e30cce4e463afec2bc3b1f6d8d392b647a76c9a68ae7af5a700476dc9209cfbe6bea2f330ee7aef5edc7c002bd42096caf6adb04f72c61012c77efbd30be952c7daa534324d18d81df7af3a85a35ac71f9a305c16033b903f6ac4cf1592c9d4e4fe74cace509c2afe55f5fd4d850735e361fd39fad3016c2fe13d774e8ade4b7d624ba10ae1a358c8001efbd2a158c10766c123a119a549978f193b1b1cb24a827e1b8a79a38bca11853900b13feb152f889e48b4ab849557ce8dc2fa4e436dd45065a5df93908ad9237dcfec6a70d4fcc89a268f915db999941273ef8345c64999716b5d9a070ab8baf2ade1d9a721c64f5c81923e36ae85e12b29ace188161c800db15cede178ba6e20b32612f6316c2627a75dbe773d3b574b3de2dad83be4fa10b918df619a464b8d9445f2491e35be2fb6b08645b106edc673c9b007db34f70cebb06a16c92cfa8f9570df7a29c88ca9f602b2cb49a709fc7492272dcdba9c6e73dbeb5385d233da3c5225d34aa708b1b1e560c463718276cd47f527765ef062e2959b9f96d2c6a65959d3ae17186f6dfb8a8b33c4f2aa3954db6f4838ff002ae6ae2cf11b50d35e5b3d2aee586546e56c7dd5f7efd7fb555f01f8a3ab697afb36af7336a16370c3cd88eecbd073a7c8ee3b8155454a51ba209a8c2549d9d01e246969adf0e5ddb481260d1901b1b83d8fe15c7b772dcc57b2d8ddaf249131490637c8ff0059aecfb2beb2d534a1a8699731ddd938ff007b19c807d88ec7e0d635e39f00a41a79e2ab28c2796556e147f329380df81fef458e54e981356ad18af2f33edd2bd3460f4af1cf9c9c8de91941e9d69c28f0f0ec59b61fde9eb48b23d400cd35ce4ae303989cee2ac2c61fbaf2f53d05637a3c1070d69f0c973199d0b479dc7bd79f126d6d84715c2661b97c22205c7a4139dbe36dfe6af3872f6ef4f85dec63b17f3319371ca48c7b646d54de26ddde6a10d84da8a59abc5cd1a0b723a1df703b7f9d262ee679e375c8ce24030492029f9c669ae40e84ff000f1d314f32976c73be7f4a489c99e9f51d3f2ab0067c89258d7f85b8f6d9852a75915db04729ebd7e695659854aa483a328ffe5536c6ceeee6ea1822239e5754039bdce2bec30471619c1cf72dfb514702db9bbe24b04b74055278da423b2f30dcd6b91e8c7f66fda1687068da2db5adba0f4054cf7273b9fa9a30e2281870d5f4d82a150124f5c645336100b8bf8238c73088f39c7427b0fde89b88a1034a48a43b3b05200dbdcff6a972ecae1aa335d32fa18a250b23163b03d07e1549e235f5c691a609ade355598bf34aae49576f8f9c51949a6da46a1218558c8e376dcfe159078b1aa4f36aa74f2716d6ebb0c6ecc7b9a4c55b19924aad19b5d3b4accf212cc773ef52f4336515c2cba8a4925bbfa5c47f7b18e9dbbe2a3841ca5b9738f7ef4dc6e7299dcf31247b8aafd1204ba07155d6817626d1ee2ea18fcd1cf073e639533f7587738db35d61c61a68d7fc35d52d44589eeec4b22760fcb951f9e2b8c2652193cb18cb06dfdfb7e15dcfc345aef862c9e764f35a052c33b67009a5cb4f4127ad9c1a99030e30c3620f5cfb57b00100018357fc756474ee36d7ad390058ef25e5037182c48fd0d55595a3de5dc704207339ea7a01dc9a3bf60d36e90cc28aafccf83819c55ad824d3b0648d9f27f946c2a63585b59b6797cd20639dfe3d8513e8701974a924910641249c6c07b52a7935a2ac7e337db24f0deb0ba3e9adfe1566ba05880c8186fd067f6aa1e2ad5e5e21bafb4eb5a7c72c8aa510292ab18c8e805392c8ab272aec7a6c2a725a8b8b776972397a13d694b270d8cfebf2d20567e1db3bdb59eeb472f0889957c999b7627bafc50d5c5abc13149579181c107a8ad3f49b96d2ae50bcb70ba7f9aa6e120452cd823948e6f9c6dd3bf6af9c7bc2b2c76eb7a2ceea152a086b850a5b6e6236f60411471f237be854fc7d7fa99614e43cbcaacbd8374a5531621d31d3da9553c89281feb804f6146de1e6a7069da8db4423669269d49e5f8d80140aa706ae3863501a6f1069d78cdcab04e92138ce003bed4c974641ecee2e19d363b6b482499184edeb27271b8acdbc79e3f9344d42df45d3c7f17c9f3a47ce39492428fd0d17ea9c5d65a57084babbdfc2c891095795b790b74503f115cabc61c4375c73c6335ec71e64b9758a0887651b28a962b99437c4df3c39d4e6bad06c679dfcee5841677ea4f7cd62dc59aa0d538a355b85c18cce5108e985da8df8af517e0df0f6c34cb1daf2e63f2cc9fd200f530fcf6ac891822228392064d7b1c7d9ec92f44a99d7c9c03be77a8f1ec8b91d3e7eb4df99eae6322a8193ea3b1c6e47d7dbe6a52db3190c45917d2189720019dff7a6f4851ed7964419deb52f0ebc549787a05b3d52392eed228cac60374cec327b6db564d2c2d6c4733c4cad90391c3631f4a666246594f5eb40e2a46a9345b718eb075ce28d4b5454118ba98c814741d055b6856335ad9898c6de75c28e53fd2bff00ed0746ad9ea339e95aa5a4e2ff008774e9218f0cb105720f75f49dbea28334b8452455e1c1649bbec17d52399139067cde6e5c0df06af62d62292ce5b5b5388628d49f7663ef4c4c6eedb50b95b7b58da4921c79f26731641195f9c6773d2ab92c4e9da6cca5409259772076036fee6929a92d96b4e0f44ed2499277664e700641ee28dafed238f458703124a4301df1437c2621b5492eae862de24323fb9c761f27a7e3575a1de0e23ba94c7ca08620a8e8801c637ec3a66a7cd6ddae90dc3c52a6f65249cade6c320ea003f22aede678fc3cbab89ec32b651956bb92f79cb9240cf2139ce302aeb52e1fb182ca599e4ccb8c2803ad057126a76b63e1a6b36d2a581bcbab98ede332c4cd2e3a92a7ee8c007735b86b24b889f27edc79af466525f7956b1c91c4640c76c7b52aaeb6bdf259d1d54a64950474a55d5e15e8e2ddfb204643bef9a976d1234a80824160307eb4a953183036af11ed574ee1084ae1a4b991109236509f740f6d8502700e9f1cbc6961cbe952ad3601e840c52a5532d45954bf245e78bb7f25c710dadbb93cb140b81db7277fc8503c9f7d80d8601a54ab71fe280c9f9310512041ee475ab4e210a6fe6403055b1f9002952ad7da03d1487d241ef4fe4b4447e34a95198474762d8cee6b77f06387c6abc2d1dcc92008b3ca8548c93b8a54aa6f2bf0ff00259e0b6b25afd13a43657bc49afe9305b98e4d35117cd6fe73dff0c918aa0d5f47cdb8cc8094249c8d8d2a55cf97c25f13b185bc8be5beff00e4b0d1b4837305ad9aba896f258edc311e9cb9c02db6e338d86f8ef5713f0d597056b508579246781c4817a0657652074f4e54919f7f7a54aaa4becb673f237fd951f47df34ea4b23bfa61400851d77ac8bc5980c5690b4723792d3f31427bf2900e3dfad2a553f88fef21fe6afb3200ed6d56ed7998e3bfe34a952aebca4d338548ffd9	Harry Potter Expert
32	Rashan@email.com	123456	Rashan	\\xffd8ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc00011080096009603012200021101031101ffc4001d000001040301010000000000000000000003000204060105070908ffc40039100001030303020305060504030000000001000203041121051231064113516122718191a10714233242c1153352b1d16272e1f0164353ffc400190100020301000000000000000000000000020300010405ffc400271100020201040201040301000000000000000102110304122131134151142223b161a1d1f0ffda000c03010002110311003f00f98dc4f0b00a716e16005122988353c049a0a7850a1cc08cc6dd319652621e8a8b42231858da510fb96005111b135a139adb94e013da1103620d456b526b7214863159428d8a4471dc85986324e05ca970b321124466fba4b4d359a8c11016def0dbfa773f2568eadac15da898e33f86088983c9a3fe841e8a87ee7a756ea2f1fca6787193fd6eff008ba0e9509acd59a0dc9e3e2521f326fe0d29edc6a2bb91d2fecbf4d6d1d05456c8db177b231d864fec1750d0e90bdcc6c83da3edbfde727f61f05a0d2e8d94b4b4948d186805f6ef6c9fad95db428acc748ee49b7f95992df235e4fc78e91b5600059259496c301e6196909008ee65bd56362b041809c1a88184a23632a8a18c1652617b45f70bf92106db94f68f352889843ed15902cb2edbcb703c96470a2231651582e13004560c220424632a54610236a97135592c346dc85b0a38aee6e2e4a89135593a5684d76ad4d0017dce015b748896e745ab558ff8674a69f4a30f9819dff1e3e807cd49fb36a2fbc6b103a41804cae3e8107ed0e569d54411fe58da18d1e8303e9656bfb32a511c3512dbda2d1183ef2b2dfe3bf936a8de651f83a2d05df532bcfe901a0fafe63fb2bc69d1f87491b6ddaeaa1a1c5e2b598fe638bbe04e3fb2bbb059a8302b761eae5cd09c92c38d925a0c879bb434714fa755cd24e19242cdcd61e5e77345bd3049f82da7d9e74eff00e49d4269a62ffbb4713a49034d8ff4b403fee70f8029523f4a8746a9a4aed3992d638b9d156324789186d816bed22e05efd894dd0e7834fa5a8962acaea6d42df86627011bbd1c2d737e39089a7c97c3236b3a7c3a7ead534905478f144fd8d90b7693f0b9c8e394114eeb5d4dd2b47afd6ab898e39aa1c4ee9646b4bb6dcf25748ebbd0b43a1a4d3e0d222959591c21b577712d2f00673dce6e11257c205c6959c99d15b9086e658e16daaa9f6388b284e6672a3408060b8ca206fa241a88d6e10906808ad19586b115adcab4058f8c594c8420462ca4c6ad12c950f65d17ecae9c1d67ef0e1ecc2d73efee04ae7908c85d2fa21df74d0abe718718dc01f88ff28333a8703b4caf25b35babcdf7eea071e419001ee5d4fa260f0b4926d625e4dfdcd25729d159e3eabbce7375de7a5e803742a425bf9daf71f8e167cdc2dabd1b34bcc9cdfb2d9a052ec8e2c58358d1f4bfeeac205828945108db8f4fec14c47895233e696e9580a836b24995678491b011e6ebaadaf21b234b1de7c8f929aea69a9a4689e27c65cd6bdbb9a46e6917045fb104150e8670ea9a58c5143525b25c8797832036f65d670000b5ee2c7392ae5a8c246874d2fddaa29ea2bc876c9e2018d819711889e736ce719b0cf3773953a0546d706f7a26b2671a610450c13c6eb09e067872381ece70b6175b87a2e96a9c23a9dce33432588381276b1be5701d1ea9d48e2d7076e381639bae93a875c546974d474d410c549530c7f8976ef9239320dc9c679c79d96c8648c71ed8f0d8a9425292937c239debd49e054c8c2d20b491c2ae4c32b73a9553aa257bde6ee71249f35a896d7596757c0604045636e8605ce11e316394a64465ac4e03da4568c5d62d90a229a1ec0a4c6de10a36dd4d8598cabb2a8253b7da6fbd740a379a5e982ce0c83f7ff854ed3a1f11ed1ce5747a5d3cd46930c64124b9a3e1724a4e69a5566ad3e36eda21f48d16ea82f70b8bd97d1ba15186e8f42cd98110bfc6cb98f4fe8629a8a13e19defc9f9aed14517834b0c7fd2c0dfa2429795b1d35e282483462c112d84c6f29fd96a5d19190ebb81ef493ab1a5c05bcd242fb0d7479e3d33572689ab475f4ac8a4998c7b1a266ee68dcd2d26de601365bdd42b6a35a9f4e8e264ae753d2c347146d25c4ec686e07a917b7aad3ea73e91155c634a15b2c0402e336d638605c0b5ff56ecf95bd6f70d23eeae9a16684eab822a88c3669ea5803986f6706b876cb6f6cf6e16bc50f24a92e58a93daadb34dace83aae9ae02ba8a585ee6ef2d70b58799f92b3fd97d1c35dfc62ab5e026d234fa3738c729c190fe50dee0e0f04765b6d43a66869f4daba2a97c5fc40ee9a92ac4b89434663209c5c5c8ee4ae632cae61735ae201e403ca2cb85e3fb5921994d292e5019dd975bcd443928d21080e765264c11379468c136416a91172103220ede2c52b653912265ce5445b05354b6918d2e69739dc05be8e8a71a5d0d7be32da7ac6b9d11f3dae2d3f2216b2a74e6d635a092d7378202b0d089ce9b45432485f052b5cd8c11c6e7171fa942d86a364de9ea5df31c5ecdbfc5765d234ef0c41096e5ac048f52d03fcaaffd9ef4eb6781d512b30e21a090ba769348d9f557cad6d9a5c2c3d02e767c9ba548eae0878e16cdcd1e9b19aca767023031dac159eca152461b50e7dbb594dbad58e2a28e7e4936c43929e4a605929e2983978092cbf36490d869f079b35933a7ab74bb6dbb361d9762eaeea2a393a5ba57eef5f14ba8b2998e9e38ddb9ccbc6cbef3c6edcd26dc8bae39139496388e0a7c24e0d497a14fee4d32cdaaeb53ea123a4a995f2c8ee5ce372b492bee500487b9582eba3c996591dc808c545521ef76e37b003c8219c9582eec904a610f8f952e21851e31c29519f242d969068cd8e45d4ca68b71e147822713c2dee9f44f25b669ca093a0e11b1f494c49160adfd33a14ba8d53226b4faa93a0f4f3ea24119c136e459772e91e9b834da4639b10f15c30e3fdd65c99bd47b36431282b90ed334b6d0e9d1d3b00326d0cc79916562d3e9194ed240176e132187697cc3804b63bf73e6b674509653b5affcddd231636e4899b3714363f65a0772511b7b651835a380b0e0385b76f566572b10375824decb205b8594c5c82343524eba4ae912d9e69330119ae082139a890b0e1cb3b894c088d175644200a331b84d6b51d809b6061536109a2e4594da78ae40b2cd353991c0342b2687a24d5d3b638632e77a25ce6a2b91b0c4e6e900a1a33ec585cbb2ba8f40f4bd5d6cc1e1bb636fe62e18b7b96efa43a0e38fc29ab403b6dec8185d4e8284b2211c11ec8c760327deb9b3d5ef7b71ab3a11d3ac4ae4cd6e95a15053cad219e24a2d7f78f356d8a273c86f008edd82c50d1c74ccbb80dca532f977174dc58a495e4eccf972a6ea260d8ced8c5835b952c10a2358038baeb12d6414e3f11e2fe4394e5251b6ccee3bb844a7177609a4ed1771f9ad4cbab8792d81a49f75d467544af77e23c03e44dcfc903d446f8e43585fbe0dcbea9adc5fe4846b00e2d7502082494e490df3385321a489879dc7d4a28e49cba446a3108d99efcb45d246de061bb4249b4fe45dff00079b213c04c6146604e14398d476b535814b8217484068e546cb4ac6b1973c29f4746f95ed0d6924f60b77a468065da64049e4b47ee7b2bb697a1d3c25bec873ff00a476f79eeb2e5d44606dc1a39647c9aae9de93967d8e9ecc6f905d8fa33a76969b68634300197772b4fa4d0ccf2d019b1be7c2b0c85f48cdae70637cc9b2e2e7d44f2ca8ed470430c6a3d97ca5a7a58181cf91a0378175225d4218183c331341fd4f780a89435359e0f87481a6ff00adc38f75d181a6a7937d7d536a65b7e56924028a19e505b60a8c6f4db9dce565a7eff0ba40e7559948372d636e119fa9dac591927cdeeb5be0a9b3eb4410ca389ac6fad81ff2a055d7460b1d5552e91e7ff5c7803e29919cfdb07e9d3ffbfc2e75bab46d6fe3d7301ffe711fee5416d436abdb6fe51ddd803fefbd51a6d5cc2e73a969d91b8feb3ed3be656b6476a1a89b4b3bdc3d49b22efb1b1d35745fab75bd3695db67ac323872c80dfebc20c3d5718b8a0a30cff53bda2aad41a05ace9dc077bb96cc4da6505c3a5dee1d998fa9514eba0fc10e9f26e61d66be4989f10e7ccd95828ea2a0c5f88e39cdf80a807aae38770a4a761793879c908f4359aa6a6f1673dad3dd5a935ec09e9b77a48e93ec39809a931ffb79496a74ad027f0ff1c97e2fed9493e319356a3fb304a308baddfd1f03b02911b09c0ca5140eb8b85b2a3a704817bfb9749ca8c318b6629291d23800d24ab6695a6d352b4495af76f3f96360c9ff00087a6d3f86006900f9f92b0e934511983a4bb8f3b9c2e7e0164cb94e860d3fb365a3514b50d6ec6f8719370d07365d0347d2a18a2dd2bace190064ad0d2d5d3d141702d717cf2a0d5f52e0b20bfb81c95cd9a9e5748ea45282ee8be54ea74b491910583fbb89e1576b35912485c1e1cef3395598bef758ef12a1e2087fd454c66a3a769e2f1b5b5128fd4ee07c148e9d44b538c79fd9bf86a2baad80304a631dcfb2d089be1a717a9ab0e77f4446ff00555cfe29a86ab20646c95cd380d68b0f92d9c5a53a11beba56c3e879f9266c5029cdcfd9266d4f70db4b16d61ee53618e79c173f0071dbea9925769d48c3b1a6470fd4f360b5751d4ac7fb01c1c3c9980ad464fa40b94576cb00753d3b2f210e75b81c21bb576c6d1b031befc2a9cfafc0c0e1b5bb88c1bf0b4953ac8713e192737b9471d3c9f604f5508972afd6659aff008c40bfb82d3cfa8c4d0e3bcc8ef7e15566af74972f793f150e4ab03bfd53e3a733cb5df05a1dabcad76e63c340f2576e91eaf14c5a1f36f70e47985c61f564e01c275357c90ca1cd71c14c7a74d08fac77f7728faf342ead86a23b4ae160db820f292f9e344ea59238b049691c5f829205e58f0984e1827cf4728a483c6c1365b485ada6b068b91e69249d2ee8cf054acd9d1c9bf27e1daca59d61d4e3c28984bafc936092497b5374cd1bdc6368951be7a88c4d593bfc33c323c7d53ff88b60bb28a06c47bbcfb4e3f129248524db4324da4999a6f1aba6b492b9ce27971fd9582968a9280efa863aa641917c009248323a7482c6af961ebbaa66a488c74b13611e518dbf5e555eb35eab9e421cf2924998b1c6ae84e7c924e9335f3d6caf3f88f738fa9417d43b3923dc924b4a48c9293601d293e6b1badca4923a0403e43ea824dd24944031e5ecf03678637eebefbe6de4857202492b4030d0543e3bed3ca4924a9a22933fffd9	Film Enthusiast!
44	Rashan3@email	123456	Rashan3	\N	\N
27	jack@email.com	12345	Jack	\\xffd8ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc00011080096009603012200021101031101ffc4001d000002030003010100000000000000000000070506080103040902ffc400531000010303020305040506060d0d00000001020304050611000712213108134151611422718115324291a11623526272a22433637582b336374344479295b1b2c1c3c4d1173438535773769394b4d2e1e2ffc40014010100000000000000000000000000000000ffc40014110100000000000000000000000000000000ffda000c03010002110311003f00caa4104823046ae5b5f4345c153acc328ef24a68f31e8c8f153a86f8801eb807531635b8cee3d0ea14a88808bbe9cc9930d40e054194f2532afe513c8a55e20907900440ed95c6bb2770e8f58790b4a21c9e190820857767287063cf84ab979e82a67aeb8d3afb426d3bb6bd4dcb8edc6bda6d3a810fa16cfbc2295f3e13fa87394aba73c1e78ca534068d1a34068d1a34068d1a34068d1a34068d1a34068d1ae741df0223d3e747891505c9121c4b4da07552944003ef23539b8f4a8f43beebb4b8841661cc718491faa707f1074f8ecb1b4729ca9c6bd2e38cb662b1f9ca6b0e8c29d5f83c478247d9f33cfa0e680aa372ee3bd26220b2e499b509ee774da39a9c5adc3803e674107a34ccdc0a647db4762db9056c48b912da5fab4ce14b89694a194c76c10404804294ac65448e806346820b686bcbb6b72eddaa2565086a6210e9ce3f36b3c0bfdd51d313b5ad96ddb97f375882d06e15692a794123003e92039f7e52af8a8e91ada8a5614924287304781d6d4ed3b01baeec9d3ab2f238970de8b28a875e071210a1fbe3eed043f665dd0a5546d28f675d32996e633c51e209607772983d1bc9f74a93929e13d46319d7ab727b3351eb2ebb36cd949a3cb5654623a0aa328feafda6ff0011e406a9b48b668f6157aa3696e4535326c8ad3c1fa4d6540f030e11ee9ef0734129e10af548382939d3518b6b70ac46d2ab2ab0cdd9410014532aee70be8478069f1c8f2e99c0f4d0651bc7696f5b494b555285257153fdf51477ed11e7c49ce3fa406a88410718e7adf54cdeca1352d302f28352b4aa879775536486947f55d03047a9c0d58a7da762df31bdadfa5512aedb9fdf4ca50a51cff288e7f8e83e7168d6dfae7666b16a054aa7aaa74b5f8062477891f27013f8ea8558ec9f2124aa8d74b2b1e089710a3f792a3fe6d065dd7201270064eb45d1fb2a5c6ecd29ac5729516205638e3871e5a87a248481f33a6eb363d81b216acab8e442f6c9711238654be171f71c3f550d82385049f21c86493cb4192e3eda5c5f93caaed558668b4803dc935373b8ef4f806d182b593e1849d535d4a50e2928585a41c0500403ebcf5a7e4d8556dedaa4e995cb8d702a9198892a3c4ee7bc8edc692c87129427881042b89255cc9239ebcedf64ea9157e72ea8494f9a61ac9ff4868332eb9c6b5e50fb2951595a155bb8e7ccc73288ac21807e64a8e98706c6dafdb68e995221d1e0ad0322554dd4b8e93e692e13cff646831e589b4d785eaa42e934975b84afefd95f99640f30a3cd5fd1075a7f6bbb3a5bf6b3accfb8969aed510429285a3119a57a20fd73eaae5e8352d337a58aa3ca87b736f556ea963290f34d162220feb3aa1fea03d7521b23755c7732eea45da98accda754fd8c478a0776cf0a06520f32ae79e649d058e2ded42aaaee683489e97e6d090a4cc6d2923bb504aba6473c149191e2359dfb1f59ac2dda9df155402dc3e28f0cac720ae1e275c1f0490907d55a87b4eacba66f0eef80a210ed3eb0a23d50a2b07f03a75d1a9e9b37b30b8db690dbedd01d92bc0e7debad159fc578f9683135df5976e2ba2ab5890a25c9d25c7ce7c0294481f2181f2d1a893a3400ebf2d6eede200f6679f919c53219fde6b51db95b5167c2b6ea1765b74ba6c7954e8ae4cee7b90fc4968424a8a14de70320101482923d74c6aa50205f1b6edd226a5d874fa8c363891154029a4e10b0949208e5803a74d028bb3add30b7336f675937630898e53d84b5f9ce65e8dd10acf82d0401c5fb27ae75d7b2954a9d81ba159db5b86a9df529b6bbea4b929c032094f025049fb4957d51f69271e3abe6dbeca5bbb7d70aab1439b58724ad85c75224ba85214951079808073948f1d50b7bac7897befddad4b9135d81ed14a5ad6f3080a590d2d6a0064e01c679f3c79681adb93785ab6e7b1c1bde3abe8d9e1412fbf08bf18287d85900e144731cba03e5aa3b1606d5d7d89159b42b428eb6802ecba2553b80d67a71249c27e040d597792e6b2ed8b4d8837da3e9469e09ee60a93de3d2148c7bfd401cfaa89039fcb592f712e6b1ee1a329bb7ad3916d4e6d41d694dc8ef19928ce085a318071921433d08f1d035ae9dc07ec76de4d077845c0e3493c1064d3532ca88f02fa797cf3ab350f70f78deb6e9d5872c5a754a34c05484c752d97827970a9482a380aea0e3a0cf2c8ce4bb56a4ed2eb71a4c6a6c5a8cb4ac061894c9790564e07e6c11c4738c03919f0d7d02dbb76e68968aaa5b8f3a1a26a91dfb8d36d25a6e1b606485287538e64f41d074c90b1d124d41ca146935c8ad44a829aef1f8f1d65e4b67af083805440f21d7a675907b47566edbbeb94e667d2a4d1e80640669912661b7a42c9092ea9bcf1679f96120e339272dd4dd9b83b86baa54f6d1c834db7e190c4272a0c026a4e057beb0483c080338e5d791e79e15f54367f74abd7fc2b9ee37a95264b3259754112f01286d60f0213c380391e5e67d74167b567caa4597685fd01a5c83458aaa0dc319b195aa2b4b290e01e2a6c80bfd951e835f9dd5dd4add06fa80cc6b89102d1abc46a4c1a945a7b52f841185121441500799c73014391d5aedf4b5b7bbc53adc75c4b946bc54ed460b78c9624a7f8d42874e150e60fa01a5d768edb39945b65c936ec7326da664197ec8919552d6afe30b7fc82f91527eca802396741eeba65556df54756e85ed76bb489cacc5a95bfdd3511e411c412b0801685639e30411d09e7a9eb718d8b891855d8954da9be5c4214f545c725c82b51c272daf2473f1e1c6bdd1694ddd5d9423c69a02d68a1f7ad295cca56ca4941cff400f813ac84290f51ae1a13720e57251166018e89778569fdd2341bb7752ffa7ed7512972e45356fc2912c442dc6296fb94f0951504e307013d397c755decf92989f55dc5990dd4bb164dc2e3cd389e8b42921493f3046ab3db5bfb00a27f3aff00b2735d5d89ff00b0baff00f38a7faa4e811373d55348dd6dc475671dfaaa7100f32ea948ff005eb61eeaa528d91b8d29184a68ae003d3bbd61add9feda176ff3ac9feb55adff0072d0d5736df4ea221f11d55081ecc1e29e208e24019c78e3cb41f3571a35be6d7d89b02dda7a5a934966a6f900392aa278ca8fa279253f003e67468334f67eb89d8916f7a34a79e553a55bd35dee8b87bb42d0d93c5c3d325248ceb486e8ca9307b36ca910df7a3c96e970ca5d69650b49cb43911cc6b10d1eb2f52a1555a89ee3b3e3fb22dcf10d15052d23f6b8523e19f3d6d9de1ffa33d43f9ae1ff00a4d6814bd96ee9fca1ba9ca0dca9766be868cb872dc90ef7816820942bdfc2860e464781f03a6adceacf6a6b393e544907efef7fe1acf7d9306779e0fa4593fd59d683b9938ed5167ab1ccd0e40fc5dd02fbb57dbd53ba7726d2a45122ae54e910d61284f403bce6a51f048ea49e9ab0de74ab136bf6aa8144bc2991ae2aac74afd9238052e3cea9454b2950f792df12b1f772274cadd7bde85b75495d76a2d32ed5dd68c686c8c075fc1e2e0cf50804e547a0f5381a5f6ce6ded56bf5f3b91b960bd58918729f05d4e13151d52a293f5481f553e1f58fbc790496ceedca6116af0bb6954da5d41282b834c8cc25a669ad919e2578a9d23aa944948f23d171ba7b9ce6e3dd6d5b16e40abd52d28ce854d4529b25ea8149e99c7bad647227af5f2c5dee8ae4dde6ba6459969ca723da30943e9bab327fe71cff008868f88241e7e3827a0f7998e4483b7166062d4b6e4cb4b38435069e805c7567ed2d47f159c9f8f4d04c5a6a61cb629fec14c7e90c06025b83219ee971c0e410a4f8631e079f5f1d661bdf737792ca0b72e24d221b45e532c92cb44c8c1facda42b88a7183c58c0c8f1e5ab6cfdc3deb92d3cdd3f6e5a86a5e436e2d2a714d8f9ac027e231e9aa3c2d8ebf2f8aeaeb9b9b544d398238df75f790e3c1b1cf094a7dc6d2067a90075c1d073b77b8f3371774b6f9caf2594d629b2e5365c651c0979a7192a49c78149491ea08f5d69bb8aefa3d0ae0a2d12b2e861caca5d4c671c03bb5ad1c20b6a3e04f18c6791e9d719c7db5ca82e768ca2cca145533415545d8d055838536864a4733d4e0a547f6bd74c1edbdc936591c8832f9ff00e4e81f17653625176b6e083488e88d123d2a586596f9251f9a59c0f2193d3489dccdbc8f50db6b06e6a227e909d4a8d0624a7a1ad2e36e474000af97d6e05e4647404e790e4cdb627cbab7669f6ca83ee4996f5bf238dd59ca96434e0049f138039e94db41744bb32cf81745310f4db29f508d5c808f7d74b949c0321b1ff56b1c2a29fd6c79682d1db5bfb00a27f3affb2735d5d89c116657c1ebf48a7faa4eac1da26db9db95b774476ce2cd45a135b9214d2c1e369495238d3e78e2048eb807cb525b1301aa65737161c7484b2cd78a5000c607769d0675aaed4dc17e6e7dccfd2170134f3589489125d9481ecd87959e36f3c7d398c0c1f3eb8d837955dcb52c2ab55a3b6892ed3602de4216484aca11cb38f0e5af9ffbb0a23742eec12335594397fdeab5b9775ffb49dcbfccce7f57a0c7153dd89f5796b975fa5d3ebf31649cd54bae34c83f659650b4a1b1eb82a3e274696c3a9d1a0e3a1e7ade1bca8537d9aaa285a4a569a6440524608214d69046d287137f136f5b94d6ea6c50996d3998be060b8da0296fc850e8da56a2481d70123aeb40ded7d59173db953b5e45464d69d92cf72f8a1c27a570af910a494029e4a0081c47a63419c3b26646f3c1f58b27fab3a736f5dcf1ec8dedb7ae59ec3cec68b449084a509385b8a2e04238ba0c9239f80d5176e5b8bb75536aa8e58777cbabc46dc8ec4d66238c4692856405badad254dab07071c439679eae4d55e9d72d798ae5fafcfadc888ae3a7db549a4cb5c7615fa6b2b6d21d5faab091f0e81fada6b0ead7f5c69dc7dcc49716b2174ca6ad2421b40394a8a0f440ea949ea7de3eb64ed007706b100dbb62d0e4aa04847f0ea821f690a5a4f569014b040c7d63e3d3a673150b7b6eaafd525c6b4b6f1d9edc7421c3ded450870a14484af00630784f427a75d7b9cdc7dd069b5baf6d5869a40e252dcaaa10948f324f20341f9b0e55cd63db91e8d42da4a8371daf796e2ab1178de59eab59f151fc3901c86ac5f9717d1ebb5750ff002bc5d51a87bdf7a57e6498d41dbd8f53763005e312a89750de7a02b09e1cf5e59cf2d4d1dc5dd31fe099cff2927fe1a09f5def7d06f28daba815f91abc503efcea85778dcebe10605c1695569d6fa8fe7a05266450e481fa2e3eb7338f40903e3a9d3b8dba43fc133bfe514ffc3514fef5de6cd43e8efc808ef55bc6045a8992fa479ad2da14103f688d058288fd428b0299129db37319669854a87fc361a94ca9430a5254579e250ce4e727c754cdf9a15e3b9b49a5b512c1aa429b01e52d0e3b3a2a90a42c00a4e02f39ca5241f8eac5ff0029fb9fff006492bff567ff008eb946e6ee82d61236964e49c739b81f794e839dbdaa5f76bd9149b7a56d94d9621b1dc2dd1548c12e0c9cfba4f4e7d33af0ecf5ab5eb66fbabb09b3e7532ceadb27be8b3253121119e19c01c2a24a082538233cc67206bd571eeeddf6cb51c57ed0a5439d271ecf4f4d58bf29efd96da6d47e67035e96373afe4530d4aaf61d36874e18cc8ab5653180f4e15278b3e98ce83ae4c29db25547a7d2da91376e25b9c72e1a72e39485a8f371b1d4b47c4787c79999d8d98c54eafb855382e07e04aaea9c61f47343a9ee93cd27c7558a16feaaa953760cfb5973a128a592f525c53e1656951090dba86cb9c410b20273900e01d56199302c3bc9daf6da4a9aaa6ca1fc3ed8974f98ce4f8f744b452950f0cf4e63241c6810bbc6caa3eeb5dcdabafd2920fc8b848ff3eb7b5df457ee3db5aa51a1ad08933a9aa8ed297f54294de067d33acb378d9ac5e5ba2edc6fd32e8856e540225496c51642e421c0005b400491ef6321792399f118d68c8d7fd9b7345916eb35c7e95364b263259909720ca471278416fbc032a1e04679e830055e99368d54954eaa467234d8ce169e69c182850f0ffefc746b4d532c18958dceabda1b9b21d98e4280d4883554afbb7a5b085a9282e28e78880ef09f1f707338d1a064d076468a66bb56b81e9f2e6d4c25faa4253f88cfc82a2b3c41382a4a54a38413c3c8123550ba3b485b36a3cba3d9d4033198aa2d05208891c1070781212491f21a7bda55435ab4e8f565638a6c26649c74ca90147f13af9c75fa056a1541e5d52953a1975d510a94c29a04927c5400d07d09db8b9265cd6253ae0ac44669ab98d1901a43c54943593c2a2a20632919f9e90f7fd46e4ddbb9dda158173ca99422e7772d51622a3c38cd78f78f95713ca3fa20007c069aecd3e48ece5f47e509962d8533969c0b485fb311c949383f107535b74e4489b5541974c88cb6c1a5332432ca42015772147a0ea4e72741216fd1a8b67d2697019f658e5b659a734f3bc2971fe10785055d5449e23c3e64e34aeed556db953b35356915e910a934d054f404232996e2880de398f7b8881cf2002481cb9e6eadee2dc9b83b8948a94f7d6db71a632a8b198c86e28ef13823d738ca8f33f70d6a2ed3d4e935db3a894184b087ead5a662a54ae99eedd5241f4e203413bb4148814bda7a740b564c46e4fb305b8fe51202652939529c085609079638ba0033cb4bcac5e3bcb695c2d2abd418153a087877d2697096f02d67de290957124e3f48633acb543af5c960dc0f2e972e5d26a4c2cb4fb6397349e685a0f250cf81075a7f6337eeb17a5d306dbad51e32e43e85933a32cb6121082a254d9cf5c63911d7a68252b170dbbba17d5bb4bfa6ea1f40ca8d21a729cc3eb86e7b62785610fa792882df1e3c329383a9cdc6bae91b2b6e52e9f6b5b4db926a4e96a2c48c9e042949c654b50054a57bc90073273d7509bec9a4c0dc2b2a7393df8f545cd6e42d6fcc288b16330a0a71c524f2e239e11cc6727a9d3128f755917b56a3374ba8d32ad538095c96023de5b208e0529391cb92b1cbcf40a1dbcdfbb96eebad8a61b6a9d1a121ccce965e58444681f796a51f747438c9e67034c3ab6e68acca728fb67105c1562781734022043fd671de8ac75e14e73e7aabedceddda74eba2bb69d72df892e64173dbe13f2029c44986ea8f012824a78d0acb64e39e07aebdbbabbd343daf946dea6d15c91516994b8861a4a588cd850ca798e7f209f9e827d14189b6967d7ee87926b772b711c972ea328e1d92b4a73c00f3eedbf0094f20078eabd69d8ed57a0b17eeebd419abbee464ce8f11cca60d3d95242c61b3c94403cc9cfccf3d59b706a0e55b602b3517d2843b3280a90b4a3ea852d90a2067c39ebd94e9ae5336362cf615c2f45b6d0fa15e4a4c50a07ef1a08daed16d1ddbb22a2cdbf361a8bc5b089d11385b0f339eeb886011c3c4460e3dd51c6a9fb4574566d6b93f24371ee877e933f9b8d16a1189ef893842d997c5efa55d385602b3c87318d661b66e6b936c2f4f6c86f2da989e054865c24b725b500b0163c42828107a8ce46b486f5d4691b87b396edd94b4f77345423a629eae34e2d7c0e3248f2233ebc20e8195bd37cd4b6f6d766b90294cd4a326425a92971f5365b4ab9254300f8f2f98d2fed6de9b177456d5bf77d15b89224a836cb73825f656b3c804b98050af2c81e873ab6f69d79a6b646e20f9195f708467c55df23a7dc758eb6eed77a656589d54a3dc326951f0f14d3202dd71f20821095600483e2a2790e809d06b1adec4437c21746afd6233cc9eea389320bc98d1ce4965048e2e1e2c1192718d1a50ee2768bbdfdb531e994916c212a2ae194c778fac74e7de24003e09f9e8d06a2dbaa99acd856fd4d5163c4f6b82d3decf193c2db59483c281e00780d67d81daa1a325d8b70dae171788a14b8b2388919c7f16b183fe36b436dfd2dda258b6f52e4a71221d3d861c1e4b4a0050fbf3ac29baf61c0b62a539da3dd347ac30894a6d71da7826532788f2523a1c1e44a49e7d40d06d1dbbbe2cfbe28c62daf2580da1a285d3fbb0cb8ca0f223bbf2e7d5391ebaf26c3ad4bdaea753a49cc8a6b92298f0f22cbab401fe284eb01532a150a154e3cea748910a732438d3ada8a169c8c820f9107e041d6bfec9578c8b961ddad5454dfb7aa7a6a0be04f0851751c2b501d0654de4e39655a09cbceceb6ac7da8a953adc88cb2e264c053eb2a0a7dc265b582e2bae3ae074f21a9fde3e53f6f547a0baa30fbdb7469057c506b8df68eaed1a8e95c815c2c4a536b78278d90e34f288e2201e02dab03ae01c69fbbd1906c450f0bb207e3de0ff005e8159dad2956b447a9d52abd19f13a6853699f06521b716a48e8e36a490b0070fbd907981af27639b37865d5aef71a70452930609740e257305c572f2c2539fdad3337b36b9fdcbae5aa872508b4980a7d73560fe708577784a0799e13ccf21d79f4d4edd75885625b702816c478e9aabcd7b2d260e404a7039bae1f06d1f594a3d7e2741973b54c8955cbf5ea9b214e52e1ba68aca87305d652971d03fa4e91fd13aecec9f02a11776e2bafc494d32b8721256b694949f741ea47981a7952f70f6cf6ee810a8afdc71aa32e2152dd798695256ebea24b8e1524100a9455e3c872d709ed2db7e5d082fd54273f5cc33c3fe967f0d059c3a55da08b59e48b5f8b1e5c52fff00cea8dda2764e45f127f286da7522b6db21b762baac224a53f57854792563a73e479731e3e597bb365c1dcf62f06aa8a9b4a9f4b45256a8e83c70d69754e713ad2b0be150230a00f45723cb5d3bb5b935cb06efa55d54298c56ecdaec748f66e3cb7c6d8c12dac6781441073e60820e3417fbd22bd0bb3a54624b6d4d4862dcee9d6d5d52b4b00107e041d77bfcfb3b2fff000a1ffda6bb7732a08ab6c5d7ea4d214db73286b909428e4a42dae200fdfaea7f976765e3afe4affba682a759d9fa1ee5edc5af39d52a9f5d4d1e286e6b49e2e21dca709713f687af223cfc3552da5b0aaf6fdd702c7bc9a0604596e5c709c61e0b66538d06da48c750015f1104039035edecc55ca8ddb77542a2eadc4d2e8d4489478cd64f08c04e4e3a7112da893ea0786aeee560ceed3d1e98d9cb74db75d2a1fa2b71d428fee846826777371ad7b0e1c3fca78eecc7a4153b163371c3854a46015655eea71c439939e7cb48fabf6b09ca708a35b119a6c724995294b247c121207dfafdf6e11fc3ecf3fc94a1fbcdea8bb39b4547bc2a10535bbb698cae423bd4d2e13c1c96b4819215f65071cc8f788f1034179a2ef8de578c690e1b56d9910e2ad2953929a75484ad415c291959e642547e03469eb52dbaa6b567c4b7adb8ec53a2477d2f04a4678884a812a279a94788733cf968d0582c8a2b96e59f46a3bf23da5d8315b616f631c6a48c13cfd749bdd5b276a6cb9736ecb9212a44d92e29f6697ed242243c799e16c7d9279a89ca467a78695b78769ebaaa81c66de870e8ac1c80e63bf787f4943847f8ba4cbf72d5a5577e999f35d9b5307884897f9e503e07dec8e5e1cb03417f8bb67b83b9952997133442c313565d4baf94c66b84f24a5b0ac129000030318034c9d8bb26efdacdcda79b8a9c1ba65690e53fbe65e43a80e70f788cf09c8e682327cce91d17736f88b34ca66ecadf7c4e495cc5ac1f8a5448c7a634f0daced35251259a7ee034875851091538edf0ad1eae3639287aa4023c8e82ddda8a97328b36d9dc6a2a4999449086a463c5a2aca73e992a49fdbd5bb71aab16bd43db7aac05f1c49b725364347f55416403ea3a7cb57ba945a55e36a488aa71a9949a9c628ef1a505256850e4a49f4ea0f98d660b56acfdb91e9f625c8f0448b56eb626256bfb50d2879c2a1e831c5f070681c1be7bc3076e202624443736e2928e266328fbad27a778e639e33d07538f01cf587ee7b96af73d664d56b939e97364725ad67970f82401c8247801c86bb2f6b8e5dd97554eb9505153f31e5398273c09fb281e81381f2d41e839ceb8d1a341ce7568a65d21bb6a2d02ad1dc9d4a6aa499fdc077bb38eeca1694ab07878b20f4ea3556d1a0ded5eafd16e3ece35b9b6cac9a6228aeb0db6b3efb3c0df0f76bfd6181f1ebd0ea4e49c767470f4c5abfee9ac8db4175ae9b6f5f36ebef1112ad4592b6904f2efdb6ca863e28e21f21ada967408f55daaa140988ef22caa2c765d4671c485309047cc1d0537b355b28b3f6922cba870b122a20d4a42d7cb81b29f733e584007e6754dd83af3f70ee3dd9762a98db302a2f2d2aaa4b7f830da701a61949e44e024a8e7c074e5977df7407ae2b2aab42812c53d7363fb325e08e20da0901402411d5391f3d216f8b4362acd50875e7e53b3994847b2c798f3cea7e2949c23cf071d740d6dc9b22cddc2769ee5c7378bd842c34189a86c7bfc39cf5cfd51a8fdbedadb02cfb8d355a03a1ea90429b6bbe9c977bbe2e44a47991cb3cf9675916f283b7729a7e459354ac4479038843ab47494b9e887504e0fa2873f31aa005149041c11cc11a0fa517fdaff0095b4766009aa85ddbe97fbc08e2270952718c8fd2fc346b0a5a7bbf7cdacc18f4bafc9546c603328090947ec8583c3f2d1a0a068d1a34068d1a340ddd87de19bb7b53441a829c956d485fe798eaa609fee8dfaf9a7a1f8e0e9abdaaed366b96fd3f706d8710fb69612ccb758390ec75fd4739780cf09f450f2d64dd36f66b77dfb3187a8570475556d2961487a22b9a9a0ae4a28cf220e4e50791ea307a8294f5d71a60ee2595060a9cadd9339358b51d3c4875b39761e7fb93e8fac823a051183f1d2fb4068d1a34068d1a341fb69c5b4be36d452ac119071d460ebe94ede2d0d6dcdb2b5a929426931495138000653cceb0c6c96dc4adc3badb8ea4adba34521da8491c825bfd007f4958c0f2193e1a67768cde18d221fe44d8cfa514961018972639f75c4a46032d91f6001827ed74e99c87ab7dfb423b29c9140b064a9a8a32dc8aab670a77cd2c9f04febf53e181cce645ad4b5a94b51529472493924f9ebf3a34068d1a34068d1a34068d1a34068d1a34068d1a341db1e43d19ce38eeb8d2f18e2428a4e3cb235d6a51528951c93cc9d1a341c68d1a3406a4a8ec41539df5597244342871a632525c57a02a381f1c1f81d1a34171b8373e7bf6d8b66d888ddbd6d7db8b19654ec927aa9e78e0ac9f10001e18c01a5ee8d1a0e3468d1a03468d1a03468d1a0ffd9	I play a lot of games and like metal.
47	Rashan3@email.com	1234	Rashan4	\N	\N
39	something@gmail.com	1234	test1	\N	test2
48	ajg361us@gmail.com	wetcheese	unc.cherk223	\\xffd8ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc00011080096009603012200021101031101ffc4001d000001050101010100000000000000000006000304050702080109ffc4003c10000201030302040306050303050100000102030004110512210631134151610722711423328191b11542a1c1d13352f008162426344372e1f1ffc400160101010100000000000000000000000000000102ffc4001811010101010100000000000000000000000001113102ffda000c03010002110311003f00f308a46ba5073daba64cf60283851babb038a4ab8aeb60f2a0ee290a9ed91525640471cd440bc8ab6e9ad2a4d6b5bb5d3a13b5a7902eef41dc9fd01a8a6edede6b99365bc4f2bffb51724fe94e2e9d766fa1b47b79639e67088aea54924e077af5af4974be91a1da2c3a75aa464801a4032cc718c9356f7ba25a8b859aeed22961b6db24731c164614153a0e9167d33a25bda4312c4b143b9fd59bcc9f72681fa975b85bc68d90a6d0598f23d879f34797f6a67dd765dee6d082c4a8cb211d8103bfd680b5ad2dae927963b6bb9237c85711138e3f6a9443e9bd655b11458f94e060fe955df177419f52d31352b78c196d17336defb3d7f2a7fa53488ec75174b85962949cec914a9c1f302b4c8b4e86fade681118c5340f1b9038e7b5494791909f334f2b1ad4a1f831a8ee91eeef208a30c76ac6a646c7967b509f597475ef4bdd46939f16190652555207d0fbd5d14b0b640edc7ad495e0120557a70719a908cd8c67f5a09218e7b535348769cd3324c5064f35f65702339ce719a0e6c34db6badcf2fdaae5fcd6101427d4b77fca95503c8e198076db9ce334aa8f817269e31fa57d118ce79a7b676a6a23f87ee2914e460e6a49439e2be98cd151c2fb0a2bf86775169fd6ba6cf3b048c394cb1c01b94807f53439b3d29d418341eabb5d756d6510defdd46dc2c99e0e28dec2f2d25b21106591187249dc0e7be7dabcd9d19d5d6777a6ff0005ea162aa3fd29f923e8dfe69fbeeb0b9e98d6c58e9523dcdaae0a248c591b3fed3dc77fa5647a0e5d2fc28596c265b66c0fc272073eff005355bd417da9c5a66fd2a689ee5002cacfb471dfc8fe942969d5f7df6747bab40cef83b130d8faff00fca727eb09264573a1df13fcdb50e17f3a8a9dd3f3ea9ababcfa85842d22e3c2900048e704f3d8512e9b73208de22dbb680490003cd035f7c428f4f00dc585dc7b463c3d8c41fcfb50e6a5f1bb4f8b31c5a5cb21dbcfcdb431f4ab0c6c8f7485046232a477f7acefe34430cbd0f7123152d1b2328f42580eff004cd53699d6bd41aa325c47a6c0968e9bf31319085f2aaef8c1a84b07484505e4cab2dd4aad1c21817603925b1d80fdeaa31b4efcd7637f973507ed1ed48dd71c12281e9cfcb8c8ddf5aeae8ec420ba9c0f239aab95b7313eb5dd92979c0d81c79834109f9627de95691d29f0af53ea9d11b54d366b758bc6317872b95618f3e062955d01aa996ef4e14f7a70a95e08c669f7b70b007f1549ff006d4444dbf9d265e38a99651c6c6469194055e14ff31f6a57b12c53158dc489807728c0ed411157d452db4ea28ee4d391c0f3b848236773c00a3268a8a700fd2ad3468eeb52d52dc00d218d94b363f0ae477a3de96f864971124dafdc3c464e560888c8ff00ec4fed458fd2ebd3f62cb62545913872546f233feec73e74151a9cba8d9db48608657484297642016dc703683f8b1e7479a2751c961d3525cdf4718f05792ebcf97f9afb6da1db5ecd14b1708a77852d9c63cea97aed259ba72f0d858cab0a2e5cb7f360e338a9541dd6daeddcde15dea486d6c6f0116fb63fc406327d3cc5645ab4fbae1bb1009c30fe61eb5b3ea3a4dceb5d1ba7bbdddc2d82c58da5b818e0ab0fcb1f9565b1e833eb9d41369da784332a168f736d5c0fee7fbd5854b97af7556e98b5d161ba9a0b685426d8be40cbee4727f6a1996ee59c832bb498e06e6ce0545b9b79ad27920b9468e5462ac8c304115c2b60f3551237e4fa523db834d8e7dbeb5da9f5a239f635d23b236572296dcd24009c1cd05c691d51ab69168d6fa7ea1776f1b3ef2b1ccca33f4ed4aab23b777242ae71eb4a808de169446bc12df8101e47d69f9342befb5c56ab183248bbc01e43dea278925b39963650ea768f5fad11f45decd71aec52de4aee1d7c3dc79c6306a2a20e8ed5e39ca7d98b32fa1ef51aff00a76f6c9b1340eac4ed03be4fa57a3ad2ead21b1de24b570004625b91c79fa5555958da5aea3f6ebf9a23338df0c44fe11eb43188e8dd1bac5fdd2c66ce5881e7320dbc7e747bd3fd23716b33450f27196751c1e7b64f38a34d4b5a58a0927b37472bdcb6064fa0e3b525eaab70bf7bb16565c9da7345458b439953efa668c01c10c72294f2cfff006dea36770cef7908e3cb78c70dfa62ab13ac627d4de1903b7a1e7b53dd688b31d3e6b598833480c880f751e63dbda82bb4dea46b340934fb09caa93dfe9551abf53da7813468cbb87e10266520f9657cf9f2ab9eadd066d3ee6db56b65dda7de01e271fe939fdb27b5086b3a7dfdda6d8cdaf82c3fd52033e3ea6a07475a88ba766b248c85dcc5877c31efcfb935dfc2eb386d34fb8d7aee356792731c6e412551464918f7fda826df4db8b9d4068da7af8f34ae0c9279003ccfa01dc9af42743e8963a474cd8a4a4cc72caa5d721067be3d49e6a8cbfe2ef4ee97a8da1d7f4db88e3bcce26849ff00578ee3d0d6328544aa586e5046467bd7aeb5ce98d2faaf4f9a19ad56de58f3e1c8a4039fcbc88f5ac1fad3e1aea1d3b7b07808d7704c7e531a9278f222a98a8d3ba7f53d7e2ffc0d3a5085feedb70da17cf391cf97344d07c1fd75ed24918db970b955594124fa76ad37a0e3863e9e89665f019171278bf295fc8d12e99ad68d70c20d3f51827987f2c6d9cff9a9a63cbbac58be94a74ebcb130dfab7cccf9ce3f6a892e9d3dbdbc32c89b524ced3ee2b70f8f1a5d9cba443a8318d2ed4e14e7971ff31584f8f2b42b1172501c807ca9a62c6c6292e5da31c041c0229535677935ab129265b18c03d87fc14a826de5b3c5346921ccaf82c3fdbec6b56d1ed748b1b3d2d628019b7325c6e4237023d7ceb37d7d24b3ea2b82d1ab6252ca08f948f2ab61ac6a7ad4d676b13ec8adf0e001e63cc9f3a23689ac25d4bc5b28dd405f0f051300281cf6f4e05505ef4cdf5d6b329473e0c29e1ab3b6e24f7ede5441d017124b6375a8dc42f133fdd9ce7d31c5165aac508c0d8cca327228a00d23e1bdddcdec26f6fd45b292ef1a6724fbf9519ddf46e9d6b6dff8d66a580cef3cf3eb56736bd696708699914903b10326a9f51eb8b556440c549ce39181ebda8338d6fa6e51afc460492185b3ba50b8ce07635225b19b7c60ccaf129e11573b7e639edebc54aea8d796433c91dcb0246e23c43db1dc7b52e99bf1abf88c32f04036349e64e01e7fad01ff004f78379a2cb69771acb091b0a372181f2a0d5f848dfc52ee5b9d46e62d35a4da914606e1c67058ff008abdb58d1c88e695e38d8eef918afdea8ca76f53e557da8dcdea2d819ae1551256598019324846073e9dbf5a0139b42d13a62c1ecf48842c929fbd99cef91fea7fb543b6d5c0e9b16d0b28ba5dcf8704704e47152b540d7babdad9aeefbf90ef2382100e4e7fbd5c5d69b636f647ece9ba351b78e4feb414716ab02d9ee75dcc577e0f0738f7f7a870f58dab288ee5e311c7ccaedcf863f7a71f4617514eac19d0afcd9fc58ff154d0f4b69976a89e0ac529271220efec3c8d04aea8d2f47eb8b391ec2485afed50edc315de3d1b1fd09af9a0695a16a56565fc3c5aa4b05bf853410c2639d2603192e39efef541a8f4c6a1d333bdf69aaae31f78aacc323e954d3ea1ade85d59f6db18e382cb51214fda07ddb381c8e3907b7eb416bd55a3de2f4fea76d79abb5fdd420ffee2729f77b410428c03ce7be6b159008a528086c79af22b5eea5eab33c3d47a6eaf668263178705c46a7686519d9dbb9ce6b1b53f7981df3da8093a5b4d93529e458503144c9cfd452ad03e0fe80d0dcdcbdd1db24b165233c10a08c9fd4d2a0cfdee67beba5334a649a521773b799e3bf90a32d063834ad6a3d2e29a1bcbb997ef648b25518768d5bf9b8f3159e904119f3e2893a403cbd49a6a06c1f19413ec0d123d3376a34bd02d2d630032c6bb863cfcea9cea8971a34f3313f6a89b6300704e07b54aeadbb3159a4a537141c8fca823a5f588a1ea56b775f1ad6f655454f38db048e7d3b8a2a9675d56e62ba0cac339d99e700f207b7ef5616bd2f2c9a32ce859ae170e770241e39ad0eeecad279e78bf02b0c1c67191fe2aed52dececd2d9504a153192683258ba7b3a4ac9247b4a828188c95e4d597495a1d3e58a140409d8b16c70700f07ebfda88f57d5edd2d2444890046caa9e7f5a83d337925cdb4ad342062e06c03d083c0a0b46792d763db60488c1e3de32030f2357fafadc5d746da3b8569d6432ee23cf77b7d6aa64412039f9f8e40eec3fc8a7f50d6634e91b7b78e41b90b78addc8c13b47d49e6833fd63a896cb58d47ee8cd2456e36a2f72c4f2a3fa558dbf5435ce8f03940aec80b229c81ec4d56695d3eb7914faadfca614762cc5bcc7200aaed7ec65631ad843f688a2612050482c0631803fbd41a874d5f437702dc18c248d94e47e2c53dabe882de38eef496511b3032444fca7dfd88e6b24d03a8ae8ca5642e60da086742b8232481fa77ad5fa6f575bcb12dbb75bb465d980ed8f3f7ff00f283ad5365ac062d552301c0c32fcc1c1c0feb9a00f8d3a367a0d2ee1658e2b3b959ca0e4e1be5c7e557baeeab0ea5a8d9d9c52662b44491fd48cf0a3d7ca83ffea026b98fa66ce33e246924c329e4700f26a8cf3ae3a82c7fedf8f4ad18278576e973391dc305c63eb40fa3a2bea96cacc1159c02c7b0a8c013df9aee152b2ab0f2a2bd5b6fa2dc5ed95a5de972b5a5daa1490aae720e0e08c67ba8a5437f0cb57eaeb9d24bd8d8a8b5fe4967919777b2fb52a230d0e09068cfe155b7dababadc952563f998fa50d74af4d6add4a656d3600f1c3f2bbb3602e6b65f861d371f4d417b757f3c334fc7fa47200f4cfae6882aeb5bc88584d6eca59e45d831ff003dab3ae96b679ba9f4e9030658e7cf031d81abceae926b8b72ea8e09ee071c1f7aa4e938ee1359b18a2072d2aa31dd903839a28ef4aea243d413e93763e7d9e2ab91cb1cf23f2cd537566bf736f7e62b520c78f3cf23cebad522f135c9254210c1b43301c807cf3f953b79a11bb84cae59b2086f23cf9fb500add5dced60eed21124b80bb46727be08fa53dd25ae4b77ade9da6c6e63c4ad2b1ef908a4ff008ab27d2e43140c1a332e36ba818254799afbd3da67d87aa6ce4c0df306c60761839e6834404242db9486cfcca9c953e4450b7573fd96cc248fb773e64c7913fdff00e7d491834d7fc3ed4572ce40e7038007bd067c4d477d22f15368f0612cd93c20c719f526808353b8b75e9f115ac6712c598f81c01d8e3b6781cd55f4feaedd4578884ad8ccb80d0f7040fc409c70c31e5c553f483dfcf0e956eef0c820b6f0e54c6091b7820faf97bd14e9ba65abea2d6901296e58c976cbc6d2c06d407bf3dce3dbd6820f5f2d8e957492c3178974ec5638e219cb15f203be7354dd31abdec1610d9cc9225cc80897780368279031dfb511c5d3c96bd691db98f31bc25d2461923047009f2ae66d27ff0052f81220431b16249ee09c8a82a7a02d1985cea7784cf76f2b08d5b3844538503f21467d57a158f5669c21bb790a100e10e0ab543d02c238f4ff00151c28f11893ef93daade18e2b794b78db83a9ddb0f20f91a0f20f52e8efa1ebd79a7c9926172a188ee3c8fe95a57c03e83b6ea8d5e7bed506eb2b3236c7e523f7e7d862a4fc73e9f89e55d66d63612eed9311e63c98fed57bff004d3abc76d36a1a748877ca048ac07a77c9fd2a8dd63d3d228c45046a91270aaa30052ab4b70b327ca69515e58f825a9a41a06b30047322cab2314efb36e3b7a0c1ad434d7b78b4b96e536ba3a65329b7923d0f23bd793b4bbdbab6b88cd95c4d14aec07dd3104f3dabd4f6522cbd3297136f5675e03fe227dfdf0295981bd6ef8491b43b88cf238ef5cf45e9e3edf048ec0c664126d1df22a97a9ae618006dd9676c003ca88fa13e78e3660eac8acec18723fe668a2486dadaf25d494a6d1248012bdc8c9ed4e5cbc705ccf6ed28db80c8ce719e0647e42ab3a72f566d7351b54392bb58a938c738ae7ad1e3b9d41aca001a609b8e0f20e71413d601657113dd0631c8b8daa31ebfd2a341770a6b76e665d9e11f908f9b208c1cfa1f3a9107dadb4cb37d4630a40318e72dc701891eb43dd6967702fb4ab7b66647b9ba0aaec718041ee79f7f5a027b1bb9ee91a5b6c46b23106e197b0e7841e7f53c7d6a26bd651dde926c19885b831abb6793ce4924f99c54fb2827b6b0517777e3ba0625fc30bdb8e00a965639e78c48a48de9c01c9c0c8c500b4da3adbdbc865db144aa155d339f218038f2a2cd12c6d74ce9db978616591332e49cf38e067cc8e287ecee2efecd75148877b1910b1421860f2067b0c647bd1269172b7ba0c7ba42a5d763314ce7c880077c540216faceacfa88baba915db3b237f341e9573ab6ae979ac78a0c7c5ba82e06189c64838a882c0def53ff000cc98b6af88cc390573e5ef51753fb35af56c9611a0d8aac719f2181fdcd5037ac5eeada3fd9d4969015385438544f56cf9d4a1d4d1db3da9b712dd891790382a3ea38ab2bcbb5d7354d3a011c0b6531db28ce59d40fc3ede955dace90b23cdfc3ad92da054f95a072848f4c791ff3404f05c69daad94b6f77e015917015ce4818f3156bf0dba46cfa7e0bbb9b650ad7720d83bed51e87d3393592e810bb6ab05948933cd33051bdf711f423b57a32ce0169696b6ebd917f618a8d458c48c83ee87d695770709c9cd2aa63f3f3a6884d5ade4619f089900f523b57a66ed5bf84d85b65862056f4e40e6b08f85ba443aaebaa6e798a11b88f5c738fe95ba6ba8ff68b064552446c0afa8ab588cefa998a45234722b10e00279c1ef46bf0d6411d9ddc649cba02037f2fafed595ead7b13ebd716b719444933873f28638fedfbd69bd2048b75976851287008381dc0c7f4aca97c3c76b8ebad70c87091c6071ebb8f7a72c2e46a7f10f50f0be682301178e49e4d33d0565141a26af7d04d89afe52819c762b907f2ee69ee85b05d275e92491e4757937177ee7779ff005aa34e8a08c885241f81d5b18e719e450e75e4282eb40b88d7023bf8f031c90411fde9fbdd499bab6fec16531ac362b2161dc316c6eae3aeae9a3d0b44b8986047a843e23e3b0ce327db38a09b29fb9f3fc2dfbd7db70d71aa5bc78c069c67dbe5a8a92a4d087dde22e38c7d6ac347756d7ac02c64132f24fe941c6b56874bb09256662c37921f820927d7b8aa2f865a96e48223d9036e38ecd9c6289be252916f36cf98f719acdbe15dcacdaadddb22b994c808238c60d0118bf3a7fc509ec2e4e17ecc0a3b77c93c73fd281faaee6e34feb917b3079214760cca738070791fede7bd151b0bbeaaeb3bdd66de5b7b7b544f06342373b6cecc7c864e683be24477b6b65334b1b45745013b5bba763903cbfc5046fb44d67ac6997168c636540f2a1c138393faf6a2ce9fd5dba91bc0bdf118905d0a9238ce0a938acfaeef22d275ed1e7ba9238d6f2cd04cac0b6d65e0311e5900517f4e6a171a2f52df4524702d85d234b09207caa46703f4cfe468a2be86d291faa619a354786052c85460823822b4f949fb4007b84ede942df0cfc1ba49ee6023c3c2aab05c649efc5184e85ae6438f2c66a2f9ea4a1db1aece47ad2afb6ca4c0bda9516f5e47f82d6a862bab800060c14f1c9cd6b1a8cd1f851a043e204c6ef6cd2a556f58621d696690ebf25cf7de4653ebcf7ad7f4db58adfa5a023242c3e281ec793f9d2a540d742c1b7a1e1518cc8249b3dfbb13faf34e7436a16baa4ad68f148b306f0a57e30c47623f4a54a81d58a5b9ea4eacbc824d9768896b1b31385041e7f5c54fba967b8f8676325dec794dcdb904127ff9940e7cfb52a5416ca094ce719dbfbd4cd0d09d76cb0c410e4ff5a54a824f5c92ba6cd29e70878cfa8acabe036e9b56d46776fbc1939cfd7ca952a8214dadcba76a53369e5a2219830f26f5e29bbe33eb5d3dacea9793b348a8d0aafd133fbbff004a54aaab2feb09246ea9b98a4919d6d82c49bbfda07ffa68ebe17dcff1c234bbfdd20b72ad1927ba64fca4fd7b52a5547a2fe1f59416da42780182bc8c707cb1c62af6000dcb9c6739ef4a9545f3d4db34cc78f4f7a54a9552f5ffd9	\N
40	something@gmail.com	1234	lilly	\N	hi im lillian :)
41	someMaristEmail@gmail.com	1234	Brian	\\xffd8ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc00011080096009603012200021101031101ffc4001c0001000105010100000000000000000000000603040507080102ffc4003a10000103030204040306050305000000000100020304051112210631415113226171073281142391a1c1d115334252b12443e116536282a2ffc4001a010002030101000000000000000000000000030204050106ffc4002911000202020103030305010000000000000001020304112112314105135122427114243233b1c1ffda000c03010002110311003f00ea94444004444004442800bc2e0339e4be27999044e965706c6d192544789af6f6c3a23f287726753ea51e36c9420e6fa519db85f6df45fcea8191d1bbac1bf8fed2c711e1d51c750c1fba834d1be7797c9977b956f253e9180c18f649769a11c15f7336ada78a6d17378653d5b448e380c90683f9ace02b9eeb69dcc7ea8896b86ea59c1bc6d35248da3b8974d0670d793e667ee3d14e334c45d8ae1ca36ca2a34b5315553b26a7707c4f196b8765594ca811110011110011110011110011110010f2443c90046f8b6b442c8da776b3cc5b9f99dd07f92a03e23eaaa0be524e4e54838dea0baa9cc69e47fc6cb014a7b24dcfed3471209477e4be8e0059d1509a200381c65576b886ab7a890e72414a5a2e26cc3d74609c6028dd697452e5840c1d94a2b232f61737aa8bd64643ddab2b9bd13ee89f7c2de2578af16da9765929f264f2763f55b65734f0e4aea6e20a591ae234cad70c7b85d2a39956612da31f260a33e0f51114cae11110011110011110011110017c4f2b2089d24ae6b18d192e71c0017dac4f1646c97876b592005a59c8fb8c2e3e09457534881dea56d657d6ba37b5ed0fc82d39183bac49a98e9c17388c0dd5cb9c7c2a8c33003f4e7601d8ea3d1602e51554f307d2c8c6bc6c350ca458d37b35698b8ee256abe2ea6a16bdd554f52c6b77c86642a507175b6e4ef0a9e47646e753483851abaf0ed5c9166ab886f32c8e397c3180c889ec1adc6df5575c1fc30686515158e9a570c96095c09193c8fa25bd6b81d152df2656e7c454f450e8a8c46799d5cf0a2551c554b533399454f5552eeed661bf53d154f8994266bd53be1258c7c65a48fe93dff358e8b83e06d3c663aab831da48780e70d6481be41dcf6cec14969f723373fb4caf0c561adbbc60c6637b5e3393ebb2e97b0dce1bbdb20ada52e314a36d430411b10474390b97b8668aa286f1490c93c92e640dd6fddc5b9d838adcdf026f6cbb70dd644d001a7a979c0e9ac938cfbeafc53ab92ec8a3935b69c9f836622044c29044440044440044440044440056778a7755db2a6067ccf610df7e8af178ec63741d4f4f68d45235cd8bc373b3827cb8f977e4ade9dad6c840c6fd54b38d6dd1534f0d4421cd350f7078ce4138e83a285cb296bdd8d8e36489c7b1a95dbd6dc91f778a9a7a384cf2bd8d0c1924ab2b5dd995940d9da1b13093a03dc039c3be0f42a2bc493365ac8dd739991d3b64cb61cfcdeebeebea696a694bfc68b546d21a03d8e2361cb3b282896d5892d15f8da40ea86384d4fe4c81adc36e5b2a9c357582e144d746ef301b823915ad6f14065a9cd4d6b1e49dda5edd3ed81e8b29c3f59153fddd2bfef59b168e5a575c78211b56f926b4d1975f607020863c1256c8f80d6916de18aa9db03a16d4d41d3abfac376d5f5395abf875efa9bcc5011f793b8458f5ce174c5342d821644c0035ad0d000c0c04dad7051cab3bc7e4aa111130a011110011110011110011110010f2454aaa66d3d3c92c870c60c928d6f840deb935e7c56e23a7b7d7d82cf2467c6b8ccff0e5cecc7b184b47fedb85119640e3e5187019c1e8aebe20d14dc48c8aae36ff00afa2a865652b41e65991a33d353491ee42c2fdaa3a8a48eae9ddb756bb63cfa8ee396137268756babc8dc0bd5b17af0cb4b85a69eef708e5aea6867a6886ed9007027d957929ff0085c51c543555d4b0336641069310190705ae046361b7657f4f2c2f8c3a2c692304762aa543621a8bb01a47987aaa5a7b356325a209c473495d4cf8649a7035ba52d8a26459d5df4804b7b0cac370c52525bab1820a56479765c31b81839dfd54d2e9f666b1ef88b72d18249c63f151d6d1eb8d8f8861f2938c6ddbf752d6f839638aec4d7e105b25bcf1836b9cdc5251665711cb51ce91f8eff45d08360a35c05c3d170df0ed351b07dfbc096a1e46ef90819fa0e43d0292a6c5691956cfae5b0888ba2c222200222200222f09401e9e4bc0e1dd62eeb7ca3b702d964d72e368d9bbbfe1426edc555558e2c639d4f11e4d61dc8f52ad518765dd96915aecaaeaefcb2657abfd15ac112bf5ca79471ee4feca137ae29ababa673b0d8693500e63773a73be4f558424bb53ce5e09f75f6c026618db820e43811b7b15b14e057524df2cc9bb36cb785c22f86e46f9519e25a336e91f70a566aa790eaaa81a399ffb8df5ee3af3e6b356b864a763a091fad919fbb713be93c81f6e4afa4607c6e63802d2318c29df4c6d8f4488e3644e89ab226b9a96cd0e9aab7bfc5a778c96b4f258dadbe4861708a5744fc1cb1fdfdfa2c9d653c9c397231b33f609ddf760ff00b6ee7a7dba856974a786a72f7440077f5377caf35642544fa248f6309c6fad59591513d4cd501924ed918e7e48df7592badc7f8759ab26241922870de9827cad68f6241fa2a5f668e094361197fa0513f8813c90b28ade0bb5caf32c87d06c07e249fa29c1294921766e10726745fc04e3d92f165a4b35e6673ee3082c86679c9998d008049dcb80ebd56e4042e3fe17a59a87ecb530b9d1cacd2e0f69c60f75d11c2dc71156410b2e8d6c13bbca5e0f94bbd7b2d1ccf4f9569590eccc6a72e12938c993945e31c1cdc8c1f65eacb2e84444004444016f59550d242659e40c68efd5432f5c453d4831d3174311d811f33951be579aeab73b5661665b18fd5619c758713f30e4b63130e314a73ee646565b6fa62594c5ce2e0724f320ee55978c1e71110fc6c71d3ebc9646a036700bb00b081cbfabb1f4566c6b65d70bc69923381edcc2d88bd2e0ce6b7dc451b9b20f15de138eed683cfebdbd15de3c21a4b70d1d9508a40d229ea46a07e579ff000ab79e0c35f9743d1c7a7bae3ee09152077fa868d590ed8fe8af5db058ba8665a1cd3a7b16af9e21be53d9787e7bad5b75323665b1e706479d8307b9fd52e6bc82e5e8c07c48bf58ecf45e0dee6265a869f0e9a11aa57ffe437f2807a923eaa336495f596b654461ce85c354721d8919e471c885aaab9b70e20bbd45d2e45f3cd3bf53cff68e81a3a34720148ad34d5768f0a786794d183e601c486679fd0f548b701e525be19a98b9bfa2e1729f7367505131cd792d25ddcad6f75b4cb7be366868fbb8c169cf20d6ff00cad916cac698da358c39bb60637567c3b4ed32d4cc59897e5248e59392b2b131e50c9f6e7dd335f332233c4f761d997b49461ac6b5cd25a479b6dc7d1456ff007ebef0ef120826869e6b454ef08f0bf98cdb53757f7b4fe87aa96f17d44f49658cd04fe154d454470878f9803bbb1dbca157aba5a4bf595b475035c4e20823e6691c9cd3d08ff1b15e8ec978f0797a56b6d933e11e2ffe18d653564ae7d010c731ee25c636380df3fda32323a2daad707004104119d8ae75f067a1b75b7ed003e681be0bfb3b492067ddb85b1be137100a8a29ecd57239d534321642e7f37c27766fdc038fa2c4cec45d3eed6bf2696264f3edccd8a8bc072bd590698444401a9e57bb1b3435a3a12a8b9f9e43cdcb1dd51af900aba583b82e5f6ef2b99b9c85eb147491e61bdb1571e68e76b739d196f7d43fe558978a8a7a7ad8c0d440d407e6b265de5dd60ec4ed1357503cff002a425b9fed76e3f5538ae1bf82327a68c9b98c9a3c3865a775e534af8f30cc4e39b5c7fa82f631a001d97af0246e1d83d571fc1247cc91e8de300b79e9edeaa35c5b6937aa6a789cfcc113cbc34f73d7dd48c3dccdb3a9aa8ca01dda303990a517a0d107a2e196d116963416fb2bd92ccc6b4be9435ba879e377caff00d8a923c6461502d013bdc629c392250d0c90bdcc835e5a3688fcdedfb1edb2b9e18ad6454f76aaab7e88209038bc8e6081a76ee7963bacd4f06bf36e1d9e9cd60f88e2865a382962778734957e3cad6b72250198049ee323f151b2319c95bafa97032bb6518ba9bfa5f27d36a4dd5e2a258dbe10d4228cf98341fd4f759bb353329a28990b74b5a738ce79fbac55ae1fb36c0795dba91d30692d7376db74bb57825096cb9ada76cd4af0060021c31f9a8d492d45b1c6e146f31d4425b9c1d898dda9b9f42350531a700c608dfa1faac05c6934d44f4ceda2a86160f7c6df9a555a7f4b27626b5246efb05c63bbd9a8ebe1d9951187e3b13cc7d0ecb2416abf80d7775458aa6d73644d4726434f30d7731f4703f8ada83905e6f2a9f66e943e3fcf06de2dbef55198444482c1a26eb31ffa8a919c836327f359579d441f451dbec9a388a99c3ab70b3f110e8da4765eca51d462cf2907b6cab9c8f751415820e3c65383f3c58734741d3f1dd4a8e08c775048d99f89d5ceebe1c447b6803f45da7bbdfc058b826523b4b885f2dd6e1b6c951fce00f557518c04b7c0c4522cc35517b55dbb92b67ee57367596af1baa4e1b2b99065507053445949d8006791d9469b4ed1593871cbe298e73d9cd18c7a6c567ea9c7c238e6392c44717faff101cf8d10cfbb5dfb38a9c1f8212320c600c070abc5239a46397654da7ee881d17ad382a325b3b17a32d14d23009613ee17dd7c315d297c4a7f2d447fedff0077a058fa39bc3971fd2ef982b1e2e32d2592e13d312dc45e230b4ee30e00e3f14871fab81e9ed15fe1d5c0dafe2788cb8362af661c3d5c0e3ffa695d06de41723477a2fe25b6dc4480cb0c2df19d8c0f118f764aeafb6d64570b7d355d3b83a29e36c8d20ec411959beb15ea51b35dd7f85ff4c9694ab7e0ba4408b1b66a1ce5c52e22fb487b0525a17ea81a88bdb59fd713c8d7fce45571237eca2b49007f1fd64879fd962ff2e4450afcfe09cbb92403c4aa713d392bb0cdd112a4351e4980dc2b578c222e20650ce72ade4288a688965527208eead1acd25b8e60e33e841445389191734accb6477504c67dfbaf01ce0f53b94443388fad5a4e4735797084dc385ee118706c829a501c4679b0a22459e0b157634c5b8f876e2fe65b4f133dcbcea27f35d51f05e7351f0ead7abfdbf12319ec1eec2224fac2fdbafcff00c1fe9ffdeff04e02222f326e1fffd9	I love master of puppets
2	testupdate@gmail.com	1234	testUser	\N	Hello World but this time with description updated
42	Rashan2@email.com	123456	Rashan2	\N	This is a test account
43	new@email.com	1234	newUser	\N	\N
\.


--
-- Data for Name: videoGames; Type: TABLE DATA; Schema: public; Owner: reviewer
--

COPY public."videoGames" ("mediaID", "gID", developer, publisher, poster_url) FROM stdin;
400	\N	The Software Toolworks	The Software Toolworks	https://www.giantbomb.com/a/uploads/scale_medium/7/73970/3436007-chessmaster_2000_a800_1_1.jpg
401	\N	Naughty Dog, Inc.	Sony Interactive Entertainment Europe	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/1789606-box_unch.png
402	\N	Naughty Dog, Inc.	Sony Interactive Entertainment Europe	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2204863-box_uc2.png
403	\N	Naughty Dog, Inc.	Sony Interactive Entertainment Europe	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2215091-box_unch3.png
404	\N	Naughty Dog, Inc.	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/0/3699/2923434-uncharted%204%20-%20a%20thief%27s%20end%20v3.jpg
405	\N	SIE Santa Monica Studio	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/33/338034/3287019-3786480319-Z7hV9.png
406	\N	PlayStation Studios	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3532837-0378849544-co5s5.png
407	\N	BioWare	Xbox Game Studios	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2577246-me1.jpg
408	\N	BioWare	Electronic Arts	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2577248-me2.jpg
409	\N	BioWare	Electronic Arts	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3487302-0629533368-26992.jpg
410	\N	BioWare	Electronic Arts	https://www.giantbomb.com/a/uploads/scale_medium/0/3699/3274526-masseffectlegendaryedition-coverart.jpg
411	\N	Naughty Dog, Inc.	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/9/93770/2419553-397060_386577108098888_427807760_n.jpg
412	\N	Insomniac Games	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3533935-5172064416-co1r7.png
413	\N	Insomniac Games	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3538002-egs_marvelsspidermanmilesmorales_insomniacgamesnixxessoftware_s2_1200x1600-58989e7116de3f70a2ae6ea56ee202c6.jpg
414	\N	Insomniac Games	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3533936-5655705013-co79v.png
415	\N	FromSoftware, Inc.	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/0/3699/2734931-bloodborne%20v5.jpg
416	\N	Unknown Worlds	Unknown Worlds	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3536208-f5ebad930a2f6eb715579a056807033f.jpg
417	\N	Rockstar San Diego	Rockstar Games	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2737123-reddeadredemption.jpg
418	\N	Rockstar Games	Rockstar Games	https://www.giantbomb.com/a/uploads/scale_medium/5/56742/3018545-3469813732-redde.jpg
419	\N	Nintendo EPD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3540553-2920687-thelegendofzelda-breathofthewildv8.jpg
420	\N	Nintendo EPD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3540555-3575636093-co5vm.png
421	\N	Capcom	Capcom	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3049558-box_re2.png
422	\N	Square Enix	Square Enix	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3532478-packshot-824-e.jpg
423	\N	Telltale Games	Telltale Games	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2348800-box_twdead.png
424	\N	Squaresoft	Squaresoft	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/1814630-box_ff7.png
425	\N	Square Enix	Square Enix	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3553803-2199476859-GHXYCDYWEAAZW_o.jpg
426	\N	Capcom	Capcom	https://www.giantbomb.com/a/uploads/scale_medium/5/56742/3502363-co6bo0.jpg
427	\N	Nintendo EAD Tokyo Group No.1	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/1/13774/488943-super_mario_galaxy.jpg
428	\N	Nintendo EAD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/0/26/10169-legendofzelda-goldbox.png
429	\N	Square Enix	Square Enix	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3615240-3608718123-skobe.jpg
430	\N	FromSoftware, Inc.	Bandai Namco Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3532465-2909474649-co4jn.jpg
431	\N	Rockstar North	Rockstar Games	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3532840-6042895878-co2lb.png
432	\N	Jackbox Games	Jackbox Games	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2992614-box_jpp3.png
433	\N	Kojima Productions	Sony Interactive Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3531788-6677026638-co5vq.jpg
434	\N	Supermassive Games	Sony Interactive Entertainment Europe	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3632555-2972096676-co2s5.jpg
435	\N	Housemarque	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3534943-4746855303-EGS_Returnal_HousemarqueClimaxStudios_S2_1200x1600-617cb4daee4cf45fa937304bceb60a81.jpg
436	\N	TT Games	WB Games	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2116221-box_lbatman.png
437	\N	TT Games	WB Games	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2199357-box_lbm2.png
438	\N	Nintendo EAD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2560979-mkwiiclean.jpg
439	\N	Nintendo EAD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3541576-4801018091-co213.png
440	\N	Valve Corporation	Valve Corporation	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2525229-box_portal.png
441	\N	Valve Corporation	Valve Corporation	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3140541-box_p2.png
442	\N	Nintendo EAD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/1/12541/3318265-square.jpg
443	\N	Nintendo EAD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2338815-skywardcolor.jpg
444	\N	Irrational Games	2K Games	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2584146-bioshock.jpg
445	\N	2K Marin	2K Games	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2584143-bioshock2.jpg
446	\N	Irrational Games	2K Games	https://www.giantbomb.com/a/uploads/scale_medium/0/4344/2379677-bioshockinfinite_boxart.jpg
447	\N	CD Projekt Red	Bandai Namco Entertainment Europe	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3536201-2945734-thewitcher3-wildhuntc.jpg
448	\N	CD Projekt Red	CD Projekt SA	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3627486-zqqg225xounivn8nd2dqepuec.jpg
449	\N	Bluepoint Games	Sony Interactive Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3531791-6595349937-co2kj.jpg
450	\N	Quantic Dream	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3022574-box_dbh.png
451	\N	Torus Games Pty. Ltd.	Activision	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2284712-box_smbfny.png
452	\N	Bethesda Game Studios	Bethesda Softworks	https://www.giantbomb.com/a/uploads/scale_medium/0/3661/1895988-skyrim.png
453	\N	Bethesda Game Studios	Bethesda Softworks	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3572173-7416910434-EGS_Fallout4_BethesdaGameStudios_S2_1200x1600-2b307b78180f2a6a2dc89ab1c20b3c1b.jpg
454	\N	Obsidian Entertainment	Bethesda Softworks	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3572176-3108026057-EGS_FalloutNewVegas_ObsidianEntertainment_S2_1200x1600-866fe8b8f56e2e7bb862c49bf0627b9a.jpg
455	\N	Bethesda Game Studios	Bethesda Softworks	https://www.giantbomb.com/a/uploads/scale_medium/0/1992/3382135-5994371684-Capa_.jpg
456	\N	Hello Games	Hello Games	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3534916-2927125-noman%27ssky.jpg
457	\N	Mojang AB	Mojang AB	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3020660-box_mc.png
458	\N	Re-Logic	505 Games	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2994875-box_terr.png
459	\N	ConcernedApe	Chucklefish Games	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3019631-box_sv.png
460	\N	Nintendo EAD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/1/12541/3312461-sq_n64_supermario64.jpg
461	\N	Atari	Atari	https://www.giantbomb.com/a/uploads/scale_medium/0/7465/817419-atari___pong_1973.jpg
462	\N	Atari	Atari	https://www.giantbomb.com/a/uploads/scale_medium/9/93770/2367670-a2600_asteroids_au.jpg
463	\N	AcademySoft	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/9/93770/2362306-nes_tetris.jpg
464	\N	Rockstar North	Rockstar Games	https://www.giantbomb.com/a/uploads/scale_medium/9/93770/2446670-gta_1446_a023.jpg
465	\N	Rockstar Vancouver	Rockstar Games	https://www.giantbomb.com/a/uploads/scale_medium/0/3699/3171225-bully.jpg
466	\N	Retro Studios	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2550128-primeclean.jpg
467	\N	id Software	Bethesda Softworks	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2849529-doom.jpg
468	\N	id Software	Bethesda Softworks	https://www.giantbomb.com/a/uploads/scale_medium/0/176/3163865-cover_art_of_doom_eternal.png
469	\N	Bungie	Xbox Game Studios	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2550125-haloce.jpg
470	\N	Bungie	Xbox Game Studios	https://www.giantbomb.com/a/uploads/scale_medium/3/34651/3095500-key%20art.jpeg
471	\N	Bungie	Xbox Game Studios	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2079826-box_halo3.png
472	\N	Epic Games	Xbox Game Studios	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/1970470-box_gow.png
473	\N	Konami	Konami	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/1789942-box_mgsgbc.png
474	\N	Bloober Team	Konami	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3636111-3173455172-co5l7.jpg
475	\N	Remedy Entertainment Ltd.	Xbox Game Studios	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3534678-1563504-alan_wake_logo_vertical.jpg
476	\N	Remedy Entertainment Ltd.	Epic Games	https://www.giantbomb.com/a/uploads/scale_medium/33/338034/3471123-5459601797-EGS_AlanWake2_RemedyEntertainment_S2_1200x1600-c7c8091ddac0f9669c8e5905bca88aaa.jpg
477	\N	Rocksteady Studios Ltd	Eidos Interactive	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2606172-batmanaaclean.jpg
478	\N	Rocksteady Studios Ltd	WB Games	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2606170-batmanaccleanbox.jpg
479	\N	WB Games Montréal	WB Games	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2485321-486263.jpg
480	\N	Rocksteady Studios Ltd	WB Games	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2606852-keyfull%209237457203.jpg
481	\N	Bend Studio	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/0/1992/3080121-screen%20shot%202019-02-09%20at%205.08.15%20pm.png
482	\N	Guerrilla Games	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3627458-2920671-horizon-zerodawnv2c.jpg
483	\N	Guerrilla Games	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3532852-3302306-2531003212-mv5bz.jpg
484	\N	FromSoftware, Inc.	Bandai Namco Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2555200-dsclean.jpg
485	\N	FromSoftware, Inc.	Bandai Namco Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2555227-ds2clean.jpg
486	\N	FromSoftware, Inc.	Bandai Namco Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3081870-box_ds3.jpg
487	\N	Supergiant Games	Supergiant Games	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3532848-5240368293-co39v.png
488	\N	n-Space	Activision	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/1784886-box_cod4mwds.png
489	\N	The Creative Assembly	Sega	https://www.giantbomb.com/a/uploads/scale_medium/14/146828/2580333-alien-isolation-2.jpg
490	\N	Mobius Games	Annapurna Interactive	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3619008-4140724473-OW_Epic_PortraitStorefront_1200x1600-99dad6c305834ce163cabb944d909304.jpg
491	\N	Bluepoint Games	Sony Interactive Entertainment America	https://www.giantbomb.com/a/uploads/scale_medium/0/3699/2997724-shadow%20of%20the%20colossus.jpg
492	\N	BioWare	LucasArts Entertainment Company LLC	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3566812-cb2d0b4dd4bd5fdef091ccfb987cd757.jpg
493	\N	Capcom	Capcom	https://www.giantbomb.com/a/uploads/scale_medium/11/118833/2895081-cover_b.jpg
494	\N	FromSoftware, Inc.	Activision	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/3046323-box_ssdt.png
495	\N	Valve Corporation	Sierra	https://www.giantbomb.com/a/uploads/scale_medium/8/87790/2489840-box_hl1.png
496	\N	Valve Corporation	Electronic Arts	https://www.giantbomb.com/a/uploads/scale_medium/0/2787/625502-hl2box.jpg
497	\N	Sora	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3515903-1095697296-hero_.jpg
498	\N	Nintendo EPD	Nintendo	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3567514-5010990638-co1mx.png
499	\N	Remedy Entertainment Ltd.	505 Games	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3531429-6627325944-co2ev.jpg
500	\N	Tarsier Studios	Bandai Namco Entertainment	https://www.giantbomb.com/a/uploads/scale_medium/20/201266/3618908-dff7d64b31c38c403e4824e1cd91f957c.jpg
501	\N	Treyarch	Activision	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2555390-blops2.jpg
502	\N	Treyarch	Activision	https://www.giantbomb.com/a/uploads/scale_medium/8/82063/2794573-codblops3.jpg
\.


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reviewer
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 72, true);


--
-- Name: users_userID_seq; Type: SEQUENCE SET; Schema: public; Owner: reviewer
--

SELECT pg_catalog.setval('public."users_userID_seq"', 48, true);


--
-- Name: users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("userID");


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY ("mediaID");


--
-- Name: bookmark bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT bookmark_pkey PRIMARY KEY ("userID", "mediaID");


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY ("mediaID");


--
-- Name: friendsList friendsList_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public."friendsList"
    ADD CONSTRAINT "friendsList_pkey" PRIMARY KEY ("userID", "fID");


--
-- Name: friends friends_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY ("fID");


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY ("gID");


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY ("mediaId");


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY ("mediaID");


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY ("userID", "mediaID");


--
-- Name: videoGames videoGames_pkey; Type: CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public."videoGames"
    ADD CONSTRAINT "videoGames_pkey" PRIMARY KEY ("mediaID");


--
-- Name: friendsList FK_fID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public."friendsList"
    ADD CONSTRAINT "FK_fID" FOREIGN KEY ("fID") REFERENCES public.friends("fID");


--
-- Name: albums FK_gID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT "FK_gID" FOREIGN KEY ("gID") REFERENCES public.genres("gID");


--
-- Name: books FK_gID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT "FK_gID" FOREIGN KEY ("gID") REFERENCES public.genres("gID");


--
-- Name: movies FK_gID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "FK_gID" FOREIGN KEY ("gID") REFERENCES public.genres("gID");


--
-- Name: videoGames FK_gID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public."videoGames"
    ADD CONSTRAINT "FK_gID" FOREIGN KEY ("gID") REFERENCES public.genres("gID");


--
-- Name: albums FK_mediaID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT "FK_mediaID" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaId");


--
-- Name: bookmark FK_mediaID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT "FK_mediaID" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaId");


--
-- Name: books FK_mediaID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT "FK_mediaID" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaId");


--
-- Name: videoGames FK_mediaID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public."videoGames"
    ADD CONSTRAINT "FK_mediaID" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaId");


--
-- Name: reviews FK_mediaID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "FK_mediaID" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaId");


--
-- Name: friendsList FK_userID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public."friendsList"
    ADD CONSTRAINT "FK_userID" FOREIGN KEY ("userID") REFERENCES public.users("userID");


--
-- Name: bookmark FK_userID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT "FK_userID" FOREIGN KEY ("userID") REFERENCES public.users("userID");


--
-- Name: reviews FK_userID; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "FK_userID" FOREIGN KEY ("userID") REFERENCES public.users("userID");


--
-- Name: movies movies_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: reviewer
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "movies_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaId");


--
-- PostgreSQL database dump complete
--

