import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/data.dart';


const Map<String, Map<String, String>> translations = {
  'en': {
    'appTitle': 'First aid for schools',
    'search': 'Symptoms',
    'results': 'Cases',
    'settings': 'Settings',
    'chatbot': 'Chatbot',
    'home': 'Home',
    'wrongInput': 'Wrong Input',
    'noResults': 'Cannot evaluate.',
    'unclearResults': 'Cannot evaluate. Maybe you meant this:',
    'ok': 'OK',
    'yes': 'Yes',
    'no': 'No',
    'next': 'Next',
    'back': 'Back',
    'BreathAff' : 'He\'s breathing',
    'BreathNeg' : 'He\'s not breathing',
    'chooseLayout' : 'Choose Layout',
    'Arm' : 'Arm',
    'Leg' : 'Leg',

    'primaryText': 'Primary Text(question)',
    'description': 'Description',
    'placeholder1': 'placeholder1-en',
    'placeholder2': 'placeholder2-en',
    'placeholder3': 'placeholder3-en',

    'App Theme': 'App Theme: ',
    'System': 'System',
    'Light': 'Light',
    'Dark': 'Dark',
    'Language': 'Language: ',
    'audio' : 'Voice: ',
    'Mute': 'Audio: ',

    'RedLight': 'Light',
    'RedDark': 'Dark',

    'Solution1': 'Solution1 - en',
    'Solution2': 'Solution2 - en',
    'Solution3': 'Solution3 - en',
    'Solution4': 'Solution4 - en',

    
    //Correct Data
    'Bleeding': 'Bleeding',
    'Blister': 'Blisters',
    'CrackingSound': 'Cracking Sound (possible fracture)',
    'Foaming' : 'Foam in Mouth',
    'Immobility': 'Immobility',
    'LaboredBreath': 'Labored Breathing',
    'Nausea': 'Nausea',
    'Nosebleed': 'Nosebleed',
    'Numbness': 'Numbness',
    'Pain' : 'Pain',
    'RapidBreath': 'Rapid Breathing',
    'RapidPulse': 'Rapid Pulse',
    'Reddening': 'Reddened Skin',
    'SlurredSpeech': 'Slurred Speech',
    'Swelling': 'Swelling',
    'Twitching': 'Twitching',
    'Unresponsive': 'Unconsciousness',
    'Wheezing': 'Wheezing',


    'TypeOfPain':'Have you been splashed with acid',
    'Cracks?': 'Was a cracking sound heard or felt?',
    'Joints?': 'Is the affected area in the joint area?',
    'isBreathing?': 'Is the affected person breathing?',
    'isBreathingStep1': '1. First, call out to the person several times and if they do not respond, gently shake them',
    'isBreathingStep2': '2. Lay the affected person on their back and clear their airways by tilting their head',
    'isBreathingStep3': '3. Within 10 seconds, watch for chest rise and feel their breath',


    'RecPos' : 'Recovery Position',
    'RecPos1' : '1. Kneel by the casualty and straighten their legs. If they are wearing glasses, or have any bulky items in their pockets, remove them.',
    'RecPos2' : '2. Place the arm that is nearest to you at a right angle to their body, with the elbow bent and their palm facing upwards.',
    'RecPos3' : '3. Bring their other arm across their chest and place the back of their hand against the cheek nearest to you. Hold it there.',
    'RecPos4' : '4. With your other hand, pull their far knee up so that their foot is flat on the floor.',
    'RecPos5' : '5. Keeping the back of the casualty\'s hand pressed against their cheek, pull on the far leg to roll the casualty towards you on to their side. You can then adjust the top leg so that it is bent at a right angle.',
    'RecPos6' : '6. Gently tilt the casualty\'s head back and lift their chin to make sure their airway stays open. ',


    'cpr' : 'CPR',
    'cpr1' : '1. Call an ambulance (155)',
    'cpr2' : '2. Lay the casualty flat on a firm surface',
    'cpr3' : '3. Check if you have an AED available, if so, follow its instructions',
    'cpr4' : '4. Press the center of the chest with the heel of your hand 30 times',
    'cpr5' : '5. Tilt the head back and pinch the nose',
    'cpr6' : '6. Breathe into the casualty 2 times',
    'cpr7' : '7. Repeat until you can',



    //'Nosebleed': 'Nosebleed',
    'NosebleedDesc': 'A nosebleed is a common problem characterized by bleeding from the nose. Nosebleeds can be caused by dry air, allergies, infection, or trauma. Nosebleeds are characterized by bleeding from the nose, headache, and dizziness.',
    'NosebleedSolution1': '1. Sit the affected person with their head tilted forward',
    'NosebleedSolution2': '2. Pinch the soft part of the nose just below the bony bridge for at least 10 minutes without interruption',
    'NosebleedSolution3': '3. Loosen clothing around the neck',
    'NosebleedSolution4': '4. Ask the affected person to breathe through their mouth',
    'NosebleedSolution5': '5. Advise the affected person not to blow their nose, cough, or swallow',
    'NosebleedSolution6': '6. After stopping the bleeding, the affected person should remain calm for 4 hours and avoid drinking hot beverages (if bleeding lasts more than 30 minutes, call an ambulance (155) or arrange transport to the hospital)',

    'Burns': 'Burns',
    'BurnsDesc': 'Burns are injuries to the skin that are caused by heat, chemicals, electricity, or radiation. Burns are characterized by redness, blistering, and pain. Burns are classified into three categories: first-degree burns, second-degree burns, and third-degree burns.',
    
    'BurnsSolution1': '1. For burns larger than the palm, arrange transport to the hospital (155)',
    'BurnsSolution2': '2. Otherwise, immediately cool the area with cold water for at least 10 minutes',
    'BurnsSolution3': '3. Remove jewelry or clothing from the wound',
    'BurnsSolution4': '4. After cooling, cover the wound with a bandage or clean cloth',

    'ChemicalBurns' : 'Chemical Burns',
    'ChemicalBurnsDesc': 'Chemical burns are injuries to the skin that are caused by exposure to chemicals. Chemical burns are characterized by redness, blistering, and pain. Chemical burns are classified into three categories: first-degree burns, second-degree burns, and third-degree burns.',
    
    'ChemicalBurnsSolution1': '1. For powdered chemicals, remove them dry first',
    'ChemicalBurnsSolution2': '2. Rinse liquid chemicals with a stream of clean water for 20 minutes',
    'ChemicalBurnsSolution3': '3. If clothing is affected, remove it while rinsing',
    'ChemicalBurnsSolution4': '4. If eyes are affected, rinse them with plenty of water',
    'ChemicalBurnsSolution5': '5. If a chemical is ingested, do not induce vomiting, rinse the mouth repeatedly and then give the person 2 dl of water to drink sip by sip',
    'ChemicalBurnsSolution6': '6. Call an ambulance or arrange transport to the hospital (155)',


    // Ak nemáte prostriedky k znehybneniu zlomenej nohy, priviažte ju o zdravú
    'FractureSolLeg1': '1. Immobilize so that one joint below and one joint above the fracture is immobilized',
    'FractureSolLeg2': '2. If you do not have the means to immobilize the broken leg, tie it to the healthy one',
    'FractureSolLeg3': '3. Zavolajte záchranku alebo zariadte prenos do nemocnice (155)',


    'FractureSolArm1' : '1. To immobilize the arm use an arm sling. ',
    'FractureSolArm2' : '2. Ask the casualty to support their arm with their other hand. ',
    'FractureSolArm3' : '3. Gently slide a triangular bandage under the arm. The point of the triangle should be under the elbow of the injured arm. Bring the top end of the bandage around the back to the neck.',
    'FractureSolArm4' : '4. Fold the lower end of the bandage up over the forearm to meet the top of the bandage at the shoulder of the injured side.',
    'FractureSolArm5' : '5. Tie the two ends of the bandage together in a reef knot above their collar bone and tuck in the free ends.',
    'FractureSolArm6' : '6. Adjust the sling so that it supports their arm all the way to the end of their little finger.',
    'FractureSolArm7' : '7. Make sure that the edge of the bandage by the elbow is secured by twisting the fabric and tucking it in, or using a safety pin to fasten.',
    'FractureSolArm8' : '8. Call the ambulance (155). Check the circulation in their fingertips every 10 minutes. Press their nail for five seconds until it turns pale, then release to see if the colour returns within two seconds.',





    'Fracture': 'Fracture',
    'FractureDesc': 'A fracture is a bone injury that is characterized by a break or crack in the bone. Fractures are often caused by a sudden movement or trauma. Fractures are characterized by pain, swelling, and limited movement.',
    'FractureSolution0': '1. Immobilize so that one joint below and one joint above the fracture is immobilized. Where is the fracture located?',
    'FractureSolution1': '1. Create support on the injured limb by placing hands above and below the fracture site',
    'FractureSolution2': '2. Immobilize so that one joint below and one joint above the fracture is immobilized',
    'FractureSolution3': '3. Place the broken upper limb in a sling made of a triangular scarf or immobilize it in the sleeve of clothing (a broken collarbone is treated the same way)',
    'FractureSolution4': '4. For severe deformity, use various types of padding to immobilize (pillows, blankets, ...)',
    'FractureSolution5': '5. Call an ambulance or go to the hospital (155)',

    'Dislocation': 'Dislocation',
    'DislocationDesc': 'A dislocation is a joint injury that is characterized by the displacement of the joint head from the joint socket. Dislocations are often caused by a sudden movement or fall. Dislocations are characterized by pain, swelling, and limited movement.',
    'DislocationSolution1': '1. Place the affected person in the most comfortable position',
    'DislocationSolution2': '2. Stabilize the limb (support with a pillow)',
    'DislocationSolution3': '3. If possible, immobilize with a sling or bandage',
    'DislocationSolution4': '4. Allow the affected person to support the dislocated part themselves',
    'DislocationSolution5': '5. Arrange transport to the hospital',

    'Hypervent': 'Hyperventilation',
    'HyperventDesc': 'Hyperventilation is a breathing disorder characterized by rapid or deep breathing. Hyperventilation is often caused by anxiety, stress, or panic. Hyperventilation is characterized by rapid breathing, dizziness, and tingling in the hands and feet.',
    'HyperventSolution1': '1. Calm the person, if in a busy environment, take them to a quiet room',
    'HyperventSolution2': '2. Loosen tight clothing and seat the person in a comfortable position',
    'HyperventSolution3': '3. Help the affected person calm their breathing (breathe together with them)',

    'Unconscious': 'Unconsciousness',
    'UnconsciousDesc': 'Unconsciousness is a state where a person is unable to perceive their surroundings and respond to stimuli. Unconsciousness is often caused by head injury, stroke, or drug overdose. Unconsciousness is characterized by unresponsiveness, shallow breathing, and pale skin.',
    'UnconsciousSolution1': '1. Place the affected person in a recovery position',
    'UnconsciousSolution2': '2. Call an ambulance (155)',
    'UnconsciousSolution3': '3. Repeatedly check for breathing and consciousness',

    'Epilepsy': 'Epileptic Seizure',
    'EpilepsyDesc': 'Epilepsy is a neurological disorder characterized by recurrent seizures. Epilepsy is often caused by unusual brain activity. Epilepsy is characterized by loss of consciousness, convulsions, and muscle spasms.',
    'EpilepsySolution1': '1. Prevent the person from injuring themselves (remove dangerous objects from their surroundings)',
    'EpilepsySolution2': '2. Place a soft material (jacket, pillow, ...) or hands under the person\'s head',
    'EpilepsySolution3': '3. After the convulsions subside, check the person for injuries',
    'EpilepsySolution4': '4. If the person is unknown to you or is having a seizure for the first time, call an ambulance or arrange transport to the hospital (155)',

    'AsthmaAttack': 'Asthma Attack',
    'AsthmaAttackDesc': 'An asthma attack is a chronic respiratory condition characterized by inflammation of the airways. Asthma attacks are often caused by allergens, exercise, or stress. Asthma attacks are characterized by wheezing, coughing, and shortness of breath.',
    'AsthmaAttackSolution1': '1. Help the affected person use their inhaler',
    'AsthmaAttackSolution2': '2. Encourage the person to breathe slowly and seat them in a comfortable position',
    'AsthmaAttackSolution3': '3. If the attack does not stop after a few minutes, use the inhaler again',
    'AsthmaAttackSolution4': '4. If nothing helps, call an ambulance or arrange transport to the hospital (155)',
    'AsthmaAttackSolution5': '5. While waiting, monitor vital signs',

  },




  // Slovak    <===============================================================================================================================>
  'sk': {
    'appTitle': 'Prvá pomoc pre školákov',
    'search': 'Príznaky',
    'results': 'Prípady',
    'settings': 'Nastavenia',
    'chatbot': 'Chatbot',
    'home': 'Domov',
    'wrongInput': 'Nesprávny Vstup',
    'noResults': 'Neviem vyhodnotiť.',
    'unclearResults': 'Neviem vyhodnotiť. Možno ste mysleli toto:',
    'ok': 'OK',
    'yes': 'Áno',
    'no': 'Nie',
    'next': 'Ďalej',
    'back': 'Späť',
    'BreathAff' : 'Dýcha',
    'BreathNeg' : 'Nedýcha',
    'chooseLayout' : 'Vyberte si rozloženie',
    'Arm' : 'Ruka',
    'Leg' : 'Noha',
    

    'primaryText': 'Primárny Text(otázka)',
    'description': 'Popis',
    'placeholder1': 'placeholder1-sk',
    'placeholder2': 'placeholder2-sk',
    'placeholder3': 'placeholder3-sk',

    'App Theme': 'Svetelný režim: ',
    'System': 'Systémový',
    'Light': 'Svetlý',
    'Dark': 'Tmavý',
    'Language': 'Jazyk: ',
    'audio' : 'Hlas: ',
    'Mute': 'Zvuk: ',

    'RedLight': 'Svetlý',
    'RedDark': 'Tmavý',

    'Solution1': 'Solution1 - sk',
    'Solution2': 'Solution2 - sk',
    'Solution3': 'Solution3 - sk',
    'Solution4': 'Solution4 - sk',
    

    //Correct Data
    'Bleeding': 'Krvácanie',
    'Blister': 'Pľuzgiere',
    'CrackingSound': 'Praskavý zvuk (možná zlomenina)',
    'Foaming' : 'Pena v ústach',
    'Immobility': 'Znemožnený pohyb',
    'LaboredBreath': 'Namáhavé dýchanie',
    'Nausea': 'Nevoľnosť',
    'Nosebleed': 'Krvácanie z nosa',
    'Numbness': 'Strnulosť',
    'Pain' : 'Bolesť',
    'RapidBreath': 'Dýchavičnosť',
    'RapidPulse': 'Zrýchlený pulz',
    'Reddening': 'Zčervenanie kože',
    'SlurredSpeech': 'Ťažkopádna reč',
    'Swelling': 'Opuch',
    'Twitching': 'Nekontrolovateľné zášklby',
    'Unresponsive': 'Bezvedomie',
    'Wheezing': 'Sipot',

    'TypeOfPain':'Obliali ste sa kyselinou alebo žieravinou?',
    'Cracks?': 'Bolo počuť alebo cítiť zlomenie?',
    'Joints?': 'Je postihnuté miesto v oblasti kĺbu?',
    'isBreathing?': 'Dýchá postihnutý?',
    'isBreathingStep1': '1. Najprv niekoľkokrát oslovte osobu a ak nereaguje, jemne ju zatraste',
    'isBreathingStep2': '2. Položte postihnutého na chrbát a uvolnite mu dýchacie cesty pomocou záklonu hlavy',
    'isBreathingStep3': '3. V priebehu 10 sekúnd sledujte, či sa dvíha hrudník a či cítite jeho dych. Ak dýcha dajte ho do stabilizovanej polohy, inak okamžite začnite KPR.',

    'RecPos' : 'Stabilizovaná poloha',
    'RecPos1' : '1. Kľaknite si pri postihnutom a narovnajte mu nohy. Ak má okuliare alebo vreckové predmety v kapsách, odstráňte ich.',
    'RecPos2' : '2. Ruku, ktorá je vám najbližšie, položte v pravom uhle k telu, s lakťom pokrčeným a dlaňou smerujúcou nahor.',
    'RecPos3' : '3. Vzdialenejšiu ruku postihnutého položte cez hrudník dlaňou na líce, ktoré je vám najbližšie. Držte ju tam.',
    'RecPos4' : '4. Druhou rukou postihnutému pokrčte koleno ďalej od vás tak, aby bolo chodidlo rovno na zemi.',
    'RecPos5' : '5. Držiac postihnutému dlaň na líci, ťahajte za pokrčenú nohu, aby ste postihnutého otočili na bok. Hornú nohu upravte tak, aby bola pokrčená v pravom uhle.',
    'RecPos6' : '6. Jemne postihnutému nakloňte hlavu dozadu a zdvihnite mu bradu, aby mu dýchacie cesty ostali otvorené.',

    'cpr' : 'KPR',
    'cpr1' : '1. Zavolajte záchranku (155)',
    'cpr2' : '2. Uložte postihnutého rovno na tvrdú podložku',
    'cpr3' : '3. Pozrite sa či nemáte dostupné AED, ak áno, postupujte podľa jeho pokynov',	
    'cpr4' : '4. Stláčajte stred hrudníka hranou dlane 30-krát',
    'cpr5' : '5. Zakloňte hlavu a upchajte nos ',
    'cpr6' : '6. Vdýchnite do postihnutého 2x',
    'cpr7' : '7. Opakujte kým vládzete',

    'Burns': 'Popáleniny',
    'BurnsDesc': 'Popáleniny sú poranenia kože, ktoré sú spôsobené teplom, chemikáliami, elektrinou alebo žiarením. Popáleniny sa prejavujú červenaním, tvorbou pľuzgierov a bolesťou. Popáleniny sa klasifikujú do troch kategórií: popáleniny prvého stupňa, popáleniny druhého stupňa a popáleniny tretieho stupňa.',
    
    'BurnsSolution1': '1. Pri popálenine väčšej ako dlaň zariaďte odvoz do nemocnice (155)',
    'BurnsSolution2': '2. Inak okamžite chlaďte miesto studenou vodou najmenej 10 minút',
    'BurnsSolution3': '3. Odstráňte z rany náramky alebo oblečenie',
    'BurnsSolution4': '4. Po chladení prikryte ranu obväzom alebo nejakou čistou tkaninou',


    'ChemicalBurns' : 'Poleptanie',
    'ChemicalBurnsDesc': 'Poleptanie je poranenie kože, ktoré je spôsobené vystavením sa chemikáliám. Poleptanie sa prejavuje červenaním, tvorbou pľuzgierov a bolesťou. Poleptanie sa klasifikuje do troch kategórií: popáleniny prvého stupňa, popáleniny druhého stupňa a popáleniny tretieho stupňa.',
    
    'ChemicalBurnsSolution1': '1. Pri práškových žieravinách najprv odstráňte nasucho',
    'ChemicalBurnsSolution2': '2. Tekuté žieraviny odstraňujte 20 minút prúdom čistej vody',
    'ChemicalBurnsSolution3': '3. Pri zasiahnutí oblečenia odstraňujte odev spolu s oplachovaním',
    'ChemicalBurnsSolution4': '4. Ak sú zasiahnuté oči vypláchnite ich väčším množstvom vody',
    'ChemicalBurnsSolution5': '5. Pri vypití žieraviny nevyvolávajte zvracanie, opakovane vyplachujte ústa a potom dajte postihnutému vypiť 2 dcl vody po dúškoch',
    'ChemicalBurnsSolution6': '6. Zavolajte záchranku alebo zariadte prenos do nemocnice (155)',

    
    'FractureSolLeg1': '1. Znehybnite tak, aby bol znehybnený jeden kĺb pod aj nad zlomeninou.',
    'FractureSolLeg2': '2. Ak nemáte prostriedky k znehybneniu zlomenej nohy, priviažte ju o zdravú.',
    'FractureSolLeg3': '3. Zavolajte záchranku alebo zariadte prenos do nemocnice (155)',


    'FractureSolArm1' : '1. Dajte ruku do závesu. ',
    'FractureSolArm2' : '2. Požiadajte postihnutého, aby si ruku podoprel druhou rukou. ',
    'FractureSolArm3' : '3. Jemne posuňte trojrohý obväz pod ruku. Bod trojuholníka by mal byť pod lakťom postihnutej ruky. Vrchný koniec obväzu priveďte okolo chrbta na krk.',
    'FractureSolArm4' : '4. Spodný koniec obväzu preložte cez predlaktie, aby sa stretol s vrchným koncom obväzu na ramene postihnutej strany.',
    'FractureSolArm5' : '5. Zviažte oba konce obväzu nad kľúčnou kosťou',
    'FractureSolArm6' : '6. Obväz nastavte tak, aby podopieral ruku až po koniec malíčka.',
    'FractureSolArm7' : '7. Uistite sa, že okraj obväzu pri lakťovej časti je zabezpečený zatočením rohu, alebo použitím zatváracieho špendlíka.',
    'FractureSolArm8' : '8. Zavolajte záchranku (155). Každých 10 minút skontrolujte krvný obeh v končekoch prstov. Tlačte na nechet poraňenej ruky po dobu piatich sekúnd, až kým nezbledne, potom uvoľnite a sledujte, či sa farba vráti do dvoch sekúnd.',




    'Fracture': 'Zlomenina',
    'FractureDesc': 'Zlomenina je poranenie kosti, ktoré je charakterizované zlomením alebo trhlinou v kosti. Zlomeniny sú často spôsobené náhlym pohybom alebo traumou. Zlomeniny sa prejavujú bolesťou, opuchom a obmedzeným pohybom.',
    'FractureSolution0': '1. Nehýbte so zlomeninou pokiaľ je to možné. Kde sa zlomenina nachádza?',
    'FractureSolution1': '1. Vytvorte oporu na poranenej končatine podložením rúk pod aj nad miestom zlomeniny',
    'FractureSolution2': '2. Znehybnite tak, aby bol znehybnený jeden kĺb pod aj nad zlomeninou',
    'FractureSolution3': '3. Zlomenú hornú končatinu dajte do závesu z trojrohej šatky alebo znehybnite v rukáve odevu (zlomenina kľúčnej kosti sa ošetruje tak isto)',
    'FractureSolution4': '4. Pri veľkej deformácii využite rôzne druhy obloženia na znehybnenie (vankúše, deky, ...)',
    'FractureSolution5': '5. Zavolajte záchranku alebo zariadte prenos do nemocnice (155)',


    'Dislocation': 'Vykĺbenina',
    'DislocationDesc': 'Vykĺbenina je poranenie kĺbu, ktoré je charakterizované vypadnutím kĺbovej hlavice z kĺbovej jamky. Vyklbenia sú často spôsobené náhlym pohybom alebo pádom. Vyklbenie sa prejavuje bolesťou, opuchom a obmedzeným pohybom.',
    
    'DislocationSolution1': '1. Uložte postihnutého do najpohodlnejšej polohy',
    'DislocationSolution2': '2. Spevnite končatinu (podložte vankúšom)',
    'DislocationSolution3': '3. Ak je možné, znehybnite závesom alebo obväzom',
    'DislocationSolution4': '4. Nechajte postihnutého aby si sám podopieral vykĺbenú časť',
    'DislocationSolution5': '5. Zavolajte záchranku alebo zariadte prenos do nemocnice (155)',



    //'Nosebleed': 'Krvácanie z nosa',
    'NosebleedDesc': 'Krvácanie z nosa je bežný problém, ktorý sa prejavuje krvácaním z nosa. Krvácanie z nosa môže byť spôsobené suchým vzduchom, alergiami, infekciou alebo traumou. Krvácanie z nosa sa prejavuje krvácaním z nosa, bolesťou hlavy a závratmi.',
    
    'NosebleedSolution1': '1. Posaďte postihnutého s predklonenou hlavou',
    'NosebleedSolution2': '2. Tlačte na mäkkú časť nosa tesne pod kostenou tvrdou  časťou najmenej 10 min. bez prerušenia',
    'NosebleedSolution3': '3. Uvoľnite odev okolo krku',
    'NosebleedSolution4': '4. Požiadajte postihnutého, aby dýchal ústami',
    'NosebleedSolution5': '5. Poraďte postihnutému, aby nesmrkal, nekašľal a neprehĺtal',
    'NosebleedSolution6': '6. Po zastavení krvácania musí zostať postihnutý v kľude 4 hodiny a nepiť teplé nápoje (ak krvácanie trvá viac ako 30 min. zavolajte záchranku alebo zariadte prenos do nemocnice.)',


    'Hypervent': 'Hyperventilácia',
    'HyperventDesc': 'Hyperventilácia je porucha dýchania, ktorá je charakterizovaná rýchlym alebo hlbokým dýchaním. Hyperventilácia je často spôsobená úzkosťou, stresom alebo panikou. Hyperventilácia sa prejavuje rýchlym dýchaním, závratmi a brnením v rukách a nohách.',
    
    'HyperventSolution1': '1. Upokojujte dotyčnú osobu, ak ste v rušnom prostredí odveďte osobu do pokojnej miestnosti',
    'HyperventSolution2': '2. Uvoľnite tesný odev a usaďte dotyčného do pre neho pohodlnej polohy',
    'HyperventSolution3': '3. Pomôžte postihnutému upokojiť dýchanie (dýchajte spolu s ním)',


    'Unconscious': 'Bezvedomie',
    'UnconsciousDesc': 'Bezvedomie je stav, keď človek nie je schopný vnímať svoje okolie a reagovať na podnety. Bezvedomie je často spôsobené poranením hlavy, mozgovou príhodou alebo predávkovaním drogami. Bezvedomie sa prejavuje neodpovednosťou, plytkým dýchaním a bledou pokožkou.',
    
    'UnconsciousSolution1': '1. Uložte postihnutého do stabilizovanej polohy',
    'UnconsciousSolution2': '2. Privolajte záchranku (155)',
    'UnconsciousSolution3': '3. Opakovane sledujte prítomnosť dýchania a stav vedomia',


    'Epilepsy': 'Epileptický Záchvat',
    'EpilepsyDesc': 'Epilepsia je neurologické ochorenie, ktoré je charakterizované opakujúcimi sa záchvatmi. Epilepsia je často spôsobená nezvyčajnou aktivitou mozgu. Epilepsia sa prejavuje strátou vedomia, kŕčmi a svalovými kŕčmi.',
    
    'EpilepsySolution1': '1. Zabráňte tomu, aby sa postihnutý zranil (odstráňte nebezpečné predmety z jeho okolia)',
    'EpilepsySolution2': '2. Podložte pod hlavu dotyčného mäkký materiál (bunda, vankúš,...) alebo ruky',
    'EpilepsySolution3': '3. Po odznení kŕčov treba postihnutého prezrieť, či neutrpel nejaké zranenia',
    'EpilepsySolution4': '4. Ak je vám dotyčná osoba neznáma alebo má záchvat po prví raz, zavolajte záchranku alebo zariadte prenos do nemocnice. (155)',


    'AsthmaAttack': 'Astmatický Záchvat',
    'AsthmaAttackDesc': 'Astmatický záchvat je chronický respiračný stav, ktorý je charakterizovaný zápalom dýchacích ciest. Astmatické záchvaty sú často spôsobené alergénmi, cvičením alebo stresom. Astmatické záchvaty sa prejavujú sipotom, kašľom a dýchavičnosťou.',

    'AsthmaAttackSolution1': '1. Pomôžte postihnutému použiť inhalátor',
    'AsthmaAttackSolution2': '2. Vyzvite postihnutého aby dýchal pomaly a usaďte ho do pohodlnej polohy',
    'AsthmaAttackSolution3': '3. Ak záchvat po pár minútach neprestane, opäť použite inhalátor',
    'AsthmaAttackSolution4': '4. V prípade, že nič nepomáha zavolajte záchranku alebo zariadte prenos do nemocnice (155)',
    'AsthmaAttackSolution5': '5. Kým čakáte kontrolujte vitálne funkcie',
  },
};