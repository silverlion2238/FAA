import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/data.dart';


const Map<String, Map<String, String>> translations = {
  'en': {
    'appTitle': 'My App',
    'search': 'Search',
    'results': 'Results',
    'settings': 'Settings',
    'chatbot': 'Chatbot',
    'wrongInput': 'Wrong Input',
    'noResults': 'No results with these options',
    'ok': 'OK',
    'yes': 'Yes',
    'no': 'No',
    'next': 'Next',
    'back': 'Back',
    'BreathAff' : 'He\'s breathing',
    'BreathNeg' : 'He\'s not breathing',

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


    'TypeOfPain':'Is the pain burning?',
    'Cracks?': 'Was a cracking sound heard or felt?',
    'Joints?': 'Is the affected area in the joint area?',
    'isBreathing?': 'Is the affected person breathing?',
    'isBreathingStep1': '1. First, call out to the person several times and if they do not respond, shaking them by the shoulders is enough to determine if first aid will be needed.',
    'isBreathingStep2': '2. Clear the affected person\'s airway by laying them on their back and tilting their head (one hand on the forehead, the other under the chin). Never support the head or neck with anything.',
    'isBreathingStep3': '3. Spend about 10 seconds checking the breathing and watch the chest movements. In that time, there should be 2-3 normal breaths.',



    'RecPos' : 'Recovery Position',
    'RecPos1' : '1. Kneel by the casualty and straighten their legs. If they are wearing glasses, or have any bulky items in their pockets, remove them.',
    'RecPos2' : '2. Place the arm that is nearest to you at a right angle to their body, with the elbow bent and their palm facing upwards.',
    'RecPos3' : '3. Bring their other arm across their chest and place the back of their hand against the cheek nearest to you. Hold it there.',
    'RecPos4' : '4. With your other hand, pull their far knee up so that their foot is flat on the floor.',
    'RecPos5' : '5. Keeping the back of the casualty\'s hand pressed against their cheek, pull on the far leg to roll the casualty towards you on to their side. You can then adjust the top leg so that it is bent at a right angle.',
    'RecPos6' : '6. Gently tilt the casualty\'s head back and lift their chin to make sure their airway stays open. ',




    //'Nosebleed': 'Nosebleed',
    'NosebleedDesc': 'A nosebleed is a common problem characterized by bleeding from the nose. Nosebleeds can be caused by dry air, allergies, infection, or trauma. Nosebleeds are characterized by bleeding from the nose, headache, and dizziness.',
    'NosebleedSolution1': '1. Sit the affected person with their head tilted forward',
    'NosebleedSolution2': '2. Pinch the soft part of the nose just below the bony bridge for at least 10 minutes without interruption',
    'NosebleedSolution3': '3. Loosen clothing around the neck',
    'NosebleedSolution4': '4. Ask the affected person to breathe through their mouth',
    'NosebleedSolution5': '5. Advise the affected person not to blow their nose, cough, or swallow',
    'NosebleedSolution6': '6. After stopping the bleeding, the affected person should remain calm for 4 hours and avoid drinking hot beverages (if bleeding lasts more than 30 minutes, call for medical help)',

    'Burns': 'Burns',
    'BurnsDesc': 'Burns are injuries to the skin that are caused by heat, chemicals, electricity, or radiation. Burns are characterized by redness, blistering, and pain. Burns are classified into three categories: first-degree burns, second-degree burns, and third-degree burns.',
    
    'BurnsSolution1': '1. For burns larger than the palm, arrange transport to the hospital',
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
    'ChemicalBurnsSolution6': '6. Arrange transport to the hospital',

    'Fracture': 'Fracture',
    'FractureDesc': 'A fracture is a bone injury that is characterized by a break or crack in the bone. Fractures are often caused by a sudden movement or trauma. Fractures are characterized by pain, swelling, and limited movement.',
    'FractureSolution1': '1. Create support on the injured limb by placing hands above and below the fracture site',
    'FractureSolution2': '2. Immobilize so that one joint below and one joint above the fracture is immobilized',
    'FractureSolution3': '3. Place the broken upper limb in a sling made of a triangular scarf or immobilize it in the sleeve of clothing (a broken collarbone is treated the same way)',
    'FractureSolution4': '4. For severe deformity, use various types of padding to immobilize (pillows, blankets, ...)',
    'FractureSolution5': '5. Call an ambulance or go to the emergency room',

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
    'EpilepsySolution4': '4. If the person is unknown to you or is having a seizure for the first time, call an ambulance (155)',

    'AsthmaAttack': 'Asthma Attack',
    'AsthmaAttackDesc': 'An asthma attack is a chronic respiratory condition characterized by inflammation of the airways. Asthma attacks are often caused by allergens, exercise, or stress. Asthma attacks are characterized by wheezing, coughing, and shortness of breath.',
    'AsthmaAttackSolution1': '1. Help the affected person use their inhaler',
    'AsthmaAttackSolution2': '2. Encourage the person to breathe slowly and seat them in a comfortable position',
    'AsthmaAttackSolution3': '3. If the attack does not stop after a few minutes, use the inhaler again',
    'AsthmaAttackSolution4': '4. If nothing helps, call an ambulance',
    'AsthmaAttackSolution5': '5. While waiting, monitor vital signs',

    /*Old Data
    'Cough': 'Cough',
    'Sweating': 'Sweating',
    'Bleeding': 'Bleeding',
    'MildCut': 'Mild Cut',
    'SevereCut': 'Severe Cut',
    'CantMove': 'Can\'t Move',
    'PainInArea': 'Pain in Area',
    'Swelling': 'Swelling',
    'Bruise': 'Bruise',
    'Fever': 'Fever',


    'CommonCold': 'Common Cold',
    'CommonColdDesc': 'Common cold is a common viral infection of the nose and throat. It is caused by viruses that spread through the air when an infected person coughs or sneezes. Common cold is characterized by sore throat, sneezing, coughing, stuffy nose, and runny nose. It usually occurs in the winter months.',
    'CommonColdSolution': 'To treat the common cold, it is recommended to take pain and fever medications that relieve sore throat and reduce fever. It is also important to drink plenty of fluids and rest.',

    'MildCut': 'Mild Cut',
    'MildCutDesc': 'A mild cut is a skin injury that has not penetrated deeper tissue. Mild cuts are often caused by sharp objects such as knives, glass, or nails. Mild cuts are characterized by pain, bleeding, and swelling.',
    'MildCutSolution': 'To treat mild cuts, it is recommended to wash the wound with soap and water to prevent infection. The wound should be cleaned and disinfected, and then a bandage can be applied.',

    'SevereCut': 'Severe Cut',
    'SevereCutDesc': 'A severe cut is a skin injury that has penetrated deeper tissue such as muscles, tendons, or bones. Severe cuts are often caused by sharp or blunt objects such as knives, glass, or metal. Severe cuts are characterized by pain, bleeding, and swelling.',
    'SevereCutSolution': 'To treat severe cuts, it is recommended to wash the wound with soap and water to prevent infection. The wound should be cleaned and disinfected, and then the bleeding should be stopped and the wound should be bandaged.',

    'Nosebleed': 'Nosebleed',
    'NosebleedDesc': 'A nosebleed is a common problem that is characterized by bleeding from the nose. Nosebleeds can be caused by dry air, allergies, infection, or trauma. Nosebleeds are characterized by bleeding from the nose, headache, and dizziness.',
    'NosebleedSolution': 'To stop a nosebleed, it is recommended to tilt the head forward and pinch the nose shut. The nose should be pinched for 10-15 minutes to stop the bleeding. It is also important to avoid blowing the nose and to remain calm.',

    'Sprain': 'Sprain',
    'SprainDesc': 'A sprain is a joint injury that is characterized by a sudden twist or impact to the joint. Sprains are often caused by a sudden movement or fall. Sprains are characterized by pain, swelling, and limited movement.',
    'SprainSolution': 'To treat sprains, it is recommended to apply ice to the affected area to reduce swelling and pain. The affected area should also be wrapped with an elastic bandage and kept still.',

    'Dislocation': 'Dislocation',
    'DislocationDesc': 'A dislocation is a joint injury that is characterized by the displacement of the joint head from the joint socket. Dislocations are often caused by a sudden movement or fall. Dislocations are characterized by pain, swelling, and limited movement.',
    'DislocationSolution': 'To treat dislocations, it is recommended to apply ice to the affected area to reduce swelling and pain. The affected area should also be wrapped with an elastic bandage and kept still.',

    'BoneFracture': 'Bone Fracture',
    'BoneFractureDesc': 'A bone fracture is a bone injury that is characterized by a break or crack in the bone. Bone fractures are often caused by a sudden movement or trauma. Bone fractures are characterized by pain, swelling, and limited movement.',
    'BoneFractureSolution': 'To treat bone fractures, it is recommended to stop the bleeding and immobilize the affected area. The affected area should also be wrapped with an elastic bandage and kept still.',
    */
  },
  'sk': {
    'appTitle': 'Moja Aplikácia',
    'search': 'Hľadať',
    'results': 'Výsledky',
    'settings': 'Nastavenia',
    'chatbot': 'Chatbot',
    'wrongInput': 'Nesprávny Vstup',
    'noResults': 'Žiadne výsledky s týmito možnosťami',
    'ok': 'OK',
    'yes': 'Áno',
    'no': 'Nie',
    'next': 'Ďalej',
    'back': 'Späť',
    'BreathAff' : 'Dýcha',
    'BreathNeg' : 'Nedýcha',
    

    'primaryText': 'Primárny Text(otázka)',
    'description': 'Popis',
    'placeholder1': 'placeholder1-sk',
    'placeholder2': 'placeholder2-sk',
    'placeholder3': 'placeholder3-sk',

    'App Theme': 'Svetelný režim aplikácie: ',
    'System': 'Systémový',
    'Light': 'Svetlý',
    'Dark': 'Tmavý',
    'Language': 'Jazyk: ',
    'audio' : 'Hlas: ',
    'Mute': 'Zvuk: ',

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

    'TypeOfPain':'Je bolesť pálivá?',
    'Cracks?': 'Bolo počuť alebo cítiť zlomenie?',
    'Joints?': 'Je postihnuté miesto v oblasti kĺbu?',
    'isBreathing?': 'Dýchá postihnutý?',
    'isBreathingStep1': '1. Najprv osobu niekoľkokrát hlasno oslovte a pokiaľ nereaguje, zatrasenie za ramená postačí na určenie, či bude treba poskytnúť prvú pomoc.',
    'isBreathingStep2': '2. Uvoľnite postihnutému dýchacie cesty tak, že ho položíte na chrbát a zakloníte mu hlavu (jednou rukou na čelo, druhou pod bradu). Nikdy hlavu ani krk ničím nepodkladajte. ',
    'isBreathingStep3': '3. Zhruba 10 sekúnd venujte kontrole dýchania a sledujte pohyby hrudníka. Za ten čas by malo dôjsťby malo dôjsť k 2-3 normálnym nádychom.',

    'RecPos' : 'Stabilizovaná poloha',
    'RecPos1' : '1. Kľaknite si pri postihnutom a narovnajte mu nohy. Ak má okuliare alebo vreckové predmety v kapsách, odstráňte ich.',
    'RecPos2' : '2. Ruku, ktorá je vám najbližšie, položte v pravom uhle k telu, s lakťom pokrčeným a dlaňou smerujúcou nahor.',
    'RecPos3' : '3. Vzdialenejšiu ruku postihnutého položte cez hrudník dlaňou na líce, ktoré je vám najbližšie. Držte ju tam.',
    'RecPos4' : '4. Druhou rukou postihnutému pokrčte koleno ďalej od vás tak, aby bolo chodidlo rovno na zemi.',
    'RecPos5' : '5. Držiac postihnutému dlaň na líci, ťahajte za pokrčenú nohu, aby ste postihnutého otočili na bok. Hornú nohu upravte tak, aby bola pokrčená v pravom uhle.',
    'RecPos6' : '6. Jemne postihnutému nakloňte hlavu dozadu a zdvihnite mu bradu, aby mu dýchacie cesty ostali otvorené.',

    'cpr' : 'KPR',
    'cpr1' : '1. Zavolajte záchranku (155)',
    'cpr2' : '2. Nakloňte sa kolmo nad hrudník a stláčajte ho do hĺbky 5-6 cm asi 100-120 krát za minútu(tempo ako pieseň Stayin\' Alive)',
    'cpr3' : '3. Po každom 30 stlačení urobte 2 nádychy (ak dýchať nechcete, pokračujte len v stlačovaní)',
    'cpr4' : '4. Pokračujte v KPR, kým sa neobjaví záchranka. Použite AED, ak je k dispozícii.',

    'Burns': 'Popáleniny',
    'BurnsDesc': 'Popáleniny sú poranenia kože, ktoré sú spôsobené teplom, chemikáliami, elektrinou alebo žiarením. Popáleniny sa prejavujú červenaním, tvorbou pľuzgierov a bolesťou. Popáleniny sa klasifikujú do troch kategórií: popáleniny prvého stupňa, popáleniny druhého stupňa a popáleniny tretieho stupňa.',
    
    'BurnsSolution1': '1. Pri popálenine väčšej ako dlaň zariaďte odvoz do nemocnice',
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
    'ChemicalBurnsSolution6': '6. Zariaďte transport do nemocnice',

    



    'Fracture': 'Zlomenina',
    'FractureDesc': 'Zlomenina je poranenie kosti, ktoré je charakterizované zlomením alebo trhlinou v kosti. Zlomeniny sú často spôsobené náhlym pohybom alebo traumou. Zlomeniny sa prejavujú bolesťou, opuchom a obmedzeným pohybom.',
   
    'FractureSolution1': '1. Vytvorte oporu na poranenej končatine podložením rúk pod aj nad miestom zlomeniny',
    'FractureSolution2': '2. Znehybnite tak, aby bol znehybnený jeden kĺb pod aj nad zlomeninou',
    'FractureSolution3': '3. Zlomenú hornú končatinu dajte do závesu z trojrohej šatky alebo znehybnite v rukáve odevu (zlomenina kľúčnej kosti sa ošetruje tak isto)',
    'FractureSolution4': '4. Pri veľkej deformácii využite rôzne druhy obloženia na znehybnenie (vankúše, deky, ...)',
    'FractureSolution5': '5. Zavolajte záchranku alebo choďte na pohotovosť',


    'Dislocation': 'Vykĺbenina',
    'DislocationDesc': 'Vykĺbenina je poranenie kĺbu, ktoré je charakterizované vypadnutím kĺbovej hlavice z kĺbovej jamky. Vyklbenia sú často spôsobené náhlym pohybom alebo pádom. Vyklbenie sa prejavuje bolesťou, opuchom a obmedzeným pohybom.',
    
    'DislocationSolution1': '1. Uložte postihnutého do najpohodlnejšej polohy',
    'DislocationSolution2': '2. Spevnite končatinu (podložte vankúšom)',
    'DislocationSolution3': '3. Ak je možné, znehybnite závesom alebo obväzom',
    'DislocationSolution4': '4. Nechajte postihnutého aby si sám podopieral vykĺbenú časť',
    'DislocationSolution5': '5. Zariaďte prevoz do nemocnice',



    //'Nosebleed': 'Krvácanie z nosa',
    'NosebleedDesc': 'Krvácanie z nosa je bežný problém, ktorý sa prejavuje krvácaním z nosa. Krvácanie z nosa môže byť spôsobené suchým vzduchom, alergiami, infekciou alebo traumou. Krvácanie z nosa sa prejavuje krvácaním z nosa, bolesťou hlavy a závratmi.',
    
    'NosebleedSolution1': '1. Posaďte postihnutého s predklonenou hlavou',
    'NosebleedSolution2': '2. Tlačte na mäkkú časť nosa tesne pod kostenou tvrdou  časťou najmenej 10 min. bez prerušenia',
    'NosebleedSolution3': '3. Uvoľnite odev okolo krku',
    'NosebleedSolution4': '4. Požiadajte postihnutého, aby dýchal ústami',
    'NosebleedSolution5': '5. Poraďte postihnutému, aby nesmrkal, nekašľal a neprehĺtal',
    'NosebleedSolution6': '6. Po zastavení krvácania musí zostať postihnutý v kľude 4 hodiny a nepiť teplé nápoje (ak krvácanie trvá viac ako 30 min. zavolajte lekársku pomoc)',


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
    'EpilepsySolution4': '4. Ak je vám dotyčná osoba neznáma alebo má záchvat po prví raz, treba volať záchranku (155)',


    'AsthmaAttack': 'Astmatický Záchvat',
    'AsthmaAttackDesc': 'Astmatický záchvat je chronický respiračný stav, ktorý je charakterizovaný zápalom dýchacích ciest. Astmatické záchvaty sú často spôsobené alergénmi, cvičením alebo stresom. Astmatické záchvaty sa prejavujú sipotom, kašľom a dýchavičnosťou.',

    'AsthmaAttackSolution1': '1. Pomôžte postihnutému použiť inhalátor',
    'AsthmaAttackSolution2': '2. Vyzvite postihnutého aby dýchal pomaly a usaďte ho do pohodlnej polohy',
    'AsthmaAttackSolution3': '3. Ak záchvat po pár minútach neprestane, opäť použite inhalátor',
    'AsthmaAttackSolution4': '4. V prípade, že nič nepomáha volajte záchrannú službu',
    'AsthmaAttackSolution5': '5. Kým čakáte kontrolujte vitálne funkcie',

    



    /*Old Data
    'Cough': 'Kašeľ',
    'Sweating': 'Potenie',
    'Bleeding': 'Krvácanie',
    'MildCut': 'Plytká rana',
    'SevereCut': 'Hlboká rana',
    'CantMove': 'Znemožnený pohyb',
    'PainInArea': 'Bolesť v oblasti poranenia',
    'Swelling': 'Opuch',
    'Bruise': 'Modrina',
    'Fever': 'Horúčka',

    'CommonCold': 'Nádcha',
    'CommonColdDesc': 'Nádcha je bežný vírusový infekčný ochorenie nosohltanu. Je spôsobená vírusmi, ktoré sa šíria vzduchom, keď chorý kýcha alebo kašle. Nádcha sa prejavuje bolesťou v hrdle, kýchaním, kašľom, upchatým nosom a výtokom z nosa. Väčšinou sa prejavuje v zimných mesiacoch.',
    'CommonColdSolution': 'Na liečbu nádchy sa odporúča užívať lieky proti bolesti a horúčke, ktoré zmiernia bolesť v hrdle a znížia horúčku. Dôležité je tiež piť veľa tekutín a odpočívať.',

    'MildCut': 'Plytká rana',
    'MildCutDesc': 'Plytká rana je poranenie kože, ktoré nezasiahlo hlbšie tkanivo. Plytké rany sú často spôsobené ostrými predmetmi, ako sú nože, sklo alebo nôžky. Plytké rany sa prejavujú bolesťou, krvácaním a opuchom.',
    'MildCutSolution': 'Na liečbu plytkých rán sa odporúča umyť ranu mydlom a vodou, aby sa zabránilo infekcii. Rana by sa mala vyčistiť a dezinfikovať a následne sa na ňu môže aplikovať náplasť.',

    'SevereCut': 'Hlboká rana',
    'SevereCutDesc': 'Hlboká rana je poranenie kože, ktoré zasiahlo hlbšie tkanivo, ako sú svaly, šľachy alebo kosti. Hlboké rany sú často spôsobené ostrými alebo tupými predmetmi, ako sú nože, sklo alebo kov. Hlboké rany sa prejavujú bolesťou, krvácaním a opuchom.',
    'SevereCutSolution': 'Na liečbu hlbokých rán sa odporúča umyť ranu mydlom a vodou, aby sa zabránilo infekcii. Rana by sa mala vyčistiť a dezinfikovať a následne by sa mala zastaviť krvácanie a rana by sa mala zabandážovať.',

    'Nosebleed': 'Krvácanie z nosa',
    'NosebleedDesc': 'Krvácanie z nosa je bežný problém, ktorý sa prejavuje krvácaním z nosa. Krvácanie z nosa môže byť spôsobené suchým vzduchom, alergiami, infekciou alebo traumou. Krvácanie z nosa sa prejavuje krvácaním z nosa, bolesťou hlavy a závratmi.',
    'NosebleedSolution': 'Na zastavenie krvácania z nosa sa odporúča skloniť hlavu dopredu a stlačiť nos krútením. Nos by sa mal stlačiť po dobu 10-15 minút, aby sa zastavilo krvácanie. Dôležité je tiež vyhnúť sa vyfukovaniu nosa a držať sa pokojne.',

    'Sprain': 'Výron',
    'SprainDesc': 'Výron je poranenie kĺbu, ktoré sa prejavuje náhlym ťahom alebo nárazom kĺbu. Výrony sú často spôsobené náhlym pohybom alebo pádom. Výron sa prejavuje bolesťou, opuchom a obmedzeným pohybom.',
    'SprainSolution': 'Na liečbu výronov sa odporúča aplikovať ľad na postihnuté miesto, aby sa zmiernil opuch a bolesť. Postihnuté miesto by sa malo tiež zviazať elastickým obväzom a držať sa pokojne.',

    'Dislocation': 'Vyklbenie',
    'DislocationDesc': 'Vyklbenie je poranenie kĺbu, ktoré sa prejavuje vypadnutím kĺbovej hlavice z kĺbovej jamky. Vyklbenia sú často spôsobené náhlym pohybom alebo pádom. Vyklbenie sa prejavuje bolesťou, opuchom a obmedzeným pohybom.',
    'DislocationSolution': 'Na liečbu vyklbení sa odporúča aplikovať ľad na postihnuté miesto, aby sa zmiernil opuch a bolesť. Postihnuté miesto by sa malo tiež zviazať elastickým obväzom a držať sa pokojne.',

    'BoneFracture': 'Zlomenina kosti',
    'BoneFractureDesc': 'Zlomenina kosti je poranenie kosti, ktoré sa prejavuje zlomením alebo trhlinou v kosti. Zlomeniny kostí sú často spôsobené náhlym pohybom alebo traumou. Zlomenina kosti sa prejavuje bolesťou, opuchom a obmedzeným pohybom.',
    'BoneFractureSolution': 'Na liečbu zlomenín kostí sa odporúča zastaviť krvácanie a znehybniť postihnuté miesto. Postihnuté miesto by sa malo tiež zviazať elastickým obväzom a držať sa pokojne.',
    */
  },
};