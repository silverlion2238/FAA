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

    'primaryText': 'Primary Text(question)',
    'description': 'Description',
    'placeholder1': 'placeholder1-en',
    'placeholder2': 'placeholder2-en',
    'placeholder3': 'placeholder3-en',

    'App Theme: ': 'App Theme: ',
    'System': 'System',
    'Light': 'Light',
    'Dark': 'Dark',
    'Language: ': 'Language: ',

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

    'Burns': 'Burns',
    'BurnsDesc': 'Burns are injuries to the skin that are caused by heat, chemicals, electricity, or radiation. Burns are characterized by redness, blistering, and pain. Burns are classified into three categories: first-degree burns, second-degree burns, and third-degree burns.',
    'BurnsSolution': 'To treat burns, it is recommended to cool the burn with cool water and cover it with a clean bandage. It is important to avoid breaking the blisters and to seek medical attention if the burn is severe.',

    'ChemicalBurns' : 'Chemical Burns',
    'ChemicalBurnsDesc': 'Chemical burns are injuries to the skin that are caused by exposure to chemicals. Chemical burns are characterized by redness, blistering, and pain. Chemical burns are classified into three categories: first-degree burns, second-degree burns, and third-degree burns.',
    'ChemicalBurnsSolution': 'To treat chemical burns, it is recommended to remove the chemical from the skin and rinse the affected area with water. It is important to avoid rubbing the skin and to seek medical attention if the burn is severe.',

    'Fracture': 'Fracture',
    'FractureDesc': 'A fracture is a bone injury that is characterized by a break or crack in the bone. Fractures are often caused by a sudden movement or trauma. Fractures are characterized by pain, swelling, and limited movement.',
    'FractureSolution': 'To treat fractures, it is recommended to immobilize the affected area and seek medical attention. The affected area should also be wrapped with an elastic bandage and kept still.',

    'Dislocation': 'Dislocation',
    'DislocationDesc': 'A dislocation is a joint injury that is characterized by the displacement of the joint head from the joint socket. Dislocations are often caused by a sudden movement or fall. Dislocations are characterized by pain, swelling, and limited movement.',
    'DislocationSolution': 'To treat dislocations, it is recommended to apply ice to the affected area to reduce swelling and pain. The affected area should also be wrapped with an elastic bandage and kept still.',

    //'Nosebleed': 'Nosebleed',
    'NosebleedDesc': 'A nosebleed is a common problem that is characterized by bleeding from the nose. Nosebleeds can be caused by dry air, allergies, infection, or trauma. Nosebleeds are characterized by bleeding from the nose, headache, and dizziness.',
    'NosebleedSolution': 'To stop a nosebleed, it is recommended to tilt the head forward and pinch the nose shut. The nose should be pinched for 10-15 minutes to stop the bleeding. It is also important to avoid blowing the nose and to remain calm.',

    'Hypervent': 'Hyperventilation',
    'HyperventDesc': 'Hyperventilation is a breathing disorder that is characterized by rapid or deep breathing. Hyperventilation is often caused by anxiety, stress, or panic. Hyperventilation is characterized by rapid breathing, dizziness, and tingling in the hands and feet.',
    'HyperventSolution': 'To treat hyperventilation, it is recommended to breathe into a paper bag to increase carbon dioxide levels in the blood. It is also important to practice relaxation techniques and seek medical attention if symptoms persist.',

    'Unconscious': 'Unconsciousness',
    'UnconsciousDesc': 'Unconsciousness is a state of being unaware of one\'s surroundings and unable to respond to stimuli. Unconsciousness is often caused by head injury, stroke, or drug overdose. Unconsciousness is characterized by unresponsiveness, shallow breathing, and pale skin.',
    'UnconsciousSolution': 'To treat unconsciousness, it is recommended to check for breathing and pulse and to place the person in the recovery position. It is also important to seek medical attention immediately.',

    'Epilepsy': 'Epileptic Seizure',
    'EpilepsyDesc': 'Epilepsy is a neurological disorder that is characterized by recurrent seizures. Epilepsy is often caused by abnormal brain activity. Epilepsy is characterized by loss of consciousness, convulsions, and muscle spasms.',
    'EpilepsySolution': 'To treat epilepsy, it is recommended to protect the person from injury and to stay with the person until the seizure stops. It is also important to seek medical attention if the seizure lasts longer than five minutes.',

    'AsthmaAttack': 'Asthma Attack',
    'AsthmaAttackDesc': 'Asthma is a chronic respiratory condition that is characterized by inflammation of the airways. Asthma attacks are often triggered by allergens, exercise, or stress. Asthma attacks are characterized by wheezing, coughing, and shortness of breath.',
    'AsthmaAttackSolution': 'To treat asthma attacks, it is recommended to use a rescue inhaler to open the airways and to sit up straight and remain calm. It is also important to seek medical attention if symptoms do not improve.',




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

    'primaryText': 'Primárny Text(otázka)',
    'description': 'Popis',
    'placeholder1': 'placeholder1-sk',
    'placeholder2': 'placeholder2-sk',
    'placeholder3': 'placeholder3-sk',

    'App Theme: ': 'Svetelný režim aplikácie: ',
    'System': 'Systémový',
    'Light': 'Svetlý',
    'Dark': 'Tmavý',
    'Language: ': 'Jazyk: ',

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




    'Burns': 'Popáleniny',
    'BurnsDesc': 'Popáleniny sú poranenia kože, ktoré sú spôsobené teplom, chemikáliami, elektrinou alebo žiarením. Popáleniny sa prejavujú červenaním, tvorbou pľuzgierov a bolesťou. Popáleniny sa klasifikujú do troch kategórií: popáleniny prvého stupňa, popáleniny druhého stupňa a popáleniny tretieho stupňa.',
    'BurnsSolution': 'Na liečbu popálenín sa odporúča chladiť popáleninu studenou vodou a zakryť ju čistou obväzom. Dôležité je tiež zabrániť prasknutiu pľuzgierov a vyhľadať lekársku pomoc, ak je popálenina vážna.',

    'ChemicalBurns' : 'Poleptanie',
    'ChemicalBurnsDesc': 'Poleptanie je poranenie kože, ktoré je spôsobené vystavením sa chemikáliám. Poleptanie sa prejavuje červenaním, tvorbou pľuzgierov a bolesťou. Poleptanie sa klasifikuje do troch kategórií: popáleniny prvého stupňa, popáleniny druhého stupňa a popáleniny tretieho stupňa.',
    'ChemicalBurnsSolution': 'Na liečbu poleptaní sa odporúča odstrániť chemikáliu zo pokožky a opláchnuť postihnutú oblasť vodou. Dôležité je tiež neotierať pokožku a vyhľadať lekársku pomoc, ak je poleptanie vážne.',

    'Fracture': 'Zlomenina',
    'FractureDesc': 'Zlomenina je poranenie kosti, ktoré je charakterizované zlomením alebo trhlinou v kosti. Zlomeniny sú často spôsobené náhlym pohybom alebo traumou. Zlomeniny sa prejavujú bolesťou, opuchom a obmedzeným pohybom.',
    'FractureSolution': 'Na liečbu zlomenín sa odporúča imobilizovať postihnutú oblasť a vyhľadať lekársku pomoc. Postihnuté miesto by sa malo tiež zviazať elastickým obväzom a držať sa pokojne.',

    'Dislocation': 'Vyklbenie',
    'DislocationDesc': 'Vyklbenie je poranenie kĺbu, ktoré je charakterizované vypadnutím kĺbovej hlavice z kĺbovej jamky. Vyklbenia sú často spôsobené náhlym pohybom alebo pádom. Vyklbenie sa prejavuje bolesťou, opuchom a obmedzeným pohybom.',
    'DislocationSolution': 'Na liečbu vyklbení sa odporúča aplikovať ľad na postihnuté miesto, aby sa zmiernil opuch a bolesť. Postihnuté miesto by sa malo tiež zviazať elastickým obväzom a držať sa pokojne.',

    //'Nosebleed': 'Krvácanie z nosa',
    'NosebleedDesc': 'Krvácanie z nosa je bežný problém, ktorý sa prejavuje krvácaním z nosa. Krvácanie z nosa môže byť spôsobené suchým vzduchom, alergiami, infekciou alebo traumou. Krvácanie z nosa sa prejavuje krvácaním z nosa, bolesťou hlavy a závratmi.',
    'NosebleedSolution': 'Na zastavenie krvácania z nosa sa odporúča skloniť hlavu dopredu a stlačiť nos krútením. Nos by sa mal stlačiť po dobu 10-15 minút, aby sa zastavilo krvácanie. Dôležité je tiež vyhnúť sa vyfukovaniu nosa a držať sa pokojne.',

    'Hypervent': 'Hyperventilácia',
    'HyperventDesc': 'Hyperventilácia je porucha dýchania, ktorá je charakterizovaná rýchlym alebo hlbokým dýchaním. Hyperventilácia je často spôsobená úzkosťou, stresom alebo panikou. Hyperventilácia sa prejavuje rýchlym dýchaním, závratmi a brnením v rukách a nohách.',
    'HyperventSolution': 'Na liečbu hyperventilácie sa odporúča dýchať do papierového vrecka, aby sa zvýšila hladina oxidu uhličitého v krvi. Dôležité je tiež cvičiť relaxačné techniky a vyhľadať lekársku pomoc, ak príznaky pretrvávajú.',

    'Unconscious': 'Bezvedomie',
    'UnconsciousDesc': 'Bezvedomie je stav, keď človek nie je schopný vnímať svoje okolie a reagovať na podnety. Bezvedomie je často spôsobené poranením hlavy, mozgovou príhodou alebo predávkovaním drogami. Bezvedomie sa prejavuje neodpovednosťou, plytkým dýchaním a bledou pokožkou.',
    'UnconsciousSolution': 'Na liečbu bezvedomia sa odporúča skontrolovať dýchanie a pulz a umiestniť osobu do polohy na bok. Dôležité je tiež okamžite vyhľadať lekársku pomoc.',

    'Epilepsy': 'Epileptický Záchvat',
    'EpilepsyDesc': 'Epilepsia je neurologické ochorenie, ktoré je charakterizované opakujúcimi sa záchvatmi. Epilepsia je často spôsobená nezvyčajnou aktivitou mozgu. Epilepsia sa prejavuje strátou vedomia, kŕčmi a svalovými kŕčmi.',
    'EpilepsySolution': 'Na liečbu epilepsie sa odporúča chrániť osobu pred zranením a zostať s ňou, kým záchvat neustane. Dôležité je tiež vyhľadať lekársku pomoc, ak záchvat trvá dlhšie ako päť minút.',

    'AsthmaAttack': 'Astmatický Záchvat',
    'AsthmaAttackDesc': 'Astmatický záchvat je chronický respiračný stav, ktorý je charakterizovaný zápalom dýchacích ciest. Astmatické záchvaty sú často spôsobené alergénmi, cvičením alebo stresom. Astmatické záchvaty sa prejavujú sipotom, kašľom a dýchavičnosťou.',
    'AsthmaAttackSolution': 'Na liečbu astmatických záchvatov sa odporúča použiť záchranný inhalátor na otvorenie dýchacích ciest a posadiť sa rovno a zostať pokojný. Dôležité je tiež vyhľadať lekársku pomoc, ak sa príznaky nezlepšujú.',

    



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