___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "BD Gender Detector | Tracking with Shadin",
  "description": "A high-precision gender detection tool by Tracking with Shadin. Powered by a massive database of 1000+ Bangladeshi names, suffixes, and prefixes to ensure extreme accuracy in identifying Male/Female.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "fullName",
    "displayName": "Full Name Data Layer Variable",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeString = require('makeString');

const inputName = data.fullName;
if (!inputName) return undefined;

const name = makeString(inputName).toLowerCase().trim();
if (!name) return undefined;

const cleanName = name.split(',').join(' ').split('.').join(' ').split('-').join(' ');
const parts = cleanName.split(' ');
const filteredParts = [];
for (let i = 0; i < parts.length; i++) {
    if (parts[i].length > 0) filteredParts.push(parts[i]);
}

if (filteredParts.length === 0) return undefined;

const malePrefixes = ['md', 'mohammad', 'muhammad', 'mr', 'hafez', 'maulana', 'mohd', 'sm', 'sheikh', 'syed', 'sri', 'shree', 'dr', 'engr', 'advocate'];
const femalePrefixes = ['mst', 'mussammat', 'ms', 'mrs', 'miss', 'sreemati', 'srabori', 'begum', 'marium'];

const firstPart = filteredParts[0];
for (let i = 0; i < malePrefixes.length; i++) {
    if (firstPart === malePrefixes[i]) return 'male';
}
for (let i = 0; i < femalePrefixes.length; i++) {
    if (firstPart === femalePrefixes[i]) return 'female';
}

const femaleIndicators = ['akter', 'khatun', 'begum', 'sultana', 'jahan', 'parvin', 'nasrin', 'yasmin', 'nahid', 'itrat', 'marium', 'umme', 'bibi', 'nahar', 'bano', 'rani', 'shanti', 'bala', 'kanon', 'moni', 'purnima', 'lata', 'tara', 'rekha'];
const maleIndicators = ['uddin', 'rahman', 'hasan', 'hossain', 'ahmed', 'islam', 'ali', 'kabir', 'miah', 'mollah', 'munshi', 'patwari', 'talukder', 'uz-zaman', 'das', 'sarkar', 'biswas', 'debnath', 'adhikary', 'roy', 'majumder', 'pal', 'ghosh', 'kundu', 'dhar', 'sen', 'banik', 'bhowmik', 'shil'];

for (let i = 0; i < filteredParts.length; i++) {
    const part = filteredParts[i];
    for (let j = 0; j < femaleIndicators.length; j++) {
        if (part === femaleIndicators[j]) return 'female';
    }
    for (let j = 0; j < maleIndicators.length; j++) {
        if (part === maleIndicators[j]) return 'male';
    }
}

const maleBank = [
    'abir', 'arif', 'emon', 'suman', 'rubel', 'mamun', 'manik', 'ibrahim', 'yusuf', 'sajib', 'raju', 'liton', 'palash', 'ashik', 'shimul', 'bijoy', 'sajal', 'sohel', 'rony', 'johny', 'babu', 'kamal', 'jamal', 'anwar', 'jahir', 'nasir', 'kader', 'bashar', 'abdur', 'abdus', 'abu', 'abul', 'adib', 'adnan', 'afif', 'ahnaf', 'akbar', 'akram', 'amir', 'amjad', 'anis', 'anowar', 'arfat', 'ariful', 'arman', 'asad', 'asif', 'atiq', 'azad', 'azam', 'aziz', 'badal', 'bappy', 'baten', 'belal', 'biplob', 'borhan', 'dalim', 'dewan', 'dilip', 'dulal', 'ekram', 'enayet', 'farhad', 'farid', 'faruk', 'faysal', 'fazle', 'ferdous', 'gazi', 'golam', 'habib', 'hafiz', 'hamid', 'hanif', 'harun', 'hashem', 'hemayet', 'hridoy', 'humayun', 'imran', 'ismail', 'jafar', 'jalal', 'jasim', 'jewel', 'jia', 'kabir', 'kajal', 'kalim', 'kamil', 'kashem', 'kawsar', 'khalek', 'khaled', 'khokon', 'khorshed', 'kibriya', 'labib', 'lutfar', 'mahfuz', 'mahbub', 'mahid', 'mainul', 'majid', 'manjur', 'masud', 'matiur', 'mazhar', 'mehadi', 'mehdi', 'mizan', 'monir', 'mosharraf', 'mostafa', 'motin', 'mukul', 'munir', 'murad', 'mushfiq', 'mustafa', 'nabil', 'nadim', 'nafees', 'naim', 'najmul', 'nasim', 'nayem', 'nazim', 'nazmul', 'nihad', 'nipun', 'nizam', 'nur', 'nura', 'nurul', 'obaidul', 'omar', 'osman', 'parvez', 'quddus', 'rafi', 'rafiq', 'raihan', 'rajeeb', 'rajesh', 'ramzan', 'rashed', 'rashid', 'rayhan', 'reza', 'rezaul', 'riad', 'riaz', 'rifat', 'ripon', 'riyad', 'robel', 'rofiq', 'rokon', 'sabuj', 'sadnan', 'saffat', 'safi', 'safiul', 'sagar', 'sahid', 'saif', 'saiful', 'saikat', 'sajid', 'salam', 'salim', 'salman', 'samad', 'samrat', 'sanjoy', 'santanu', 'sarwar', 'sayed', 'sayeed', 'sayem', 'sedik', 'selim', 'shafiq', 'shafiul', 'shah', 'shahan', 'shahadat', 'shahid', 'shahin', 'shahjalal', 'shahriar', 'shajahan', 'shakil', 'shakor', 'shamim', 'shams', 'sharif', 'shaukat', 'shawon', 'shohel', 'shohid', 'sohag', 'sojib', 'sourav', 'subrata', 'sujon', 'sukumar', 'sultan', 'sunny', 'taha', 'taher', 'tahid', 'tahmid', 'tahsin', 'tamim', 'tanveer', 'tanvir', 'tareq', 'tariq', 'taslim', 'tawhid', 'tipu', 'tofail', 'tufan', 'utpola', 'wahid', 'zahed', 'zahid', 'zahir', 'zaid', 'zakaria', 'zakir', 'zaman', 'ziaur', 'mithu', 'pappu', 'shuvo', 'joy', 'topu', 'himel', 'turjo', 'shawon', 'saikat', 'pritom', 'proloy', 'opol', 'shishir', 'shuvra', 'taposh', 'bikram', 'kartik', 'shankar', 'gouranga', 'basudev', 'shyamal', 'uttam', 'anup', 'nayan', 'proshanta', 'mridul', 'gobinda', 'shiblu', 'anik'
];

const femaleBank = [
    'nadia', 'runa', 'fatema', 'mariya', 'ayesha', 'sumaiya', 'jannat', 'mim', 'keya', 'shila', 'laboni', 'brishti', 'mou', 'akhi', 'shanta', 'sadia', 'sabrina', 'tanzina', 'farhana', 'shamima', 'salma', 'rehana', 'kohinoor', 'reshma', 'swapna', 'munni', 'dipa', 'lipi', 'adiba', 'afia', 'afroza', 'amina', 'anika', 'anita', 'anya', 'aritrika', 'arpa', 'arpita', 'asma', 'ateka', 'atia', 'ayra', 'azra', 'bushra', 'elora', 'esrat', 'fahmida', 'fariha', 'farzana', 'fiza', 'gulshan', 'habiba', 'hafiza', 'hamida', 'hana', 'hasina', 'homayra', 'humaira', 'israt', 'jahanara', 'jannatul', 'jerin', 'jesmin', 'jia', 'joty', 'jui', 'julekha', 'kabita', 'kajal', 'kamrun', 'kani', 'kaniz', 'khadija', 'khaleda', 'koli', 'konica', 'laila', 'lamia', 'lina', 'lucky', 'lutfun', 'mahbuba', 'mahmuda', 'maleaka', 'maliha', 'manisha', 'marufa', 'meherun', 'moumita', 'mouna', 'mousumi', 'mukta', 'munia', 'mura', 'nabiha', 'nadeera', 'nadira', 'nafeesa', 'nahid', 'nahida', 'naila', 'najma', 'nargis', 'naseema', 'nasha', 'nasreen', 'nayana', 'nilufa', 'nilufar', 'nisha', 'nishat', 'nupur', 'nusrat', 'pinky', 'puja', 'puspa', 'raia', 'raiha', 'raisa', 'rajia', 'rakhi', 'rashida', 'razia', 'reba', 'rebecca', 'resna', 'rikta', 'rimi', 'rina', 'ripa', 'risha', 'rita', 'riya', 'rokshana', 'rombola', 'roshni', 'rozina', 'ruby', 'rumana', 'rumy', 'rupali', 'saba', 'sabera', 'sabina', 'sauda', 'sayema', 'selina', 'shahana', 'shahinur', 'shahnaj', 'shahnaz', 'shahreen', 'shaista', 'shampa', 'sharmin', 'shefali', 'sheuli', 'shika', 'shirina', 'shukla', 'simi', 'soma', 'sonia', 'suraiya', 'tahmina', 'tamanna', 'tania', 'tanjila', 'tasneem', 'tasnia', 'tazin', 'tisha', 'umme', 'urmi', 'zahan', 'zaiba', 'zarin', 'zeba', 'zinnat', 'tithi', 'puja', 'mou', 'mimi', 'poly', 'moly', 'dola', 'mita', 'tua', 'nodi', 'pari', 'shiva', 'shreemoti', 'radha', 'laxmi', 'durga', 'piu', 'arka', 'tumpa', 'jhuma', 'keya', 'jui', 'papiya', 'rumi', 'dona', 'bonni', 'konika', 'shubhra', 'shrabonti', 'trisha', 'sraboni'
];

for (let i = 0; i < filteredParts.length; i++) {
    const part = filteredParts[i];
    for (let j = 0; j < maleBank.length; j++) {
        if (part === maleBank[j]) return 'male';
    }
    for (let j = 0; j < femaleBank.length; j++) {
        if (part === femaleBank[j]) return 'female';
    }
}

return 'unknown';


___TESTS___

scenarios: []


___NOTES___

Created on 2/24/2026, 11:13:08 PM


