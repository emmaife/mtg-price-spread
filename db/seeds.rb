# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
MagicSet.destroy_all


MagicSet.create([

		{setName: 'Fourth Edition', tcgID: 46, ckID: 2350, sdkID: '4ED' } ,
		{setName: 'Fifth Edition', tcgID: 44, ckID: 2355, sdkID: '5ED' } ,
		{setName: '7th Edition', tcgID: 2, ckID: 2365, sdkID: '7ED' } ,
		{setName: '8th Edition', tcgID: 3, ckID: 2370, sdkID: '8ED' } ,
		{setName: '9th Edition', tcgID: 4, ckID: 2375, sdkID: '9ED' } ,
		{setName: '10th Edition', tcgID: 1, ckID: 2380, sdkID: '10E' } ,
		{setName: 'Magic 2010 (M10)', tcgID: 68, ckID: 2789, sdkID: 'M10' } ,
		{setName: 'Magic 2011 (M11)', tcgID: 69, ckID: 2847, sdkID: 'M11' } ,
		{setName: 'Magic 2012 (M12)', tcgID: 70, ckID: 2863, sdkID: 'M12' } ,
		{setName: 'Magic 2013 (M13)', tcgID: 364, ckID: 2876, sdkID: 'M13' } ,
		{setName: 'Magic 2014 (M14)', tcgID: 1113, ckID: 2895, sdkID: 'M14' } ,
		{setName: 'Magic 2015 (M15)', tcgID: 1293, ckID: 2910, sdkID: 'M15' } ,
		{setName: 'Aether Revolt', tcgID: 1857, ckID: 3030, sdkID: 'AER' } ,
		{setName: 'Alara Reborn', tcgID: 5, ckID: 2385, sdkID: 'ARB' } ,
		{setName: 'Alliances', tcgID: 6, ckID: 2390, sdkID: 'ALL' } ,
		{setName: 'Alpha Edition', tcgID: 7, ckID: 2395, sdkID: 'LEA' } ,
		{setName: 'Amonkhet', tcgID: 1882, ckID: 3042, sdkID: 'AKH' } ,
		{setName: 'Anthologies', tcgID: 1275, ckID: 2400, sdkID: 'ATH' } ,
		{setName: 'Antiquities', tcgID: 8, ckID: 2405, sdkID: 'ATQ' } ,
		{setName: 'Apocalypse', tcgID: 10, ckID: 2410, sdkID: 'APC' } ,
		{setName: 'Arabian Nights', tcgID: 11, ckID: 2415, sdkID: 'ARN' } ,
		{setName: 'Archenemy', tcgID: 12, ckID: 2846, sdkID: 'ARC' } ,
		{setName: 'Archenemy: Nicol Bolas', tcgID: 1904, ckID: 3048, sdkID: 'E01' } ,
		{setName: 'Avacyn Restored', tcgID: 362, ckID: 2874, sdkID: 'AVR' } ,
		{setName: 'Battle for Zendikar', tcgID: 1645, ckID: 2953, sdkID: 'BFZ' } ,
		{setName: 'Battle Royale Box Set', tcgID: 15, ckID: 2420, sdkID: 'BRB' } ,
		{setName: 'Battlebond', tcgID: 2245, ckID: 3088, sdkID: 'BBD' } ,
		{setName: 'Beatdown Box Set', tcgID: 16, ckID: 2425, sdkID: 'BTD' } ,
		{setName: 'Beta Edition', tcgID: 17, ckID: 2430, sdkID: 'LEB' } ,
		{setName: 'Betrayers of Kamigawa', tcgID: 18, ckID: 2435, sdkID: 'BOK' } ,
		{setName: 'Born of the Gods', tcgID: 1276, ckID: 2903, sdkID: 'BNG' } ,
		{setName: 'Challenger Decks', tcgID: 2203, ckID: 3085, sdkID: 'Q01' } ,
		{setName: 'Champions of Kamigawa', tcgID: 20, ckID: 2440, sdkID: 'CHK' } ,
		{setName: 'Chronicles', tcgID: 22, ckID: 2445, sdkID: 'CHR' } ,
		{setName: 'Coldsnap', tcgID: 24, ckID: 2450, sdkID: 'CSP' } ,
		{setName: 'Collectors Edition', tcgID: 1526, ckID: 2455, sdkID: 'CED' } ,
		{setName: 'Commander', tcgID: 25, ckID: 2862, sdkID: 'CMD' } ,
		{setName: 'Commander 2013', tcgID: 1164, ckID: 2902, sdkID: 'C13' } ,
		{setName: 'Commander 2014', tcgID: 1476, ckID: 2916, sdkID: 'C14' } ,
		{setName: 'Commander 2015', tcgID: 1673, ckID: 2958, sdkID: 'C15' } ,
		{setName: 'Commander 2016', tcgID: 1792, ckID: 2949, sdkID: 'C16' } ,
		{setName: 'Commander 2017', tcgID: 2009, ckID: 3055, sdkID: 'C17' } ,
		{setName: 'Commander Anthology', tcgID: 1933, ckID: 3047, sdkID: 'CMA' } ,
		{setName: 'Commander Anthology Volume II', tcgID: 2246, ckID: 3089, sdkID: 'CM2' } ,
		{setName: 'Commanders Arsenal', tcgID: 568, ckID: 2888, sdkID: 'CM1' } ,
		{setName: 'Conflux', tcgID: 26, ckID: 2783, sdkID: 'CON' } ,
		{setName: 'Conspiracy', tcgID: 1312, ckID: 2908, sdkID: 'CNS' } ,
		{setName: 'Conspiracy: Take the Crown', tcgID: 1794, ckID: 2977, sdkID: 'CN2' } ,
		{setName: 'Dark Ascension', tcgID: 125, ckID: 2870, sdkID: 'DKA' } ,
		{setName: 'Darksteel', tcgID: 27, ckID: 2465, sdkID: 'DST' } ,
		{setName: 'Deckmasters Garfield vs Finkel', tcgID: 1311, ckID: 2470, sdkID: 'DKM' } ,
		{setName: 'Dissension', tcgID: 28, ckID: 2475, sdkID: 'DIS' } ,
		{setName: 'Dominaria', tcgID: 2199, ckID: 3086, sdkID: 'DOM' } ,
		{setName: 'Dragons Maze', tcgID: 570, ckID: 2892, sdkID: 'DGM' } ,
		{setName: 'Dragons of Tarkir', tcgID: 1515, ckID: 2938, sdkID: 'DTK' } ,
		{setName: 'Duel Decks: Ajani vs. Nicol Bolas', tcgID: 30, ckID: 2865, sdkID: 'DDH' } ,
		{setName: 'Duel Decks: Blessed vs. Cursed', tcgID: 1726, ckID: 2969, sdkID: 'DDQ' } ,
		{setName: 'Duel Decks: Divine vs. Demonic', tcgID: 31, ckID: 2480, sdkID: 'DDC' } ,
		{setName: 'Duel Decks: Elspeth vs. Kiora', tcgID: 1511, ckID: 2936, sdkID: 'DDO' } ,
		{setName: 'Duel Decks: Elspeth vs. Tezzeret', tcgID: 32, ckID: 2851, sdkID: 'DDF' } ,
		{setName: 'Duel Decks: Elves vs. Goblins', tcgID: 33, ckID: 2485, sdkID: 'EVG' } ,
		{setName: 'Duel Decks: Elves vs. Inventors', tcgID: 2207, ckID: 3084, sdkID: 'DDU' } ,
		{setName: 'Duel Decks: Garruk vs. Liliana', tcgID: 34, ckID: 2838, sdkID: 'DDD' } ,
		{setName: 'Duel Decks: Heroes vs. Monsters', tcgID: 1145, ckID: 2896, sdkID: 'DDL' } ,
		{setName: 'Duel Decks: Izzet vs. Golgari', tcgID: 365, ckID: 2878, sdkID: 'DDJ' } ,
		{setName: 'Duel Decks: Jace vs. Chandra', tcgID: 35, ckID: 2490, sdkID: 'DD2' } ,
		{setName: 'Duel Decks: Jace vs. Vraska', tcgID: 1166, ckID: 2904, sdkID: 'DDM' } ,
		{setName: 'Duel Decks: Knights vs. Dragons', tcgID: 36, ckID: 2860, sdkID: 'DDG' } ,
		{setName: 'Duel Decks: Merfolk vs. Goblins', tcgID: 2076, ckID: 3062, sdkID: 'DDT' } ,
		{setName: 'Duel Decks: Mind vs. Might', tcgID: 1905, ckID: 3041, sdkID: 'DDS' } ,
		{setName: 'Duel Decks: Nissa vs. Ob Nixilis', tcgID: 1835, ckID: 2980, sdkID: 'DDR' } ,
		{setName: 'Duel Decks: Phyrexia vs. the Coalition', tcgID: 37, ckID: 2841, sdkID: 'DDE' } ,
		{setName: 'Duel Decks: Sorin vs. Tibalt', tcgID: 601, ckID: 2891, sdkID: 'DDK' } ,
		{setName: 'Duel Decks: Speed vs. Cunning', tcgID: 1477, ckID: 2911, sdkID: 'DDN' } ,
		{setName: 'Duel Decks: Venser vs. Koth', tcgID: 367, ckID: 2873, sdkID: 'DDI' } ,
		{setName: 'Duel Decks: Zendikar vs. Eldrazi', tcgID: 1641, ckID: 2951, sdkID: 'DDP' } ,
		{setName: 'Duels of the Planeswalkers', tcgID: 1274, ckID: 2845, sdkID: 'DPA' } ,
		{setName: 'Eldritch Moon', tcgID: 1790, ckID: 2976, sdkID: 'EMN' } ,
		{setName: 'Eternal Masters', tcgID: 1740, ckID: 2973, sdkID: 'EMA' } ,
		{setName: 'Eventide', tcgID: 39, ckID: 2495, sdkID: 'EVE' } ,
		{setName: 'Exodus', tcgID: 40, ckID: 2500, sdkID: 'EXO' } ,
		{setName: 'Explorers of Ixalan', tcgID: 2077, ckID: 3064, sdkID: 'E02' } ,
		{setName: 'Fallen Empires', tcgID: 41, ckID: 2505, sdkID: 'FEM' } ,
		{setName: 'Fate Reforged', tcgID: 1497, ckID: 2923, sdkID: 'FRF' } ,
		{setName: 'Fifth Dawn', tcgID: 43, ckID: 2510, sdkID: '5DN' } ,
		{setName: 'From the Vault: Angels', tcgID: 1577, ckID: 2952, sdkID: 'V15' } ,
		{setName: 'From the Vault: Annihilation', tcgID: 1475, ckID: 2913, sdkID: 'V14' } ,
		{setName: 'From the Vault: Dragons', tcgID: 47, ckID: 2515, sdkID: 'DRB' } ,
		{setName: 'From the Vault: Exiled', tcgID: 48, ckID: 2815, sdkID: 'V09' } ,
		{setName: 'From the Vault: Legends', tcgID: 49, ckID: 2868, sdkID: 'V11' } ,
		{setName: 'From the Vault: Lore', tcgID: 1821, ckID: 2979, sdkID: 'V16' } ,
		{setName: 'From the Vault: Realms', tcgID: 368, ckID: 2883, sdkID: 'V12' } ,
		{setName: 'From the Vault: Relics', tcgID: 50, ckID: 2850, sdkID: 'V10' } ,
		{setName: 'From the Vault: Transform', tcgID: 2078, ckID: 3065, sdkID: 'V17' } ,
		{setName: 'From the Vault: Twenty', tcgID: 1141, ckID: 2899, sdkID: 'V13' } ,
		{setName: 'Future Sight', tcgID: 51, ckID: 2520, sdkID: 'FUT' } ,
		{setName: 'Gatecrash', tcgID: 569, ckID: 2890, sdkID: 'GTC' } ,
		{setName: 'Guildpact', tcgID: 55, ckID: 2525, sdkID: 'GPT' } ,
		{setName: 'Homelands', tcgID: 57, ckID: 2530, sdkID: 'HML' } ,
		{setName: 'Hour of Devastation', tcgID: 1934, ckID: 3051, sdkID: 'HOU' } ,
		{setName: 'Ice Age', tcgID: 58, ckID: 2535, sdkID: 'ICE' } ,
		{setName: 'Iconic Masters', tcgID: 2050, ckID: 3059, sdkID: 'IMA' } ,
		{setName: 'Innistrad', tcgID: 59, ckID: 2866, sdkID: 'ISD' } ,
		{setName: 'Invasion', tcgID: 60, ckID: 2540, sdkID: 'INV' } ,
		{setName: 'Ixalan', tcgID: 2043, ckID: 3058, sdkID: 'XLN' } ,
		{setName: 'Journey Into Nyx', tcgID: 1277, ckID: 2905, sdkID: 'JOU' } ,
		{setName: 'Judgment', tcgID: 63, ckID: 2545, sdkID: 'JUD' } ,
		{setName: 'Kaladesh', tcgID: 1791, ckID: 2983, sdkID: 'KLD' } ,
		{setName: 'Khans of Tarkir', tcgID: 1356, ckID: 2914, sdkID: 'KTK' } ,
		{setName: 'Legends', tcgID: 65, ckID: 2550, sdkID: 'LEG' } ,
		{setName: 'Legions', tcgID: 66, ckID: 2555, sdkID: 'LGN' } ,
		{setName: 'Lorwyn', tcgID: 67, ckID: 2560, sdkID: 'LRW' } ,
		{setName: 'Magic Origins', tcgID: 1512, ckID: 2950, sdkID: 'ORI' } ,
		{setName: 'Masterpiece Series: Amonkhet Invocations', tcgID: 1909, ckID: 3044, sdkID: 'MP2' } ,
		{setName: 'Masterpiece Series: Kaladesh Inventions', tcgID: 1837, ckID: 2984, sdkID: 'MPS' } ,
		{setName: 'Masters 25', tcgID: 2189, ckID: 3078, sdkID: 'A25' } ,
		{setName: 'Mercadian Masques', tcgID: 73, ckID: 2565, sdkID: 'MMQ' } ,
		{setName: 'Mirage', tcgID: 74, ckID: 2570, sdkID: 'MIR' } ,
		{setName: 'Mirrodin', tcgID: 75, ckID: 2575, sdkID: 'MRD' } ,
		{setName: 'Mirrodin Besieged', tcgID: 76, ckID: 2859, sdkID: 'MBS' } ,
		{setName: 'Magic Modern Event Deck', tcgID: 1346, ckID: 2907, sdkID: 'MD1' } ,
		{setName: 'Modern Masters', tcgID: 1111, ckID: 2894, sdkID: 'MMA' } ,
		{setName: 'Modern Masters 2015', tcgID: 1503, ckID: 2947, sdkID: 'MM2' } ,
		{setName: 'Modern Masters 2017', tcgID: 1879, ckID: 3032, sdkID: 'MM3' } ,
		{setName: 'Morningtide', tcgID: 77, ckID: 2580, sdkID: 'MOR' } ,
		{setName: 'Nemesis', tcgID: 78, ckID: 2590, sdkID: 'NMS' } ,
		{setName: 'New Phyrexia', tcgID: 79, ckID: 2861, sdkID: 'NPH' } ,
		{setName: 'Oath of the Gatewatch', tcgID: 1693, ckID: 2967, sdkID: 'OGW' } ,
		{setName: 'Odyssey', tcgID: 80, ckID: 2595, sdkID: 'ODY' } ,
		{setName: 'Onslaught', tcgID: 81, ckID: 2600, sdkID: 'ONS' } ,
		{setName: 'Planar Chaos', tcgID: 83, ckID: 2605, sdkID: 'PLC' } ,
		{setName: 'Planechase', tcgID: 84, ckID: 2839, sdkID: 'HOP' } ,
		{setName: 'Planechase 2012', tcgID: 363, ckID: 2875, sdkID: 'PC2' } ,
		{setName: 'Planechase Anthology', tcgID: 1793, ckID: 2989, sdkID: 'PCA' } ,
		{setName: 'Planeshift', tcgID: 85, ckID: 2610, sdkID: 'PLS' } ,
		{setName: 'Portal', tcgID: 86, ckID: 2615, sdkID: 'POR' } ,
		{setName: 'Portal Three Kingdoms', tcgID: 88, ckID: 2620, sdkID: 'PTK' } ,
		{setName: 'Portal Second Age', tcgID: 87, ckID: 2625, sdkID: 'PO2' } ,
		{setName: 'Premium Deck Series: Fire and Lightning', tcgID: 89, ckID: 2854, sdkID: 'PD2' } ,
		{setName: 'Premium Deck Series: Graveborn', tcgID: 90, ckID: 2867, sdkID: 'PD3' } ,
		{setName: 'Premium Deck Series: Slivers', tcgID: 91, ckID: 2837, sdkID: 'H09' } ,
		{setName: 'Prophecy', tcgID: 94, ckID: 2635, sdkID: 'PCY' } ,
		{setName: 'Ravnica', tcgID: 95, ckID: 2640, sdkID: 'RAV' } ,
		{setName: 'Return to Ravnica', tcgID: 370, ckID: 2884, sdkID: 'RTR' } ,
		{setName: 'Rise of the Eldrazi', tcgID: 98, ckID: 2843, sdkID: 'ROE' } ,
		{setName: 'Rivals of Ixalan', tcgID: 2098, ckID: 3076, sdkID: 'RIX' } ,
		{setName: 'Saviors of Kamigawa', tcgID: 99, ckID: 2645, sdkID: 'SOK' } ,
		{setName: 'Scars of Mirrodin', tcgID: 100, ckID: 2852, sdkID: 'SOM' } ,
		{setName: 'Scourge', tcgID: 101, ckID: 2650, sdkID: 'SCG' } ,
		{setName: 'Shadowmoor', tcgID: 102, ckID: 2655, sdkID: 'SHM' } ,
		{setName: 'Shadows over Innistrad', tcgID: 1708, ckID: 2971, sdkID: 'SOI' } ,
		{setName: 'Shards of Alara', tcgID: 103, ckID: 2660, sdkID: 'ALA' } ,
		{setName: 'Starter 1999', tcgID: 105, ckID: 2670, sdkID: 'S99' } ,
		{setName: 'Starter 2000', tcgID: 106, ckID: 2675, sdkID: 'S00' } ,
		{setName: 'Stronghold', tcgID: 107, ckID: 2680, sdkID: 'STH' } ,
		{setName: 'Tempest', tcgID: 108, ckID: 2685, sdkID: 'TMP' } ,
		{setName: 'The Dark', tcgID: 109, ckID: 2690, sdkID: 'DRK' } ,
		{setName: 'Theros', tcgID: 1144, ckID: 2900, sdkID: 'THS' } ,
		{setName: 'Time Spiral', tcgID: 110, ckID: 2695, sdkID: 'TSP' } ,
		{setName: 'Torment', tcgID: 112, ckID: 2705, sdkID: 'TOR' } ,
		{setName: 'Unglued', tcgID: 113, ckID: 2710, sdkID: 'UGL' } ,
		{setName: 'Unhinged', tcgID: 114, ckID: 2715, sdkID: 'UNH' } ,
		{setName: 'Unlimited Edition', tcgID: 115, ckID: 2720, sdkID: '2ED' } ,
		{setName: 'Unstable', tcgID: 2092, ckID: 3075, sdkID: 'UST' } ,
		{setName: 'Urzas Destiny', tcgID: 116, ckID: 2725, sdkID: 'UDS' } ,
		{setName: 'Urzas Legacy', tcgID: 117, ckID: 2730, sdkID: 'ULG' } ,
		{setName: 'Urzas Saga', tcgID: 118, ckID: 2735, sdkID: 'USG' } ,
		{setName: 'Vanguard', tcgID: 119, ckID: 2740, sdkID: 'VAN' } ,
		{setName: 'Visions', tcgID: 120, ckID: 2745, sdkID: 'VIS' } ,
		{setName: 'Weatherlight', tcgID: 121, ckID: 2750, sdkID: 'WTH' } ,
		{setName: 'Worldwake', tcgID: 122, ckID: 2840, sdkID: 'WWK' } ,
		{setName: 'Zendikar', tcgID: 124, ckID: 2826, sdkID: 'ZEN'}

			])





#{setName: '4th Edition' , tcgID: 46, ckID:  2350},
#{setName: '5th Edition' , tcgID: 44, ckID:  2355},
#{setName: '7th Edition', tcgID: 2, ckID: 2365}, 
#{setName: '8th Edition' , tcgID: 3, ckID:  2370},
#{setName: '9th Edition' , tcgID: 4, ckID:  2375},
#{setName: '10th Edition' , tcgID: 1, ckID:  2380},
#{setName: 'Magic 2010 (M10)' , tcgID: 68, ckID: 2789},
#{setName: 'Magic 2011 (M11)' , tcgID: 69, ckID: 2847},
#{setName: 'Magic 2012 (M12)' , tcgID: 70, ckID: 2863},
#{setName: 'Magic 2013 (M13)' , tcgID: 364, ckID: 2876},
#{setName: 'Magic 2014 (M14)' , tcgID: 1113, ckID: 2895},
#{setName: 'Magic 2015 (M15)' , tcgID: 1293, ckID: 2910},
#{setName: 'Aether Revolt' , tcgID: 1857, ckID: 3030},
#{setName: 'Alara Reborn' , tcgID: 5, ckID: 2385},
#{setName: 'Alliances' , tcgID: 6, ckID:  2390},
#{setName: 'Alpha Edition' , tcgID: 7, ckID:  2395},
#{setName: 'Amonkhet' , tcgID: 1882, ckID:  3042},
#{setName: 'Anthologies' , tcgID: 1275, ckID:  2400},
#{setName: 'Antiquities' , tcgID: 8, ckID:  2405},
#{setName: 'Apocalypse' , tcgID: 10, ckID:  2410},
#{setName: 'Arabian Nights' , tcgID: 11, ckID:  2415},
#{setName: 'Archenemy' , tcgID: 12, ckID:  2846},
#{setName: 'Archenemy: Nicol Bolas' , tcgID: 1904, ckID:  3048},
#{setName: 'Avacyn Restored' , tcgID: 362, ckID:  2874},
#{setName: 'Battle for Zendikar' , tcgID: 1645, ckID:  2953},
#{setName: 'Battle Royale Box Set' , tcgID: 15, ckID:  2420},
#{setName: 'Battlebond' , tcgID: 2245, ckID:  3088},
#{setName: 'Beatdown Box Set' , tcgID: 16, ckID:  2425},
#{setName: 'Beta Edition' , tcgID: 17, ckID:  2430},
#{setName: 'Betrayers of Kamigawa' , tcgID: 18, ckID:  2435},
#{setName: 'Born of the Gods' , tcgID: 1276, ckID:  2903},
#{setName: 'Challenger Decks' , tcgID: 2203, ckID:  3085},
#{setName: 'Champions of Kamigawa' , tcgID: 20, ckID:  2440},
#{setName: 'Chronicles' , tcgID: 22, ckID:  2445},
#{setName: 'Coldsnap' , tcgID: 24, ckID:  2450},
#{setName: 'Collectors Edition' , tcgID: 1526, ckID:  2455},
#{setName: 'Commander' , tcgID: 25, ckID:  2862},
#{setName: 'Commander 2013' , tcgID: 1164, ckID:  2902},
#{setName: 'Commander 2014' , tcgID: 1476, ckID:  2916},
#{setName: 'Commander 2015' , tcgID: 1673, ckID:  2958},
#{setName: 'Commander 2016' , tcgID: 1792, ckID:  2949},
#{setName: 'Commander 2017' , tcgID: 2009, ckID:  3055},
#{setName: 'Commander Anthology' , tcgID: 1933, ckID:  3047},
#{setName: 'Commander Anthology Volume II' , tcgID: 2246, ckID:  3089},
#{setName: 'Commanders Arsenal' , tcgID: 568, ckID:  2888},
#{setName: 'Conflux' , tcgID: 26, ckID:  2783},
#{setName: 'Conspiracy' , tcgID: 1312, ckID:  2908},
#{setName: 'Conspiracy: Take the Crown' , tcgID: 1794, ckID:  2977},
#{setName: 'Dark Ascension' , tcgID: 125, ckID:  2870},
#{setName: 'Darksteel' , tcgID: 27, ckID:  2465},
#{setName: 'Deckmasters Garfield vs Finkel' , tcgID: 1311, ckID:  2470},
#{setName: 'Dissension' , tcgID: 28, ckID:  2475},
#{setName: 'Dominaria' , tcgID: 2199, ckID:  3086},
#{setName: 'Dragons Maze' , tcgID: 570, ckID:  2892},
#{setName: 'Dragons of Tarkir' , tcgID: 1515, ckID:  2938},
#{setName: 'Duel Decks: Ajani vs. Nicol Bolas' , tcgID: 30, ckID:  2865},
#{setName: 'Duel Decks: Anthology' , tcgID: 1490, ckID:  2918},
#{setName: 'Duel Decks: Blessed vs. Cursed' , tcgID: 1726, ckID:  2969},
#{setName: 'Duel Decks: Divine vs. Demonic' , tcgID: 31, ckID:  2480},
#{setName: 'Duel Decks: Elspeth vs. Kiora' , tcgID: 1511, ckID:  2936},
#{setName: 'Duel Decks: Elspeth vs. Tezzeret' , tcgID: 32, ckID:  2851},
#{setName: 'Duel Decks: Elves vs. Goblins' , tcgID: 33, ckID:  2485},
#{setName: 'Duel Decks: Elves vs. Inventors' , tcgID: 2207, ckID:  3084},
#{setName: 'Duel Decks: Garruk vs. Liliana' , tcgID: 34, ckID:  2838},
#{setName: 'Duel Decks: Heroes vs. Monsters' , tcgID: 1145, ckID:  2896},
#{setName: 'Duel Decks: Izzet vs. Golgari' , tcgID: 365, ckID:  2878},
#{setName: 'Duel Decks: Jace vs. Chandra' , tcgID: 35, ckID:  2490},
#{setName: 'Duel Decks: Jace vs. Vraska' , tcgID: 1166, ckID:  2904},
#{setName: 'Duel Decks: Knights vs. Dragons' , tcgID: 36, ckID:  2860},
#{setName: 'Duel Decks: Merfolk vs. Goblins' , tcgID: 2076, ckID:  3062},
#{setName: 'Duel Decks: Mind vs. Might' , tcgID: 1905, ckID:  3041},
#{setName: 'Duel Decks: Nissa vs. Ob Nixilis' , tcgID: 1835, ckID:  2980},
#{setName: 'Duel Decks: Phyrexia vs. the Coalition' , tcgID: 37, ckID:  2841},
#{setName: 'Duel Decks: Sorin vs. Tibalt' , tcgID: 601, ckID:  2891},
#{setName: 'Duel Decks: Speed vs. Cunning' , tcgID: 1477, ckID:  2911},
#{setName: 'Duel Decks: Venser vs. Koth' , tcgID: 367, ckID:  2873},
#{setName: 'Duel Decks: Zendikar vs. Eldrazi' , tcgID: 1641, ckID:  2951},
#{setName: 'Duels of the Planeswalkers' , tcgID: 1274, ckID:  2845},
#{setName: 'Eldritch Moon' , tcgID: 1790, ckID:  2976},
#{setName: 'Eternal Masters' , tcgID: 1740, ckID:  2973},
#{setName: 'Eventide' , tcgID: 39, ckID:  2495},
#{setName: 'Exodus' , tcgID: 40, ckID:  2500},
#{setName: 'Explorers of Ixalan' , tcgID: 2077, ckID:  3064},
#{setName: 'Fallen Empires' , tcgID: 41, ckID:  2505},
#{setName: 'Fate Reforged' , tcgID: 1497, ckID:  2923},
#{setName: 'Fifth Dawn' , tcgID: 43, ckID:  2510},
#{setName: 'From the Vault: Angels' , tcgID: 1577, ckID:  2952},
#{setName: 'From the Vault: Annihilation' , tcgID: 1475, ckID:  2913},
#{setName: 'From the Vault: Dragons' , tcgID: 47, ckID:  2515},
#{setName: 'From the Vault: Exiled' , tcgID: 48, ckID:  2815},
#{setName: 'From the Vault: Legends' , tcgID: 49, ckID:  2868},
#{setName: 'From the Vault: Lore' , tcgID: 1821, ckID:  2979},
#{setName: 'From the Vault: Realms' , tcgID: 368, ckID:  2883},
#{setName: 'From the Vault: Relics' , tcgID: 50, ckID:  2850},
#{setName: 'From the Vault: Transform' , tcgID: 2078, ckID:  3065},
#{setName: 'From the Vault: Twenty' , tcgID: 1141, ckID:  2899},
#{setName: 'Future Sight' , tcgID: 51, ckID:  2520},
#{setName: 'Gatecrash' , tcgID: 569, ckID:  2890},
#{setName: 'Guildpact' , tcgID: 55, ckID:  2525},
#{setName: 'Homelands' , tcgID: 57, ckID:  2530},
#{setName: 'Hour of Devastation' , tcgID: 1934, ckID:  3051},
#{setName: 'Ice Age' , tcgID: 58, ckID:  2535},
#{setName: 'Iconic Masters' , tcgID: 2050, ckID:  3059},
#{setName: 'Innistrad' , tcgID: 59, ckID:  2866},
#{setName: 'Invasion' , tcgID: 60, ckID:  2540},
#{setName: 'Ixalan' , tcgID: 2043, ckID:  3058},
#{setName: 'Journey Into Nyx' , tcgID: 1277, ckID:  2905},
#{setName: 'Judgment' , tcgID: 63, ckID:  2545},
#{setName: 'Kaladesh' , tcgID: 1791, ckID:  2983},
#{setName: 'Khans of Tarkir' , tcgID: 1356, ckID:  2914},
#{setName: 'Legends' , tcgID: 65, ckID:  2550},
#{setName: 'Legions' , tcgID: 66, ckID:  2555},
#{setName: 'Lorwyn' , tcgID: 67, ckID:  2560},
#{setName: 'Magic Origins' , tcgID: 1512, ckID:  2950},
#{setName: 'Masterpiece Series: Amonkhet Invocations' , tcgID: 1909, ckID:  3044},
#{setName: 'Masterpiece Series: Kaladesh Inventions' , tcgID: 1837, ckID:  2984},
#{setName: 'Masters 25' , tcgID: 2189, ckID:  3078},
#{setName: 'Mercadian Masques' , tcgID: 73, ckID:  2565},
#{setName: 'Mirage' , tcgID: 74, ckID:  2570},
#{setName: 'Mirrodin' , tcgID: 75, ckID:  2575},
#{setName: 'Mirrodin Besieged' , tcgID: 76, ckID:  2859},
#{setName: 'Magic Modern Event Deck' , tcgID: 1346, ckID:  2907},
#{setName: 'Modern Masters' , tcgID: 1111, ckID:  2894},
#{setName: 'Modern Masters 2015' , tcgID: 1503, ckID:  2947},
#{setName: 'Modern Masters 2017' , tcgID: 1879, ckID:  3032},
#{setName: 'Morningtide' , tcgID: 77, ckID:  2580},
#{setName: 'Nemesis' , tcgID: 78, ckID:  2590},
#{setName: 'New Phyrexia' , tcgID: 79, ckID:  2861},
#{setName: 'Oath of the Gatewatch' , tcgID: 1693, ckID:  2967},
#{setName: 'Odyssey' , tcgID: 80, ckID:  2595},
#{setName: 'Onslaught' , tcgID: 81, ckID:  2600},
#{setName: 'Planar Chaos' , tcgID: 83, ckID:  2605},
#{setName: 'Planechase' , tcgID: 84, ckID:  2839},
#{setName: 'Planechase 2012' , tcgID: 363, ckID:  2875},
#{setName: 'Planechase Anthology' , tcgID: 1793, ckID:  2989},
#{setName: 'Planeshift' , tcgID: 85, ckID:  2610},
#{setName: 'Portal' , tcgID: 86, ckID:  2615},
#{setName: 'Portal Three Kingdoms' , tcgID: 88, ckID:  2620},
#{setName: 'Portal Second Age' , tcgID: 87, ckID:  2625},
#{setName: 'Premium Deck Series: Fire and Lightning' , tcgID: 89, ckID:  2854},
#{setName: 'Premium Deck Series: Graveborn' , tcgID: 90, ckID:  2867},
#{setName: 'Premium Deck Series: Slivers' , tcgID: 91, ckID:  2837},
#{setName: 'Prophecy' , tcgID: 94, ckID:  2635},
#{setName: 'Ravnica' , tcgID: 95, ckID:  2640},
#{setName: 'Return to Ravnica' , tcgID: 370, ckID:  2884},
#{setName: 'Rise of the Eldrazi' , tcgID: 98, ckID:  2843},
#{setName: 'Rivals of Ixalan' , tcgID: 2098, ckID:  3076},
#{setName: 'Saviors of Kamigawa' , tcgID: 99, ckID:  2645},
#{setName: 'Scars of Mirrodin' , tcgID: 100, ckID:  2852},
#{setName: 'Scourge' , tcgID: 101, ckID:  2650},
#{setName: 'Shadowmoor' , tcgID: 102, ckID:  2655},
#{setName: 'Shadows over Innistrad' , tcgID: 1708, ckID:  2971},
#{setName: 'Shards of Alara' , tcgID: 103, ckID:  2660},
#{setName: 'Starter 1999' , tcgID: 105, ckID:  2670},
#{setName: 'Starter 2000' , tcgID: 106, ckID:  2675},
#{setName: 'Stronghold' , tcgID: 107, ckID:  2680},
#{setName: 'Tempest' , tcgID: 108, ckID:  2685},
#{setName: 'The Dark' , tcgID: 109, ckID:  2690},
#{setName: 'Theros' , tcgID: 1144, ckID:  2900},
#{setName: 'Time Spiral' , tcgID: 110, ckID:  2695},
#{setName: 'Timeshifted' , tcgID: 111, ckID:  2700},
#{setName: 'Torment' , tcgID: 112, ckID:  2705},
#{setName: 'Unglued' , tcgID: 113, ckID:  2710},
#{setName: 'Unhinged' , tcgID: 114, ckID:  2715},
#{setName: 'Unlimited Edition' , tcgID: 115, ckID:  2720},
#{setName: 'Unstable' , tcgID: 2092, ckID:  3075},
#{setName: 'Urzas Destiny' , tcgID: 116, ckID:  2725},
#{setName: 'Urzas Legacy' , tcgID: 117, ckID:  2730},
#{setName: 'Urzas Saga' , tcgID: 118, ckID:  2735},
#{setName: 'Vanguard' , tcgID: 119, ckID:  2740},
#{setName: 'Visions' , tcgID: 120, ckID:  2745},
#{setName: 'Weatherlight' , tcgID: 121, ckID:  2750},
#{setName: 'World Championship Decks' , tcgID: 2198, ckID:  2975},
#{setName: 'Worldwake' , tcgID: 122, ckID:  2840},
#{setName: 'Zendikar' , tcgID: 124, ckID:  2826}


