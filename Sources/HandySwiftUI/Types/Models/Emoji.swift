import HandySwift
import SwiftUI

/// An enum representing a variety of emoji characters. Each case is an emoji with a specific meaning. This type is designed to be used in a ``SearchableGridPicker``.
public enum Emoji: String, CaseIterable, AutoConforming {
   case firstPlaceMedal = "🥇"
   case secondPlaceMedal = "🥈"
   case thirdPlaceMedal = "🥉"
   case aButton = "🅰️"
   case abButton = "🆎"
   case abacus = "🧮"
   case accordion = "🪗"
   case adhesiveBandage = "🩹"
   case admissionTickets = "🎟️"
   case aerialTramway = "🚡"
   case airplane = "✈️"
   case airplaneArrival = "🛬"
   case airplaneDeparture = "🛫"
   case alarmClock = "⏰"
   case alembic = "⚗️"
   case alien = "👽"
   case alienMonster = "👾"
   case ambulance = "🚑"
   case americanFootball = "🏈"
   case amphora = "🏺"
   case anatomicalHeart = "🫀"
   case anchor = "⚓"
   case angerSymbol = "💢"
   case angryFace = "😠"
   case angryFaceWithHorns = "👿"
   case anguishedFace = "😧"
   case ant = "🐜"
   case antennaBars = "📶"
   case anxiousFaceWithSweat = "😰"
   case aquarius = "♒"
   case aries = "♈"
   case articulatedLorry = "🚛"
   case artist = "🧑‍🎨"
   case artistPalette = "🎨"
   case astonishedFace = "😲"
   case astronaut = "🧑‍🚀"
   case atmSign = "🏧"
   case atomSymbol = "⚛️"
   case autoRickshaw = "🛺"
   case automobile = "🚗"
   case avocado = "🥑"
   case axe = "🪓"
   case bButton = "🅱️"
   case baby = "👶"
   case babyAngel = "👼"
   case babyBottle = "🍼"
   case babyChick = "🐤"
   case babySymbol = "🚼"
   case backArrow = "🔙"
   case backhandIndexPointingDown = "👇"
   case backhandIndexPointingLeft = "👈"
   case backhandIndexPointingRight = "👉"
   case backhandIndexPointingUp = "👆"
   case backpack = "🎒"
   case bacon = "🥓"
   case badger = "🦡"
   case badminton = "🏸"
   case bagel = "🥯"
   case baggageClaim = "🛄"
   case baguetteBread = "🥖"
   case balanceScale = "⚖️"
   case balletShoes = "🩰"
   case balloon = "🎈"
   case ballotBoxWithBallot = "🗳️"
   case banana = "🍌"
   case banjo = "🪕"
   case bank = "🏦"
   case barChart = "📊"
   case barberPole = "💈"
   case baseball = "⚾"
   case basket = "🧺"
   case basketball = "🏀"
   case bat = "🦇"
   case bathtub = "🛁"
   case battery = "🔋"
   case beachWithUmbrella = "🏖️"
   case beamingFaceWithSmilingEyes = "😁"
   case beans = "🫘"
   case bear = "🐻"
   case beatingHeart = "💓"
   case beaver = "🦫"
   case bed = "🛏️"
   case beerMug = "🍺"
   case beetle = "🪲"
   case bell = "🔔"
   case bellPepper = "🫑"
   case bellWithSlash = "🔕"
   case bellhopBell = "🛎️"
   case bentoBox = "🍱"
   case beverageBox = "🧃"
   case bicycle = "🚲"
   case bikini = "👙"
   case billedCap = "🧢"
   case biohazard = "☣️"
   case bird = "🐦"
   case birthdayCake = "🎂"
   case bison = "🦬"
   case bitingLip = "🫦"
   case blackBird = "🐦‍⬛"
   case blackCat = "🐈‍⬛"
   case blackCircle = "⚫"
   case blackFlag = "🏴"
   case blackHeart = "🖤"
   case blackLargeSquare = "⬛"
   case blackMediumSmallSquare = "◾"
   case blackMediumSquare = "◼️"
   case blackNib = "✒️"
   case blackSmallSquare = "▪️"
   case blackSquareButton = "🔲"
   case blossom = "🌼"
   case blowfish = "🐡"
   case blueBook = "📘"
   case blueCircle = "🔵"
   case blueHeart = "💙"
   case blueSquare = "🟦"
   case blueberries = "🫐"
   case boar = "🐗"
   case bomb = "💣"
   case bone = "🦴"
   case bookmark = "🔖"
   case bookmarkTabs = "📑"
   case books = "📚"
   case boomerang = "🪃"
   case bottleWithPoppingCork = "🍾"
   case bouquet = "💐"
   case bowAndArrow = "🏹"
   case bowlWithSpoon = "🥣"
   case bowling = "🎳"
   case boxingGlove = "🥊"
   case boy = "👦"
   case brain = "🧠"
   case bread = "🍞"
   case breastFeeding = "🤱"
   case brick = "🧱"
   case brideWithVeil = "👰"
   case bridgeAtNight = "🌉"
   case briefcase = "💼"
   case briefs = "🩲"
   case brightButton = "🔆"
   case broccoli = "🥦"
   case brokenHeart = "💔"
   case broom = "🧹"
   case brownCircle = "🟤"
   case brownHeart = "🤎"
   case brownSquare = "🟫"
   case bubbleTea = "🧋"
   case bubbles = "🫧"
   case bucket = "🪣"
   case bug = "🐛"
   case buildingConstruction = "🏗️"
   case bulletTrain = "🚅"
   case burrito = "🌯"
   case bus = "🚌"
   case busStop = "🚏"
   case bustInSilhouette = "👤"
   case bustsInSilhouette = "👥"
   case butter = "🧈"
   case butterfly = "🦋"
   case cactus = "🌵"
   case calendar = "📅"
   case callMeHand = "🤙"
   case camel = "🐪"
   case camera = "📷"
   case cameraWithFlash = "📸"
   case camping = "🏕️"
   case cancer = "♋"
   case candle = "🕯️"
   case candy = "🍬"
   case cannedFood = "🥫"
   case canoe = "🛶"
   case capricorn = "♑"
   case cardFileBox = "🗃️"
   case cardIndex = "📇"
   case cardIndexDividers = "🗂️"
   case carouselHorse = "🎠"
   case carpStreamer = "🎏"
   case carpentrySaw = "🪚"
   case carrot = "🥕"
   case castle = "🏰"
   case cat = "🐈"
   case catFace = "🐱"
   case catWithTearsOfJoy = "😹"
   case catWithWrySmile = "😼"
   case chains = "⛓️"
   case chair = "🪑"
   case chartDecreasing = "📉"
   case chartIncreasing = "📈"
   case chartIncreasingWithYen = "💹"
   case checkBoxWithCheck = "☑️"
   case checkMark = "✔️"
   case checkMarkButton = "✅"
   case cheeseWedge = "🧀"
   case chequeredFlag = "🏁"
   case cherries = "🍒"
   case cherryBlossom = "🌸"
   case chessPawn = "♟️"
   case chestnut = "🌰"
   case chicken = "🐔"
   case child = "🧒"
   case childrenCrossing = "🚸"
   case chipmunk = "🐿️"
   case chocolateBar = "🍫"
   case chopsticks = "🥢"
   case christmasTree = "🎄"
   case church = "⛪"
   case cigarette = "🚬"
   case cinema = "🎦"
   case circledM = "Ⓜ️"
   case circusTent = "🎪"
   case cityscape = "🏙️"
   case cityscapeAtDusk = "🌆"
   case clButton = "🆑"
   case clamp = "🗜️"
   case clapperBoard = "🎬"
   case clappingHands = "👏"
   case classicalBuilding = "🏛️"
   case clinkingBeerMugs = "🍻"
   case clinkingGlasses = "🥂"
   case clipboard = "📋"
   case clockwiseVerticalArrows = "🔃"
   case closedBook = "📕"
   case closedMailboxWithLoweredFlag = "📪"
   case closedMailboxWithRaisedFlag = "📫"
   case closedUmbrella = "🌂"
   case cloud = "☁️"
   case cloudWithLightning = "🌩️"
   case cloudWithLightningAndRain = "⛈️"
   case cloudWithRain = "🌧️"
   case cloudWithSnow = "🌨️"
   case clownFace = "🤡"
   case clubSuit = "♣️"
   case clutchBag = "👝"
   case coat = "🧥"
   case cockroach = "🪳"
   case cocktailGlass = "🍸"
   case coconut = "🥥"
   case coffin = "⚰️"
   case coin = "🪙"
   case coldFace = "🥶"
   case collision = "💥"
   case comet = "☄️"
   case compass = "🧭"
   case computerDisk = "💽"
   case computerMouse = "🖱️"
   case confettiBall = "🎊"
   case confoundedFace = "😖"
   case confusedFace = "😕"
   case construction = "🚧"
   case constructionWorker = "👷"
   case controlKnobs = "🎛️"
   case convenienceStore = "🏪"
   case cook = "🧑‍🍳"
   case cookedRice = "🍚"
   case cookie = "🍪"
   case cooking = "🍳"
   case coolButton = "🆒"
   case copyright = "©️"
   case coral = "🪸"
   case couchAndLamp = "🛋️"
   case counterclockwiseArrowsButton = "🔄"
   case coupleWithHeart = "💑"
   case coupleWithHeartManMan = "👨‍❤️‍👨"
   case coupleWithHeartWomanMan = "👩‍❤️‍👨"
   case coupleWithHeartWomanWoman = "👩‍❤️‍👩"
   case cow = "🐄"
   case cowFace = "🐮"
   case cowboyHatFace = "🤠"
   case crab = "🦀"
   case crayon = "🖍️"
   case creditCard = "💳"
   case crescentMoon = "🌙"
   case cricket = "🦗"
   case cricketGame = "🏏"
   case crocodile = "🐊"
   case croissant = "🥐"
   case crossMark = "❌"
   case crossMarkButton = "❎"
   case crossedFingers = "🤞"
   case crossedFlags = "🎌"
   case crossedSwords = "⚔️"
   case crown = "👑"
   case crutch = "🩼"
   case cryingCat = "😿"
   case cryingFace = "😢"
   case crystalBall = "🔮"
   case cucumber = "🥒"
   case cupWithStraw = "🥤"
   case cupcake = "🧁"
   case curlingStone = "🥌"
   case curlyLoop = "➰"
   case currencyExchange = "💱"
   case curryRice = "🍛"
   case custard = "🍮"
   case customs = "🛃"
   case cutOfMeat = "🥩"
   case cyclone = "🌀"
   case dagger = "🗡️"
   case dango = "🍡"
   case dashingAway = "💨"
   case deafMan = "🧏‍♂️"
   case deafPerson = "🧏"
   case deafWoman = "🧏‍♀️"
   case deciduousTree = "🌳"
   case deer = "🦌"
   case deliveryTruck = "🚚"
   case departmentStore = "🏬"
   case derelictHouse = "🏚️"
   case desert = "🏜️"
   case desertIsland = "🏝️"
   case desktopComputer = "🖥️"
   case detective = "🕵️"
   case diamondSuit = "♦️"
   case diamondWithADot = "💠"
   case dimButton = "🔅"
   case directHit = "🎯"
   case disappointedFace = "😞"
   case disguisedFace = "🥸"
   case divingMask = "🤿"
   case divisionSign = "➗"
   case diyaLamp = "🪔"
   case dizzy = "💫"
   case dizzyFace = "😵"
   case dna = "🧬"
   case dodo = "🦤"
   case dog = "🐕"
   case dogFace = "🐶"
   case dollarBanknote = "💵"
   case dolphin = "🐬"
   case donkey = "🫏"
   case door = "🚪"
   case dottedLineFace = "🫥"
   case dottedSixPointedStar = "🔯"
   case doubleCurlyLoop = "➿"
   case doubleExclamationMark = "‼️"
   case doughnut = "🍩"
   case dove = "🕊️"
   case downArrow = "⬇️"
   case downLeftArrow = "↙️"
   case downRightArrow = "↘️"
   case downcastFaceWithSweat = "😓"
   case downwardsButton = "🔽"
   case dragon = "🐉"
   case dragonFace = "🐲"
   case dress = "👗"
   case droolingFace = "🤤"
   case dropOfBlood = "🩸"
   case droplet = "💧"
   case drum = "🥁"
   case duck = "🦆"
   case dumpling = "🥟"
   case dvd = "📀"
   case eMail = "📧"
   case eagle = "🦅"
   case ear = "👂"
   case earOfCorn = "🌽"
   case earWithHearingAid = "🦻"
   case egg = "🥚"
   case eggplant = "🍆"
   case eightOClock = "🕗"
   case eightPointedStar = "✴️"
   case eightSpokedAsterisk = "✳️"
   case eightThirty = "🕣"
   case ejectButton = "⏏️"
   case electricPlug = "🔌"
   case elephant = "🐘"
   case elevator = "🛗"
   case elevenOClock = "🕚"
   case elevenThirty = "🕦"
   case elf = "🧝"
   case emptyNest = "🪹"
   case endArrow = "🔚"
   case envelope = "✉️"
   case envelopeWithArrow = "📩"
   case euroBanknote = "💶"
   case evergreenTree = "🌲"
   case ewe = "🐑"
   case exclamationMark = "❗"
   case exclamationQuestionMark = "⁉️"
   case explodingHead = "🤯"
   case expressionlessFace = "😑"
   case eye = "👁️"
   case eyeInSpeechBubble = "👁️‍🗨️"
   case eyes = "👀"
   case faceBlowingAKiss = "😘"
   case faceExhaling = "😮‍💨"
   case faceHoldingBackTears = "🥹"
   case faceInClouds = "😶‍🌫️"
   case faceSavoringFood = "😋"
   case faceScreamingInFear = "😱"
   case faceVomiting = "🤮"
   case faceWithDiagonalMouth = "🫤"
   case faceWithHandOverMouth = "🤭"
   case faceWithHeadBandage = "🤕"
   case faceWithMedicalMask = "😷"
   case faceWithMonocle = "🧐"
   case faceWithOpenEyesAndHandOverMouth = "🫢"
   case faceWithOpenMouth = "😮"
   case faceWithPeekingEye = "🫣"
   case faceWithRaisedEyebrow = "🤨"
   case faceWithRollingEyes = "🙄"
   case faceWithSpiralEyes = "😵‍💫"
   case faceWithSteamFromNose = "😤"
   case faceWithSymbolsOnMouth = "🤬"
   case faceWithTearsOfJoy = "😂"
   case faceWithThermometer = "🤒"
   case faceWithTongue = "😛"
   case faceWithoutMouth = "😶"
   case factory = "🏭"
   case factoryWorker = "🧑‍🏭"
   case fairy = "🧚"
   case falafel = "🧆"
   case fallenLeaf = "🍂"
   case family = "👪"
   case familyManBoy = "👨‍👦"
   case familyManBoyBoy = "👨‍👦‍👦"
   case familyManGirl = "👨‍👧"
   case familyManGirlBoy = "👨‍👧‍👦"
   case familyManGirlGirl = "👨‍👧‍👧"
   case familyManManBoy = "👨‍👨‍👦"
   case familyManManBoyBoy = "👨‍👨‍👦‍👦"
   case familyManManGirl = "👨‍👨‍👧"
   case familyManManGirlBoy = "👨‍👨‍👧‍👦"
   case familyManManGirlGirl = "👨‍👨‍👧‍👧"
   case familyManWomanBoy = "👨‍👩‍👦"
   case familyManWomanBoyBoy = "👨‍👩‍👦‍👦"
   case familyManWomanGirl = "👨‍👩‍👧"
   case familyManWomanGirlBoy = "👨‍👩‍👧‍👦"
   case familyManWomanGirlGirl = "👨‍👩‍👧‍👧"
   case familyWomanBoy = "👩‍👦"
   case familyWomanBoyBoy = "👩‍👦‍👦"
   case familyWomanGirl = "👩‍👧"
   case familyWomanGirlBoy = "👩‍👧‍👦"
   case familyWomanGirlGirl = "👩‍👧‍👧"
   case familyWomanWomanBoy = "👩‍👩‍👦"
   case familyWomanWomanBoyBoy = "👩‍👩‍👦‍👦"
   case familyWomanWomanGirl = "👩‍👩‍👧"
   case familyWomanWomanGirlBoy = "👩‍👩‍👧‍👦"
   case familyWomanWomanGirlGirl = "👩‍👩‍👧‍👧"
   case farmer = "🧑‍🌾"
   case fastDownButton = "⏬"
   case fastForwardButton = "⏩"
   case fastReverseButton = "⏪"
   case fastUpButton = "⏫"
   case faxMachine = "📠"
   case fearfulFace = "😨"
   case feather = "🪶"
   case femaleSign = "♀️"
   case ferrisWheel = "🎡"
   case ferry = "⛴️"
   case fieldHockey = "🏑"
   case fileCabinet = "🗄️"
   case fileFolder = "📁"
   case filmFrames = "🎞️"
   case filmProjector = "📽️"
   case fire = "🔥"
   case fireEngine = "🚒"
   case fireExtinguisher = "🧯"
   case firecracker = "🧨"
   case firefighter = "🧑‍🚒"
   case fireworks = "🎆"
   case firstQuarterMoon = "🌓"
   case firstQuarterMoonFace = "🌛"
   case fish = "🐟"
   case fishCakeWithSwirl = "🍥"
   case fishingPole = "🎣"
   case fiveOClock = "🕔"
   case fiveThirty = "🕠"
   case flagAfghanistan = "🇦🇫"
   case flagAlandIslands = "🇦🇽"
   case flagAlbania = "🇦🇱"
   case flagAlgeria = "🇩🇿"
   case flagAmericanSamoa = "🇦🇸"
   case flagAndorra = "🇦🇩"
   case flagAngola = "🇦🇴"
   case flagAnguilla = "🇦🇮"
   case flagAntarctica = "🇦🇶"
   case flagAntiguaBarbuda = "🇦🇬"
   case flagArgentina = "🇦🇷"
   case flagArmenia = "🇦🇲"
   case flagAruba = "🇦🇼"
   case flagAscensionIsland = "🇦🇨"
   case flagAustralia = "🇦🇺"
   case flagAustria = "🇦🇹"
   case flagAzerbaijan = "🇦🇿"
   case flagBahamas = "🇧🇸"
   case flagBahrain = "🇧🇭"
   case flagBangladesh = "🇧🇩"
   case flagBarbados = "🇧🇧"
   case flagBelarus = "🇧🇾"
   case flagBelgium = "🇧🇪"
   case flagBelize = "🇧🇿"
   case flagBenin = "🇧🇯"
   case flagBermuda = "🇧🇲"
   case flagBhutan = "🇧🇹"
   case flagBolivia = "🇧🇴"
   case flagBosniaHerzegovina = "🇧🇦"
   case flagBotswana = "🇧🇼"
   case flagBouvetIsland = "🇧🇻"
   case flagBrazil = "🇧🇷"
   case flagBritishIndianOceanTerritory = "🇮🇴"
   case flagBritishVirginIslands = "🇻🇬"
   case flagBrunei = "🇧🇳"
   case flagBulgaria = "🇧🇬"
   case flagBurkinaFaso = "🇧🇫"
   case flagBurundi = "🇧🇮"
   case flagCambodia = "🇰🇭"
   case flagCameroon = "🇨🇲"
   case flagCanada = "🇨🇦"
   case flagCanaryIslands = "🇮🇨"
   case flagCapeVerde = "🇨🇻"
   case flagCaribbeanNetherlands = "🇧🇶"
   case flagCaymanIslands = "🇰🇾"
   case flagCentralAfricanRepublic = "🇨🇫"
   case flagCeutaMelilla = "🇪🇦"
   case flagChad = "🇹🇩"
   case flagChile = "🇨🇱"
   case flagChina = "🇨🇳"
   case flagChristmasIsland = "🇨🇽"
   case flagClippertonIsland = "🇨🇵"
   case flagCocosIslands = "🇨🇨"
   case flagColombia = "🇨🇴"
   case flagComoros = "🇰🇲"
   case flagCongoBrazzaville = "🇨🇬"
   case flagCongoKinshasa = "🇨🇩"
   case flagCookIslands = "🇨🇰"
   case flagCostaRica = "🇨🇷"
   case flagCoteDIvoire = "🇨🇮"
   case flagCroatia = "🇭🇷"
   case flagCuba = "🇨🇺"
   case flagCuracao = "🇨🇼"
   case flagCyprus = "🇨🇾"
   case flagCzechia = "🇨🇿"
   case flagDenmark = "🇩🇰"
   case flagDiegoGarcia = "🇩🇬"
   case flagDjibouti = "🇩🇯"
   case flagDominica = "🇩🇲"
   case flagDominicanRepublic = "🇩🇴"
   case flagEcuador = "🇪🇨"
   case flagEgypt = "🇪🇬"
   case flagElSalvador = "🇸🇻"
   case flagEngland = "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
   case flagEquatorialGuinea = "🇬🇶"
   case flagEritrea = "🇪🇷"
   case flagEstonia = "🇪🇪"
   case flagEswatini = "🇸🇿"
   case flagEthiopia = "🇪🇹"
   case flagEuropeanUnion = "🇪🇺"
   case flagFalklandIslands = "🇫🇰"
   case flagFaroeIslands = "🇫🇴"
   case flagFiji = "🇫🇯"
   case flagFinland = "🇫🇮"
   case flagFrance = "🇫🇷"
   case flagFrenchGuiana = "🇬🇫"
   case flagFrenchPolynesia = "🇵🇫"
   case flagFrenchSouthernTerritories = "🇹🇫"
   case flagGabon = "🇬🇦"
   case flagGambia = "🇬🇲"
   case flagGeorgia = "🇬🇪"
   case flagGermany = "🇩🇪"
   case flagGhana = "🇬🇭"
   case flagGibraltar = "🇬🇮"
   case flagGreece = "🇬🇷"
   case flagGreenland = "🇬🇱"
   case flagGrenada = "🇬🇩"
   case flagGuadeloupe = "🇬🇵"
   case flagGuam = "🇬🇺"
   case flagGuatemala = "🇬🇹"
   case flagGuernsey = "🇬🇬"
   case flagGuinea = "🇬🇳"
   case flagGuineaBissau = "🇬🇼"
   case flagGuyana = "🇬🇾"
   case flagHaiti = "🇭🇹"
   case flagHeardMcdonaldIslands = "🇭🇲"
   case flagHonduras = "🇭🇳"
   case flagHongKongSarChina = "🇭🇰"
   case flagHungary = "🇭🇺"
   case flagIceland = "🇮🇸"
   case flagInHole = "⛳"
   case flagIndia = "🇮🇳"
   case flagIndonesia = "🇮🇩"
   case flagIran = "🇮🇷"
   case flagIraq = "🇮🇶"
   case flagIreland = "🇮🇪"
   case flagIsleOfMan = "🇮🇲"
   case flagIsrael = "🇮🇱"
   case flagItaly = "🇮🇹"
   case flagJamaica = "🇯🇲"
   case flagJapan = "🇯🇵"
   case flagJersey = "🇯🇪"
   case flagJordan = "🇯🇴"
   case flagKazakhstan = "🇰🇿"
   case flagKenya = "🇰🇪"
   case flagKiribati = "🇰🇮"
   case flagKosovo = "🇽🇰"
   case flagKuwait = "🇰🇼"
   case flagKyrgyzstan = "🇰🇬"
   case flagLaos = "🇱🇦"
   case flagLatvia = "🇱🇻"
   case flagLebanon = "🇱🇧"
   case flagLesotho = "🇱🇸"
   case flagLiberia = "🇱🇷"
   case flagLibya = "🇱🇾"
   case flagLiechtenstein = "🇱🇮"
   case flagLithuania = "🇱🇹"
   case flagLuxembourg = "🇱🇺"
   case flagMacaoSarChina = "🇲🇴"
   case flagMadagascar = "🇲🇬"
   case flagMalawi = "🇲🇼"
   case flagMalaysia = "🇲🇾"
   case flagMaldives = "🇲🇻"
   case flagMali = "🇲🇱"
   case flagMalta = "🇲🇹"
   case flagMarshallIslands = "🇲🇭"
   case flagMartinique = "🇲🇶"
   case flagMauritania = "🇲🇷"
   case flagMauritius = "🇲🇺"
   case flagMayotte = "🇾🇹"
   case flagMexico = "🇲🇽"
   case flagMicronesia = "🇫🇲"
   case flagMoldova = "🇲🇩"
   case flagMonaco = "🇲🇨"
   case flagMongolia = "🇲🇳"
   case flagMontenegro = "🇲🇪"
   case flagMontserrat = "🇲🇸"
   case flagMorocco = "🇲🇦"
   case flagMozambique = "🇲🇿"
   case flagMyanmar = "🇲🇲"
   case flagNamibia = "🇳🇦"
   case flagNauru = "🇳🇷"
   case flagNepal = "🇳🇵"
   case flagNetherlands = "🇳🇱"
   case flagNewCaledonia = "🇳🇨"
   case flagNewZealand = "🇳🇿"
   case flagNicaragua = "🇳🇮"
   case flagNiger = "🇳🇪"
   case flagNigeria = "🇳🇬"
   case flagNiue = "🇳🇺"
   case flagNorfolkIsland = "🇳🇫"
   case flagNorthKorea = "🇰🇵"
   case flagNorthMacedonia = "🇲🇰"
   case flagNorthernMarianaIslands = "🇲🇵"
   case flagNorway = "🇳🇴"
   case flagOman = "🇴🇲"
   case flagPakistan = "🇵🇰"
   case flagPalau = "🇵🇼"
   case flagPalestinianTerritories = "🇵🇸"
   case flagPanama = "🇵🇦"
   case flagPapuaNewGuinea = "🇵🇬"
   case flagParaguay = "🇵🇾"
   case flagPeru = "🇵🇪"
   case flagPhilippines = "🇵🇭"
   case flagPitcairnIslands = "🇵🇳"
   case flagPoland = "🇵🇱"
   case flagPortugal = "🇵🇹"
   case flagPuertoRico = "🇵🇷"
   case flagQatar = "🇶🇦"
   case flagReunion = "🇷🇪"
   case flagRomania = "🇷🇴"
   case flagRussia = "🇷🇺"
   case flagRwanda = "🇷🇼"
   case flagSamoa = "🇼🇸"
   case flagSanMarino = "🇸🇲"
   case flagSaoTomePrincipe = "🇸🇹"
   case flagSaudiArabia = "🇸🇦"
   case flagScotland = "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
   case flagSenegal = "🇸🇳"
   case flagSerbia = "🇷🇸"
   case flagSeychelles = "🇸🇨"
   case flagSierraLeone = "🇸🇱"
   case flagSingapore = "🇸🇬"
   case flagSintMaarten = "🇸🇽"
   case flagSlovakia = "🇸🇰"
   case flagSlovenia = "🇸🇮"
   case flagSolomonIslands = "🇸🇧"
   case flagSomalia = "🇸🇴"
   case flagSouthAfrica = "🇿🇦"
   case flagSouthGeorgiaSouthSandwichIslands = "🇬🇸"
   case flagSouthKorea = "🇰🇷"
   case flagSouthSudan = "🇸🇸"
   case flagSpain = "🇪🇸"
   case flagSriLanka = "🇱🇰"
   case flagStBarthelemy = "🇧🇱"
   case flagStHelena = "🇸🇭"
   case flagStKittsNevis = "🇰🇳"
   case flagStLucia = "🇱🇨"
   case flagStMartin = "🇲🇫"
   case flagStPierreMiquelon = "🇵🇲"
   case flagStVincentGrenadines = "🇻🇨"
   case flagSudan = "🇸🇩"
   case flagSuriname = "🇸🇷"
   case flagSvalbardJanMayen = "🇸🇯"
   case flagSweden = "🇸🇪"
   case flagSwitzerland = "🇨🇭"
   case flagSyria = "🇸🇾"
   case flagTaiwan = "🇹🇼"
   case flagTajikistan = "🇹🇯"
   case flagTanzania = "🇹🇿"
   case flagThailand = "🇹🇭"
   case flagTimorLeste = "🇹🇱"
   case flagTogo = "🇹🇬"
   case flagTokelau = "🇹🇰"
   case flagTonga = "🇹🇴"
   case flagTrinidadTobago = "🇹🇹"
   case flagTristanDaCunha = "🇹🇦"
   case flagTunisia = "🇹🇳"
   case flagTurkey = "🇹🇷"
   case flagTurkmenistan = "🇹🇲"
   case flagTurksCaicosIslands = "🇹🇨"
   case flagTuvalu = "🇹🇻"
   case flagUSOutlyingIslands = "🇺🇲"
   case flagUSVirginIslands = "🇻🇮"
   case flagUganda = "🇺🇬"
   case flagUkraine = "🇺🇦"
   case flagUnitedArabEmirates = "🇦🇪"
   case flagUnitedKingdom = "🇬🇧"
   case flagUnitedNations = "🇺🇳"
   case flagUnitedStates = "🇺🇸"
   case flagUruguay = "🇺🇾"
   case flagUzbekistan = "🇺🇿"
   case flagVanuatu = "🇻🇺"
   case flagVaticanCity = "🇻🇦"
   case flagVenezuela = "🇻🇪"
   case flagVietnam = "🇻🇳"
   case flagWales = "🏴󠁧󠁢󠁷󠁬󠁳󠁿"
   case flagWallisFutuna = "🇼🇫"
   case flagWesternSahara = "🇪🇭"
   case flagYemen = "🇾🇪"
   case flagZambia = "🇿🇲"
   case flagZimbabwe = "🇿🇼"
   case flamingo = "🦩"
   case flashlight = "🔦"
   case flatShoe = "🥿"
   case flatbread = "🫓"
   case fleurDeLis = "⚜️"
   case flexedBiceps = "💪"
   case floppyDisk = "💾"
   case flowerPlayingCards = "🎴"
   case flushedFace = "😳"
   case flute = "🪈"
   case fly = "🪰"
   case flyingDisc = "🥏"
   case flyingSaucer = "🛸"
   case fog = "🌫️"
   case foggy = "🌁"
   case foldedHands = "🙏"
   case foldingHandFan = "🪭"
   case fondue = "🫕"
   case foot = "🦶"
   case footprints = "👣"
   case forkAndKnife = "🍴"
   case forkAndKnifeWithPlate = "🍽️"
   case fortuneCookie = "🥠"
   case fountain = "⛲"
   case fountainPen = "🖋️"
   case fourLeafClover = "🍀"
   case fourOClock = "🕓"
   case fourThirty = "🕟"
   case fox = "🦊"
   case framedPicture = "🖼️"
   case freeButton = "🆓"
   case frenchFries = "🍟"
   case friedShrimp = "🍤"
   case frog = "🐸"
   case frontFacingBabyChick = "🐥"
   case frowningFace = "☹️"
   case frowningFaceWithOpenMouth = "😦"
   case fuelPump = "⛽"
   case fullMoon = "🌕"
   case fullMoonFace = "🌝"
   case funeralUrn = "⚱️"
   case gameDie = "🎲"
   case garlic = "🧄"
   case gear = "⚙️"
   case gemStone = "💎"
   case gemini = "♊"
   case genie = "🧞"
   case ghost = "👻"
   case gingerRoot = "🫚"
   case giraffe = "🦒"
   case girl = "👧"
   case glassOfMilk = "🥛"
   case glasses = "👓"
   case globeShowingAmericas = "🌎"
   case globeShowingAsiaAustralia = "🌏"
   case globeShowingEuropeAfrica = "🌍"
   case globeWithMeridians = "🌐"
   case gloves = "🧤"
   case glowingStar = "🌟"
   case goalNet = "🥅"
   case goat = "🐐"
   case goblin = "👺"
   case goggles = "🥽"
   case goose = "🪿"
   case gorilla = "🦍"
   case graduationCap = "🎓"
   case grapes = "🍇"
   case greenApple = "🍏"
   case greenBook = "📗"
   case greenCircle = "🟢"
   case greenHeart = "💚"
   case greenSalad = "🥗"
   case greenSquare = "🟩"
   case greyHeart = "🩶"
   case grimacingFace = "😬"
   case grinningCat = "😺"
   case grinningCatWithSmilingEyes = "😸"
   case grinningFace = "😀"
   case grinningFaceWithBigEyes = "😃"
   case grinningFaceWithSmilingEyes = "😄"
   case grinningFaceWithSweat = "😅"
   case grinningSquintingFace = "😆"
   case growingHeart = "💗"
   case `guard` = "💂"
   case guideDog = "🦮"
   case guitar = "🎸"
   case hairPick = "🪮"
   case hamburger = "🍔"
   case hammer = "🔨"
   case hammerAndPick = "⚒️"
   case hammerAndWrench = "🛠️"
   case hamsa = "🪬"
   case hamster = "🐹"
   case handWithFingersSplayed = "🖐️"
   case handWithIndexFingerAndThumbCrossed = "🫰"
   case handbag = "👜"
   case handshake = "🤝"
   case hatchingChick = "🐣"
   case headphone = "🎧"
   case headstone = "🪦"
   case healthWorker = "🧑‍⚕️"
   case hearNoEvilMonkey = "🙉"
   case heartDecoration = "💟"
   case heartExclamation = "❣️"
   case heartHands = "🫶"
   case heartOnFire = "❤️‍🔥"
   case heartSuit = "♥️"
   case heartWithArrow = "💘"
   case heartWithRibbon = "💝"
   case heavyDollarSign = "💲"
   case heavyEqualsSign = "🟰"
   case hedgehog = "🦔"
   case helicopter = "🚁"
   case herb = "🌿"
   case hibiscus = "🌺"
   case highHeeledShoe = "👠"
   case highSpeedTrain = "🚄"
   case highVoltage = "⚡"
   case hikingBoot = "🥾"
   case hinduTemple = "🛕"
   case hippopotamus = "🦛"
   case hole = "🕳️"
   case hollowRedCircle = "⭕"
   case honeyPot = "🍯"
   case honeybee = "🐝"
   case hook = "🪝"
   case horizontalTrafficLight = "🚥"
   case horse = "🐎"
   case horseFace = "🐴"
   case horseRacing = "🏇"
   case hospital = "🏥"
   case hotBeverage = "☕"
   case hotDog = "🌭"
   case hotFace = "🥵"
   case hotPepper = "🌶️"
   case hotSprings = "♨️"
   case hotel = "🏨"
   case hourglassDone = "⌛"
   case hourglassNotDone = "⏳"
   case house = "🏠"
   case houseWithGarden = "🏡"
   case houses = "🏘️"
   case huggingFace = "🤗"
   case hundredPoints = "💯"
   case hushedFace = "😯"
   case hut = "🛖"
   case hyacinth = "🪻"
   case ice = "🧊"
   case iceCream = "🍨"
   case iceHockey = "🏒"
   case iceSkate = "⛸️"
   case idButton = "🆔"
   case identificationCard = "🪪"
   case inboxTray = "📥"
   case incomingEnvelope = "📨"
   case indexPointingAtTheViewer = "🫵"
   case indexPointingUp = "☝️"
   case infinity = "♾️"
   case information = "ℹ️"
   case inputLatinLetters = "🔤"
   case inputLatinLowercase = "🔡"
   case inputLatinUppercase = "🔠"
   case inputNumbers = "🔢"
   case inputSymbols = "🔣"
   case jackOLantern = "🎃"
   case japaneseAcceptableButton = "🉑"
   case japaneseApplicationButton = "🈸"
   case japaneseBargainButton = "🉐"
   case japaneseCastle = "🏯"
   case japaneseCongratulationsButton = "㊗️"
   case japaneseDiscountButton = "🈹"
   case japaneseDolls = "🎎"
   case japaneseFreeOfChargeButton = "🈚"
   case japaneseHereButton = "🈁"
   case japaneseMonthlyAmountButton = "🈷️"
   case japaneseNoVacancyButton = "🈵"
   case japaneseNotFreeOfChargeButton = "🈶"
   case japaneseOpenForBusinessButton = "🈺"
   case japanesePassingGradeButton = "🈴"
   case japanesePostOffice = "🏣"
   case japaneseProhibitedButton = "🈲"
   case japaneseReservedButton = "🈯"
   case japaneseSecretButton = "㊙️"
   case japaneseServiceChargeButton = "🈂️"
   case japaneseSymbolForBeginner = "🔰"
   case japaneseVacancyButton = "🈳"
   case jar = "🫙"
   case jeans = "👖"
   case jellyfish = "🪼"
   case joker = "🃏"
   case joystick = "🕹️"
   case judge = "🧑‍⚖️"
   case kaaba = "🕋"
   case kangaroo = "🦘"
   case key = "🔑"
   case keyboard = "⌨️"
   case keycapStar = "*️⃣"
   case keycapSymbol = "#️⃣"
   case keycap0 = "0️⃣"
   case keycap1 = "1️⃣"
   case keycap10 = "🔟"
   case keycap2 = "2️⃣"
   case keycap3 = "3️⃣"
   case keycap4 = "4️⃣"
   case keycap5 = "5️⃣"
   case keycap6 = "6️⃣"
   case keycap7 = "7️⃣"
   case keycap8 = "8️⃣"
   case keycap9 = "9️⃣"
   case khanda = "🪯"
   case kickScooter = "🛴"
   case kimono = "👘"
   case kiss = "💏"
   case kissManMan = "👨‍❤️‍💋‍👨"
   case kissMark = "💋"
   case kissWomanMan = "👩‍❤️‍💋‍👨"
   case kissWomanWoman = "👩‍❤️‍💋‍👩"
   case kissingCat = "😽"
   case kissingFace = "😗"
   case kissingFaceWithClosedEyes = "😚"
   case kissingFaceWithSmilingEyes = "😙"
   case kitchenKnife = "🔪"
   case kite = "🪁"
   case kiwiFruit = "🥝"
   case knot = "🪢"
   case koala = "🐨"
   case labCoat = "🥼"
   case label = "🏷️"
   case lacrosse = "🥍"
   case ladder = "🪜"
   case ladyBeetle = "🐞"
   case laptop = "💻"
   case largeBlueDiamond = "🔷"
   case largeOrangeDiamond = "🔶"
   case lastQuarterMoon = "🌗"
   case lastQuarterMoonFace = "🌜"
   case lastTrackButton = "⏮️"
   case latinCross = "✝️"
   case leafFlutteringInWind = "🍃"
   case leafyGreen = "🥬"
   case ledger = "📒"
   case leftArrow = "⬅️"
   case leftArrowCurvingRight = "↪️"
   case leftFacingFist = "🤛"
   case leftLuggage = "🛅"
   case leftRightArrow = "↔️"
   case leftSpeechBubble = "🗨️"
   case leftwardsHand = "🫲"
   case leftwardsPushingHand = "🫷"
   case leg = "🦵"
   case lemon = "🍋"
   case leo = "♌"
   case leopard = "🐆"
   case levelSlider = "🎚️"
   case libra = "♎"
   case lightBlueHeart = "🩵"
   case lightBulb = "💡"
   case lightRail = "🚈"
   case link = "🔗"
   case linkedPaperclips = "🖇️"
   case lion = "🦁"
   case lipstick = "💄"
   case litterInBinSign = "🚮"
   case lizard = "🦎"
   case llama = "🦙"
   case lobster = "🦞"
   case locked = "🔒"
   case lockedWithKey = "🔐"
   case lockedWithPen = "🔏"
   case locomotive = "🚂"
   case lollipop = "🍭"
   case longDrum = "🪘"
   case lotionBottle = "🧴"
   case lotus = "🪷"
   case loudlyCryingFace = "😭"
   case loudspeaker = "📢"
   case loveHotel = "🏩"
   case loveLetter = "💌"
   case loveYouGesture = "🤟"
   case lowBattery = "🪫"
   case luggage = "🧳"
   case lungs = "🫁"
   case lyingFace = "🤥"
   case mage = "🧙"
   case magicWand = "🪄"
   case magnet = "🧲"
   case magnifyingGlassTiltedLeft = "🔍"
   case magnifyingGlassTiltedRight = "🔎"
   case mahjongRedDragon = "🀄"
   case maleSign = "♂️"
   case mammoth = "🦣"
   case man = "👨"
   case manArtist = "👨‍🎨"
   case manAstronaut = "👨‍🚀"
   case manBald = "👨‍🦲"
   case manBeard = "🧔‍♂️"
   case manBiking = "🚴‍♂️"
   case manBlondHair = "👱‍♂️"
   case manBouncingBall = "⛹️‍♂️"
   case manBowing = "🙇‍♂️"
   case manCartwheeling = "🤸‍♂️"
   case manClimbing = "🧗‍♂️"
   case manConstructionWorker = "👷‍♂️"
   case manCook = "👨‍🍳"
   case manCurlyHair = "👨‍🦱"
   case manDancing = "🕺"
   case manDetective = "🕵️‍♂️"
   case manElf = "🧝‍♂️"
   case manFacepalming = "🤦‍♂️"
   case manFactoryWorker = "👨‍🏭"
   case manFairy = "🧚‍♂️"
   case manFarmer = "👨‍🌾"
   case manFeedingBaby = "👨‍🍼"
   case manFirefighter = "👨‍🚒"
   case manFrowning = "🙍‍♂️"
   case manGenie = "🧞‍♂️"
   case manGesturingNo = "🙅‍♂️"
   case manGesturingOk = "🙆‍♂️"
   case manGettingHaircut = "💇‍♂️"
   case manGettingMassage = "💆‍♂️"
   case manGolfing = "🏌️‍♂️"
   case manGuard = "💂‍♂️"
   case manHealthWorker = "👨‍⚕️"
   case manInLotusPosition = "🧘‍♂️"
   case manInManualWheelchair = "👨‍🦽"
   case manInMotorizedWheelchair = "👨‍🦼"
   case manInSteamyRoom = "🧖‍♂️"
   case manInSuitLevitating = "🕴️"
   case manInTuxedo = "🤵‍♂️"
   case manJudge = "👨‍⚖️"
   case manJuggling = "🤹‍♂️"
   case manKneeling = "🧎‍♂️"
   case manLiftingWeights = "🏋️‍♂️"
   case manMage = "🧙‍♂️"
   case manMechanic = "👨‍🔧"
   case manMountainBiking = "🚵‍♂️"
   case manOfficeWorker = "👨‍💼"
   case manPilot = "👨‍✈️"
   case manPlayingHandball = "🤾‍♂️"
   case manPlayingWaterPolo = "🤽‍♂️"
   case manPoliceOfficer = "👮‍♂️"
   case manPouting = "🙎‍♂️"
   case manRaisingHand = "🙋‍♂️"
   case manRedHair = "👨‍🦰"
   case manRowingBoat = "🚣‍♂️"
   case manRunning = "🏃‍♂️"
   case manSShoe = "👞"
   case manScientist = "👨‍🔬"
   case manShrugging = "🤷‍♂️"
   case manSinger = "👨‍🎤"
   case manStanding = "🧍‍♂️"
   case manStudent = "👨‍🎓"
   case manSuperhero = "🦸‍♂️"
   case manSupervillain = "🦹‍♂️"
   case manSurfing = "🏄‍♂️"
   case manSwimming = "🏊‍♂️"
   case manTeacher = "👨‍🏫"
   case manTechnologist = "👨‍💻"
   case manTippingHand = "💁‍♂️"
   case manVampire = "🧛‍♂️"
   case manWalking = "🚶‍♂️"
   case manWearingTurban = "👳‍♂️"
   case manWhiteHair = "👨‍🦳"
   case manWithProbingCane = "👨‍🦯"
   case manWithSkullcap = "👲"
   case manWithVeil = "👰‍♂️"
   case manZombie = "🧟‍♂️"
   case mango = "🥭"
   case mantelpieceClock = "🕰️"
   case manualWheelchair = "🦽"
   case mapOfJapan = "🗾"
   case mapleLeaf = "🍁"
   case maracas = "🪇"
   case martialArtsUniform = "🥋"
   case mate = "🧉"
   case meatOnBone = "🍖"
   case mechanic = "🧑‍🔧"
   case mechanicalArm = "🦾"
   case mechanicalLeg = "🦿"
   case medicalSymbol = "⚕️"
   case megaphone = "📣"
   case melon = "🍈"
   case meltingFace = "🫠"
   case memo = "📝"
   case menHoldingHands = "👬"
   case menSRoom = "🚹"
   case menWithBunnyEars = "👯‍♂️"
   case menWrestling = "🤼‍♂️"
   case mendingHeart = "❤️‍🩹"
   case menorah = "🕎"
   case mermaid = "🧜‍♀️"
   case merman = "🧜‍♂️"
   case merperson = "🧜"
   case metro = "🚇"
   case microbe = "🦠"
   case microphone = "🎤"
   case microscope = "🔬"
   case middleFinger = "🖕"
   case militaryHelmet = "🪖"
   case militaryMedal = "🎖️"
   case milkyWay = "🌌"
   case minibus = "🚐"
   case minusSign = "➖"
   case mirror = "🪞"
   case mirrorBall = "🪩"
   case moai = "🗿"
   case mobilePhone = "📱"
   case mobilePhoneOff = "📴"
   case mobilePhoneWithArrow = "📲"
   case moneyBag = "💰"
   case moneyMouthFace = "🤑"
   case moneyWithWings = "💸"
   case monkey = "🐒"
   case monkeyFace = "🐵"
   case monorail = "🚝"
   case moonCake = "🥮"
   case moonViewingCeremony = "🎑"
   case moose = "🫎"
   case mosque = "🕌"
   case mosquito = "🦟"
   case motorBoat = "🛥️"
   case motorScooter = "🛵"
   case motorcycle = "🏍️"
   case motorizedWheelchair = "🦼"
   case motorway = "🛣️"
   case mountFuji = "🗻"
   case mountain = "⛰️"
   case mountainCableway = "🚠"
   case mountainRailway = "🚞"
   case mouse = "🐁"
   case mouseFace = "🐭"
   case mouseTrap = "🪤"
   case mouth = "👄"
   case movieCamera = "🎥"
   case mrsClaus = "🤶"
   case multiplicationSign = "✖️"
   case mushroom = "🍄"
   case musicalKeyboard = "🎹"
   case musicalNote = "🎵"
   case musicalNotes = "🎶"
   case musicalScore = "🎼"
   case mutedSpeaker = "🔇"
   case mxClaus = "🧑‍🎄"
   case nailPolish = "💅"
   case nameBadge = "📛"
   case nationalPark = "🏞️"
   case nauseatedFace = "🤢"
   case nazarAmulet = "🧿"
   case necktie = "👔"
   case nerdFace = "🤓"
   case nestWithEggs = "🪺"
   case nestingDolls = "🪆"
   case neutralFace = "😐"
   case newButton = "🆕"
   case newMoon = "🌑"
   case newMoonFace = "🌚"
   case newspaper = "📰"
   case nextTrackButton = "⏭️"
   case ngButton = "🆖"
   case nightWithStars = "🌃"
   case nineOClock = "🕘"
   case nineThirty = "🕤"
   case ninja = "🥷"
   case noBicycles = "🚳"
   case noEntry = "⛔"
   case noLittering = "🚯"
   case noMobilePhones = "📵"
   case noOneUnderEighteen = "🔞"
   case noPedestrians = "🚷"
   case noSmoking = "🚭"
   case nonPotableWater = "🚱"
   case nose = "👃"
   case notebook = "📓"
   case notebookWithDecorativeCover = "📔"
   case nutAndBolt = "🔩"
   case oButton = "🅾️"
   case octopus = "🐙"
   case oden = "🍢"
   case officeBuilding = "🏢"
   case officeWorker = "🧑‍💼"
   case ogre = "👹"
   case oilDrum = "🛢️"
   case okButton = "🆗"
   case okHand = "👌"
   case oldKey = "🗝️"
   case oldMan = "👴"
   case oldWoman = "👵"
   case olderPerson = "🧓"
   case olive = "🫒"
   case om = "🕉️"
   case onArrow = "🔛"
   case oncomingAutomobile = "🚘"
   case oncomingBus = "🚍"
   case oncomingFist = "👊"
   case oncomingPoliceCar = "🚔"
   case oncomingTaxi = "🚖"
   case oneOClock = "🕐"
   case onePieceSwimsuit = "🩱"
   case oneThirty = "🕜"
   case onion = "🧅"
   case openBook = "📖"
   case openFileFolder = "📂"
   case openHands = "👐"
   case openMailboxWithLoweredFlag = "📭"
   case openMailboxWithRaisedFlag = "📬"
   case ophiuchus = "⛎"
   case opticalDisk = "💿"
   case orangeBook = "📙"
   case orangeCircle = "🟠"
   case orangeHeart = "🧡"
   case orangeSquare = "🟧"
   case orangutan = "🦧"
   case orthodoxCross = "☦️"
   case otter = "🦦"
   case outboxTray = "📤"
   case owl = "🦉"
   case ox = "🐂"
   case oyster = "🦪"
   case pButton = "🅿️"
   case package = "📦"
   case pageFacingUp = "📄"
   case pageWithCurl = "📃"
   case pager = "📟"
   case paintbrush = "🖌️"
   case palmDownHand = "🫳"
   case palmTree = "🌴"
   case palmUpHand = "🫴"
   case palmsUpTogether = "🤲"
   case pancakes = "🥞"
   case panda = "🐼"
   case paperclip = "📎"
   case parachute = "🪂"
   case parrot = "🦜"
   case partAlternationMark = "〽️"
   case partyPopper = "🎉"
   case partyingFace = "🥳"
   case passengerShip = "🛳️"
   case passportControl = "🛂"
   case pauseButton = "⏸️"
   case pawPrints = "🐾"
   case peaPod = "🫛"
   case peaceSymbol = "☮️"
   case peach = "🍑"
   case peacock = "🦚"
   case peanuts = "🥜"
   case pear = "🍐"
   case pen = "🖊️"
   case pencil = "✏️"
   case penguin = "🐧"
   case pensiveFace = "😔"
   case peopleHoldingHands = "🧑‍🤝‍🧑"
   case peopleHugging = "🫂"
   case peopleWithBunnyEars = "👯"
   case peopleWrestling = "🤼"
   case performingArts = "🎭"
   case perseveringFace = "😣"
   case person = "🧑"
   case personBald = "🧑‍🦲"
   case personBiking = "🚴"
   case personBlondHair = "👱"
   case personBouncingBall = "⛹️"
   case personBowing = "🙇"
   case personCartwheeling = "🤸"
   case personClimbing = "🧗"
   case personCurlyHair = "🧑‍🦱"
   case personFacepalming = "🤦"
   case personFeedingBaby = "🧑‍🍼"
   case personFencing = "🤺"
   case personFrowning = "🙍"
   case personGesturingNo = "🙅"
   case personGesturingOk = "🙆"
   case personGettingHaircut = "💇"
   case personGettingMassage = "💆"
   case personGolfing = "🏌️"
   case personInBed = "🛌"
   case personInLotusPosition = "🧘"
   case personInManualWheelchair = "🧑‍🦽"
   case personInMotorizedWheelchair = "🧑‍🦼"
   case personInSteamyRoom = "🧖"
   case personJuggling = "🤹"
   case personKneeling = "🧎"
   case personLiftingWeights = "🏋️"
   case personMountainBiking = "🚵"
   case personPlayingHandball = "🤾"
   case personPlayingWaterPolo = "🤽"
   case personPouting = "🙎"
   case personRaisingHand = "🙋"
   case personRedHair = "🧑‍🦰"
   case personRowingBoat = "🚣"
   case personRunning = "🏃"
   case personShrugging = "🤷"
   case personStanding = "🧍"
   case personSurfing = "🏄"
   case personSwimming = "🏊"
   case personTakingBath = "🛀"
   case personTippingHand = "💁"
   case personWalking = "🚶"
   case personWearingTurban = "👳"
   case personWhiteHair = "🧑‍🦳"
   case personWithCrown = "🫅"
   case personWithProbingCane = "🧑‍🦯"
   case petriDish = "🧫"
   case pick = "⛏️"
   case pickupTruck = "🛻"
   case pie = "🥧"
   case pig = "🐖"
   case pigFace = "🐷"
   case pigNose = "🐽"
   case pileOfPoo = "💩"
   case pill = "💊"
   case pilot = "🧑‍✈️"
   case pinata = "🪅"
   case pinchedFingers = "🤌"
   case pinchingHand = "🤏"
   case pineDecoration = "🎍"
   case pineapple = "🍍"
   case pingPong = "🏓"
   case pinkHeart = "🩷"
   case pirateFlag = "🏴‍☠️"
   case pisces = "♓"
   case pistol = "🔫"
   case pizza = "🍕"
   case placard = "🪧"
   case placeOfWorship = "🛐"
   case playButton = "▶️"
   case playOrPauseButton = "⏯️"
   case playgroundSlide = "🛝"
   case pleadingFace = "🥺"
   case plunger = "🪠"
   case plusSign = "➕"
   case polarBear = "🐻‍❄️"
   case policeCar = "🚓"
   case policeCarLight = "🚨"
   case policeOfficer = "👮"
   case poodle = "🐩"
   case pool8Ball = "🎱"
   case popcorn = "🍿"
   case postOffice = "🏤"
   case postalHorn = "📯"
   case postbox = "📮"
   case potOfFood = "🍲"
   case potableWater = "🚰"
   case potato = "🥔"
   case pottedPlant = "🪴"
   case poultryLeg = "🍗"
   case poundBanknote = "💷"
   case pouringLiquid = "🫗"
   case poutingCat = "😾"
   case poutingFace = "😡"
   case prayerBeads = "📿"
   case pregnantMan = "🫃"
   case pregnantPerson = "🫄"
   case pregnantWoman = "🤰"
   case pretzel = "🥨"
   case prince = "🤴"
   case princess = "👸"
   case printer = "🖨️"
   case probingCane = "🦯"
   case prohibited = "🚫"
   case purpleCircle = "🟣"
   case purpleHeart = "💜"
   case purpleSquare = "🟪"
   case purse = "👛"
   case pushpin = "📌"
   case puzzlePiece = "🧩"
   case questionMark = "❓"
   case rabbit = "🐇"
   case rabbitFace = "🐰"
   case raccoon = "🦝"
   case racingCar = "🏎️"
   case radio = "📻"
   case radioButton = "🔘"
   case radioactive = "☢️"
   case railwayCar = "🚃"
   case railwayTrack = "🛤️"
   case rainbow = "🌈"
   case rainbowFlag = "🏳️‍🌈"
   case raisedBackOfHand = "🤚"
   case raisedFist = "✊"
   case raisedHand = "✋"
   case raisingHands = "🙌"
   case ram = "🐏"
   case rat = "🐀"
   case razor = "🪒"
   case receipt = "🧾"
   case recordButton = "⏺️"
   case recyclingSymbol = "♻️"
   case redApple = "🍎"
   case redCircle = "🔴"
   case redEnvelope = "🧧"
   case redHeart = "❤️"
   case redPaperLantern = "🏮"
   case redSquare = "🟥"
   case redTrianglePointedDown = "🔻"
   case redTrianglePointedUp = "🔺"
   case registered = "®️"
   case relievedFace = "😌"
   case reminderRibbon = "🎗️"
   case repeatButton = "🔁"
   case repeatSingleButton = "🔂"
   case rescueWorkerSHelmet = "⛑️"
   case restroom = "🚻"
   case reverseButton = "◀️"
   case revolvingHearts = "💞"
   case rhinoceros = "🦏"
   case ribbon = "🎀"
   case riceBall = "🍙"
   case riceCracker = "🍘"
   case rightAngerBubble = "🗯️"
   case rightArrow = "➡️"
   case rightArrowCurvingDown = "⤵️"
   case rightArrowCurvingLeft = "↩️"
   case rightArrowCurvingUp = "⤴️"
   case rightFacingFist = "🤜"
   case rightwardsHand = "🫱"
   case rightwardsPushingHand = "🫸"
   case ring = "💍"
   case ringBuoy = "🛟"
   case ringedPlanet = "🪐"
   case roastedSweetPotato = "🍠"
   case robot = "🤖"
   case rock = "🪨"
   case rocket = "🚀"
   case rollOfPaper = "🧻"
   case rolledUpNewspaper = "🗞️"
   case rollerCoaster = "🎢"
   case rollerSkate = "🛼"
   case rollingOnTheFloorLaughing = "🤣"
   case rooster = "🐓"
   case rose = "🌹"
   case rosette = "🏵️"
   case roundPushpin = "📍"
   case rugbyFootball = "🏉"
   case runningShirt = "🎽"
   case runningShoe = "👟"
   case sadButRelievedFace = "😥"
   case safetyPin = "🧷"
   case safetyVest = "🦺"
   case sagittarius = "♐"
   case sailboat = "⛵"
   case sake = "🍶"
   case salt = "🧂"
   case salutingFace = "🫡"
   case sandwich = "🥪"
   case santaClaus = "🎅"
   case sari = "🥻"
   case satellite = "🛰️"
   case satelliteAntenna = "📡"
   case sauropod = "🦕"
   case saxophone = "🎷"
   case scarf = "🧣"
   case school = "🏫"
   case scientist = "🧑‍🔬"
   case scissors = "✂️"
   case scorpio = "♏"
   case scorpion = "🦂"
   case screwdriver = "🪛"
   case scroll = "📜"
   case seal = "🦭"
   case seat = "💺"
   case seeNoEvilMonkey = "🙈"
   case seedling = "🌱"
   case selfie = "🤳"
   case serviceDog = "🐕‍🦺"
   case sevenOClock = "🕖"
   case sevenThirty = "🕢"
   case sewingNeedle = "🪡"
   case shakingFace = "🫨"
   case shallowPanOfFood = "🥘"
   case shamrock = "☘️"
   case shark = "🦈"
   case shavedIce = "🍧"
   case sheafOfRice = "🌾"
   case shield = "🛡️"
   case shintoShrine = "⛩️"
   case ship = "🚢"
   case shootingStar = "🌠"
   case shoppingBags = "🛍️"
   case shoppingCart = "🛒"
   case shortcake = "🍰"
   case shorts = "🩳"
   case shower = "🚿"
   case shrimp = "🦐"
   case shuffleTracksButton = "🔀"
   case shushingFace = "🤫"
   case signOfTheHorns = "🤘"
   case singer = "🧑‍🎤"
   case sixOClock = "🕕"
   case sixThirty = "🕡"
   case skateboard = "🛹"
   case skier = "⛷️"
   case skis = "🎿"
   case skull = "💀"
   case skullAndCrossbones = "☠️"
   case skunk = "🦨"
   case sled = "🛷"
   case sleepingFace = "😴"
   case sleepyFace = "😪"
   case slightlyFrowningFace = "🙁"
   case slightlySmilingFace = "🙂"
   case slotMachine = "🎰"
   case sloth = "🦥"
   case smallAirplane = "🛩️"
   case smallBlueDiamond = "🔹"
   case smallOrangeDiamond = "🔸"
   case smilingCatWithHeartEyes = "😻"
   case smilingFace = "☺️"
   case smilingFaceWithHalo = "😇"
   case smilingFaceWithHeartEyes = "😍"
   case smilingFaceWithHearts = "🥰"
   case smilingFaceWithHorns = "😈"
   case smilingFaceWithSmilingEyes = "😊"
   case smilingFaceWithSunglasses = "😎"
   case smilingFaceWithTear = "🥲"
   case smirkingFace = "😏"
   case snail = "🐌"
   case snake = "🐍"
   case sneezingFace = "🤧"
   case snowCappedMountain = "🏔️"
   case snowboarder = "🏂"
   case snowflake = "❄️"
   case snowman = "☃️"
   case snowmanWithoutSnow = "⛄"
   case soap = "🧼"
   case soccerBall = "⚽"
   case socks = "🧦"
   case softIceCream = "🍦"
   case softball = "🥎"
   case soonArrow = "🔜"
   case sosButton = "🆘"
   case spadeSuit = "♠️"
   case spaghetti = "🍝"
   case sparkle = "❇️"
   case sparkler = "🎇"
   case sparkles = "✨"
   case sparklingHeart = "💖"
   case speakNoEvilMonkey = "🙊"
   case speakerHighVolume = "🔊"
   case speakerLowVolume = "🔈"
   case speakerMediumVolume = "🔉"
   case speakingHead = "🗣️"
   case speechBalloon = "💬"
   case speedboat = "🚤"
   case spider = "🕷️"
   case spiderWeb = "🕸️"
   case spiralCalendar = "🗓️"
   case spiralNotepad = "🗒️"
   case spiralShell = "🐚"
   case sponge = "🧽"
   case spoon = "🥄"
   case sportUtilityVehicle = "🚙"
   case sportsMedal = "🏅"
   case spoutingWhale = "🐳"
   case squid = "🦑"
   case squintingFaceWithTongue = "😝"
   case stadium = "🏟️"
   case star = "⭐"
   case starAndCrescent = "☪️"
   case starOfDavid = "✡️"
   case starStruck = "🤩"
   case station = "🚉"
   case statueOfLiberty = "🗽"
   case steamingBowl = "🍜"
   case stethoscope = "🩺"
   case stopButton = "⏹️"
   case stopSign = "🛑"
   case stopwatch = "⏱️"
   case straightRuler = "📏"
   case strawberry = "🍓"
   case student = "🧑‍🎓"
   case studioMicrophone = "🎙️"
   case stuffedFlatbread = "🥙"
   case sun = "☀️"
   case sunBehindCloud = "⛅"
   case sunBehindLargeCloud = "🌥️"
   case sunBehindRainCloud = "🌦️"
   case sunBehindSmallCloud = "🌤️"
   case sunWithFace = "🌞"
   case sunflower = "🌻"
   case sunglasses = "🕶️"
   case sunrise = "🌅"
   case sunriseOverMountains = "🌄"
   case sunset = "🌇"
   case superhero = "🦸"
   case supervillain = "🦹"
   case sushi = "🍣"
   case suspensionRailway = "🚟"
   case swan = "🦢"
   case sweatDroplets = "💦"
   case synagogue = "🕍"
   case syringe = "💉"
   case tRex = "🦖"
   case tShirt = "👕"
   case taco = "🌮"
   case takeoutBox = "🥡"
   case tamale = "🫔"
   case tanabataTree = "🎋"
   case tangerine = "🍊"
   case taurus = "♉"
   case taxi = "🚕"
   case teacher = "🧑‍🏫"
   case teacupWithoutHandle = "🍵"
   case teapot = "🫖"
   case tearOffCalendar = "📆"
   case technologist = "🧑‍💻"
   case teddyBear = "🧸"
   case telephone = "☎️"
   case telephoneReceiver = "📞"
   case telescope = "🔭"
   case television = "📺"
   case tenOClock = "🕙"
   case tenThirty = "🕥"
   case tennis = "🎾"
   case tent = "⛺"
   case testTube = "🧪"
   case thermometer = "🌡️"
   case thinkingFace = "🤔"
   case thongSandal = "🩴"
   case thoughtBalloon = "💭"
   case thread = "🧵"
   case threeOClock = "🕒"
   case threeThirty = "🕞"
   case thumbsDown = "👎"
   case thumbsUp = "👍"
   case ticket = "🎫"
   case tiger = "🐅"
   case tigerFace = "🐯"
   case timerClock = "⏲️"
   case tiredFace = "😫"
   case toilet = "🚽"
   case tokyoTower = "🗼"
   case tomato = "🍅"
   case tongue = "👅"
   case toolbox = "🧰"
   case tooth = "🦷"
   case toothbrush = "🪥"
   case topArrow = "🔝"
   case topHat = "🎩"
   case tornado = "🌪️"
   case trackball = "🖲️"
   case tractor = "🚜"
   case tradeMark = "™️"
   case train = "🚆"
   case tram = "🚊"
   case tramCar = "🚋"
   case transgenderFlag = "🏳️‍⚧️"
   case transgenderSymbol = "⚧️"
   case triangularFlag = "🚩"
   case triangularRuler = "📐"
   case tridentEmblem = "🔱"
   case troll = "🧌"
   case trolleybus = "🚎"
   case trophy = "🏆"
   case tropicalDrink = "🍹"
   case tropicalFish = "🐠"
   case trumpet = "🎺"
   case tulip = "🌷"
   case tumblerGlass = "🥃"
   case turkey = "🦃"
   case turtle = "🐢"
   case twelveOClock = "🕛"
   case twelveThirty = "🕧"
   case twoHearts = "💕"
   case twoHumpCamel = "🐫"
   case twoOClock = "🕑"
   case twoThirty = "🕝"
   case umbrella = "☂️"
   case umbrellaOnGround = "⛱️"
   case umbrellaWithRainDrops = "☔"
   case unamusedFace = "😒"
   case unicorn = "🦄"
   case unlocked = "🔓"
   case upArrow = "⬆️"
   case upButton = "🆙"
   case upDownArrow = "↕️"
   case upLeftArrow = "↖️"
   case upRightArrow = "↗️"
   case upsideDownFace = "🙃"
   case upwardsButton = "🔼"
   case vampire = "🧛"
   case verticalTrafficLight = "🚦"
   case vibrationMode = "📳"
   case victoryHand = "✌️"
   case videoCamera = "📹"
   case videoGame = "🎮"
   case videocassette = "📼"
   case violin = "🎻"
   case virgo = "♍"
   case volcano = "🌋"
   case volleyball = "🏐"
   case vsButton = "🆚"
   case vulcanSalute = "🖖"
   case waffle = "🧇"
   case waningCrescentMoon = "🌘"
   case waningGibbousMoon = "🌖"
   case warning = "⚠️"
   case wastebasket = "🗑️"
   case watch = "⌚"
   case waterBuffalo = "🐃"
   case waterCloset = "🚾"
   case waterWave = "🌊"
   case watermelon = "🍉"
   case wavingHand = "👋"
   case wavyDash = "〰️"
   case waxingCrescentMoon = "🌒"
   case waxingGibbousMoon = "🌔"
   case wearyCat = "🙀"
   case wearyFace = "😩"
   case wedding = "💒"
   case whale = "🐋"
   case wheel = "🛞"
   case wheelOfDharma = "☸️"
   case wheelchairSymbol = "♿"
   case whiteCircle = "⚪"
   case whiteExclamationMark = "❕"
   case whiteFlag = "🏳️"
   case whiteFlower = "💮"
   case whiteHeart = "🤍"
   case whiteLargeSquare = "⬜"
   case whiteMediumSmallSquare = "◽"
   case whiteMediumSquare = "◻️"
   case whiteQuestionMark = "❔"
   case whiteSmallSquare = "▫️"
   case whiteSquareButton = "🔳"
   case wiltedFlower = "🥀"
   case windChime = "🎐"
   case windFace = "🌬️"
   case window = "🪟"
   case wineGlass = "🍷"
   case wing = "🪽"
   case winkingFace = "😉"
   case winkingFaceWithTongue = "😜"
   case wireless = "🛜"
   case wolf = "🐺"
   case woman = "👩"
   case womanAndManHoldingHands = "👫"
   case womanArtist = "👩‍🎨"
   case womanAstronaut = "👩‍🚀"
   case womanBald = "👩‍🦲"
   case womanBeard = "🧔‍♀️"
   case womanBiking = "🚴‍♀️"
   case womanBlondHair = "👱‍♀️"
   case womanBouncingBall = "⛹️‍♀️"
   case womanBowing = "🙇‍♀️"
   case womanCartwheeling = "🤸‍♀️"
   case womanClimbing = "🧗‍♀️"
   case womanConstructionWorker = "👷‍♀️"
   case womanCook = "👩‍🍳"
   case womanCurlyHair = "👩‍🦱"
   case womanDancing = "💃"
   case womanDetective = "🕵️‍♀️"
   case womanElf = "🧝‍♀️"
   case womanFacepalming = "🤦‍♀️"
   case womanFactoryWorker = "👩‍🏭"
   case womanFairy = "🧚‍♀️"
   case womanFarmer = "👩‍🌾"
   case womanFeedingBaby = "👩‍🍼"
   case womanFirefighter = "👩‍🚒"
   case womanFrowning = "🙍‍♀️"
   case womanGenie = "🧞‍♀️"
   case womanGesturingNo = "🙅‍♀️"
   case womanGesturingOk = "🙆‍♀️"
   case womanGettingHaircut = "💇‍♀️"
   case womanGettingMassage = "💆‍♀️"
   case womanGolfing = "🏌️‍♀️"
   case womanGuard = "💂‍♀️"
   case womanHealthWorker = "👩‍⚕️"
   case womanInLotusPosition = "🧘‍♀️"
   case womanInManualWheelchair = "👩‍🦽"
   case womanInMotorizedWheelchair = "👩‍🦼"
   case womanInSteamyRoom = "🧖‍♀️"
   case womanInTuxedo = "🤵‍♀️"
   case womanJudge = "👩‍⚖️"
   case womanJuggling = "🤹‍♀️"
   case womanKneeling = "🧎‍♀️"
   case womanLiftingWeights = "🏋️‍♀️"
   case womanMage = "🧙‍♀️"
   case womanMechanic = "👩‍🔧"
   case womanMountainBiking = "🚵‍♀️"
   case womanOfficeWorker = "👩‍💼"
   case womanPilot = "👩‍✈️"
   case womanPlayingHandball = "🤾‍♀️"
   case womanPlayingWaterPolo = "🤽‍♀️"
   case womanPoliceOfficer = "👮‍♀️"
   case womanPouting = "🙎‍♀️"
   case womanRaisingHand = "🙋‍♀️"
   case womanRedHair = "👩‍🦰"
   case womanRowingBoat = "🚣‍♀️"
   case womanRunning = "🏃‍♀️"
   case womanSBoot = "👢"
   case womanSClothes = "👚"
   case womanSHat = "👒"
   case womanSSandal = "👡"
   case womanScientist = "👩‍🔬"
   case womanShrugging = "🤷‍♀️"
   case womanSinger = "👩‍🎤"
   case womanStanding = "🧍‍♀️"
   case womanStudent = "👩‍🎓"
   case womanSuperhero = "🦸‍♀️"
   case womanSupervillain = "🦹‍♀️"
   case womanSurfing = "🏄‍♀️"
   case womanSwimming = "🏊‍♀️"
   case womanTeacher = "👩‍🏫"
   case womanTechnologist = "👩‍💻"
   case womanTippingHand = "💁‍♀️"
   case womanVampire = "🧛‍♀️"
   case womanWalking = "🚶‍♀️"
   case womanWearingTurban = "👳‍♀️"
   case womanWhiteHair = "👩‍🦳"
   case womanWithHeadscarf = "🧕"
   case womanWithProbingCane = "👩‍🦯"
   case womanWithVeil = "👰‍♀️"
   case womanZombie = "🧟‍♀️"
   case womenHoldingHands = "👭"
   case womenSRoom = "🚺"
   case womenWithBunnyEars = "👯‍♀️"
   case womenWrestling = "🤼‍♀️"
   case wood = "🪵"
   case woozyFace = "🥴"
   case worldMap = "🗺️"
   case worm = "🪱"
   case worriedFace = "😟"
   case wrappedGift = "🎁"
   case wrench = "🔧"
   case writingHand = "✍️"
   case xray = "🩻"
   case yarn = "🧶"
   case yawningFace = "🥱"
   case yellowCircle = "🟡"
   case yellowHeart = "💛"
   case yellowSquare = "🟨"
   case yenBanknote = "💴"
   case yinYang = "☯️"
   case yoYo = "🪀"
   case zanyFace = "🤪"
   case zebra = "🦓"
   case zipperMouthFace = "🤐"
   case zombie = "🧟"
   case zzz = "💤"
}

extension Emoji: SearchableOption {
   public var id: Self { self }

   /// A SwiftUI view that displays the emoji in a large font size.
   ///
   /// - Note: No need to use this directly. It will be used inside a ``SearchableGridPicker``.
   ///
   /// Example:
   /// """
   /// var body: some View {
   ///     Emoji.alarmClock.view
   /// }
   /// // Displays the alarm clock emoji ⏰ in large size.
   /// """
   public var view: some View {
      Text(self.rawValue)
         .font(.title3)
   }

   // TODO: localize the search terms to support more languages
   /// Search terms related to each emoji. This can be used to filter or find emojis based on keywords.
   ///
   /// - Note: No need to use this directly. It will be used inside a ``SearchableGridPicker``.
   ///
   /// Example:
   /// ```
   /// let searchTerms = Emoji.airplane.searchTerms
   /// print(searchTerms) // Outputs: ["airplane", "vehicle", "transportation", "flight", "fly"]
   /// ```
   public var searchTerms: [String] {
      switch self {
      case .firstPlaceMedal: ["1st", "place", "medal", "award", "winning", "first"]
      case .secondPlaceMedal: ["2nd", "place", "medal", "award", "second"]
      case .thirdPlaceMedal: ["3rd", "place", "medal", "award", "third"]
      case .aButton: ["a", "button", "red-square", "alphabet", "letter"]
      case .abButton: ["ab", "button", "red-square", "alphabet"]
      case .abacus: ["abacus", "calculation"]
      case .accordion: ["accordion", "music"]
      case .adhesiveBandage: ["adhesive", "bandage", "heal"]
      case .admissionTickets: ["admission", "tickets", "sports", "concert", "entrance"]
      case .aerialTramway: ["aerial", "tramway", "transportation", "vehicle", "ski"]
      case .airplane: ["airplane", "vehicle", "transportation", "flight", "fly"]
      case .airplaneArrival: ["airplane", "arrival", "airport", "flight", "boarding"]
      case .airplaneDeparture: ["airplane", "departure", "airport", "flight", "landing"]
      case .alarmClock: ["alarm", "clock", "time", "wake"]
      case .alembic: ["alembic", "distilling", "science", "experiment", "chemistry"]
      case .alien: ["alien", "UFO", "paul", "weird", "outer", "space"]
      case .alienMonster: ["alien", "monster", "game", "arcade", "play"]
      case .ambulance: ["ambulance", "health", "911", "hospital"]
      case .americanFootball: ["american", "football", "sports", "balls", "NFL"]
      case .amphora: ["amphora", "vase", "jar"]
      case .anatomicalHeart: ["anatomical", "heart", "health", "heartbeat"]
      case .anchor: ["anchor", "ship", "ferry", "sea", "boat"]
      case .angerSymbol: ["anger", "symbol", "angry", "mad"]
      case .angryFace: ["angry", "face", "mad", "face", "annoyed", "frustrated"]
      case .angryFaceWithHorns: ["angry", "face", "with", "horns", "devil", "angry", "horns"]
      case .anguishedFace: ["anguished", "face", "face", "stunned", "nervous"]
      case .ant: ["ant", "animal", "insect", "nature", "bug"]
      case .antennaBars: ["antenna", "bars", "blue-square", "reception", "phone", "internet", "connection", "wifi", "bluetooth", "bars"]
      case .anxiousFaceWithSweat: ["anxious", "face", "with", "sweat", "face", "nervous", "sweat"]
      case .aquarius: ["aquarius", "sign", "purple-square", "zodiac", "astrology"]
      case .aries: ["aries", "sign", "purple-square", "zodiac", "astrology"]
      case .articulatedLorry: ["articulated", "lorry", "vehicle", "cars", "transportation", "express"]
      case .artist: ["artist", "painting", "draw", "creativity"]
      case .artistPalette: ["artist", "palette", "design", "paint", "draw", "colors"]
      case .astonishedFace: ["astonished", "face", "face", "xox", "surprised", "poisoned"]
      case .astronaut: ["astronaut", "outerspace"]
      case .atmSign: ["atm", "sign", "money", "sales", "cash", "blue-square", "payment", "bank"]
      case .atomSymbol: ["atom", "symbol", "science", "physics", "chemistry"]
      case .autoRickshaw: ["auto", "rickshaw", "move", "transportation"]
      case .automobile: ["automobile", "red", "transportation", "vehicle"]
      case .avocado: ["avocado", "fruit", "food"]
      case .axe: ["axe", "tool", "chop", "cut"]
      case .bButton: ["b", "button", "red-square", "alphabet", "letter"]
      case .baby: ["baby", "child", "boy", "girl", "toddler"]
      case .babyAngel: ["baby", "angel", "heaven", "wings", "halo"]
      case .babyBottle: ["baby", "bottle", "food", "container", "milk"]
      case .babyChick: ["baby", "chick", "animal", "chicken", "bird"]
      case .babySymbol: ["baby", "symbol", "orange-square", "child"]
      case .backArrow: ["back", "arrow", "arrow", "words", "return"]
      case .backhandIndexPointingDown: ["backhand", "index", "pointing", "down", "fingers", "hand", "direction", "down"]
      case .backhandIndexPointingLeft: ["backhand", "index", "pointing", "left", "direction", "fingers", "hand", "left"]
      case .backhandIndexPointingRight: ["backhand", "index", "pointing", "right", "fingers", "hand", "direction", "right"]
      case .backhandIndexPointingUp: ["backhand", "index", "pointing", "up", "fingers", "hand", "direction", "up"]
      case .backpack: ["backpack", "student", "education", "bag"]
      case .bacon: ["bacon", "food", "breakfast", "pork", "pig", "meat", "brunch"]
      case .badger: ["badger", "animal", "nature", "honey"]
      case .badminton: ["badminton", "sports"]
      case .bagel: ["bagel", "food", "bread", "bakery", "schmear", "jewish", "bakery"]
      case .baggageClaim: ["baggage", "claim", "blue-square", "airport", "transport"]
      case .baguetteBread: ["baguette", "bread", "food", "bread", "french", "france", "bakery"]
      case .balanceScale: ["balance", "scale", "law", "fairness", "weight"]
      case .balletShoes: ["ballet", "shoes", "dance"]
      case .balloon: ["balloon", "party", "celebration", "birthday", "circus"]
      case .ballotBoxWithBallot: ["ballot", "box", "with", "ballot", "election", "vote"]
      case .banana: ["banana", "fruit", "food", "monkey"]
      case .banjo: ["banjo", "music", "instructment"]
      case .bank: ["bank", "building", "money", "sales", "cash", "business", "enterprise"]
      case .barChart: ["bar", "chart", "graph", "presentation", "stats"]
      case .barberPole: ["barber", "pole", "hair", "salon", "style"]
      case .baseball: ["baseball", "sports", "balls"]
      case .basket: ["basket", "laundry"]
      case .basketball: ["basketball", "sports", "balls", "NBA"]
      case .bat: ["bat", "animal", "nature", "blind", "vampire"]
      case .bathtub: ["bathtub", "clean", "shower", "bathroom"]
      case .battery: ["battery", "power", "energy", "sustain"]
      case .beachWithUmbrella: ["beach", "with", "umbrella", "weather", "summer", "sunny", "sand", "mojito"]
      case .beamingFaceWithSmilingEyes: ["beaming", "face", "with", "smiling", "eyes", "face", "happy", "smile", "joy", "kawaii"]
      case .beans: ["beans", "food"]
      case .bear: ["bear", "animal", "nature", "wild"]
      case .beatingHeart: ["beating", "heart", "love", "like", "affection", "valentines", "pink", "heart"]
      case .beaver: ["beaver", "animal", "rodent"]
      case .bed: ["bed", "sleep", "rest"]
      case .beerMug: ["beer", "mug", "relax", "beverage", "drink", "drunk", "party", "pub", "summer", "alcohol", "booze"]
      case .beetle: ["beetle", "insect"]
      case .bell: ["bell", "sound", "notification", "christmas", "xmas", "chime"]
      case .bellPepper: ["bell", "pepper", "fruit", "plant"]
      case .bellWithSlash: ["bell", "with", "slash", "sound", "volume", "mute", "quiet", "silent"]
      case .bellhopBell: ["bellhop", "bell", "service"]
      case .bentoBox: ["bento", "box", "food", "japanese", "box", "lunch"]
      case .beverageBox: ["beverage", "box", "drink"]
      case .bicycle: ["bicycle", "bike", "sports", "exercise", "hipster"]
      case .bikini: ["bikini", "swimming", "female", "woman", "girl", "fashion", "beach", "summer"]
      case .billedCap: ["billed", "cap", "cap", "baseball"]
      case .biohazard: ["biohazard", "danger"]
      case .bird: ["bird", "animal", "nature", "fly", "tweet", "spring"]
      case .birthdayCake: ["birthday", "cake", "food", "dessert", "cake"]
      case .bison: ["bison", "ox"]
      case .bitingLip: ["biting", "lip", "flirt", "sexy", "pain", "worry"]
      case .blackBird: ["black", "bird", "crow"]
      case .blackCat: ["black", "cat", "superstition", "luck"]
      case .blackCircle: ["black", "circle", "shape", "button", "round"]
      case .blackFlag: ["black", "flag", "pirate"]
      case .blackHeart: ["black", "heart", "evil"]
      case .blackLargeSquare: ["black", "large", "square", "shape", "icon", "button"]
      case .blackMediumSmallSquare: ["black", "medium", "small", "square", "icon", "shape", "button"]
      case .blackMediumSquare: ["black", "medium", "square", "shape", "button", "icon"]
      case .blackNib: ["black", "nib", "pen", "stationery", "writing", "write"]
      case .blackSmallSquare: ["black", "small", "square", "shape", "icon"]
      case .blackSquareButton: ["black", "square", "button", "shape", "input", "frame"]
      case .blossom: ["blossom", "nature", "flowers", "yellow"]
      case .blowfish: ["blowfish", "animal", "nature", "food", "sea", "ocean"]
      case .blueBook: ["blue", "book", "read", "library", "knowledge", "learn", "study"]
      case .blueCircle: ["blue", "circle", "shape", "icon", "button"]
      case .blueHeart: ["blue", "heart", "love", "like", "affection", "valentines"]
      case .blueSquare: ["blue", "square"]
      case .blueberries: ["blueberries", "fruit"]
      case .boar: ["boar", "animal", "nature"]
      case .bomb: ["bomb", "boom", "explode", "explosion", "terrorism"]
      case .bone: ["bone", "skeleton"]
      case .bookmark: ["bookmark", "favorite", "label", "save"]
      case .bookmarkTabs: ["bookmark", "tabs", "favorite", "save", "order", "tidy"]
      case .books: ["books", "literature", "library", "study"]
      case .boomerang: ["boomerang", "weapon"]
      case .bottleWithPoppingCork: ["bottle", "with", "popping", "cork", "drink", "wine", "bottle", "celebration"]
      case .bouquet: ["bouquet", "flowers", "nature", "spring"]
      case .bowAndArrow: ["bow", "and", "arrow", "sports"]
      case .bowlWithSpoon: ["bowl", "with", "spoon", "food", "breakfast", "cereal", "oatmeal", "porridge"]
      case .bowling: ["bowling", "sports", "fun", "play"]
      case .boxingGlove: ["boxing", "glove", "sports", "fighting"]
      case .boy: ["boy", "man", "male", "guy", "teenager"]
      case .brain: ["brain", "smart", "intelligent"]
      case .bread: ["bread", "food", "wheat", "breakfast", "toast"]
      case .breastFeeding: ["breast", "feeding", "nursing", "baby"]
      case .brick: ["brick", "bricks"]
      case .brideWithVeil: ["bride", "with", "veil", "couple", "marriage", "wedding", "woman", "bride"]
      case .bridgeAtNight: ["bridge", "at", "night", "photo", "sanfrancisco"]
      case .briefcase: ["briefcase", "business", "documents", "work", "law", "legal", "job", "career"]
      case .briefs: ["briefs", "clothing"]
      case .brightButton: ["bright", "button", "sun", "light"]
      case .broccoli: ["broccoli", "fruit", "food", "vegetable"]
      case .brokenHeart: ["broken", "heart", "sad", "sorry", "break", "heart", "heartbreak"]
      case .broom: ["broom", "cleaning", "sweeping", "witch"]
      case .brownCircle: ["brown", "circle", "round"]
      case .brownHeart: ["brown", "heart", "coffee"]
      case .brownSquare: ["brown", "square"]
      case .bubbleTea: ["bubble", "tea", "taiwan", "boba", "milk", "tea", "straw"]
      case .bubbles: ["bubbles", "soap", "fun", "carbonation", "sparkling"]
      case .bucket: ["bucket", "water", "container"]
      case .bug: ["bug", "animal", "insect", "nature", "worm"]
      case .buildingConstruction: ["building", "construction", "wip", "working", "progress"]
      case .bulletTrain: ["bullet", "train", "transportation", "vehicle", "speed", "fast", "public", "travel"]
      case .burrito: ["burrito", "food", "mexican"]
      case .bus: ["bus", "car", "vehicle", "transportation"]
      case .busStop: ["bus", "stop", "transportation", "wait"]
      case .bustInSilhouette: ["bust", "in", "silhouette", "user", "person", "human"]
      case .bustsInSilhouette: ["busts", "in", "silhouette", "user", "person", "human", "group", "team"]
      case .butter: ["butter", "food", "cook"]
      case .butterfly: ["butterfly", "animal", "insect", "nature", "caterpillar"]
      case .cactus: ["cactus", "vegetable", "plant", "nature"]
      case .calendar: ["calendar", "schedule"]
      case .callMeHand: ["call", "me", "hand", "hands", "gesture", "shaka"]
      case .camel: ["camel", "animal", "hot", "desert", "hump"]
      case .camera: ["camera", "gadgets", "photography"]
      case .cameraWithFlash: ["camera", "with", "flash", "photography", "gadgets"]
      case .camping: ["camping", "photo", "outdoors", "tent"]
      case .cancer: ["cancer", "sign", "zodiac", "purple-square", "astrology"]
      case .candle: ["candle", "fire", "wax"]
      case .candy: ["candy", "snack", "dessert", "sweet", "lolly"]
      case .cannedFood: ["canned", "food", "food", "soup", "tomatoes"]
      case .canoe: ["canoe", "boat", "paddle", "water", "ship"]
      case .capricorn: ["capricorn", "sign", "zodiac", "purple-square", "astrology"]
      case .cardFileBox: ["card", "file", "box", "business", "stationery"]
      case .cardIndex: ["card", "index", "business", "stationery"]
      case .cardIndexDividers: ["card", "index", "dividers", "organizing", "business", "stationery"]
      case .carouselHorse: ["carousel", "horse", "photo", "carnival"]
      case .carpStreamer: ["carp", "streamer", "fish", "japanese", "koinobori", "carp", "banner"]
      case .carpentrySaw: ["carpentry", "saw", "cut", "chop"]
      case .carrot: ["carrot", "vegetable", "food", "orange"]
      case .castle: ["castle", "building", "royalty", "history"]
      case .cat: ["cat", "animal", "meow", "pet", "cats"]
      case .catFace: ["cat", "face", "animal", "meow", "nature", "pet", "kitten"]
      case .catWithTearsOfJoy: ["cat", "with", "tears", "of", "joy", "animal", "cats", "haha", "happy", "tears"]
      case .catWithWrySmile: ["cat", "with", "wry", "smile", "animal", "cats", "smirk"]
      case .chains: ["chains", "lock", "arrest"]
      case .chair: ["chair", "sit", "furniture"]
      case .chartDecreasing:
         ["chart", "decreasing", "graph", "presentation", "stats", "recession", "business", "economics", "money", "sales", "bad", "failure"]
      case .chartIncreasing:
         ["chart", "increasing", "graph", "presentation", "stats", "recovery", "business", "economics", "money", "sales", "good", "success"]
      case .chartIncreasingWithYen: ["chart", "increasing", "with", "yen", "green-square", "graph", "presentation", "stats"]
      case .checkBoxWithCheck: ["check", "box", "with", "check", "ok", "agree", "confirm", "black-square", "vote", "election", "yes", "tick"]
      case .checkMark: ["check", "mark", "ok", "nike", "answer", "yes", "tick"]
      case .checkMarkButton: ["check", "mark", "button", "green-square", "ok", "agree", "vote", "election", "answer", "tick"]
      case .cheeseWedge: ["cheese", "wedge", "food", "chadder", "swiss"]
      case .chequeredFlag: ["chequered", "flag", "contest", "finishline", "race", "gokart"]
      case .cherries: ["cherries", "food", "fruit"]
      case .cherryBlossom: ["cherry", "blossom", "nature", "plant", "spring", "flower"]
      case .chessPawn: ["chess", "pawn", "expendable"]
      case .chestnut: ["chestnut", "food", "squirrel"]
      case .chicken: ["chicken", "animal", "cluck", "nature", "bird"]
      case .child: ["child", "gender-neutral", "young"]
      case .childrenCrossing: ["children", "crossing", "school", "warning", "danger", "sign", "driving", "yellow-diamond"]
      case .chipmunk: ["chipmunk", "animal", "nature", "rodent", "squirrel"]
      case .chocolateBar: ["chocolate", "bar", "food", "snack", "dessert", "sweet"]
      case .chopsticks: ["chopsticks", "food"]
      case .christmasTree: ["christmas", "tree", "festival", "vacation", "december", "xmas", "celebration"]
      case .church: ["church", "building", "religion", "christ"]
      case .cigarette: ["cigarette", "kills", "tobacco", "joint", "smoke"]
      case .cinema: ["cinema", "blue-square", "record", "film", "movie", "curtain", "stage", "theater"]
      case .circledM: ["circled", "m", "alphabet", "blue-circle", "letter"]
      case .circusTent: ["circus", "tent", "festival", "carnival", "party"]
      case .cityscape: ["cityscape", "photo", "night", "life", "urban"]
      case .cityscapeAtDusk: ["cityscape", "at", "dusk", "photo", "evening", "sky", "buildings"]
      case .clButton: ["cl", "button", "alphabet", "words", "red-square"]
      case .clamp: ["clamp", "tool"]
      case .clapperBoard: ["clapper", "board", "movie", "film", "record"]
      case .clappingHands: ["clapping", "hands", "hands", "praise", "applause", "congrats", "yay"]
      case .classicalBuilding: ["classical", "building", "art", "culture", "history"]
      case .clinkingBeerMugs: ["clinking", "beer", "mugs", "relax", "beverage", "drink", "drunk", "party", "pub", "summer", "alcohol", "booze"]
      case .clinkingGlasses: ["clinking", "glasses", "beverage", "drink", "party", "alcohol", "celebrate", "cheers", "wine", "champagne", "toast"]
      case .clipboard: ["clipboard", "stationery", "documents"]
      case .clockwiseVerticalArrows: ["clockwise", "vertical", "arrows", "sync", "cycle", "round", "repeat"]
      case .closedBook: ["closed", "book", "read", "library", "knowledge", "textbook", "learn"]
      case .closedMailboxWithLoweredFlag: ["closed", "mailbox", "with", "lowered", "flag", "email", "communication", "inbox"]
      case .closedMailboxWithRaisedFlag: ["closed", "mailbox", "with", "raised", "flag", "email", "inbox", "communication"]
      case .closedUmbrella: ["closed", "umbrella", "weather", "rain", "drizzle"]
      case .cloud: ["cloud", "weather", "sky"]
      case .cloudWithLightning: ["cloud", "with", "lightning", "weather", "thunder"]
      case .cloudWithLightningAndRain: ["cloud", "with", "lightning", "and", "rain", "weather", "lightning"]
      case .cloudWithRain: ["cloud", "with", "rain", "weather"]
      case .cloudWithSnow: ["cloud", "with", "snow", "weather"]
      case .clownFace: ["clown", "face", "face"]
      case .clubSuit: ["club", "suit", "poker", "cards", "magic", "suits"]
      case .clutchBag: ["clutch", "bag", "bag", "accessories", "shopping"]
      case .coat: ["coat", "jacket"]
      case .cockroach: ["cockroach", "insect", "pests"]
      case .cocktailGlass: ["cocktail", "glass", "drink", "drunk", "alcohol", "beverage", "booze", "mojito"]
      case .coconut: ["coconut", "fruit", "nature", "food", "palm"]
      case .coffin: ["coffin", "vampire", "dead", "die", "death", "rip", "graveyard", "cemetery", "casket", "funeral", "box"]
      case .coin: ["coin", "money", "currency"]
      case .coldFace: ["cold", "face", "face", "blue", "freezing", "frozen", "frostbite", "icicles"]
      case .collision: ["collision", "bomb", "explode", "explosion", "blown"]
      case .comet: ["comet", "space"]
      case .compass: ["compass", "magnetic", "navigation", "orienteering"]
      case .computerDisk: ["computer", "disk", "technology", "record", "data", "disk", "90s"]
      case .computerMouse: ["computer", "mouse", "click"]
      case .confettiBall: ["confetti", "ball", "festival", "party", "birthday", "circus"]
      case .confoundedFace: ["confounded", "face", "face", "confused", "sick", "unwell", "oops", ":S"]
      case .confusedFace: ["confused", "face", "face", "indifference", "huh", "weird", "hmmm", ":/"]
      case .construction: ["construction", "wip", "progress", "caution", "warning"]
      case .constructionWorker: ["construction", "worker", "labor", "build"]
      case .controlKnobs: ["control", "knobs", "dial"]
      case .convenienceStore: ["convenience", "store", "building", "shopping", "groceries"]
      case .cook: ["cook", "food", "kitchen", "culinary"]
      case .cookedRice: ["cooked", "rice", "food", "asian"]
      case .cookie: ["cookie", "food", "snack", "oreo", "chocolate", "sweet", "dessert"]
      case .cooking: ["cooking", "food", "breakfast", "kitchen", "egg", "skillet"]
      case .coolButton: ["cool", "button", "words", "blue-square"]
      case .copyright: ["copyright", "ip", "license", "circle", "law", "legal"]
      case .coral: ["coral", "ocean", "sea", "reef"]
      case .couchAndLamp: ["couch", "and", "lamp", "read", "chill"]
      case .counterclockwiseArrowsButton: ["counterclockwise", "arrows", "button", "blue-square", "sync", "cycle"]
      case .coupleWithHeart: ["couple", "with", "heart", "pair", "love", "like", "affection", "human", "dating", "valentines", "marriage"]
      case .coupleWithHeartManMan:
         ["couple", "with", "heart", "man", "man", "pair", "love", "like", "affection", "human", "dating", "valentines", "marriage"]
      case .coupleWithHeartWomanMan: ["couple", "with", "heart", "woman", "man", "love"]
      case .coupleWithHeartWomanWoman:
         ["couple", "with", "heart", "woman", "woman", "pair", "love", "like", "affection", "human", "dating", "valentines", "marriage"]
      case .cow: ["cow", "beef", "ox", "animal", "nature", "moo", "milk"]
      case .cowFace: ["cow", "face", "beef", "ox", "animal", "nature", "moo", "milk"]
      case .cowboyHatFace: ["cowboy", "hat", "face", "face", "cowgirl", "hat"]
      case .crab: ["crab", "animal", "crustacean"]
      case .crayon: ["crayon", "drawing", "creativity"]
      case .creditCard: ["credit", "card", "money", "sales", "dollar", "bill", "payment", "shopping"]
      case .crescentMoon: ["crescent", "moon", "night", "sleep", "sky", "evening", "magic"]
      case .cricket: ["cricket", "animal", "chirp"]
      case .cricketGame: ["cricket", "game", "sports"]
      case .crocodile: ["crocodile", "animal", "nature", "reptile", "lizard", "alligator"]
      case .croissant: ["croissant", "food", "bread", "french"]
      case .crossMark: ["cross", "mark", "no", "delete", "remove", "cancel", "red"]
      case .crossMarkButton: ["cross", "mark", "button", "x", "green-square", "no", "deny"]
      case .crossedFingers: ["crossed", "fingers", "good", "lucky"]
      case .crossedFlags: ["crossed", "flags", "japanese", "nation", "country", "border"]
      case .crossedSwords: ["crossed", "swords", "weapon"]
      case .crown: ["crown", "king", "kod", "leader", "royalty", "lord"]
      case .crutch: ["crutch", "accessibility", "assist"]
      case .cryingCat: ["crying", "cat", "animal", "tears", "weep", "sad", "cats", "upset", "cry"]
      case .cryingFace: ["crying", "face", "face", "tears", "sad", "depressed", "upset", ":'("]
      case .crystalBall: ["crystal", "ball", "disco", "party", "magic", "circus", "fortune", "teller"]
      case .cucumber: ["cucumber", "fruit", "food", "pickle"]
      case .cupWithStraw: ["cup", "with", "straw", "drink", "soda"]
      case .cupcake: ["cupcake", "food", "dessert", "bakery", "sweet"]
      case .curlingStone: ["curling", "stone", "sports"]
      case .curlyLoop: ["curly", "loop", "scribble", "draw", "shape", "squiggle"]
      case .currencyExchange: ["currency", "exchange", "money", "sales", "dollar", "travel"]
      case .curryRice: ["curry", "rice", "food", "spicy", "hot", "indian"]
      case .custard: ["custard", "dessert", "food", "pudding", "flan"]
      case .customs: ["customs", "passport", "border", "blue-square"]
      case .cutOfMeat: ["cut", "of", "meat", "food", "cow", "meat", "cut", "chop", "lambchop", "porkchop"]
      case .cyclone: ["cyclone", "weather", "swirl", "blue", "cloud", "vortex", "spiral", "whirlpool", "spin", "tornado", "hurricane", "typhoon"]
      case .dagger: ["dagger", "weapon"]
      case .dango: ["dango", "food", "dessert", "sweet", "japanese", "barbecue", "meat"]
      case .dashingAway: ["dashing", "away", "wind", "air", "fast", "shoo", "fart", "smoke", "puff"]
      case .deafMan: ["deaf", "man", "accessibility"]
      case .deafPerson: ["deaf", "person", "accessibility"]
      case .deafWoman: ["deaf", "woman", "accessibility"]
      case .deciduousTree: ["deciduous", "tree", "plant", "nature"]
      case .deer: ["deer", "animal", "nature", "horns", "venison"]
      case .deliveryTruck: ["delivery", "truck", "cars", "transportation"]
      case .departmentStore: ["department", "store", "building", "shopping", "mall"]
      case .derelictHouse: ["derelict", "house", "abandon", "evict", "broken", "building"]
      case .desert: ["desert", "photo", "warm", "saharah"]
      case .desertIsland: ["desert", "island", "photo", "tropical", "mojito"]
      case .desktopComputer: ["desktop", "computer", "technology", "computing", "screen"]
      case .detective: ["detective", "human", "spy"]
      case .diamondSuit: ["diamond", "suit", "poker", "cards", "magic", "suits"]
      case .diamondWithADot: ["diamond", "with", "a", "dot", "jewel", "blue", "gem", "crystal", "fancy"]
      case .dimButton: ["dim", "button", "sun", "afternoon", "warm", "summer"]
      case .directHit: ["direct", "hit", "game", "play", "bar", "target", "bullseye"]
      case .disappointedFace: ["disappointed", "face", "face", "sad", "upset", "depressed", ":("]
      case .disguisedFace: ["disguised", "face", "pretent", "brows", "glasses", "moustache"]
      case .divingMask: ["diving", "mask", "sport", "ocean"]
      case .divisionSign: ["division", "sign", "divide", "math", "calculation"]
      case .diyaLamp: ["diya", "lamp", "lighting"]
      case .dizzy: ["dizzy", "star", "sparkle", "shoot", "magic"]
      case .dizzyFace: ["dizzy", "face", "spent", "unconscious", "xox", "dizzy"]
      case .dna: ["dna", "biologist", "genetics", "life"]
      case .dodo: ["dodo", "animal", "bird"]
      case .dog: ["dog", "animal", "nature", "friend", "doge", "pet", "faithful"]
      case .dogFace: ["dog", "face", "animal", "friend", "nature", "woof", "puppy", "pet", "faithful"]
      case .dollarBanknote: ["dollar", "banknote", "money", "sales", "bill", "currency"]
      case .dolphin: ["dolphin", "animal", "nature", "fish", "sea", "ocean", "flipper", "fins", "beach"]
      case .donkey: ["donkey", "eeyore", "mule"]
      case .door: ["door", "house", "entry", "exit"]
      case .dottedLineFace: ["dotted", "line", "face", "invisible", "lonely", "isolation", "depression"]
      case .dottedSixPointedStar: ["dotted", "six", "pointed", "star", "purple-square", "religion", "jewish", "hexagram"]
      case .doubleCurlyLoop: ["double", "curly", "loop", "tape", "cassette"]
      case .doubleExclamationMark: ["double", "exclamation", "mark", "exclamation", "surprise"]
      case .doughnut: ["doughnut", "food", "dessert", "snack", "sweet", "donut"]
      case .dove: ["dove", "animal", "bird"]
      case .downArrow: ["down", "arrow", "blue-square", "direction", "bottom"]
      case .downLeftArrow: ["down", "left", "arrow", "blue-square", "direction", "diagonal", "southwest"]
      case .downRightArrow: ["down", "right", "arrow", "blue-square", "direction", "diagonal", "southeast"]
      case .downcastFaceWithSweat: ["downcast", "face", "with", "sweat", "face", "hot", "sad", "tired", "exercise"]
      case .downwardsButton: ["downwards", "button", "blue-square", "direction", "bottom"]
      case .dragon: ["dragon", "animal", "myth", "nature", "chinese", "green"]
      case .dragonFace: ["dragon", "face", "animal", "myth", "nature", "chinese", "green"]
      case .dress: ["dress", "clothes", "fashion", "shopping"]
      case .droolingFace: ["drooling", "face", "face"]
      case .dropOfBlood: ["drop", "of", "blood", "period", "hurt", "harm", "wound"]
      case .droplet: ["droplet", "water", "drip", "faucet", "spring"]
      case .drum: ["drum", "music", "instrument", "drumsticks", "snare"]
      case .duck: ["duck", "animal", "nature", "bird", "mallard"]
      case .dumpling: ["dumpling", "food", "empanada", "pierogi", "potsticker", "gyoza"]
      case .dvd: ["dvd", "cd", "disk", "disc"]
      case .eMail: ["e", "mail", "communication", "inbox"]
      case .eagle: ["eagle", "animal", "nature", "bird"]
      case .ear: ["ear", "face", "hear", "sound", "listen"]
      case .earOfCorn: ["ear", "of", "corn", "food", "vegetable", "plant"]
      case .earWithHearingAid: ["ear", "with", "hearing", "aid", "accessibility"]
      case .egg: ["egg", "food", "chicken", "breakfast"]
      case .eggplant: ["eggplant", "vegetable", "nature", "food", "aubergine"]
      case .eightOClock: ["eight", "o", "clock", "8", "8:00", "800", "20:00", "2000", "time", "late", "early", "schedule"]
      case .eightPointedStar: ["eight", "pointed", "star", "orange-square", "shape", "polygon"]
      case .eightSpokedAsterisk: ["eight", "spoked", "asterisk", "star", "sparkle", "green-square"]
      case .eightThirty: ["eight", "thirty", "8:30", "830", "20:30", "2030", "time", "late", "early", "schedule"]
      case .ejectButton: ["eject", "button", "blue-square"]
      case .electricPlug: ["electric", "plug", "charger", "power"]
      case .elephant: ["elephant", "animal", "nature", "nose", "th", "circus"]
      case .elevator: ["elevator", "lift"]
      case .elevenOClock: ["eleven", "o", "clock", "11", "11:00", "1100", "23:00", "2300", "time", "late", "early", "schedule"]
      case .elevenThirty: ["eleven", "thirty", "11:30", "1130", "23:30", "2330", "time", "late", "early", "schedule"]
      case .elf: ["elf", "magical"]
      case .emptyNest: ["empty", "nest", "bird"]
      case .endArrow: ["end", "arrow", "words", "arrow"]
      case .envelope: ["envelope", "letter", "postal", "inbox", "communication"]
      case .envelopeWithArrow: ["envelope", "with", "arrow", "email", "communication"]
      case .euroBanknote: ["euro", "banknote", "money", "sales", "dollar", "currency"]
      case .evergreenTree: ["evergreen", "tree", "plant", "nature"]
      case .ewe: ["ewe", "animal", "nature", "wool", "shipit"]
      case .exclamationMark: ["exclamation", "mark", "heavy", "exclamation", "mark", "danger", "surprise", "punctuation", "wow", "warning"]
      case .exclamationQuestionMark: ["exclamation", "question", "mark", "wat", "punctuation", "surprise"]
      case .explodingHead: ["exploding", "head", "face", "shocked", "mind", "blown"]
      case .expressionlessFace: ["expressionless", "face", "face", "indifferent", "-", "-", "meh", "deadpan"]
      case .eye: ["eye", "face", "look", "see", "watch", "stare"]
      case .eyeInSpeechBubble: ["eye", "in", "speech", "bubble", "info"]
      case .eyes: ["eyes", "look", "watch", "stalk", "peek", "see"]
      case .faceBlowingAKiss: ["face", "blowing", "a", "kiss", "face", "love", "like", "affection", "valentines", "infatuation", "kiss"]
      case .faceExhaling: ["face", "exhaling", "relieve", "relief", "tired", "sigh"]
      case .faceHoldingBackTears: ["face", "holding", "back", "tears", "touched", "gratitude", "cry"]
      case .faceInClouds: ["face", "in", "clouds", "shower", "steam", "dream"]
      case .faceSavoringFood:
         ["face", "savoring", "food", "happy", "joy", "tongue", "smile", "face", "silly", "yummy", "nom", "delicious", "savouring"]
      case .faceScreamingInFear: ["face", "screaming", "in", "fear", "face", "munch", "scared", "omg"]
      case .faceVomiting: ["face", "vomiting", "face", "sick"]
      case .faceWithDiagonalMouth: ["face", "with", "diagonal", "mouth", "skeptic", "confuse", "frustrated", "indifferent"]
      case .faceWithHandOverMouth: ["face", "with", "hand", "over", "mouth", "face", "whoops", "shock", "surprise"]
      case .faceWithHeadBandage: ["face", "with", "head", "bandage", "injured", "clumsy", "bandage", "hurt"]
      case .faceWithMedicalMask: ["face", "with", "medical", "mask", "face", "sick", "ill", "disease", "covid"]
      case .faceWithMonocle: ["face", "with", "monocle", "face", "stuffy", "wealthy"]
      case .faceWithOpenEyesAndHandOverMouth:
         ["face", "with", "open", "eyes", "and", "hand", "over", "mouth", "silence", "secret", "shock", "surprise"]
      case .faceWithOpenMouth: ["face", "with", "open", "mouth", "face", "surprise", "impressed", "wow", "whoa", ":O"]
      case .faceWithPeekingEye: ["face", "with", "peeking", "eye", "scared", "frightening", "embarrassing", "shy"]
      case .faceWithRaisedEyebrow:
         ["face", "with", "raised", "eyebrow", "face", "distrust", "scepticism", "disapproval", "disbelief", "surprise", "suspicious"]
      case .faceWithRollingEyes: ["face", "with", "rolling", "eyes", "face", "eyeroll", "frustrated"]
      case .faceWithSpiralEyes: ["face", "with", "spiral", "eyes", "sick", "ill", "confused", "nauseous", "nausea"]
      case .faceWithSteamFromNose: ["face", "with", "steam", "from", "nose", "face", "gas", "phew", "proud", "pride", "triumph"]
      case .faceWithSymbolsOnMouth: ["face", "with", "symbols", "on", "mouth", "face", "swearing", "cursing", "cussing", "profanity", "expletive"]
      case .faceWithTearsOfJoy: ["face", "with", "tears", "of", "joy", "face", "cry", "tears", "weep", "happy", "happytears", "haha"]
      case .faceWithThermometer: ["face", "with", "thermometer", "sick", "temperature", "thermometer", "cold", "fever", "covid"]
      case .faceWithTongue: ["face", "with", "tongue", "face", "prank", "childish", "playful", "mischievous", "smile", "tongue"]
      case .faceWithoutMouth: ["face", "without", "mouth", "face"]
      case .factory: ["factory", "building", "industry", "pollution", "smoke"]
      case .factoryWorker: ["factory", "worker", "labor"]
      case .fairy: ["fairy", "wings", "magical"]
      case .falafel: ["falafel", "food", "mediterranean"]
      case .fallenLeaf: ["fallen", "leaf", "nature", "plant", "vegetable", "leaves"]
      case .family: ["family", "home", "parents", "child", "mom", "dad", "father", "mother", "people", "human"]
      case .familyManBoy: ["family", "man", "boy", "home", "parent", "people", "human", "child"]
      case .familyManBoyBoy: ["family", "man", "boy", "boy", "home", "parent", "people", "human", "children"]
      case .familyManGirl: ["family", "man", "girl", "home", "parent", "people", "human", "child"]
      case .familyManGirlBoy: ["family", "man", "girl", "boy", "home", "parent", "people", "human", "children"]
      case .familyManGirlGirl: ["family", "man", "girl", "girl", "home", "parent", "people", "human", "children"]
      case .familyManManBoy: ["family", "man", "man", "boy", "home", "parents", "people", "human", "children"]
      case .familyManManBoyBoy: ["family", "man", "man", "boy", "boy", "home", "parents", "people", "human", "children"]
      case .familyManManGirl: ["family", "man", "man", "girl", "home", "parents", "people", "human", "children"]
      case .familyManManGirlBoy: ["family", "man", "man", "girl", "boy", "home", "parents", "people", "human", "children"]
      case .familyManManGirlGirl: ["family", "man", "man", "girl", "girl", "home", "parents", "people", "human", "children"]
      case .familyManWomanBoy: ["family", "man", "woman", "boy", "love"]
      case .familyManWomanBoyBoy: ["family", "man", "woman", "boy", "boy", "home", "parents", "people", "human", "children"]
      case .familyManWomanGirl: ["family", "man", "woman", "girl", "home", "parents", "people", "human", "child"]
      case .familyManWomanGirlBoy: ["family", "man", "woman", "girl", "boy", "home", "parents", "people", "human", "children"]
      case .familyManWomanGirlGirl: ["family", "man", "woman", "girl", "girl", "home", "parents", "people", "human", "children"]
      case .familyWomanBoy: ["family", "woman", "boy", "home", "parent", "people", "human", "child"]
      case .familyWomanBoyBoy: ["family", "woman", "boy", "boy", "home", "parent", "people", "human", "children"]
      case .familyWomanGirl: ["family", "woman", "girl", "home", "parent", "people", "human", "child"]
      case .familyWomanGirlBoy: ["family", "woman", "girl", "boy", "home", "parent", "people", "human", "children"]
      case .familyWomanGirlGirl: ["family", "woman", "girl", "girl", "home", "parent", "people", "human", "children"]
      case .familyWomanWomanBoy: ["family", "woman", "woman", "boy", "home", "parents", "people", "human", "children"]
      case .familyWomanWomanBoyBoy: ["family", "woman", "woman", "boy", "boy", "home", "parents", "people", "human", "children"]
      case .familyWomanWomanGirl: ["family", "woman", "woman", "girl", "home", "parents", "people", "human", "children"]
      case .familyWomanWomanGirlBoy: ["family", "woman", "woman", "girl", "boy", "home", "parents", "people", "human", "children"]
      case .familyWomanWomanGirlGirl: ["family", "woman", "woman", "girl", "girl", "home", "parents", "people", "human", "children"]
      case .farmer: ["farmer", "crops"]
      case .fastDownButton: ["fast", "down", "button", "blue-square", "direction", "bottom"]
      case .fastForwardButton: ["fast", "forward", "button", "blue-square", "play", "speed", "continue"]
      case .fastReverseButton: ["fast", "reverse", "button", "play", "blue-square"]
      case .fastUpButton: ["fast", "up", "button", "blue-square", "direction", "top"]
      case .faxMachine: ["fax", "machine", "communication", "technology"]
      case .fearfulFace: ["fearful", "face", "face", "scared", "terrified", "nervous"]
      case .feather: ["feather", "bird", "fly"]
      case .femaleSign: ["female", "sign", "woman", "women", "lady", "girl"]
      case .ferrisWheel: ["ferris", "wheel", "photo", "carnival", "londoneye"]
      case .ferry: ["ferry", "boat", "ship", "yacht"]
      case .fieldHockey: ["field", "hockey", "sports"]
      case .fileCabinet: ["file", "cabinet", "filing", "organizing"]
      case .fileFolder: ["file", "folder", "documents", "business", "office"]
      case .filmFrames: ["film", "frames", "movie"]
      case .filmProjector: ["film", "projector", "video", "tape", "record", "movie"]
      case .fire: ["fire", "hot", "cook", "flame"]
      case .fireEngine: ["fire", "engine", "transportation", "cars", "vehicle"]
      case .fireExtinguisher: ["fire", "extinguisher", "quench"]
      case .firecracker: ["firecracker", "dynamite", "boom", "explode", "explosion", "explosive"]
      case .firefighter: ["firefighter", "fire"]
      case .fireworks: ["fireworks", "photo", "festival", "carnival", "congratulations"]
      case .firstQuarterMoon: ["first", "quarter", "moon", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .firstQuarterMoonFace: ["first", "quarter", "moon", "face", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .fish: ["fish", "animal", "food", "nature"]
      case .fishCakeWithSwirl:
         ["fish", "cake", "with", "swirl", "food", "japan", "sea", "beach", "narutomaki", "pink", "swirl", "kamaboko", "surimi", "ramen"]
      case .fishingPole: ["fishing", "pole", "food", "hobby", "summer"]
      case .fiveOClock: ["five", "o", "clock", "5", "5:00", "500", "17:00", "1700", "time", "late", "early", "schedule"]
      case .fiveThirty: ["five", "thirty", "5:30", "530", "17:30", "1730", "time", "late", "early", "schedule"]
      case .flagAfghanistan: ["flag", "afghanistan", "af", "flag", "nation", "country", "banner", "afghanistan"]
      case .flagAlandIslands: ["flag", "aland", "islands", "Åland", "islands", "flag", "nation", "country", "banner", "aland", "islands"]
      case .flagAlbania: ["flag", "albania", "al", "flag", "nation", "country", "banner", "albania"]
      case .flagAlgeria: ["flag", "algeria", "dz", "flag", "nation", "country", "banner", "algeria"]
      case .flagAmericanSamoa: ["flag", "american", "samoa", "american", "ws", "flag", "nation", "country", "banner", "american", "samoa"]
      case .flagAndorra: ["flag", "andorra", "ad", "flag", "nation", "country", "banner", "andorra"]
      case .flagAngola: ["flag", "angola", "ao", "flag", "nation", "country", "banner", "angola"]
      case .flagAnguilla: ["flag", "anguilla", "ai", "flag", "nation", "country", "banner", "anguilla"]
      case .flagAntarctica: ["flag", "antarctica", "aq", "flag", "nation", "country", "banner", "antarctica"]
      case .flagAntiguaBarbuda: ["flag", "antigua", "barbuda", "antigua", "barbuda", "flag", "nation", "country", "banner", "antigua", "barbuda"]
      case .flagArgentina: ["flag", "argentina", "ar", "flag", "nation", "country", "banner", "argentina"]
      case .flagArmenia: ["flag", "armenia", "am", "flag", "nation", "country", "banner", "armenia"]
      case .flagAruba: ["flag", "aruba", "aw", "flag", "nation", "country", "banner", "aruba"]
      case .flagAscensionIsland: ["flag", "ascension", "island"]
      case .flagAustralia: ["flag", "australia", "au", "flag", "nation", "country", "banner", "australia"]
      case .flagAustria: ["flag", "austria", "at", "flag", "nation", "country", "banner", "austria"]
      case .flagAzerbaijan: ["flag", "azerbaijan", "az", "flag", "nation", "country", "banner", "azerbaijan"]
      case .flagBahamas: ["flag", "bahamas", "bs", "flag", "nation", "country", "banner", "bahamas"]
      case .flagBahrain: ["flag", "bahrain", "bh", "flag", "nation", "country", "banner", "bahrain"]
      case .flagBangladesh: ["flag", "bangladesh", "bd", "flag", "nation", "country", "banner", "bangladesh"]
      case .flagBarbados: ["flag", "barbados", "bb", "flag", "nation", "country", "banner", "barbados"]
      case .flagBelarus: ["flag", "belarus", "by", "flag", "nation", "country", "banner", "belarus"]
      case .flagBelgium: ["flag", "belgium", "be", "flag", "nation", "country", "banner", "belgium"]
      case .flagBelize: ["flag", "belize", "bz", "flag", "nation", "country", "banner", "belize"]
      case .flagBenin: ["flag", "benin", "bj", "flag", "nation", "country", "banner", "benin"]
      case .flagBermuda: ["flag", "bermuda", "bm", "flag", "nation", "country", "banner", "bermuda"]
      case .flagBhutan: ["flag", "bhutan", "bt", "flag", "nation", "country", "banner", "bhutan"]
      case .flagBolivia: ["flag", "bolivia", "bo", "flag", "nation", "country", "banner", "bolivia"]
      case .flagBosniaHerzegovina:
         ["flag", "bosnia", "herzegovina", "bosnia", "herzegovina", "flag", "nation", "country", "banner", "bosnia", "herzegovina"]
      case .flagBotswana: ["flag", "botswana", "bw", "flag", "nation", "country", "banner", "botswana"]
      case .flagBouvetIsland: ["flag", "bouvet", "island", "norway"]
      case .flagBrazil: ["flag", "brazil", "br", "flag", "nation", "country", "banner", "brazil"]
      case .flagBritishIndianOceanTerritory:
         [
            "flag", "british", "indian", "ocean", "territory", "british", "indian", "ocean", "territory", "flag", "nation", "country", "banner",
            "british", "indian", "ocean", "territory",
         ]
      case .flagBritishVirginIslands:
         [
            "flag", "british", "virgin", "islands", "british", "virgin", "islands", "bvi", "flag", "nation", "country", "banner", "british", "virgin",
            "islands",
         ]
      case .flagBrunei: ["flag", "brunei", "bn", "darussalam", "flag", "nation", "country", "banner", "brunei"]
      case .flagBulgaria: ["flag", "bulgaria", "bg", "flag", "nation", "country", "banner", "bulgaria"]
      case .flagBurkinaFaso: ["flag", "burkina", "faso", "burkina", "faso", "flag", "nation", "country", "banner", "burkina", "faso"]
      case .flagBurundi: ["flag", "burundi", "bi", "flag", "nation", "country", "banner", "burundi"]
      case .flagCambodia: ["flag", "cambodia", "kh", "flag", "nation", "country", "banner", "cambodia"]
      case .flagCameroon: ["flag", "cameroon", "cm", "flag", "nation", "country", "banner", "cameroon"]
      case .flagCanada: ["flag", "canada", "ca", "flag", "nation", "country", "banner", "canada"]
      case .flagCanaryIslands: ["flag", "canary", "islands", "canary", "islands", "flag", "nation", "country", "banner", "canary", "islands"]
      case .flagCapeVerde: ["flag", "cape", "verde", "cabo", "verde", "flag", "nation", "country", "banner", "cape", "verde"]
      case .flagCaribbeanNetherlands:
         ["flag", "caribbean", "netherlands", "bonaire", "flag", "nation", "country", "banner", "caribbean", "netherlands"]
      case .flagCaymanIslands: ["flag", "cayman", "islands", "cayman", "islands", "flag", "nation", "country", "banner", "cayman", "islands"]
      case .flagCentralAfricanRepublic:
         [
            "flag", "central", "african", "republic", "central", "african", "republic", "flag", "nation", "country", "banner", "central", "african",
            "republic",
         ]
      case .flagCeutaMelilla: ["flag", "ceuta", "melilla"]
      case .flagChad: ["flag", "chad", "td", "flag", "nation", "country", "banner", "chad"]
      case .flagChile: ["flag", "chile", "flag", "nation", "country", "banner", "chile"]
      case .flagChina: ["flag", "china", "china", "chinese", "prc", "flag", "country", "nation", "banner"]
      case .flagChristmasIsland: ["flag", "christmas", "island", "christmas", "island", "flag", "nation", "country", "banner", "christmas", "island"]
      case .flagClippertonIsland: ["flag", "clipperton", "island"]
      case .flagCocosIslands: ["flag", "cocos", "islands", "cocos", "keeling", "islands", "flag", "nation", "country", "banner", "cocos", "islands"]
      case .flagColombia: ["flag", "colombia", "co", "flag", "nation", "country", "banner", "colombia"]
      case .flagComoros: ["flag", "comoros", "km", "flag", "nation", "country", "banner", "comoros"]
      case .flagCongoBrazzaville: ["flag", "congo", "brazzaville", "congo", "flag", "nation", "country", "banner", "congo", "brazzaville"]
      case .flagCongoKinshasa:
         ["flag", "congo", "kinshasa", "congo", "democratic", "republic", "flag", "nation", "country", "banner", "congo", "kinshasa"]
      case .flagCookIslands: ["flag", "cook", "islands", "cook", "islands", "flag", "nation", "country", "banner", "cook", "islands"]
      case .flagCostaRica: ["flag", "costa", "rica", "costa", "rica", "flag", "nation", "country", "banner", "costa", "rica"]
      case .flagCoteDIvoire: ["flag", "cote", "d", "ivoire", "ivory", "coast", "flag", "nation", "country", "banner", "cote", "d", "ivoire"]
      case .flagCroatia: ["flag", "croatia", "hr", "flag", "nation", "country", "banner", "croatia"]
      case .flagCuba: ["flag", "cuba", "cu", "flag", "nation", "country", "banner", "cuba"]
      case .flagCuracao: ["flag", "curacao", "curaçao", "flag", "nation", "country", "banner", "curacao"]
      case .flagCyprus: ["flag", "cyprus", "cy", "flag", "nation", "country", "banner", "cyprus"]
      case .flagCzechia: ["flag", "czechia", "cz", "flag", "nation", "country", "banner", "czechia"]
      case .flagDenmark: ["flag", "denmark", "dk", "flag", "nation", "country", "banner", "denmark"]
      case .flagDiegoGarcia: ["flag", "diego", "garcia"]
      case .flagDjibouti: ["flag", "djibouti", "dj", "flag", "nation", "country", "banner", "djibouti"]
      case .flagDominica: ["flag", "dominica", "dm", "flag", "nation", "country", "banner", "dominica"]
      case .flagDominicanRepublic:
         ["flag", "dominican", "republic", "dominican", "republic", "flag", "nation", "country", "banner", "dominican", "republic"]
      case .flagEcuador: ["flag", "ecuador", "ec", "flag", "nation", "country", "banner", "ecuador"]
      case .flagEgypt: ["flag", "egypt", "eg", "flag", "nation", "country", "banner", "egypt"]
      case .flagElSalvador: ["flag", "el", "salvador", "el", "salvador", "flag", "nation", "country", "banner", "el", "salvador"]
      case .flagEngland: ["flag", "england", "flag", "english"]
      case .flagEquatorialGuinea: ["flag", "equatorial", "guinea", "equatorial", "gn", "flag", "nation", "country", "banner", "equatorial", "guinea"]
      case .flagEritrea: ["flag", "eritrea", "er", "flag", "nation", "country", "banner", "eritrea"]
      case .flagEstonia: ["flag", "estonia", "ee", "flag", "nation", "country", "banner", "estonia"]
      case .flagEswatini: ["flag", "eswatini", "sz", "flag", "nation", "country", "banner", "eswatini"]
      case .flagEthiopia: ["flag", "ethiopia", "et", "flag", "nation", "country", "banner", "ethiopia"]
      case .flagEuropeanUnion: ["flag", "european", "union", "european", "union", "flag", "banner"]
      case .flagFalklandIslands:
         ["flag", "falkland", "islands", "falkland", "islands", "malvinas", "flag", "nation", "country", "banner", "falkland", "islands"]
      case .flagFaroeIslands: ["flag", "faroe", "islands", "faroe", "islands", "flag", "nation", "country", "banner", "faroe", "islands"]
      case .flagFiji: ["flag", "fiji", "fj", "flag", "nation", "country", "banner", "fiji"]
      case .flagFinland: ["flag", "finland", "fi", "flag", "nation", "country", "banner", "finland"]
      case .flagFrance: ["flag", "france", "banner", "flag", "nation", "france", "french", "country"]
      case .flagFrenchGuiana: ["flag", "french", "guiana", "french", "guiana", "flag", "nation", "country", "banner", "french", "guiana"]
      case .flagFrenchPolynesia: ["flag", "french", "polynesia", "french", "polynesia", "flag", "nation", "country", "banner", "french", "polynesia"]
      case .flagFrenchSouthernTerritories:
         [
            "flag", "french", "southern", "territories", "french", "southern", "territories", "flag", "nation", "country", "banner", "french",
            "southern", "territories",
         ]
      case .flagGabon: ["flag", "gabon", "ga", "flag", "nation", "country", "banner", "gabon"]
      case .flagGambia: ["flag", "gambia", "gm", "flag", "nation", "country", "banner", "gambia"]
      case .flagGeorgia: ["flag", "georgia", "ge", "flag", "nation", "country", "banner", "georgia"]
      case .flagGermany: ["flag", "germany", "german", "nation", "flag", "country", "banner", "germany"]
      case .flagGhana: ["flag", "ghana", "gh", "flag", "nation", "country", "banner", "ghana"]
      case .flagGibraltar: ["flag", "gibraltar", "gi", "flag", "nation", "country", "banner", "gibraltar"]
      case .flagGreece: ["flag", "greece", "gr", "flag", "nation", "country", "banner", "greece"]
      case .flagGreenland: ["flag", "greenland", "gl", "flag", "nation", "country", "banner", "greenland"]
      case .flagGrenada: ["flag", "grenada", "gd", "flag", "nation", "country", "banner", "grenada"]
      case .flagGuadeloupe: ["flag", "guadeloupe", "gp", "flag", "nation", "country", "banner", "guadeloupe"]
      case .flagGuam: ["flag", "guam", "gu", "flag", "nation", "country", "banner", "guam"]
      case .flagGuatemala: ["flag", "guatemala", "gt", "flag", "nation", "country", "banner", "guatemala"]
      case .flagGuernsey: ["flag", "guernsey", "gg", "flag", "nation", "country", "banner", "guernsey"]
      case .flagGuinea: ["flag", "guinea", "gn", "flag", "nation", "country", "banner", "guinea"]
      case .flagGuineaBissau: ["flag", "guinea", "bissau", "gw", "bissau", "flag", "nation", "country", "banner", "guinea", "bissau"]
      case .flagGuyana: ["flag", "guyana", "gy", "flag", "nation", "country", "banner", "guyana"]
      case .flagHaiti: ["flag", "haiti", "ht", "flag", "nation", "country", "banner", "haiti"]
      case .flagHeardMcdonaldIslands: ["flag", "heard", "mcdonald", "islands"]
      case .flagHonduras: ["flag", "honduras", "hn", "flag", "nation", "country", "banner", "honduras"]
      case .flagHongKongSarChina:
         ["flag", "hong", "kong", "sar", "china", "hong", "kong", "flag", "nation", "country", "banner", "hong", "kong", "sar", "china"]
      case .flagHungary: ["flag", "hungary", "hu", "flag", "nation", "country", "banner", "hungary"]
      case .flagIceland: ["flag", "iceland", "is", "flag", "nation", "country", "banner", "iceland"]
      case .flagInHole: ["flag", "in", "hole", "sports", "business", "flag", "hole", "summer"]
      case .flagIndia: ["flag", "india", "in", "flag", "nation", "country", "banner", "india"]
      case .flagIndonesia: ["flag", "indonesia", "flag", "nation", "country", "banner", "indonesia"]
      case .flagIran: ["flag", "iran", "iran", "islamic", "republic", "flag", "nation", "country", "banner"]
      case .flagIraq: ["flag", "iraq", "iq", "flag", "nation", "country", "banner", "iraq"]
      case .flagIreland: ["flag", "ireland", "ie", "flag", "nation", "country", "banner", "ireland"]
      case .flagIsleOfMan: ["flag", "isle", "of", "man", "isle", "man", "flag", "nation", "country", "banner", "isle", "of", "man"]
      case .flagIsrael: ["flag", "israel", "il", "flag", "nation", "country", "banner", "israel"]
      case .flagItaly: ["flag", "italy", "italy", "flag", "nation", "country", "banner"]
      case .flagJamaica: ["flag", "jamaica", "jm", "flag", "nation", "country", "banner", "jamaica"]
      case .flagJapan: ["flag", "japan", "japanese", "nation", "flag", "country", "banner", "japan", "jp", "ja"]
      case .flagJersey: ["flag", "jersey", "je", "flag", "nation", "country", "banner", "jersey"]
      case .flagJordan: ["flag", "jordan", "jo", "flag", "nation", "country", "banner", "jordan"]
      case .flagKazakhstan: ["flag", "kazakhstan", "kz", "flag", "nation", "country", "banner", "kazakhstan"]
      case .flagKenya: ["flag", "kenya", "ke", "flag", "nation", "country", "banner", "kenya"]
      case .flagKiribati: ["flag", "kiribati", "ki", "flag", "nation", "country", "banner", "kiribati"]
      case .flagKosovo: ["flag", "kosovo", "xk", "flag", "nation", "country", "banner", "kosovo"]
      case .flagKuwait: ["flag", "kuwait", "kw", "flag", "nation", "country", "banner", "kuwait"]
      case .flagKyrgyzstan: ["flag", "kyrgyzstan", "kg", "flag", "nation", "country", "banner", "kyrgyzstan"]
      case .flagLaos: ["flag", "laos", "lao", "democratic", "republic", "flag", "nation", "country", "banner", "laos"]
      case .flagLatvia: ["flag", "latvia", "lv", "flag", "nation", "country", "banner", "latvia"]
      case .flagLebanon: ["flag", "lebanon", "lb", "flag", "nation", "country", "banner", "lebanon"]
      case .flagLesotho: ["flag", "lesotho", "ls", "flag", "nation", "country", "banner", "lesotho"]
      case .flagLiberia: ["flag", "liberia", "lr", "flag", "nation", "country", "banner", "liberia"]
      case .flagLibya: ["flag", "libya", "ly", "flag", "nation", "country", "banner", "libya"]
      case .flagLiechtenstein: ["flag", "liechtenstein", "li", "flag", "nation", "country", "banner", "liechtenstein"]
      case .flagLithuania: ["flag", "lithuania", "lt", "flag", "nation", "country", "banner", "lithuania"]
      case .flagLuxembourg: ["flag", "luxembourg", "lu", "flag", "nation", "country", "banner", "luxembourg"]
      case .flagMacaoSarChina: ["flag", "macao", "sar", "china", "macao", "flag", "nation", "country", "banner", "macao", "sar", "china"]
      case .flagMadagascar: ["flag", "madagascar", "mg", "flag", "nation", "country", "banner", "madagascar"]
      case .flagMalawi: ["flag", "malawi", "mw", "flag", "nation", "country", "banner", "malawi"]
      case .flagMalaysia: ["flag", "malaysia", "my", "flag", "nation", "country", "banner", "malaysia"]
      case .flagMaldives: ["flag", "maldives", "mv", "flag", "nation", "country", "banner", "maldives"]
      case .flagMali: ["flag", "mali", "ml", "flag", "nation", "country", "banner", "mali"]
      case .flagMalta: ["flag", "malta", "mt", "flag", "nation", "country", "banner", "malta"]
      case .flagMarshallIslands: ["flag", "marshall", "islands", "marshall", "islands", "flag", "nation", "country", "banner", "marshall", "islands"]
      case .flagMartinique: ["flag", "martinique", "mq", "flag", "nation", "country", "banner", "martinique"]
      case .flagMauritania: ["flag", "mauritania", "mr", "flag", "nation", "country", "banner", "mauritania"]
      case .flagMauritius: ["flag", "mauritius", "mu", "flag", "nation", "country", "banner", "mauritius"]
      case .flagMayotte: ["flag", "mayotte", "yt", "flag", "nation", "country", "banner", "mayotte"]
      case .flagMexico: ["flag", "mexico", "mx", "flag", "nation", "country", "banner", "mexico"]
      case .flagMicronesia: ["flag", "micronesia", "micronesia", "federated", "states", "flag", "nation", "country", "banner"]
      case .flagMoldova: ["flag", "moldova", "moldova", "republic", "flag", "nation", "country", "banner"]
      case .flagMonaco: ["flag", "monaco", "mc", "flag", "nation", "country", "banner", "monaco"]
      case .flagMongolia: ["flag", "mongolia", "mn", "flag", "nation", "country", "banner", "mongolia"]
      case .flagMontenegro: ["flag", "montenegro", "me", "flag", "nation", "country", "banner", "montenegro"]
      case .flagMontserrat: ["flag", "montserrat", "ms", "flag", "nation", "country", "banner", "montserrat"]
      case .flagMorocco: ["flag", "morocco", "ma", "flag", "nation", "country", "banner", "morocco"]
      case .flagMozambique: ["flag", "mozambique", "mz", "flag", "nation", "country", "banner", "mozambique"]
      case .flagMyanmar: ["flag", "myanmar", "mm", "flag", "nation", "country", "banner", "myanmar"]
      case .flagNamibia: ["flag", "namibia", "na", "flag", "nation", "country", "banner", "namibia"]
      case .flagNauru: ["flag", "nauru", "nr", "flag", "nation", "country", "banner", "nauru"]
      case .flagNepal: ["flag", "nepal", "np", "flag", "nation", "country", "banner", "nepal"]
      case .flagNetherlands: ["flag", "netherlands", "nl", "flag", "nation", "country", "banner", "netherlands"]
      case .flagNewCaledonia: ["flag", "new", "caledonia", "new", "caledonia", "flag", "nation", "country", "banner", "new", "caledonia"]
      case .flagNewZealand: ["flag", "new", "zealand", "new", "zealand", "flag", "nation", "country", "banner", "new", "zealand"]
      case .flagNicaragua: ["flag", "nicaragua", "ni", "flag", "nation", "country", "banner", "nicaragua"]
      case .flagNiger: ["flag", "niger", "ne", "flag", "nation", "country", "banner", "niger"]
      case .flagNigeria: ["flag", "nigeria", "flag", "nation", "country", "banner", "nigeria"]
      case .flagNiue: ["flag", "niue", "nu", "flag", "nation", "country", "banner", "niue"]
      case .flagNorfolkIsland: ["flag", "norfolk", "island", "norfolk", "island", "flag", "nation", "country", "banner", "norfolk", "island"]
      case .flagNorthKorea: ["flag", "north", "korea", "north", "korea", "nation", "flag", "country", "banner", "north", "korea"]
      case .flagNorthMacedonia: ["flag", "north", "macedonia", "macedonia", "flag", "nation", "country", "banner", "north", "macedonia"]
      case .flagNorthernMarianaIslands:
         [
            "flag", "northern", "mariana", "islands", "northern", "mariana", "islands", "flag", "nation", "country", "banner", "northern", "mariana",
            "islands",
         ]
      case .flagNorway: ["flag", "norway", "no", "flag", "nation", "country", "banner", "norway"]
      case .flagOman: ["flag", "oman", "om", "symbol", "flag", "nation", "country", "banner", "oman"]
      case .flagPakistan: ["flag", "pakistan", "pk", "flag", "nation", "country", "banner", "pakistan"]
      case .flagPalau: ["flag", "palau", "pw", "flag", "nation", "country", "banner", "palau"]
      case .flagPalestinianTerritories:
         [
            "flag", "palestinian", "territories", "palestine", "palestinian", "territories", "flag", "nation", "country", "banner", "palestinian",
            "territories",
         ]
      case .flagPanama: ["flag", "panama", "pa", "flag", "nation", "country", "banner", "panama"]
      case .flagPapuaNewGuinea:
         ["flag", "papua", "new", "guinea", "papua", "new", "guinea", "flag", "nation", "country", "banner", "papua", "new", "guinea"]
      case .flagParaguay: ["flag", "paraguay", "py", "flag", "nation", "country", "banner", "paraguay"]
      case .flagPeru: ["flag", "peru", "pe", "flag", "nation", "country", "banner", "peru"]
      case .flagPhilippines: ["flag", "philippines", "ph", "flag", "nation", "country", "banner", "philippines"]
      case .flagPitcairnIslands: ["flag", "pitcairn", "islands", "pitcairn", "flag", "nation", "country", "banner", "pitcairn", "islands"]
      case .flagPoland: ["flag", "poland", "pl", "flag", "nation", "country", "banner", "poland"]
      case .flagPortugal: ["flag", "portugal", "pt", "flag", "nation", "country", "banner", "portugal"]
      case .flagPuertoRico: ["flag", "puerto", "rico", "puerto", "rico", "flag", "nation", "country", "banner", "puerto", "rico"]
      case .flagQatar: ["flag", "qatar", "qa", "flag", "nation", "country", "banner", "qatar"]
      case .flagReunion: ["flag", "reunion", "réunion", "flag", "nation", "country", "banner", "reunion"]
      case .flagRomania: ["flag", "romania", "ro", "flag", "nation", "country", "banner", "romania"]
      case .flagRussia: ["flag", "russia", "russian", "federation", "flag", "nation", "country", "banner", "russia"]
      case .flagRwanda: ["flag", "rwanda", "rw", "flag", "nation", "country", "banner", "rwanda"]
      case .flagSamoa: ["flag", "samoa", "ws", "flag", "nation", "country", "banner", "samoa"]
      case .flagSanMarino: ["flag", "san", "marino", "san", "marino", "flag", "nation", "country", "banner", "san", "marino"]
      case .flagSaoTomePrincipe:
         ["flag", "sao", "tome", "principe", "sao", "tome", "principe", "flag", "nation", "country", "banner", "sao", "tome", "principe"]
      case .flagSaudiArabia: ["flag", "saudi", "arabia", "flag", "nation", "country", "banner", "saudi", "arabia"]
      case .flagScotland: ["flag", "scotland", "flag", "scottish"]
      case .flagSenegal: ["flag", "senegal", "sn", "flag", "nation", "country", "banner", "senegal"]
      case .flagSerbia: ["flag", "serbia", "rs", "flag", "nation", "country", "banner", "serbia"]
      case .flagSeychelles: ["flag", "seychelles", "sc", "flag", "nation", "country", "banner", "seychelles"]
      case .flagSierraLeone: ["flag", "sierra", "leone", "sierra", "leone", "flag", "nation", "country", "banner", "sierra", "leone"]
      case .flagSingapore: ["flag", "singapore", "sg", "flag", "nation", "country", "banner", "singapore"]
      case .flagSintMaarten: ["flag", "sint", "maarten", "sint", "maarten", "dutch", "flag", "nation", "country", "banner", "sint", "maarten"]
      case .flagSlovakia: ["flag", "slovakia", "sk", "flag", "nation", "country", "banner", "slovakia"]
      case .flagSlovenia: ["flag", "slovenia", "si", "flag", "nation", "country", "banner", "slovenia"]
      case .flagSolomonIslands: ["flag", "solomon", "islands", "solomon", "islands", "flag", "nation", "country", "banner", "solomon", "islands"]
      case .flagSomalia: ["flag", "somalia", "so", "flag", "nation", "country", "banner", "somalia"]
      case .flagSouthAfrica: ["flag", "south", "africa", "south", "africa", "flag", "nation", "country", "banner", "south", "africa"]
      case .flagSouthGeorgiaSouthSandwichIslands:
         [
            "flag", "south", "georgia", "south", "sandwich", "islands", "south", "georgia", "sandwich", "islands", "flag", "nation", "country",
            "banner", "south", "georgia", "south", "sandwich", "islands",
         ]
      case .flagSouthKorea: ["flag", "south", "korea", "south", "korea", "nation", "flag", "country", "banner", "south", "korea"]
      case .flagSouthSudan: ["flag", "south", "sudan", "south", "sd", "flag", "nation", "country", "banner", "south", "sudan"]
      case .flagSpain: ["flag", "spain", "spain", "flag", "nation", "country", "banner"]
      case .flagSriLanka: ["flag", "sri", "lanka", "sri", "lanka", "flag", "nation", "country", "banner", "sri", "lanka"]
      case .flagStBarthelemy: ["flag", "st", "barthelemy", "saint", "barthélemy", "flag", "nation", "country", "banner", "st", "barthelemy"]
      case .flagStHelena:
         ["flag", "st", "helena", "saint", "helena", "ascension", "tristan", "cunha", "flag", "nation", "country", "banner", "st", "helena"]
      case .flagStKittsNevis:
         ["flag", "st", "kitts", "nevis", "saint", "kitts", "nevis", "flag", "nation", "country", "banner", "st", "kitts", "nevis"]
      case .flagStLucia: ["flag", "st", "lucia", "saint", "lucia", "flag", "nation", "country", "banner", "st", "lucia"]
      case .flagStMartin: ["flag", "st", "martin"]
      case .flagStPierreMiquelon:
         ["flag", "st", "pierre", "miquelon", "saint", "pierre", "miquelon", "flag", "nation", "country", "banner", "st", "pierre", "miquelon"]
      case .flagStVincentGrenadines:
         [
            "flag", "st", "vincent", "grenadines", "saint", "vincent", "grenadines", "flag", "nation", "country", "banner", "st", "vincent",
            "grenadines",
         ]
      case .flagSudan: ["flag", "sudan", "sd", "flag", "nation", "country", "banner", "sudan"]
      case .flagSuriname: ["flag", "suriname", "sr", "flag", "nation", "country", "banner", "suriname"]
      case .flagSvalbardJanMayen: ["flag", "svalbard", "jan", "mayen"]
      case .flagSweden: ["flag", "sweden", "se", "flag", "nation", "country", "banner", "sweden"]
      case .flagSwitzerland: ["flag", "switzerland", "ch", "flag", "nation", "country", "banner", "switzerland"]
      case .flagSyria: ["flag", "syria", "syrian", "arab", "republic", "flag", "nation", "country", "banner", "syria"]
      case .flagTaiwan: ["flag", "taiwan", "tw", "flag", "nation", "country", "banner", "taiwan"]
      case .flagTajikistan: ["flag", "tajikistan", "tj", "flag", "nation", "country", "banner", "tajikistan"]
      case .flagTanzania: ["flag", "tanzania", "tanzania", "united", "republic", "flag", "nation", "country", "banner"]
      case .flagThailand: ["flag", "thailand", "th", "flag", "nation", "country", "banner", "thailand"]
      case .flagTimorLeste: ["flag", "timor", "leste", "timor", "leste", "flag", "nation", "country", "banner", "timor", "leste"]
      case .flagTogo: ["flag", "togo", "tg", "flag", "nation", "country", "banner", "togo"]
      case .flagTokelau: ["flag", "tokelau", "tk", "flag", "nation", "country", "banner", "tokelau"]
      case .flagTonga: ["flag", "tonga", "to", "flag", "nation", "country", "banner", "tonga"]
      case .flagTrinidadTobago: ["flag", "trinidad", "tobago", "trinidad", "tobago", "flag", "nation", "country", "banner", "trinidad", "tobago"]
      case .flagTristanDaCunha: ["flag", "tristan", "da", "cunha"]
      case .flagTunisia: ["flag", "tunisia", "tn", "flag", "nation", "country", "banner", "tunisia"]
      case .flagTurkey: ["flag", "turkey", "turkey", "flag", "nation", "country", "banner"]
      case .flagTurkmenistan: ["flag", "turkmenistan", "flag", "nation", "country", "banner", "turkmenistan"]
      case .flagTurksCaicosIslands:
         ["flag", "turks", "caicos", "islands", "turks", "caicos", "islands", "flag", "nation", "country", "banner", "turks", "caicos", "islands"]
      case .flagTuvalu: ["flag", "tuvalu", "flag", "nation", "country", "banner", "tuvalu"]
      case .flagUSOutlyingIslands: ["flag", "u", "s", "outlying", "islands"]
      case .flagUSVirginIslands:
         ["flag", "u", "s", "virgin", "islands", "virgin", "islands", "us", "flag", "nation", "country", "banner", "u", "s", "virgin", "islands"]
      case .flagUganda: ["flag", "uganda", "ug", "flag", "nation", "country", "banner", "uganda"]
      case .flagUkraine: ["flag", "ukraine", "ua", "flag", "nation", "country", "banner", "ukraine"]
      case .flagUnitedArabEmirates:
         ["flag", "united", "arab", "emirates", "united", "arab", "emirates", "flag", "nation", "country", "banner", "united", "arab", "emirates"]
      case .flagUnitedKingdom:
         [
            "flag", "united", "kingdom", "united", "kingdom", "great", "britain", "northern", "ireland", "flag", "nation", "country", "banner",
            "british", "UK", "english", "england", "union", "jack", "united", "kingdom",
         ]
      case .flagUnitedNations: ["flag", "united", "nations", "un", "flag", "banner"]
      case .flagUnitedStates: ["flag", "united", "states", "united", "states", "america", "flag", "nation", "country", "banner", "united", "states"]
      case .flagUruguay: ["flag", "uruguay", "uy", "flag", "nation", "country", "banner", "uruguay"]
      case .flagUzbekistan: ["flag", "uzbekistan", "uz", "flag", "nation", "country", "banner", "uzbekistan"]
      case .flagVanuatu: ["flag", "vanuatu", "vu", "flag", "nation", "country", "banner", "vanuatu"]
      case .flagVaticanCity: ["flag", "vatican", "city", "vatican", "city", "flag", "nation", "country", "banner", "vatican", "city"]
      case .flagVenezuela: ["flag", "venezuela", "ve", "bolivarian", "republic", "flag", "nation", "country", "banner", "venezuela"]
      case .flagVietnam: ["flag", "vietnam", "viet", "nam", "flag", "nation", "country", "banner", "vietnam"]
      case .flagWales: ["flag", "wales", "flag", "welsh"]
      case .flagWallisFutuna: ["flag", "wallis", "futuna", "wallis", "futuna", "flag", "nation", "country", "banner", "wallis", "futuna"]
      case .flagWesternSahara: ["flag", "western", "sahara", "western", "sahara", "flag", "nation", "country", "banner", "western", "sahara"]
      case .flagYemen: ["flag", "yemen", "ye", "flag", "nation", "country", "banner", "yemen"]
      case .flagZambia: ["flag", "zambia", "zm", "flag", "nation", "country", "banner", "zambia"]
      case .flagZimbabwe: ["flag", "zimbabwe", "zw", "flag", "nation", "country", "banner", "zimbabwe"]
      case .flamingo: ["flamingo", "animal"]
      case .flashlight: ["flashlight", "dark", "camping", "sight", "night"]
      case .flatShoe: ["flat", "shoe", "ballet", "slip-on", "slipper"]
      case .flatbread: ["flatbread", "flour", "food", "bakery"]
      case .fleurDeLis: ["fleur", "de", "lis", "decorative", "scout"]
      case .flexedBiceps: ["flexed", "biceps", "arm", "flex", "hand", "summer", "strong", "biceps"]
      case .floppyDisk: ["floppy", "disk", "oldschool", "technology", "save", "90s", "80s"]
      case .flowerPlayingCards: ["flower", "playing", "cards", "game", "sunset", "red"]
      case .flushedFace: ["flushed", "face", "face", "blush", "shy", "flattered"]
      case .flute: ["flute", "bamboo", "music", "instrument", "pied", "piper"]
      case .fly: ["fly", "insect"]
      case .flyingDisc: ["flying", "disc", "sports", "frisbee", "ultimate"]
      case .flyingSaucer: ["flying", "saucer", "transportation", "vehicle", "ufo"]
      case .fog: ["fog", "weather"]
      case .foggy: ["foggy", "photo", "mountain"]
      case .foldedHands: ["folded", "hands", "please", "hope", "wish", "namaste", "highfive", "pray", "thank", "you", "thanks", "appreciate"]
      case .foldingHandFan: ["folding", "hand", "fan", "flamenco", "hot"]
      case .fondue: ["fondue", "cheese", "pot", "food"]
      case .foot: ["foot", "kick", "stomp"]
      case .footprints: ["footprints", "feet", "tracking", "walking", "beach"]
      case .forkAndKnife: ["fork", "and", "knife", "cutlery", "kitchen"]
      case .forkAndKnifeWithPlate: ["fork", "and", "knife", "with", "plate", "food", "eat", "meal", "lunch", "dinner", "restaurant"]
      case .fortuneCookie: ["fortune", "cookie", "food", "prophecy", "dessert"]
      case .fountain: ["fountain", "photo", "summer", "water", "fresh"]
      case .fountainPen: ["fountain", "pen", "stationery", "writing", "write"]
      case .fourLeafClover: ["four", "leaf", "clover", "vegetable", "plant", "nature", "lucky", "irish"]
      case .fourOClock: ["four", "o", "clock", "4", "4:00", "400", "16:00", "1600", "time", "late", "early", "schedule"]
      case .fourThirty: ["four", "thirty", "4:30", "430", "16:30", "1630", "time", "late", "early", "schedule"]
      case .fox: ["fox", "animal", "nature", "face"]
      case .framedPicture: ["framed", "picture", "photography"]
      case .freeButton: ["free", "button", "blue-square", "words"]
      case .frenchFries: ["french", "fries", "chips", "snack", "fast", "food", "potato"]
      case .friedShrimp: ["fried", "shrimp", "food", "animal", "appetizer", "summer"]
      case .frog: ["frog", "animal", "nature", "croak", "toad"]
      case .frontFacingBabyChick: ["front", "facing", "baby", "chick", "animal", "chicken", "baby", "bird"]
      case .frowningFace: ["frowning", "face", "face", "sad", "upset", "frown"]
      case .frowningFaceWithOpenMouth: ["frowning", "face", "with", "open", "mouth", "face", "aw", "what"]
      case .fuelPump: ["fuel", "pump", "gas", "station", "petroleum"]
      case .fullMoon: ["full", "moon", "nature", "yellow", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .fullMoonFace: ["full", "moon", "face", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .funeralUrn: ["funeral", "urn", "dead", "die", "death", "rip", "ashes"]
      case .gameDie: ["game", "die", "dice", "random", "tabletop", "play", "luck"]
      case .garlic: ["garlic", "food", "spice", "cook"]
      case .gear: ["gear", "cog"]
      case .gemStone: ["gem", "stone", "blue", "ruby", "diamond", "jewelry"]
      case .gemini: ["gemini", "sign", "zodiac", "purple-square", "astrology"]
      case .genie: ["genie", "magical", "wishes"]
      case .ghost: ["ghost", "halloween", "spooky", "scary"]
      case .gingerRoot: ["ginger", "root", "spice", "yellow", "cooking", "gingerbread"]
      case .giraffe: ["giraffe", "animal", "nature", "spots", "safari"]
      case .girl: ["girl", "female", "woman", "teenager"]
      case .glassOfMilk: ["glass", "of", "milk", "beverage", "drink", "cow"]
      case .glasses: ["glasses", "fashion", "accessories", "eyesight", "nerdy", "dork", "geek"]
      case .globeShowingAmericas: ["globe", "showing", "americas", "globe", "world", "USA", "earth", "international"]
      case .globeShowingAsiaAustralia: ["globe", "showing", "asia", "australia", "globe", "world", "east", "earth", "international"]
      case .globeShowingEuropeAfrica: ["globe", "showing", "europe", "africa", "globe", "world", "earth", "international"]
      case .globeWithMeridians: ["globe", "with", "meridians", "earth", "international", "world", "internet", "interweb", "i18n"]
      case .gloves: ["gloves", "hands", "winter", "clothes"]
      case .glowingStar: ["glowing", "star", "night", "sparkle", "awesome", "good", "magic"]
      case .goalNet: ["goal", "net", "sports"]
      case .goat: ["goat", "animal", "nature"]
      case .goblin: ["goblin", "red", "evil", "mask", "monster", "scary", "creepy", "japanese", "goblin"]
      case .goggles: ["goggles", "eyes", "protection", "safety"]
      case .goose: ["goose", "silly", "jemima", "goosebumps"]
      case .gorilla: ["gorilla", "animal", "nature", "circus"]
      case .graduationCap:
         ["graduation", "cap", "school", "college", "degree", "university", "graduation", "cap", "hat", "legal", "learn", "education"]
      case .grapes: ["grapes", "fruit", "food", "wine"]
      case .greenApple: ["green", "apple", "fruit", "nature"]
      case .greenBook: ["green", "book", "read", "library", "knowledge", "study"]
      case .greenCircle: ["green", "circle", "round"]
      case .greenHeart: ["green", "heart", "love", "like", "affection", "valentines"]
      case .greenSalad: ["green", "salad", "food", "healthy", "lettuce", "vegetable"]
      case .greenSquare: ["green", "square"]
      case .greyHeart: ["grey", "heart", "silver", "monochrome"]
      case .grimacingFace: ["grimacing", "face", "face", "grimace", "teeth"]
      case .grinningCat: ["grinning", "cat", "animal", "cats", "happy", "smile"]
      case .grinningCatWithSmilingEyes: ["grinning", "cat", "with", "smiling", "eyes", "animal", "cats", "smile"]
      case .grinningFace: ["grinning", "face", "face", "smile", "happy", "joy", ":D", "grin"]
      case .grinningFaceWithBigEyes: ["grinning", "face", "with", "big", "eyes", "face", "happy", "joy", "haha", ":D", ":)", "smile", "funny"]
      case .grinningFaceWithSmilingEyes:
         ["grinning", "face", "with", "smiling", "eyes", "face", "happy", "joy", "funny", "haha", "laugh", "like", ":D", ":)", "smile"]
      case .grinningFaceWithSweat: ["grinning", "face", "with", "sweat", "face", "hot", "happy", "laugh", "sweat", "smile", "relief"]
      case .grinningSquintingFace: ["grinning", "squinting", "face", "happy", "joy", "lol", "satisfied", "haha", "face", "glad", "XD", "laugh"]
      case .growingHeart: ["growing", "heart", "like", "love", "affection", "valentines", "pink"]
      case .guard: ["guard", "protect"]
      case .guideDog: ["guide", "dog", "animal", "blind"]
      case .guitar: ["guitar", "music", "instrument"]
      case .hairPick: ["hair", "pick", "afro", "comb"]
      case .hamburger: ["hamburger", "meat", "fast", "food", "beef", "cheeseburger", "mcdonalds", "burger", "king"]
      case .hammer: ["hammer", "tools", "build", "create"]
      case .hammerAndPick: ["hammer", "and", "pick", "tools", "build", "create"]
      case .hammerAndWrench: ["hammer", "and", "wrench", "tools", "build", "create"]
      case .hamsa: ["hamsa", "religion", "protection"]
      case .hamster: ["hamster", "animal", "nature"]
      case .handWithFingersSplayed: ["hand", "with", "fingers", "splayed", "hand", "fingers", "palm"]
      case .handWithIndexFingerAndThumbCrossed: ["hand", "with", "index", "finger", "and", "thumb", "crossed", "heart", "love", "money", "expensive"]
      case .handbag: ["handbag", "fashion", "accessory", "accessories", "shopping"]
      case .handshake: ["handshake", "agreement", "shake"]
      case .hatchingChick: ["hatching", "chick", "animal", "chicken", "egg", "born", "baby", "bird"]
      case .headphone: ["headphone", "music", "score", "gadgets"]
      case .headstone: ["headstone", "death", "rip", "grave"]
      case .healthWorker: ["health", "worker", "hospital"]
      case .hearNoEvilMonkey: ["hear", "no", "evil", "monkey", "animal", "monkey", "nature"]
      case .heartDecoration: ["heart", "decoration", "purple-square", "love", "like"]
      case .heartExclamation: ["heart", "exclamation", "decoration", "love"]
      case .heartHands: ["heart", "hands", "love", "appreciation", "support"]
      case .heartOnFire: ["heart", "on", "fire", "passionate", "enthusiastic"]
      case .heartSuit: ["heart", "suit", "poker", "cards", "magic", "suits"]
      case .heartWithArrow: ["heart", "with", "arrow", "love", "like", "heart", "affection", "valentines"]
      case .heartWithRibbon: ["heart", "with", "ribbon", "love", "valentines"]
      case .heavyDollarSign: ["heavy", "dollar", "sign", "money", "sales", "payment", "currency", "buck"]
      case .heavyEqualsSign: ["heavy", "equals", "sign", "math"]
      case .hedgehog: ["hedgehog", "animal", "nature", "spiny"]
      case .helicopter: ["helicopter", "transportation", "vehicle", "fly"]
      case .herb: ["herb", "vegetable", "plant", "medicine", "weed", "grass", "lawn"]
      case .hibiscus: ["hibiscus", "plant", "vegetable", "flowers", "beach"]
      case .highHeeledShoe: ["high", "heeled", "shoe", "fashion", "shoes", "female", "pumps", "stiletto"]
      case .highSpeedTrain: ["high", "speed", "train", "transportation", "vehicle"]
      case .highVoltage: ["high", "voltage", "thunder", "weather", "lightning", "bolt", "fast", "zap"]
      case .hikingBoot: ["hiking", "boot", "backpacking", "camping", "hiking"]
      case .hinduTemple: ["hindu", "temple", "religion"]
      case .hippopotamus: ["hippopotamus", "animal", "nature"]
      case .hole: ["hole", "embarrassing"]
      case .hollowRedCircle: ["hollow", "red", "circle", "circle", "round"]
      case .honeyPot: ["honey", "pot", "bees", "sweet", "kitchen"]
      case .honeybee: ["honeybee", "animal", "insect", "nature", "bug", "spring", "honey"]
      case .hook: ["hook", "tools"]
      case .horizontalTrafficLight: ["horizontal", "traffic", "light", "transportation", "signal"]
      case .horse: ["horse", "animal", "gamble", "luck"]
      case .horseFace: ["horse", "face", "animal", "brown", "nature"]
      case .horseRacing: ["horse", "racing", "animal", "betting", "competition", "gambling", "luck"]
      case .hospital: ["hospital", "building", "health", "surgery", "doctor"]
      case .hotBeverage: ["hot", "beverage", "beverage", "caffeine", "latte", "espresso", "coffee", "mug"]
      case .hotDog: ["hot", "dog", "food", "frankfurter", "america"]
      case .hotFace: ["hot", "face", "face", "feverish", "heat", "red", "sweating"]
      case .hotPepper: ["hot", "pepper", "food", "spicy", "chilli", "chili"]
      case .hotSprings: ["hot", "springs", "bath", "warm", "relax"]
      case .hotel: ["hotel", "building", "accomodation", "checkin"]
      case .hourglassDone: ["hourglass", "done", "time", "clock", "oldschool", "limit", "exam", "quiz", "test"]
      case .hourglassNotDone: ["hourglass", "not", "done", "oldschool", "time", "countdown"]
      case .house: ["house", "building", "home"]
      case .houseWithGarden: ["house", "with", "garden", "home", "plant", "nature"]
      case .houses: ["houses", "buildings", "photo"]
      case .huggingFace: ["hugging", "face", "face", "smile", "hug"]
      case .hundredPoints: ["hundred", "points", "score", "perfect", "numbers", "century", "exam", "quiz", "test", "pass", "hundred", "100"]
      case .hushedFace: ["hushed", "face", "face", "woo", "shh"]
      case .hut: ["hut", "house", "structure"]
      case .hyacinth: ["hyacinth", "flower", "lavender"]
      case .ice: ["ice", "water", "cold"]
      case .iceCream: ["ice", "cream", "food", "hot", "dessert"]
      case .iceHockey: ["ice", "hockey", "sports"]
      case .iceSkate: ["ice", "skate", "sports"]
      case .idButton: ["id", "button", "purple-square", "words"]
      case .identificationCard: ["identification", "card", "document"]
      case .inboxTray: ["inbox", "tray", "email", "documents"]
      case .incomingEnvelope: ["incoming", "envelope", "email", "inbox"]
      case .indexPointingAtTheViewer: ["index", "pointing", "at", "the", "viewer", "you", "recruit"]
      case .indexPointingUp: ["index", "pointing", "up", "hand", "fingers", "direction", "up"]
      case .infinity: ["infinity", "forever"]
      case .information: ["information", "blue-square", "alphabet", "letter"]
      case .inputLatinLetters: ["input", "latin", "letters", "blue-square", "alphabet"]
      case .inputLatinLowercase: ["input", "latin", "lowercase", "blue-square", "letters", "lowercase", "alphabet"]
      case .inputLatinUppercase: ["input", "latin", "uppercase", "alphabet", "words", "letters", "uppercase", "blue-square"]
      case .inputNumbers: ["input", "numbers", "numbers", "blue-square", "1234", "1", "2", "3", "4"]
      case .inputSymbols: ["input", "symbols", "blue-square", "music", "note", "ampersand", "percent", "glyphs", "characters"]
      case .jackOLantern: ["jack", "o", "lantern", "halloween", "light", "pumpkin", "creepy", "fall"]
      case .japaneseAcceptableButton: ["japanese", "acceptable", "button", "ok", "good", "chinese", "kanji", "agree", "yes", "orange-circle"]
      case .japaneseApplicationButton: ["japanese", "application", "button", "chinese", "japanese", "kanji", "orange-square"]
      case .japaneseBargainButton: ["japanese", "bargain", "button", "chinese", "kanji", "obtain", "get", "circle"]
      case .japaneseCastle: ["japanese", "castle", "photo", "building"]
      case .japaneseCongratulationsButton: ["japanese", "congratulations", "button", "chinese", "kanji", "japanese", "red-circle"]
      case .japaneseDiscountButton: ["japanese", "discount", "button", "cut", "divide", "chinese", "kanji", "pink-square"]
      case .japaneseDolls: ["japanese", "dolls", "japanese", "toy", "kimono"]
      case .japaneseFreeOfChargeButton: ["japanese", "free", "of", "charge", "button", "nothing", "chinese", "kanji", "japanese", "orange-square"]
      case .japaneseHereButton: ["japanese", "here", "button", "blue-square", "here", "katakana", "japanese", "destination"]
      case .japaneseMonthlyAmountButton:
         ["japanese", "monthly", "amount", "button", "chinese", "month", "moon", "japanese", "orange-square", "kanji"]
      case .japaneseNoVacancyButton: ["japanese", "no", "vacancy", "button", "full", "chinese", "japanese", "red-square", "kanji"]
      case .japaneseNotFreeOfChargeButton: ["japanese", "not", "free", "of", "charge", "button", "orange-square", "chinese", "have", "kanji"]
      case .japaneseOpenForBusinessButton: ["japanese", "open", "for", "business", "button", "japanese", "opening", "hours", "orange-square"]
      case .japanesePassingGradeButton: ["japanese", "passing", "grade", "button", "japanese", "chinese", "join", "kanji", "red-square"]
      case .japanesePostOffice: ["japanese", "post", "office", "building", "envelope", "communication"]
      case .japaneseProhibitedButton:
         ["japanese", "prohibited", "button", "kanji", "japanese", "chinese", "forbidden", "limit", "restricted", "red-square"]
      case .japaneseReservedButton: ["japanese", "reserved", "button", "chinese", "point", "green-square", "kanji"]
      case .japaneseSecretButton: ["japanese", "secret", "button", "privacy", "chinese", "sshh", "kanji", "red-circle"]
      case .japaneseServiceChargeButton: ["japanese", "service", "charge", "button", "japanese", "blue-square", "katakana"]
      case .japaneseSymbolForBeginner: ["japanese", "symbol", "for", "beginner", "badge", "shield"]
      case .japaneseVacancyButton: ["japanese", "vacancy", "button", "kanji", "japanese", "chinese", "empty", "sky", "blue-square"]
      case .jar: ["jar", "container", "sauce"]
      case .jeans: ["jeans", "fashion", "shopping"]
      case .jellyfish: ["jellyfish", "sting", "tentacles"]
      case .joker: ["joker", "poker", "cards", "game", "play", "magic"]
      case .joystick: ["joystick", "game", "play"]
      case .judge: ["judge", "law"]
      case .kaaba: ["kaaba", "mecca", "mosque", "islam"]
      case .kangaroo: ["kangaroo", "animal", "nature", "australia", "joey", "hop", "marsupial"]
      case .key: ["key", "lock", "door", "password"]
      case .keyboard: ["keyboard", "technology", "computer", "type", "input", "text"]
      case .keycapStar: ["keycap", "star", "keycap"]
      case .keycapSymbol: ["keycap", "symbol", "blue-square", "twitter"]
      case .keycap0: ["keycap", "0", "0", "numbers", "blue-square", "null", "zero"]
      case .keycap1: ["keycap", "1", "blue-square", "numbers", "1", "one"]
      case .keycap10: ["keycap", "10", "numbers", "10", "blue-square", "ten"]
      case .keycap2: ["keycap", "2", "numbers", "2", "prime", "blue-square", "two"]
      case .keycap3: ["keycap", "3", "3", "numbers", "prime", "blue-square", "three"]
      case .keycap4: ["keycap", "4", "4", "numbers", "blue-square", "four"]
      case .keycap5: ["keycap", "5", "5", "numbers", "blue-square", "prime", "five"]
      case .keycap6: ["keycap", "6", "6", "numbers", "blue-square", "six"]
      case .keycap7: ["keycap", "7", "7", "numbers", "blue-square", "prime", "seven"]
      case .keycap8: ["keycap", "8", "8", "blue-square", "numbers", "eight"]
      case .keycap9: ["keycap", "9", "blue-square", "numbers", "9", "nine"]
      case .khanda: ["khanda", "Sikhism", "religion"]
      case .kickScooter: ["kick", "scooter", "vehicle", "kick", "razor"]
      case .kimono: ["kimono", "dress", "fashion", "women", "female", "japanese"]
      case .kiss: ["kiss", "pair", "valentines", "love", "like", "dating", "marriage"]
      case .kissManMan: ["kiss", "man", "man", "pair", "valentines", "love", "like", "dating", "marriage"]
      case .kissMark: ["kiss", "mark", "face", "lips", "love", "like", "affection", "valentines"]
      case .kissWomanMan: ["kiss", "woman", "man", "love"]
      case .kissWomanWoman: ["kiss", "woman", "woman", "pair", "valentines", "love", "like", "dating", "marriage"]
      case .kissingCat: ["kissing", "cat", "animal", "cats", "kiss"]
      case .kissingFace: ["kissing", "face", "love", "like", "face", "3", "valentines", "infatuation", "kiss"]
      case .kissingFaceWithClosedEyes:
         ["kissing", "face", "with", "closed", "eyes", "face", "love", "like", "affection", "valentines", "infatuation", "kiss"]
      case .kissingFaceWithSmilingEyes: ["kissing", "face", "with", "smiling", "eyes", "face", "affection", "valentines", "infatuation", "kiss"]
      case .kitchenKnife: ["kitchen", "knife", "knife", "blade", "cutlery", "kitchen", "weapon"]
      case .kite: ["kite", "wind", "fly"]
      case .kiwiFruit: ["kiwi", "fruit", "fruit", "food"]
      case .knot: ["knot", "rope", "scout"]
      case .koala: ["koala", "animal", "nature"]
      case .labCoat: ["lab", "coat", "doctor", "experiment", "scientist", "chemist"]
      case .label: ["label", "sale", "tag"]
      case .lacrosse: ["lacrosse", "sports", "ball", "stick"]
      case .ladder: ["ladder", "tools"]
      case .ladyBeetle: ["lady", "beetle", "animal", "insect", "nature", "ladybug"]
      case .laptop: ["laptop", "technology", "screen", "display", "monitor"]
      case .largeBlueDiamond: ["large", "blue", "diamond", "shape", "jewel", "gem"]
      case .largeOrangeDiamond: ["large", "orange", "diamond", "shape", "jewel", "gem"]
      case .lastQuarterMoon: ["last", "quarter", "moon", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .lastQuarterMoonFace: ["last", "quarter", "moon", "face", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .lastTrackButton: ["last", "track", "button", "backward"]
      case .latinCross: ["latin", "cross", "christianity"]
      case .leafFlutteringInWind: ["leaf", "fluttering", "in", "wind", "nature", "plant", "tree", "vegetable", "grass", "lawn", "spring"]
      case .leafyGreen: ["leafy", "green", "food", "vegetable", "plant", "bok", "choy", "cabbage", "kale", "lettuce"]
      case .ledger: ["ledger", "notes", "paper"]
      case .leftArrow: ["left", "arrow", "blue-square", "previous", "back"]
      case .leftArrowCurvingRight: ["left", "arrow", "curving", "right", "blue-square", "return", "rotate", "direction"]
      case .leftFacingFist: ["left", "facing", "fist", "hand", "fistbump"]
      case .leftLuggage: ["left", "luggage", "blue-square", "travel"]
      case .leftRightArrow: ["left", "right", "arrow", "shape", "direction", "horizontal", "sideways"]
      case .leftSpeechBubble: ["left", "speech", "bubble", "words", "message", "talk", "chatting"]
      case .leftwardsHand: ["leftwards", "hand", "palm", "offer"]
      case .leftwardsPushingHand: ["leftwards", "pushing", "hand", "highfive", "pressing", "stop"]
      case .leg: ["leg", "kick", "limb"]
      case .lemon: ["lemon", "fruit", "nature"]
      case .leo: ["leo", "sign", "purple-square", "zodiac", "astrology"]
      case .leopard: ["leopard", "animal", "nature"]
      case .levelSlider: ["level", "slider", "scale"]
      case .libra: ["libra", "sign", "purple-square", "zodiac", "astrology"]
      case .lightBlueHeart: ["light", "blue", "heart", "ice", "baby", "blue"]
      case .lightBulb: ["light", "bulb", "light", "electricity", "idea"]
      case .lightRail: ["light", "rail", "transportation", "vehicle"]
      case .link: ["link", "rings", "url"]
      case .linkedPaperclips: ["linked", "paperclips", "documents", "stationery"]
      case .lion: ["lion", "animal", "nature"]
      case .lipstick: ["lipstick", "female", "girl", "fashion", "woman"]
      case .litterInBinSign: ["litter", "in", "bin", "sign", "blue-square", "sign", "human", "info"]
      case .lizard: ["lizard", "animal", "nature", "reptile"]
      case .llama: ["llama", "animal", "nature", "alpaca"]
      case .lobster: ["lobster", "animal", "nature", "bisque", "claws", "seafood"]
      case .locked: ["locked", "security", "password", "padlock"]
      case .lockedWithKey: ["locked", "with", "key", "security", "privacy"]
      case .lockedWithPen: ["locked", "with", "pen", "security", "secret"]
      case .locomotive: ["locomotive", "transportation", "vehicle", "train"]
      case .lollipop: ["lollipop", "food", "snack", "candy", "sweet"]
      case .longDrum: ["long", "drum", "music"]
      case .lotionBottle: ["lotion", "bottle", "moisturizer", "sunscreen"]
      case .lotus: ["lotus", "flower", "calm", "meditation"]
      case .loudlyCryingFace: ["loudly", "crying", "face", "sobbing", "face", "cry", "tears", "sad", "upset", "depressed"]
      case .loudspeaker: ["loudspeaker", "volume", "sound"]
      case .loveHotel: ["love", "hotel", "like", "affection", "dating"]
      case .loveLetter: ["love", "letter", "email", "like", "affection", "envelope", "valentines"]
      case .loveYouGesture: ["love", "you", "gesture", "hand", "fingers", "gesture"]
      case .lowBattery: ["low", "battery", "drained", "dead"]
      case .luggage: ["luggage", "packing", "travel"]
      case .lungs: ["lungs", "breathe"]
      case .lyingFace: ["lying", "face", "face", "lie", "pinocchio"]
      case .mage: ["mage", "magic"]
      case .magicWand: ["magic", "wand", "supernature", "power"]
      case .magnet: ["magnet", "attraction", "magnetic"]
      case .magnifyingGlassTiltedLeft: ["magnifying", "glass", "tilted", "left", "search", "zoom", "find", "detective"]
      case .magnifyingGlassTiltedRight: ["magnifying", "glass", "tilted", "right", "search", "zoom", "find", "detective"]
      case .mahjongRedDragon: ["mahjong", "red", "dragon", "game", "play", "chinese", "kanji"]
      case .maleSign: ["male", "sign", "man", "boy", "men"]
      case .mammoth: ["mammoth", "elephant", "tusks"]
      case .man: ["man", "mustache", "father", "dad", "guy", "classy", "sir", "moustache"]
      case .manArtist: ["man", "artist", "painter", "man", "human"]
      case .manAstronaut: ["man", "astronaut", "space", "rocket", "man", "human"]
      case .manBald: ["man", "bald", "hairless"]
      case .manBeard: ["man", "beard", "person", "bewhiskered", "facial", "hair"]
      case .manBiking: ["man", "biking", "bicycle", "bike", "cyclist", "sports", "exercise", "hipster"]
      case .manBlondHair: ["man", "blond", "hair", "man", "male", "boy", "blonde", "guy", "person"]
      case .manBouncingBall: ["man", "bouncing", "ball", "sport"]
      case .manBowing: ["man", "bowing", "man", "male", "boy"]
      case .manCartwheeling: ["man", "cartwheeling", "gymnastics"]
      case .manClimbing: ["man", "climbing", "sports", "hobby", "man", "male", "rock"]
      case .manConstructionWorker: ["man", "construction", "worker", "male", "human", "wip", "guy", "build", "construction", "worker", "labor"]
      case .manCook: ["man", "cook", "chef", "man", "human"]
      case .manCurlyHair: ["man", "curly", "hair", "hairstyle"]
      case .manDancing: ["man", "dancing", "male", "boy", "fun", "dancer"]
      case .manDetective: ["man", "detective", "crime"]
      case .manElf: ["man", "elf", "man", "male"]
      case .manFacepalming: ["man", "facepalming", "man", "male", "boy", "disbelief"]
      case .manFactoryWorker: ["man", "factory", "worker", "assembly", "industrial", "man", "human"]
      case .manFairy: ["man", "fairy", "man", "male"]
      case .manFarmer: ["man", "farmer", "rancher", "gardener", "man", "human"]
      case .manFeedingBaby: ["man", "feeding", "baby", "birth", "food"]
      case .manFirefighter: ["man", "firefighter", "fireman", "man", "human"]
      case .manFrowning: ["man", "frowning", "male", "boy", "man", "sad", "depressed", "discouraged", "unhappy"]
      case .manGenie: ["man", "genie", "man", "male"]
      case .manGesturingNo: ["man", "gesturing", "no", "male", "boy", "man", "nope"]
      case .manGesturingOk: ["man", "gesturing", "ok", "men", "boy", "male", "blue", "human", "man"]
      case .manGettingHaircut: ["man", "getting", "haircut", "male", "boy", "man"]
      case .manGettingMassage: ["man", "getting", "massage", "male", "boy", "man", "head"]
      case .manGolfing: ["man", "golfing", "sport"]
      case .manGuard: ["man", "guard", "uk", "gb", "british", "male", "guy", "royal"]
      case .manHealthWorker: ["man", "health", "worker", "doctor", "nurse", "therapist", "healthcare", "man", "human"]
      case .manInLotusPosition: ["man", "in", "lotus", "position", "man", "male", "meditation", "yoga", "serenity", "zen", "mindfulness"]
      case .manInManualWheelchair: ["man", "in", "manual", "wheelchair", "disability", "accessibility"]
      case .manInMotorizedWheelchair: ["man", "in", "motorized", "wheelchair", "disability", "accessibility"]
      case .manInSteamyRoom: ["man", "in", "steamy", "room", "male", "man", "spa", "steamroom", "sauna"]
      case .manInSuitLevitating: ["man", "in", "suit", "levitating", "suit", "business", "levitate", "hover", "jump"]
      case .manInTuxedo: ["man", "in", "tuxedo", "couple", "marriage", "wedding", "groom", "formal", "fashion"]
      case .manJudge: ["man", "judge", "justice", "court", "man", "human"]
      case .manJuggling: ["man", "juggling", "juggle", "balance", "skill", "multitask"]
      case .manKneeling: ["man", "kneeling", "pray", "respectful"]
      case .manLiftingWeights: ["man", "lifting", "weights", "sport"]
      case .manMage: ["man", "mage", "man", "male", "mage", "sorcerer"]
      case .manMechanic: ["man", "mechanic", "plumber", "man", "human", "wrench"]
      case .manMountainBiking: ["man", "mountain", "biking", "bicycle", "bike", "cyclist", "transportation", "sports", "human", "race"]
      case .manOfficeWorker: ["man", "office", "worker", "business", "manager", "man", "human"]
      case .manPilot: ["man", "pilot", "aviator", "plane", "man", "human"]
      case .manPlayingHandball: ["man", "playing", "handball", "sports"]
      case .manPlayingWaterPolo: ["man", "playing", "water", "polo", "sports", "pool"]
      case .manPoliceOfficer: ["man", "police", "officer", "man", "police", "law", "legal", "enforcement", "arrest", "911"]
      case .manPouting: ["man", "pouting", "male", "boy", "man"]
      case .manRaisingHand: ["man", "raising", "hand", "male", "boy", "man"]
      case .manRedHair: ["man", "red", "hair", "hairstyle"]
      case .manRowingBoat: ["man", "rowing", "boat", "sports", "hobby", "water", "ship"]
      case .manRunning: ["man", "running", "man", "walking", "exercise", "race", "running"]
      case .manSShoe: ["man", "s", "shoe", "fashion", "male"]
      case .manScientist: ["man", "scientist", "biologist", "chemist", "engineer", "physicist", "man", "human"]
      case .manShrugging: ["man", "shrugging", "man", "male", "boy", "confused", "indifferent", "doubt"]
      case .manSinger: ["man", "singer", "rockstar", "entertainer", "man", "human"]
      case .manStanding: ["man", "standing", "still"]
      case .manStudent: ["man", "student", "graduate", "man", "human"]
      case .manSuperhero: ["man", "superhero", "man", "male", "good", "hero", "superpowers"]
      case .manSupervillain: ["man", "supervillain", "man", "male", "evil", "bad", "criminal", "hero", "superpowers"]
      case .manSurfing: ["man", "surfing", "sports", "ocean", "sea", "summer", "beach"]
      case .manSwimming: ["man", "swimming", "sports", "exercise", "human", "athlete", "water", "summer"]
      case .manTeacher: ["man", "teacher", "instructor", "professor", "man", "human"]
      case .manTechnologist:
         ["man", "technologist", "coder", "developer", "engineer", "programmer", "software", "man", "human", "laptop", "computer"]
      case .manTippingHand: ["man", "tipping", "hand", "male", "boy", "man", "human", "information"]
      case .manVampire: ["man", "vampire", "man", "male", "dracula"]
      case .manWalking: ["man", "walking", "human", "feet", "steps"]
      case .manWearingTurban: ["man", "wearing", "turban", "male", "indian", "hinduism", "arabs"]
      case .manWhiteHair: ["man", "white", "hair", "old", "elder"]
      case .manWithProbingCane: ["man", "with", "probing", "cane", "blind"]
      case .manWithSkullcap: ["man", "with", "skullcap", "male", "boy", "chinese"]
      case .manWithVeil: ["man", "with", "veil", "wedding", "marriage"]
      case .manZombie: ["man", "zombie", "man", "male", "dracula", "undead", "walking", "dead"]
      case .mango: ["mango", "fruit", "food", "tropical"]
      case .mantelpieceClock: ["mantelpiece", "clock", "time"]
      case .manualWheelchair: ["manual", "wheelchair", "accessibility"]
      case .mapOfJapan: ["map", "of", "japan", "nation", "country", "japanese", "asia"]
      case .mapleLeaf: ["maple", "leaf", "nature", "plant", "vegetable", "ca", "fall"]
      case .maracas: ["maracas", "music", "instrument", "percussion"]
      case .martialArtsUniform: ["martial", "arts", "uniform", "judo", "karate", "taekwondo"]
      case .mate: ["mate", "drink", "tea", "beverage"]
      case .meatOnBone: ["meat", "on", "bone", "good", "food", "drumstick"]
      case .mechanic: ["mechanic", "worker", "technician"]
      case .mechanicalArm: ["mechanical", "arm", "accessibility"]
      case .mechanicalLeg: ["mechanical", "leg", "accessibility"]
      case .medicalSymbol: ["medical", "symbol", "health", "hospital"]
      case .megaphone: ["megaphone", "sound", "speaker", "volume"]
      case .melon: ["melon", "fruit", "nature", "food"]
      case .meltingFace: ["melting", "face", "hot", "heat"]
      case .memo: ["memo", "write", "documents", "stationery", "pencil", "paper", "writing", "legal", "exam", "quiz", "test", "study", "compose"]
      case .menHoldingHands: ["men", "holding", "hands", "pair", "couple", "love", "like", "bromance", "friendship", "people", "human"]
      case .menSRoom: ["men", "s", "room", "toilet", "restroom", "wc", "blue-square", "gender", "male"]
      case .menWithBunnyEars: ["men", "with", "bunny", "ears", "male", "bunny", "men", "boys"]
      case .menWrestling: ["men", "wrestling", "sports", "wrestlers"]
      case .mendingHeart: ["mending", "heart", "broken", "heart", "bandage", "wounded"]
      case .menorah: ["menorah", "hanukkah", "candles", "jewish"]
      case .mermaid: ["mermaid", "woman", "female", "merwoman", "ariel"]
      case .merman: ["merman", "man", "male", "triton"]
      case .merperson: ["merperson", "sea"]
      case .metro: ["metro", "transportation", "blue-square", "mrt", "underground", "tube"]
      case .microbe: ["microbe", "amoeba", "bacteria", "germs", "virus", "covid"]
      case .microphone: ["microphone", "sound", "music", "PA", "sing", "talkshow"]
      case .microscope: ["microscope", "laboratory", "experiment", "zoomin", "science", "study"]
      case .middleFinger: ["middle", "finger", "hand", "fingers", "rude", "middle", "flipping"]
      case .militaryHelmet: ["military", "helmet", "army", "protection"]
      case .militaryMedal: ["military", "medal", "award", "winning", "army"]
      case .milkyWay: ["milky", "way", "photo", "space", "stars"]
      case .minibus: ["minibus", "vehicle", "car", "transportation"]
      case .minusSign: ["minus", "sign", "math", "calculation", "subtract", "less"]
      case .mirror: ["mirror", "reflection"]
      case .mirrorBall: ["mirror", "ball", "disco", "dance", "party"]
      case .moai: ["moai", "rock", "easter", "island"]
      case .mobilePhone: ["mobile", "phone", "technology", "apple", "gadgets", "dial"]
      case .mobilePhoneOff: ["mobile", "phone", "off", "mute", "orange-square", "silence", "quiet"]
      case .mobilePhoneWithArrow: ["mobile", "phone", "with", "arrow", "iphone", "incoming"]
      case .moneyBag: ["money", "bag", "dollar", "payment", "coins", "sale"]
      case .moneyMouthFace: ["money", "mouth", "face", "face", "rich", "dollar", "money"]
      case .moneyWithWings: ["money", "with", "wings", "dollar", "bills", "payment", "sale"]
      case .monkey: ["monkey", "animal", "nature", "banana", "circus"]
      case .monkeyFace: ["monkey", "face", "animal", "nature", "circus"]
      case .monorail: ["monorail", "transportation", "vehicle"]
      case .moonCake: ["moon", "cake", "food", "autumn", "dessert"]
      case .moonViewingCeremony: ["moon", "viewing", "ceremony", "photo", "japan", "asia", "tsukimi"]
      case .moose: ["moose", "shrek", "canada", "sweden", "sven", "cool"]
      case .mosque: ["mosque", "islam", "worship", "minaret"]
      case .mosquito: ["mosquito", "animal", "nature", "insect", "malaria"]
      case .motorBoat: ["motor", "boat", "ship"]
      case .motorScooter: ["motor", "scooter", "vehicle", "vespa", "sasha"]
      case .motorcycle: ["motorcycle", "race", "sports", "fast"]
      case .motorizedWheelchair: ["motorized", "wheelchair", "accessibility"]
      case .motorway: ["motorway", "road", "cupertino", "interstate", "highway"]
      case .mountFuji: ["mount", "fuji", "photo", "mountain", "nature", "japanese"]
      case .mountain: ["mountain", "photo", "nature", "environment"]
      case .mountainCableway: ["mountain", "cableway", "transportation", "vehicle", "ski"]
      case .mountainRailway: ["mountain", "railway", "transportation", "vehicle"]
      case .mouse: ["mouse", "animal", "nature", "rodent"]
      case .mouseFace: ["mouse", "face", "animal", "nature", "cheese", "wedge", "rodent"]
      case .mouseTrap: ["mouse", "trap", "cheese"]
      case .mouth: ["mouth", "kiss"]
      case .movieCamera: ["movie", "camera", "film", "record"]
      case .mrsClaus: ["mrs", "claus", "woman", "female", "xmas", "mother", "christmas"]
      case .multiplicationSign: ["multiplication", "sign", "math", "calculation"]
      case .mushroom: ["mushroom", "plant", "vegetable"]
      case .musicalKeyboard: ["musical", "keyboard", "piano", "instrument", "compose"]
      case .musicalNote: ["musical", "note", "score", "tone", "sound"]
      case .musicalNotes: ["musical", "notes", "music", "score"]
      case .musicalScore: ["musical", "score", "treble", "clef", "compose"]
      case .mutedSpeaker: ["muted", "speaker", "sound", "volume", "silence", "quiet"]
      case .mxClaus: ["mx", "claus", "christmas"]
      case .nailPolish: ["nail", "polish", "nail", "care", "beauty", "manicure", "finger", "fashion", "nail", "slay"]
      case .nameBadge: ["name", "badge", "fire", "forbid"]
      case .nationalPark: ["national", "park", "photo", "environment", "nature"]
      case .nauseatedFace: ["nauseated", "face", "face", "vomit", "gross", "green", "sick", "throw", "up", "ill"]
      case .nazarAmulet: ["nazar", "amulet", "bead", "charm"]
      case .necktie: ["necktie", "shirt", "suitup", "formal", "fashion", "cloth", "business"]
      case .nerdFace: ["nerd", "face", "face", "nerdy", "geek", "dork"]
      case .nestWithEggs: ["nest", "with", "eggs", "bird"]
      case .nestingDolls: ["nesting", "dolls", "matryoshka", "toy"]
      case .neutralFace: ["neutral", "face", "indifference", "meh", ":|", "neutral"]
      case .newButton: ["new", "button", "blue-square", "words", "start"]
      case .newMoon: ["new", "moon", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .newMoonFace: ["new", "moon", "face", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .newspaper: ["newspaper", "press", "headline"]
      case .nextTrackButton: ["next", "track", "button", "forward", "next", "blue-square"]
      case .ngButton: ["ng", "button", "blue-square", "words", "shape", "icon"]
      case .nightWithStars: ["night", "with", "stars", "evening", "city", "downtown"]
      case .nineOClock: ["nine", "o", "clock", "9", "9:00", "900", "21:00", "2100", "time", "late", "early", "schedule"]
      case .nineThirty: ["nine", "thirty", "9:30", "930", "21:30", "2130", "time", "late", "early", "schedule"]
      case .ninja: ["ninja", "ninjutsu", "skills", "japanese"]
      case .noBicycles: ["no", "bicycles", "no", "bikes", "bicycle", "bike", "cyclist", "prohibited", "circle"]
      case .noEntry: ["no", "entry", "limit", "security", "privacy", "bad", "denied", "stop", "circle"]
      case .noLittering: ["no", "littering", "trash", "bin", "garbage", "circle"]
      case .noMobilePhones: ["no", "mobile", "phones", "iphone", "mute", "circle"]
      case .noOneUnderEighteen: ["no", "one", "under", "eighteen", "18", "drink", "pub", "night", "minor", "circle"]
      case .noPedestrians: ["no", "pedestrians", "rules", "crossing", "walking", "circle"]
      case .noSmoking: ["no", "smoking", "cigarette", "blue-square", "smell", "smoke"]
      case .nonPotableWater: ["non", "potable", "water", "drink", "faucet", "tap", "circle"]
      case .nose: ["nose", "smell", "sniff"]
      case .notebook: ["notebook", "stationery", "record", "notes", "paper", "study"]
      case .notebookWithDecorativeCover: ["notebook", "with", "decorative", "cover", "classroom", "notes", "record", "paper", "study"]
      case .nutAndBolt: ["nut", "and", "bolt", "handy", "tools", "fix"]
      case .oButton: ["o", "button", "alphabet", "red-square", "letter"]
      case .octopus: ["octopus", "animal", "creature", "ocean", "sea", "nature", "beach"]
      case .oden: ["oden", "skewer", "food", "japanese"]
      case .officeBuilding: ["office", "building", "building", "bureau", "work"]
      case .officeWorker: ["office", "worker", "business"]
      case .ogre: ["ogre", "monster", "red", "mask", "halloween", "scary", "creepy", "devil", "demon", "japanese", "ogre"]
      case .oilDrum: ["oil", "drum", "barrell"]
      case .okButton: ["ok", "button", "good", "agree", "yes", "blue-square"]
      case .okHand: ["ok", "hand", "fingers", "limbs", "perfect", "ok", "okay"]
      case .oldKey: ["old", "key", "lock", "door", "password"]
      case .oldMan: ["old", "man", "human", "male", "men", "old", "elder", "senior"]
      case .oldWoman: ["old", "woman", "human", "female", "women", "lady", "old", "elder", "senior"]
      case .olderPerson: ["older", "person", "human", "elder", "senior", "gender-neutral"]
      case .olive: ["olive", "fruit"]
      case .om: ["om", "hinduism", "buddhism", "sikhism", "jainism"]
      case .onArrow: ["on", "arrow", "arrow", "words"]
      case .oncomingAutomobile: ["oncoming", "automobile", "car", "vehicle", "transportation"]
      case .oncomingBus: ["oncoming", "bus", "vehicle", "transportation"]
      case .oncomingFist: ["oncoming", "fist", "angry", "violence", "fist", "hit", "attack", "hand"]
      case .oncomingPoliceCar: ["oncoming", "police", "car", "vehicle", "law", "legal", "enforcement", "911"]
      case .oncomingTaxi: ["oncoming", "taxi", "vehicle", "cars", "uber"]
      case .oneOClock: ["one", "o", "clock", "1", "1:00", "100", "13:00", "1300", "time", "late", "early", "schedule"]
      case .onePieceSwimsuit: ["one", "piece", "swimsuit", "fashion"]
      case .oneThirty: ["one", "thirty", "1:30", "130", "13:30", "1330", "time", "late", "early", "schedule"]
      case .onion: ["onion", "cook", "food", "spice"]
      case .openBook: ["open", "book", "book", "read", "library", "knowledge", "literature", "learn", "study"]
      case .openFileFolder: ["open", "file", "folder", "documents", "load"]
      case .openHands: ["open", "hands", "fingers", "butterfly", "hands", "open"]
      case .openMailboxWithLoweredFlag: ["open", "mailbox", "with", "lowered", "flag", "email", "inbox"]
      case .openMailboxWithRaisedFlag: ["open", "mailbox", "with", "raised", "flag", "email", "inbox", "communication"]
      case .ophiuchus: ["ophiuchus", "sign", "purple-square", "constellation", "astrology"]
      case .opticalDisk: ["optical", "disk", "technology", "dvd", "disk", "disc", "90s"]
      case .orangeBook: ["orange", "book", "read", "library", "knowledge", "textbook", "study"]
      case .orangeCircle: ["orange", "circle", "round"]
      case .orangeHeart: ["orange", "heart", "love", "like", "affection", "valentines"]
      case .orangeSquare: ["orange", "square"]
      case .orangutan: ["orangutan", "animal"]
      case .orthodoxCross: ["orthodox", "cross", "suppedaneum", "religion"]
      case .otter: ["otter", "animal"]
      case .outboxTray: ["outbox", "tray", "inbox", "email"]
      case .owl: ["owl", "animal", "nature", "bird", "hoot"]
      case .ox: ["ox", "animal", "cow", "beef"]
      case .oyster: ["oyster", "food"]
      case .pButton: ["p", "button", "cars", "blue-square", "alphabet", "letter"]
      case .package: ["package", "mail", "gift", "cardboard", "box", "moving"]
      case .pageFacingUp: ["page", "facing", "up", "documents", "office", "paper", "information"]
      case .pageWithCurl: ["page", "with", "curl", "documents", "office", "paper"]
      case .pager: ["pager", "bbcall", "oldschool", "90s"]
      case .paintbrush: ["paintbrush", "drawing", "creativity", "art"]
      case .palmDownHand: ["palm", "down", "hand", "palm", "drop"]
      case .palmTree: ["palm", "tree", "plant", "vegetable", "nature", "summer", "beach", "mojito", "tropical"]
      case .palmUpHand: ["palm", "up", "hand", "lift", "offer", "demand"]
      case .palmsUpTogether: ["palms", "up", "together", "hands", "gesture", "cupped", "prayer"]
      case .pancakes: ["pancakes", "food", "breakfast", "flapjacks", "hotcakes", "brunch"]
      case .panda: ["panda", "animal", "nature"]
      case .paperclip: ["paperclip", "documents", "stationery"]
      case .parachute: ["parachute", "fly", "glide"]
      case .parrot: ["parrot", "animal", "nature", "bird", "pirate", "talk"]
      case .partAlternationMark: ["part", "alternation", "mark", "graph", "presentation", "stats", "business", "economics", "bad"]
      case .partyPopper: ["party", "popper", "party", "congratulations", "birthday", "magic", "circus", "celebration", "tada"]
      case .partyingFace: ["partying", "face", "face", "celebration", "woohoo"]
      case .passengerShip: ["passenger", "ship", "yacht", "cruise", "ferry"]
      case .passportControl: ["passport", "control", "custom", "blue-square"]
      case .pauseButton: ["pause", "button", "pause", "blue-square"]
      case .pawPrints: ["paw", "prints", "animal", "tracking", "footprints", "dog", "cat", "pet", "feet"]
      case .peaPod: ["pea", "pod", "cozy", "green"]
      case .peaceSymbol: ["peace", "symbol", "hippie"]
      case .peach: ["peach", "fruit", "nature", "food"]
      case .peacock: ["peacock", "animal", "nature", "peahen", "bird"]
      case .peanuts: ["peanuts", "food", "nut"]
      case .pear: ["pear", "fruit", "nature", "food"]
      case .pen: ["pen", "stationery", "writing", "write"]
      case .pencil: ["pencil", "stationery", "write", "paper", "writing", "school", "study"]
      case .penguin: ["penguin", "animal", "nature"]
      case .pensiveFace: ["pensive", "face", "face", "sad", "depressed", "upset"]
      case .peopleHoldingHands: ["people", "holding", "hands", "friendship"]
      case .peopleHugging: ["people", "hugging", "care"]
      case .peopleWithBunnyEars: ["people", "with", "bunny", "ears", "perform", "costume"]
      case .peopleWrestling: ["people", "wrestling", "sport"]
      case .performingArts: ["performing", "arts", "acting", "theater", "drama"]
      case .perseveringFace: ["persevering", "face", "face", "sick", "no", "upset", "oops"]
      case .person: ["person", "gender-neutral"]
      case .personBald: ["person", "bald", "hairless"]
      case .personBiking: ["person", "biking", "bicycle", "bike", "cyclist", "sport", "move"]
      case .personBlondHair: ["person", "blond", "hair", "hairstyle"]
      case .personBouncingBall: ["person", "bouncing", "ball", "sports", "human"]
      case .personBowing: ["person", "bowing", "respectiful"]
      case .personCartwheeling: ["person", "cartwheeling", "sport", "gymnastic"]
      case .personClimbing: ["person", "climbing", "sport"]
      case .personCurlyHair: ["person", "curly", "hair", "hairstyle"]
      case .personFacepalming: ["person", "facepalming", "disappointed"]
      case .personFeedingBaby: ["person", "feeding", "baby", "birth", "food"]
      case .personFencing: ["person", "fencing", "sports", "fencing", "sword"]
      case .personFrowning: ["person", "frowning", "worried"]
      case .personGesturingNo: ["person", "gesturing", "no", "decline"]
      case .personGesturingOk: ["person", "gesturing", "ok", "agree"]
      case .personGettingHaircut: ["person", "getting", "haircut", "hairstyle"]
      case .personGettingMassage: ["person", "getting", "massage", "relax"]
      case .personGolfing: ["person", "golfing", "sports", "business"]
      case .personInBed: ["person", "in", "bed", "bed", "rest"]
      case .personInLotusPosition: ["person", "in", "lotus", "position", "meditate"]
      case .personInManualWheelchair: ["person", "in", "manual", "wheelchair", "disability", "accessibility"]
      case .personInMotorizedWheelchair: ["person", "in", "motorized", "wheelchair", "disability", "accessibility"]
      case .personInSteamyRoom: ["person", "in", "steamy", "room", "relax", "spa"]
      case .personJuggling: ["person", "juggling", "performance", "balance"]
      case .personKneeling: ["person", "kneeling", "pray", "respectful"]
      case .personLiftingWeights: ["person", "lifting", "weights", "sports", "training", "exercise"]
      case .personMountainBiking: ["person", "mountain", "biking", "bicycle", "bike", "cyclist", "sport", "move"]
      case .personPlayingHandball: ["person", "playing", "handball", "sport"]
      case .personPlayingWaterPolo: ["person", "playing", "water", "polo", "sport"]
      case .personPouting: ["person", "pouting", "upset"]
      case .personRaisingHand: ["person", "raising", "hand", "question"]
      case .personRedHair: ["person", "red", "hair", "hairstyle"]
      case .personRowingBoat: ["person", "rowing", "boat", "sport", "move"]
      case .personRunning: ["person", "running", "move"]
      case .personShrugging: ["person", "shrugging", "regardless"]
      case .personStanding: ["person", "standing", "still"]
      case .personSurfing: ["person", "surfing", "sport", "sea"]
      case .personSwimming: ["person", "swimming", "sport", "pool"]
      case .personTakingBath: ["person", "taking", "bath", "clean", "shower", "bathroom"]
      case .personTippingHand: ["person", "tipping", "hand", "information"]
      case .personWalking: ["person", "walking", "move"]
      case .personWearingTurban: ["person", "wearing", "turban", "headdress"]
      case .personWhiteHair: ["person", "white", "hair", "elder", "old"]
      case .personWithCrown: ["person", "with", "crown", "royalty", "power"]
      case .personWithProbingCane: ["person", "with", "probing", "cane", "blind"]
      case .petriDish: ["petri", "dish", "bacteria", "biology", "culture", "lab"]
      case .pick: ["pick", "tools", "dig"]
      case .pickupTruck: ["pickup", "truck", "car", "transportation"]
      case .pie: ["pie", "food", "dessert", "pastry"]
      case .pig: ["pig", "animal", "nature"]
      case .pigFace: ["pig", "face", "animal", "oink", "nature"]
      case .pigNose: ["pig", "nose", "animal", "oink"]
      case .pileOfPoo: ["pile", "of", "poo", "hankey", "shitface", "fail", "turd", "shit"]
      case .pill: ["pill", "health", "medicine", "doctor", "pharmacy", "drug"]
      case .pilot: ["pilot", "fly", "plane", "airplane"]
      case .pinata: ["pinata", "mexico", "candy", "celebration"]
      case .pinchedFingers: ["pinched", "fingers", "size", "tiny", "small"]
      case .pinchingHand: ["pinching", "hand", "tiny", "small", "size"]
      case .pineDecoration: ["pine", "decoration", "japanese", "plant", "nature", "vegetable", "panda", "new", "years", "bamboo"]
      case .pineapple: ["pineapple", "fruit", "nature", "food"]
      case .pingPong: ["ping", "pong", "sports", "pingpong"]
      case .pinkHeart: ["pink", "heart", "valentines"]
      case .pirateFlag: ["pirate", "flag", "skull", "crossbones", "flag", "banner"]
      case .pisces: ["pisces", "purple-square", "sign", "zodiac", "astrology"]
      case .pistol: ["pistol", "violence", "weapon", "revolver"]
      case .pizza: ["pizza", "food", "party", "italy"]
      case .placard: ["placard", "announcement"]
      case .placeOfWorship: ["place", "of", "worship", "religion", "church", "temple", "prayer"]
      case .playButton: ["play", "button", "blue-square", "right", "direction", "play"]
      case .playOrPauseButton: ["play", "or", "pause", "button", "blue-square", "play", "pause"]
      case .playgroundSlide: ["playground", "slide", "fun", "park"]
      case .pleadingFace: ["pleading", "face", "face", "begging", "mercy", "cry", "tears", "sad", "grievance"]
      case .plunger: ["plunger", "toilet"]
      case .plusSign: ["plus", "sign", "math", "calculation", "addition", "more", "increase"]
      case .polarBear: ["polar", "bear", "animal", "arctic"]
      case .policeCar: ["police", "car", "vehicle", "cars", "transportation", "law", "legal", "enforcement"]
      case .policeCarLight: ["police", "car", "light", "police", "ambulance", "911", "emergency", "alert", "error", "pinged", "law", "legal"]
      case .policeOfficer: ["police", "officer", "cop"]
      case .poodle: ["poodle", "dog", "animal", "101", "nature", "pet"]
      case .pool8Ball: ["pool", "8", "ball", "pool", "hobby", "game", "luck", "magic"]
      case .popcorn: ["popcorn", "food", "movie", "theater", "films", "snack", "drama"]
      case .postOffice: ["post", "office", "building", "email"]
      case .postalHorn: ["postal", "horn", "instrument", "music"]
      case .postbox: ["postbox", "email", "letter", "envelope"]
      case .potOfFood: ["pot", "of", "food", "food", "meat", "soup", "hot", "pot"]
      case .potableWater: ["potable", "water", "blue-square", "liquid", "restroom", "cleaning", "faucet"]
      case .potato: ["potato", "food", "tuber", "vegatable", "starch"]
      case .pottedPlant: ["potted", "plant", "greenery", "house"]
      case .poultryLeg: ["poultry", "leg", "food", "meat", "drumstick", "bird", "chicken", "turkey"]
      case .poundBanknote: ["pound", "banknote", "british", "sterling", "money", "sales", "bills", "uk", "england", "currency"]
      case .pouringLiquid: ["pouring", "liquid", "cup", "water"]
      case .poutingCat: ["pouting", "cat", "animal", "cats"]
      case .poutingFace: ["pouting", "face", "angry", "mad", "hate", "despise"]
      case .prayerBeads: ["prayer", "beads", "dhikr", "religious"]
      case .pregnantMan: ["pregnant", "man", "baby", "belly"]
      case .pregnantPerson: ["pregnant", "person", "baby", "belly"]
      case .pregnantWoman: ["pregnant", "woman", "baby"]
      case .pretzel: ["pretzel", "food", "bread", "twisted", "germany", "bakery"]
      case .prince: ["prince", "boy", "man", "male", "crown", "royal", "king"]
      case .princess: ["princess", "girl", "woman", "female", "blond", "crown", "royal", "queen"]
      case .printer: ["printer", "paper", "ink"]
      case .probingCane: ["probing", "cane", "accessibility"]
      case .prohibited: ["prohibited", "forbid", "stop", "limit", "denied", "disallow", "circle"]
      case .purpleCircle: ["purple", "circle", "round"]
      case .purpleHeart: ["purple", "heart", "love", "like", "affection", "valentines"]
      case .purpleSquare: ["purple", "square"]
      case .purse: ["purse", "fashion", "accessories", "money", "sales", "shopping"]
      case .pushpin: ["pushpin", "stationery", "mark", "here"]
      case .puzzlePiece: ["puzzle", "piece", "interlocking", "puzzle", "piece"]
      case .questionMark: ["question", "mark", "doubt", "confused"]
      case .rabbit: ["rabbit", "animal", "nature", "pet", "magic", "spring"]
      case .rabbitFace: ["rabbit", "face", "animal", "nature", "pet", "spring", "magic", "bunny"]
      case .raccoon: ["raccoon", "animal", "nature"]
      case .racingCar: ["racing", "car", "sports", "race", "fast", "formula", "f1"]
      case .radio: ["radio", "communication", "music", "podcast", "program"]
      case .radioButton: ["radio", "button", "input", "old", "music", "circle"]
      case .radioactive: ["radioactive", "nuclear", "danger"]
      case .railwayCar: ["railway", "car", "transportation", "vehicle"]
      case .railwayTrack: ["railway", "track", "train", "transportation"]
      case .rainbow: ["rainbow", "nature", "happy", "unicorn", "face", "photo", "sky", "spring"]
      case .rainbowFlag: ["rainbow", "flag", "flag", "rainbow", "pride", "gay", "lgbt", "queer", "homosexual", "lesbian", "bisexual"]
      case .raisedBackOfHand: ["raised", "back", "of", "hand", "fingers", "raised", "backhand"]
      case .raisedFist: ["raised", "fist", "fingers", "hand", "grasp"]
      case .raisedHand: ["raised", "hand", "fingers", "stop", "highfive", "palm", "ban"]
      case .raisingHands: ["raising", "hands", "gesture", "hooray", "yea", "celebration", "hands"]
      case .ram: ["ram", "animal", "sheep", "nature"]
      case .rat: ["rat", "animal", "mouse", "rodent"]
      case .razor: ["razor", "cut"]
      case .receipt: ["receipt", "accounting", "expenses"]
      case .recordButton: ["record", "button", "blue-square"]
      case .recyclingSymbol: ["recycling", "symbol", "arrow", "environment", "garbage", "trash"]
      case .redApple: ["red", "apple", "fruit", "mac", "school"]
      case .redCircle: ["red", "circle", "shape", "error", "danger"]
      case .redEnvelope: ["red", "envelope", "gift"]
      case .redHeart: ["red", "heart", "love", "like", "valentines"]
      case .redPaperLantern: ["red", "paper", "lantern", "light", "paper", "halloween", "spooky"]
      case .redSquare: ["red", "square"]
      case .redTrianglePointedDown: ["red", "triangle", "pointed", "down", "shape", "direction", "bottom"]
      case .redTrianglePointedUp: ["red", "triangle", "pointed", "up", "shape", "direction", "up", "top"]
      case .registered: ["registered", "alphabet", "circle"]
      case .relievedFace: ["relieved", "face", "face", "relaxed", "phew", "massage", "happiness"]
      case .reminderRibbon: ["reminder", "ribbon", "sports", "cause", "support", "awareness"]
      case .repeatButton: ["repeat", "button", "loop", "record"]
      case .repeatSingleButton: ["repeat", "single", "button", "blue-square", "loop"]
      case .rescueWorkerSHelmet: ["rescue", "worker", "s", "helmet", "construction", "build"]
      case .restroom: ["restroom", "blue-square", "toilet", "refresh", "wc", "gender"]
      case .reverseButton: ["reverse", "button", "blue-square", "left", "direction"]
      case .revolvingHearts: ["revolving", "hearts", "love", "like", "affection", "valentines"]
      case .rhinoceros: ["rhinoceros", "animal", "nature", "horn"]
      case .ribbon: ["ribbon", "decoration", "pink", "girl", "bowtie"]
      case .riceBall: ["rice", "ball", "food", "japanese", "onigiri", "omusubi"]
      case .riceCracker: ["rice", "cracker", "food", "japanese", "snack", "senbei"]
      case .rightAngerBubble: ["right", "anger", "bubble", "caption", "speech", "thinking", "mad"]
      case .rightArrow: ["right", "arrow", "blue-square", "next"]
      case .rightArrowCurvingDown: ["right", "arrow", "curving", "down", "blue-square", "direction", "bottom"]
      case .rightArrowCurvingLeft: ["right", "arrow", "curving", "left", "back", "return", "blue-square", "undo", "enter"]
      case .rightArrowCurvingUp: ["right", "arrow", "curving", "up", "blue-square", "direction", "top"]
      case .rightFacingFist: ["right", "facing", "fist", "hand", "fistbump"]
      case .rightwardsHand: ["rightwards", "hand", "palm", "offer"]
      case .rightwardsPushingHand: ["rightwards", "pushing", "hand", "highfive", "pressing", "stop"]
      case .ring: ["ring", "wedding", "propose", "marriage", "valentines", "diamond", "fashion", "jewelry", "gem", "engagement"]
      case .ringBuoy: ["ring", "buoy", "life", "saver", "life", "preserver"]
      case .ringedPlanet: ["ringed", "planet", "outerspace"]
      case .roastedSweetPotato: ["roasted", "sweet", "potato", "food", "nature", "plant"]
      case .robot: ["robot", "computer", "machine", "bot"]
      case .rock: ["rock", "stone"]
      case .rocket: ["rocket", "launch", "ship", "staffmode", "NASA", "outer", "space", "outer", "space", "fly"]
      case .rollOfPaper: ["roll", "of", "paper", "roll"]
      case .rolledUpNewspaper: ["rolled", "up", "newspaper", "press", "headline"]
      case .rollerCoaster: ["roller", "coaster", "carnival", "playground", "photo", "fun"]
      case .rollerSkate: ["roller", "skate", "footwear", "sports"]
      case .rollingOnTheFloorLaughing: ["rolling", "on", "the", "floor", "laughing", "face", "rolling", "floor", "laughing", "lol", "haha", "rofl"]
      case .rooster: ["rooster", "animal", "nature", "chicken"]
      case .rose: ["rose", "flowers", "valentines", "love", "spring"]
      case .rosette: ["rosette", "flower", "decoration", "military"]
      case .roundPushpin: ["round", "pushpin", "stationery", "location", "map", "here"]
      case .rugbyFootball: ["rugby", "football", "sports", "team"]
      case .runningShirt: ["running", "shirt", "play", "pageant"]
      case .runningShoe: ["running", "shoe", "shoes", "sports", "sneakers"]
      case .sadButRelievedFace: ["sad", "but", "relieved", "face", "face", "phew", "sweat", "nervous"]
      case .safetyPin: ["safety", "pin", "diaper"]
      case .safetyVest: ["safety", "vest", "protection"]
      case .sagittarius: ["sagittarius", "sign", "zodiac", "purple-square", "astrology"]
      case .sailboat: ["sailboat", "ship", "summer", "transportation", "water", "sailing"]
      case .sake: ["sake", "wine", "drink", "drunk", "beverage", "japanese", "alcohol", "booze"]
      case .salt: ["salt", "condiment", "shaker"]
      case .salutingFace: ["saluting", "face", "respect", "salute"]
      case .sandwich: ["sandwich", "food", "lunch", "bread", "toast", "bakery"]
      case .santaClaus: ["santa", "claus", "festival", "man", "male", "xmas", "father", "christmas"]
      case .sari: ["sari", "dress"]
      case .satellite: ["satellite", "communication", "gps", "orbit", "spaceflight", "NASA", "ISS"]
      case .satelliteAntenna: ["satellite", "antenna", "communication", "future", "radio", "space"]
      case .sauropod: ["sauropod", "animal", "nature", "dinosaur", "brachiosaurus", "brontosaurus", "diplodocus", "extinct"]
      case .saxophone: ["saxophone", "music", "instrument", "jazz", "blues"]
      case .scarf: ["scarf", "neck", "winter", "clothes"]
      case .school: ["school", "building", "student", "education", "learn", "teach"]
      case .scientist: ["scientist", "chemistry"]
      case .scissors: ["scissors", "stationery", "cut"]
      case .scorpio: ["scorpio", "sign", "zodiac", "purple-square", "astrology"]
      case .scorpion: ["scorpion", "animal", "arachnid"]
      case .screwdriver: ["screwdriver", "tools"]
      case .scroll: ["scroll", "documents", "ancient", "history", "paper"]
      case .seal: ["seal", "animal", "creature", "sea"]
      case .seat: ["seat", "sit", "airplane", "transport", "bus", "flight", "fly"]
      case .seeNoEvilMonkey: ["see", "no", "evil", "monkey", "monkey", "animal", "nature", "haha"]
      case .seedling: ["seedling", "plant", "nature", "grass", "lawn", "spring"]
      case .selfie: ["selfie", "camera", "phone"]
      case .serviceDog: ["service", "dog", "blind", "animal"]
      case .sevenOClock: ["seven", "o", "clock", "7", "7:00", "700", "19:00", "1900", "time", "late", "early", "schedule"]
      case .sevenThirty: ["seven", "thirty", "7:30", "730", "19:30", "1930", "time", "late", "early", "schedule"]
      case .sewingNeedle: ["sewing", "needle", "stitches"]
      case .shakingFace: ["shaking", "face", "dizzy", "shock", "blurry", "earthquake"]
      case .shallowPanOfFood: ["shallow", "pan", "of", "food", "food", "cooking", "casserole", "paella", "skillet"]
      case .shamrock: ["shamrock", "vegetable", "plant", "nature", "irish", "clover"]
      case .shark: ["shark", "animal", "nature", "fish", "sea", "ocean", "jaws", "fins", "beach"]
      case .shavedIce: ["shaved", "ice", "hot", "dessert", "summer"]
      case .sheafOfRice: ["sheaf", "of", "rice", "nature", "plant"]
      case .shield: ["shield", "protection", "security"]
      case .shintoShrine: ["shinto", "shrine", "temple", "japan", "kyoto"]
      case .ship: ["ship", "transportation", "titanic", "deploy"]
      case .shootingStar: ["shooting", "star", "night", "photo"]
      case .shoppingBags: ["shopping", "bags", "mall", "buy", "purchase"]
      case .shoppingCart: ["shopping", "cart", "trolley"]
      case .shortcake: ["shortcake", "food", "dessert"]
      case .shorts: ["shorts", "clothing"]
      case .shower: ["shower", "clean", "water", "bathroom"]
      case .shrimp: ["shrimp", "animal", "ocean", "nature", "seafood"]
      case .shuffleTracksButton: ["shuffle", "tracks", "button", "blue-square", "shuffle", "music", "random"]
      case .shushingFace: ["shushing", "face", "face", "quiet", "shhh"]
      case .signOfTheHorns: ["sign", "of", "the", "horns", "hand", "fingers", "evil", "eye", "sign", "of", "horns", "rock", "on"]
      case .singer: ["singer", "song", "artist", "performer"]
      case .sixOClock: ["six", "o", "clock", "6", "6:00", "600", "18:00", "1800", "time", "late", "early", "schedule", "dawn", "dusk"]
      case .sixThirty: ["six", "thirty", "6:30", "630", "18:30", "1830", "time", "late", "early", "schedule"]
      case .skateboard: ["skateboard", "board"]
      case .skier: ["skier", "sports", "winter", "snow"]
      case .skis: ["skis", "sports", "winter", "cold", "snow"]
      case .skull: ["skull", "dead", "skeleton", "creepy", "death", "dead"]
      case .skullAndCrossbones: ["skull", "and", "crossbones", "poison", "danger", "deadly", "scary", "death", "pirate", "evil"]
      case .skunk: ["skunk", "animal"]
      case .sled: ["sled", "sleigh", "luge", "toboggan"]
      case .sleepingFace: ["sleeping", "face", "face", "tired", "sleepy", "night", "zzz"]
      case .sleepyFace: ["sleepy", "face", "face", "tired", "rest", "nap"]
      case .slightlyFrowningFace: ["slightly", "frowning", "face", "face", "frowning", "disappointed", "sad", "upset"]
      case .slightlySmilingFace: ["slightly", "smiling", "face", "face", "smile"]
      case .slotMachine: ["slot", "machine", "bet", "gamble", "vegas", "fruit", "machine", "luck", "casino"]
      case .sloth: ["sloth", "animal"]
      case .smallAirplane: ["small", "airplane", "flight", "transportation", "fly", "vehicle"]
      case .smallBlueDiamond: ["small", "blue", "diamond", "shape", "jewel", "gem"]
      case .smallOrangeDiamond: ["small", "orange", "diamond", "shape", "jewel", "gem"]
      case .smilingCatWithHeartEyes:
         ["smiling", "cat", "with", "heart", "eyes", "animal", "love", "like", "affection", "cats", "valentines", "heart"]
      case .smilingFace: ["smiling", "face", "face", "blush", "massage", "happiness"]
      case .smilingFaceWithHalo: ["smiling", "face", "with", "halo", "face", "angel", "heaven", "halo", "innocent"]
      case .smilingFaceWithHeartEyes:
         ["smiling", "face", "with", "heart", "eyes", "face", "love", "like", "affection", "valentines", "infatuation", "crush", "heart"]
      case .smilingFaceWithHearts:
         ["smiling", "face", "with", "hearts", "face", "love", "like", "affection", "valentines", "infatuation", "crush", "hearts", "adore"]
      case .smilingFaceWithHorns: ["smiling", "face", "with", "horns", "devil", "horns"]
      case .smilingFaceWithSmilingEyes:
         ["smiling", "face", "with", "smiling", "eyes", "face", "smile", "happy", "flushed", "crush", "embarrassed", "shy", "joy"]
      case .smilingFaceWithSunglasses: ["smiling", "face", "with", "sunglasses", "face", "cool", "smile", "summer", "beach", "sunglass"]
      case .smilingFaceWithTear: ["smiling", "face", "with", "tear", "sad", "cry", "pretend"]
      case .smirkingFace: ["smirking", "face", "face", "smile", "mean", "prank", "smug", "sarcasm"]
      case .snail: ["snail", "slow", "animal", "shell"]
      case .snake: ["snake", "animal", "evil", "nature", "hiss", "python"]
      case .sneezingFace: ["sneezing", "face", "face", "gesundheit", "sneeze", "sick", "allergy"]
      case .snowCappedMountain: ["snow", "capped", "mountain", "photo", "nature", "environment", "winter", "cold"]
      case .snowboarder: ["snowboarder", "sports", "winter"]
      case .snowflake: ["snowflake", "winter", "season", "cold", "weather", "christmas", "xmas"]
      case .snowman: ["snowman", "winter", "season", "cold", "weather", "christmas", "xmas", "frozen"]
      case .snowmanWithoutSnow:
         ["snowman", "without", "snow", "winter", "season", "cold", "weather", "christmas", "xmas", "frozen", "without", "snow"]
      case .soap: ["soap", "bar", "bathing", "cleaning", "lather"]
      case .soccerBall: ["soccer", "ball", "sports", "football"]
      case .socks: ["socks", "stockings", "clothes"]
      case .softIceCream: ["soft", "ice", "cream", "food", "hot", "dessert", "summer"]
      case .softball: ["softball", "sports", "balls"]
      case .soonArrow: ["soon", "arrow", "arrow", "words"]
      case .sosButton: ["sos", "button", "help", "red-square", "words", "emergency", "911"]
      case .spadeSuit: ["spade", "suit", "poker", "cards", "suits", "magic"]
      case .spaghetti: ["spaghetti", "food", "italian", "pasta", "noodle"]
      case .sparkle: ["sparkle", "stars", "green-square", "awesome", "good", "fireworks"]
      case .sparkler: ["sparkler", "stars", "night", "shine"]
      case .sparkles: ["sparkles", "stars", "shine", "shiny", "cool", "awesome", "good", "magic"]
      case .sparklingHeart: ["sparkling", "heart", "love", "like", "affection", "valentines"]
      case .speakNoEvilMonkey: ["speak", "no", "evil", "monkey", "monkey", "animal", "nature", "omg"]
      case .speakerHighVolume: ["speaker", "high", "volume", "volume", "noise", "noisy", "speaker", "broadcast"]
      case .speakerLowVolume: ["speaker", "low", "volume", "sound", "volume", "silence", "broadcast"]
      case .speakerMediumVolume: ["speaker", "medium", "volume", "volume", "speaker", "broadcast"]
      case .speakingHead: ["speaking", "head", "user", "person", "human", "sing", "say", "talk"]
      case .speechBalloon: ["speech", "balloon", "bubble", "words", "message", "talk", "chatting"]
      case .speedboat: ["speedboat", "ship", "transportation", "vehicle", "summer"]
      case .spider: ["spider", "animal", "arachnid"]
      case .spiderWeb: ["spider", "web", "animal", "insect", "arachnid", "silk"]
      case .spiralCalendar: ["spiral", "calendar", "date", "schedule", "planning"]
      case .spiralNotepad: ["spiral", "notepad", "memo", "stationery"]
      case .spiralShell: ["spiral", "shell", "nature", "sea", "beach"]
      case .sponge: ["sponge", "absorbing", "cleaning", "porous"]
      case .spoon: ["spoon", "cutlery", "kitchen", "tableware"]
      case .sportUtilityVehicle: ["sport", "utility", "vehicle", "transportation", "vehicle"]
      case .sportsMedal: ["sports", "medal", "award", "winning"]
      case .spoutingWhale: ["spouting", "whale", "animal", "nature", "sea", "ocean"]
      case .squid: ["squid", "animal", "nature", "ocean", "sea"]
      case .squintingFaceWithTongue: ["squinting", "face", "with", "tongue", "face", "prank", "playful", "mischievous", "smile", "tongue"]
      case .stadium: ["stadium", "photo", "place", "sports", "concert", "venue"]
      case .star: ["star", "night", "yellow"]
      case .starAndCrescent: ["star", "and", "crescent", "islam"]
      case .starOfDavid: ["star", "of", "david", "judaism"]
      case .starStruck: ["star", "struck", "face", "smile", "starry", "eyes", "grinning"]
      case .station: ["station", "transportation", "vehicle", "public"]
      case .statueOfLiberty: ["statue", "of", "liberty", "american", "newyork"]
      case .steamingBowl: ["steaming", "bowl", "food", "japanese", "noodle", "chopsticks", "ramen"]
      case .stethoscope: ["stethoscope", "health"]
      case .stopButton: ["stop", "button", "blue-square"]
      case .stopSign: ["stop", "sign", "stop"]
      case .stopwatch: ["stopwatch", "time", "deadline"]
      case .straightRuler: ["straight", "ruler", "stationery", "calculate", "length", "math", "school", "drawing", "architect", "sketch"]
      case .strawberry: ["strawberry", "fruit", "food", "nature"]
      case .student: ["student", "learn"]
      case .studioMicrophone: ["studio", "microphone", "sing", "recording", "artist", "talkshow"]
      case .stuffedFlatbread: ["stuffed", "flatbread", "food", "flatbread", "stuffed", "gyro", "mediterranean"]
      case .sun: ["sun", "weather", "nature", "brightness", "summer", "beach", "spring"]
      case .sunBehindCloud: ["sun", "behind", "cloud", "weather", "nature", "cloudy", "morning", "fall", "spring"]
      case .sunBehindLargeCloud: ["sun", "behind", "large", "cloud", "weather"]
      case .sunBehindRainCloud: ["sun", "behind", "rain", "cloud", "weather"]
      case .sunBehindSmallCloud: ["sun", "behind", "small", "cloud", "weather"]
      case .sunWithFace: ["sun", "with", "face", "nature", "morning", "sky"]
      case .sunflower: ["sunflower", "nature", "plant", "fall"]
      case .sunglasses: ["sunglasses", "face", "cool", "accessories"]
      case .sunrise: ["sunrise", "morning", "view", "vacation", "photo"]
      case .sunriseOverMountains: ["sunrise", "over", "mountains", "view", "vacation", "photo"]
      case .sunset: ["sunset", "photo", "good", "morning", "dawn"]
      case .superhero: ["superhero", "marvel"]
      case .supervillain: ["supervillain", "marvel"]
      case .sushi: ["sushi", "food", "fish", "japanese", "rice"]
      case .suspensionRailway: ["suspension", "railway", "vehicle", "transportation"]
      case .swan: ["swan", "animal", "nature", "bird"]
      case .sweatDroplets: ["sweat", "droplets", "water", "drip", "oops"]
      case .synagogue: ["synagogue", "judaism", "worship", "temple", "jewish"]
      case .syringe: ["syringe", "health", "hospital", "drugs", "blood", "medicine", "needle", "doctor", "nurse"]
      case .tRex: ["t", "rex", "animal", "nature", "dinosaur", "tyrannosaurus", "extinct"]
      case .tShirt: ["t", "shirt", "fashion", "cloth", "casual", "shirt", "tee"]
      case .taco: ["taco", "food", "mexican"]
      case .takeoutBox: ["takeout", "box", "food", "leftovers"]
      case .tamale: ["tamale", "food", "masa"]
      case .tanabataTree: ["tanabata", "tree", "plant", "nature", "branch", "summer", "bamboo", "wish", "star", "festival", "tanzaku"]
      case .tangerine: ["tangerine", "food", "fruit", "nature", "orange"]
      case .taurus: ["taurus", "purple-square", "sign", "zodiac", "astrology"]
      case .taxi: ["taxi", "uber", "vehicle", "cars", "transportation"]
      case .teacher: ["teacher", "professor"]
      case .teacupWithoutHandle: ["teacup", "without", "handle", "drink", "bowl", "breakfast", "green", "british"]
      case .teapot: ["teapot", "drink", "hot"]
      case .tearOffCalendar: ["tear", "off", "calendar", "schedule", "date", "planning"]
      case .technologist: ["technologist", "computer"]
      case .teddyBear: ["teddy", "bear", "plush", "stuffed"]
      case .telephone: ["telephone", "technology", "communication", "dial"]
      case .telephoneReceiver: ["telephone", "receiver", "technology", "communication", "dial"]
      case .telescope: ["telescope", "stars", "space", "zoom", "science", "astronomy"]
      case .television: ["television", "technology", "program", "oldschool", "show"]
      case .tenOClock: ["ten", "o", "clock", "10", "10:00", "1000", "22:00", "2200", "time", "late", "early", "schedule"]
      case .tenThirty: ["ten", "thirty", "10:30", "1030", "22:30", "2230", "time", "late", "early", "schedule"]
      case .tennis: ["tennis", "sports", "balls", "green"]
      case .tent: ["tent", "photo", "camping", "outdoors"]
      case .testTube: ["test", "tube", "chemistry", "experiment", "lab", "science"]
      case .thermometer: ["thermometer", "weather", "temperature", "hot", "cold"]
      case .thinkingFace: ["thinking", "face", "face", "hmmm", "think", "consider"]
      case .thongSandal: ["thong", "sandal", "footwear", "summer"]
      case .thoughtBalloon: ["thought", "balloon", "bubble", "cloud", "speech", "thinking", "dream"]
      case .thread: ["thread", "needle", "sewing", "spool", "string"]
      case .threeOClock: ["three", "o", "clock", "3", "3:00", "300", "15:00", "1500", "time", "late", "early", "schedule"]
      case .threeThirty: ["three", "thirty", "3:30", "330", "15:30", "1530", "time", "late", "early", "schedule"]
      case .thumbsDown: ["thumbs", "down", "thumbsdown", "no", "dislike", "hand", "-1"]
      case .thumbsUp: ["thumbs", "up", "thumbsup", "yes", "awesome", "good", "agree", "accept", "cool", "hand", "like", "+1"]
      case .ticket: ["ticket", "event", "concert", "pass"]
      case .tiger: ["tiger", "animal", "nature", "roar"]
      case .tigerFace: ["tiger", "face", "animal", "cat", "danger", "wild", "nature", "roar"]
      case .timerClock: ["timer", "clock", "alarm"]
      case .tiredFace: ["tired", "face", "sick", "whine", "upset", "frustrated"]
      case .toilet: ["toilet", "restroom", "wc", "washroom", "bathroom", "potty"]
      case .tokyoTower: ["tokyo", "tower", "photo", "japanese"]
      case .tomato: ["tomato", "fruit", "vegetable", "nature", "food"]
      case .tongue: ["tongue", "mouth", "playful"]
      case .toolbox: ["toolbox", "tools", "diy", "fix", "maintainer", "mechanic"]
      case .tooth: ["tooth", "teeth", "dentist"]
      case .toothbrush: ["toothbrush", "hygiene", "dental"]
      case .topArrow: ["top", "arrow", "words", "blue-square"]
      case .topHat: ["top", "hat", "magic", "gentleman", "classy", "circus"]
      case .tornado: ["tornado", "weather", "cyclone", "twister"]
      case .trackball: ["trackball", "technology", "trackpad"]
      case .tractor: ["tractor", "vehicle", "car", "farming", "agriculture"]
      case .tradeMark: ["trade", "mark", "trademark", "brand", "law", "legal"]
      case .train: ["train", "transportation", "vehicle"]
      case .tram: ["tram", "transportation", "vehicle"]
      case .tramCar: ["tram", "car", "transportation", "vehicle", "carriage", "public", "travel"]
      case .transgenderFlag: ["transgender", "flag", "transgender", "flag", "pride", "lgbtq"]
      case .transgenderSymbol: ["transgender", "symbol", "transgender", "lgbtq"]
      case .triangularFlag: ["triangular", "flag", "mark", "milestone", "place"]
      case .triangularRuler: ["triangular", "ruler", "stationery", "math", "architect", "sketch"]
      case .tridentEmblem: ["trident", "emblem", "weapon", "spear"]
      case .troll: ["troll", "mystical", "monster"]
      case .trolleybus: ["trolleybus", "bart", "transportation", "vehicle"]
      case .trophy: ["trophy", "win", "award", "contest", "place", "ftw", "ceremony"]
      case .tropicalDrink: ["tropical", "drink", "beverage", "cocktail", "summer", "beach", "alcohol", "booze", "mojito"]
      case .tropicalFish: ["tropical", "fish", "animal", "swim", "ocean", "beach", "nemo"]
      case .trumpet: ["trumpet", "music", "brass"]
      case .tulip: ["tulip", "flowers", "plant", "nature", "summer", "spring"]
      case .tumblerGlass:
         ["tumbler", "glass", "drink", "beverage", "drunk", "alcohol", "liquor", "booze", "bourbon", "scotch", "whisky", "glass", "shot"]
      case .turkey: ["turkey", "animal", "bird"]
      case .turtle: ["turtle", "animal", "slow", "nature", "tortoise"]
      case .twelveOClock:
         ["twelve", "o", "clock", "12", "00:00", "0000", "12:00", "1200", "time", "noon", "midnight", "midday", "late", "early", "schedule"]
      case .twelveThirty: ["twelve", "thirty", "00:30", "0030", "12:30", "1230", "time", "late", "early", "schedule"]
      case .twoHearts: ["two", "hearts", "love", "like", "affection", "valentines", "heart"]
      case .twoHumpCamel: ["two", "hump", "camel", "animal", "nature", "hot", "desert", "hump"]
      case .twoOClock: ["two", "o", "clock", "2", "2:00", "200", "14:00", "1400", "time", "late", "early", "schedule"]
      case .twoThirty: ["two", "thirty", "2:30", "230", "14:30", "1430", "time", "late", "early", "schedule"]
      case .umbrella: ["umbrella", "weather", "spring"]
      case .umbrellaOnGround: ["umbrella", "on", "ground", "weather", "summer"]
      case .umbrellaWithRainDrops: ["umbrella", "with", "rain", "drops", "rainy", "weather", "spring"]
      case .unamusedFace:
         [
            "unamused", "face", "indifference", "bored", "straight", "face", "serious", "sarcasm", "unimpressed", "skeptical", "dubious", "ugh",
            "side", "eye",
         ]
      case .unicorn: ["unicorn", "animal", "nature", "mystical"]
      case .unlocked: ["unlocked", "privacy", "security"]
      case .upArrow: ["up", "arrow", "blue-square", "continue", "top", "direction"]
      case .upButton: ["up", "button", "blue-square", "above", "high"]
      case .upDownArrow: ["up", "down", "arrow", "blue-square", "direction", "way", "vertical"]
      case .upLeftArrow: ["up", "left", "arrow", "blue-square", "point", "direction", "diagonal", "northwest"]
      case .upRightArrow: ["up", "right", "arrow", "blue-square", "point", "direction", "diagonal", "northeast"]
      case .upsideDownFace: ["upside", "down", "face", "face", "flipped", "silly", "smile"]
      case .upwardsButton: ["upwards", "button", "blue-square", "triangle", "direction", "point", "forward", "top"]
      case .vampire: ["vampire", "blood", "twilight"]
      case .verticalTrafficLight: ["vertical", "traffic", "light", "transportation", "driving"]
      case .vibrationMode: ["vibration", "mode", "orange-square", "phone"]
      case .victoryHand: ["victory", "hand", "fingers", "ohyeah", "hand", "peace", "victory", "two"]
      case .videoCamera: ["video", "camera", "film", "record"]
      case .videoGame: ["video", "game", "play", "console", "PS4", "controller"]
      case .videocassette: ["videocassette", "record", "video", "oldschool", "90s", "80s"]
      case .violin: ["violin", "music", "instrument", "orchestra", "symphony"]
      case .virgo: ["virgo", "sign", "zodiac", "purple-square", "astrology"]
      case .volcano: ["volcano", "photo", "nature", "disaster"]
      case .volleyball: ["volleyball", "sports", "balls"]
      case .vsButton: ["vs", "button", "words", "orange-square"]
      case .vulcanSalute: ["vulcan", "salute", "hand", "fingers", "spock", "star", "trek"]
      case .waffle: ["waffle", "food", "breakfast", "brunch"]
      case .waningCrescentMoon: ["waning", "crescent", "moon", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .waningGibbousMoon:
         ["waning", "gibbous", "moon", "nature", "twilight", "planet", "space", "night", "evening", "sleep", "waxing", "gibbous", "moon"]
      case .warning: ["warning", "exclamation", "wip", "alert", "error", "problem", "issue"]
      case .wastebasket: ["wastebasket", "bin", "trash", "rubbish", "garbage", "toss"]
      case .watch: ["watch", "time", "accessories"]
      case .waterBuffalo: ["water", "buffalo", "animal", "nature", "ox", "cow"]
      case .waterCloset: ["water", "closet", "toilet", "restroom", "blue-square"]
      case .waterWave: ["water", "wave", "sea", "water", "wave", "nature", "tsunami", "disaster"]
      case .watermelon: ["watermelon", "fruit", "food", "picnic", "summer"]
      case .wavingHand: ["waving", "hand", "wave", "hands", "gesture", "goodbye", "solong", "farewell", "hello", "hi", "palm"]
      case .wavyDash: ["wavy", "dash", "draw", "line", "moustache", "mustache", "squiggle", "scribble"]
      case .waxingCrescentMoon: ["waxing", "crescent", "moon", "nature", "twilight", "planet", "space", "night", "evening", "sleep"]
      case .waxingGibbousMoon: ["waxing", "gibbous", "moon", "nature", "night", "sky", "gray", "twilight", "planet", "space", "evening", "sleep"]
      case .wearyCat: ["weary", "cat", "animal", "cats", "munch", "scared", "scream"]
      case .wearyFace: ["weary", "face", "face", "tired", "sleepy", "sad", "frustrated", "upset"]
      case .wedding: ["wedding", "love", "like", "affection", "couple", "marriage", "bride", "groom"]
      case .whale: ["whale", "animal", "nature", "sea", "ocean"]
      case .wheel: ["wheel", "car", "transport"]
      case .wheelOfDharma: ["wheel", "of", "dharma", "hinduism", "buddhism", "sikhism", "jainism"]
      case .wheelchairSymbol: ["wheelchair", "symbol", "blue-square", "disabled", "accessibility"]
      case .whiteCircle: ["white", "circle", "shape", "round"]
      case .whiteExclamationMark: ["white", "exclamation", "mark", "surprise", "punctuation", "gray", "wow", "warning"]
      case .whiteFlag: ["white", "flag", "losing", "loser", "lost", "surrender", "give", "up", "fail"]
      case .whiteFlower: ["white", "flower", "japanese", "spring"]
      case .whiteHeart: ["white", "heart", "pure"]
      case .whiteLargeSquare: ["white", "large", "square", "shape", "icon", "stone", "button"]
      case .whiteMediumSmallSquare: ["white", "medium", "small", "square", "shape", "stone", "icon", "button"]
      case .whiteMediumSquare: ["white", "medium", "square", "shape", "stone", "icon"]
      case .whiteQuestionMark: ["white", "question", "mark", "doubts", "gray", "huh", "confused"]
      case .whiteSmallSquare: ["white", "small", "square", "shape", "icon"]
      case .whiteSquareButton: ["white", "square", "button", "shape", "input"]
      case .wiltedFlower: ["wilted", "flower", "plant", "nature", "flower", "rose"]
      case .windChime: ["wind", "chime", "nature", "ding", "spring", "bell"]
      case .windFace: ["wind", "face", "gust", "air"]
      case .window: ["window", "scenery"]
      case .wineGlass: ["wine", "glass", "drink", "beverage", "drunk", "alcohol", "booze"]
      case .wing: ["wing", "angel", "birds", "flying"]
      case .winkingFace: ["winking", "face", "face", "happy", "mischievous", "secret", ";)", "smile", "eye"]
      case .winkingFaceWithTongue:
         ["winking", "face", "with", "tongue", "face", "prank", "childish", "playful", "mischievous", "smile", "wink", "tongue"]
      case .wireless: ["wireless", "wifi", "internet", "contactless", "signal"]
      case .wolf: ["wolf", "animal", "nature", "wild"]
      case .woman: ["woman", "female", "girls", "lady"]
      case .womanAndManHoldingHands:
         [
            "woman", "and", "man", "holding", "hands", "pair", "people", "human", "love", "date", "dating", "like", "affection", "valentines",
            "marriage",
         ]
      case .womanArtist: ["woman", "artist", "painter", "woman", "human"]
      case .womanAstronaut: ["woman", "astronaut", "space", "rocket", "woman", "human"]
      case .womanBald: ["woman", "bald", "hairless"]
      case .womanBeard: ["woman", "beard", "facial", "hair"]
      case .womanBiking: ["woman", "biking", "bicycle", "bike", "cyclist", "sports", "exercise", "hipster", "woman", "female"]
      case .womanBlondHair: ["woman", "blond", "hair", "woman", "female", "girl", "blonde", "person"]
      case .womanBouncingBall: ["woman", "bouncing", "ball", "sports", "human", "woman", "female"]
      case .womanBowing: ["woman", "bowing", "woman", "female", "girl"]
      case .womanCartwheeling: ["woman", "cartwheeling", "gymnastics"]
      case .womanClimbing: ["woman", "climbing", "sports", "hobby", "woman", "female", "rock"]
      case .womanConstructionWorker:
         ["woman", "construction", "worker", "female", "human", "wip", "build", "construction", "worker", "labor", "woman"]
      case .womanCook: ["woman", "cook", "chef", "woman", "human"]
      case .womanCurlyHair: ["woman", "curly", "hair", "hairstyle"]
      case .womanDancing: ["woman", "dancing", "female", "girl", "woman", "fun"]
      case .womanDetective: ["woman", "detective", "human", "spy", "detective", "female", "woman"]
      case .womanElf: ["woman", "elf", "woman", "female"]
      case .womanFacepalming: ["woman", "facepalming", "woman", "female", "girl", "disbelief"]
      case .womanFactoryWorker: ["woman", "factory", "worker", "assembly", "industrial", "woman", "human"]
      case .womanFairy: ["woman", "fairy", "woman", "female"]
      case .womanFarmer: ["woman", "farmer", "rancher", "gardener", "woman", "human"]
      case .womanFeedingBaby: ["woman", "feeding", "baby", "birth", "food"]
      case .womanFirefighter: ["woman", "firefighter", "fireman", "woman", "human"]
      case .womanFrowning: ["woman", "frowning", "female", "girl", "woman", "sad", "depressed", "discouraged", "unhappy"]
      case .womanGenie: ["woman", "genie", "woman", "female"]
      case .womanGesturingNo: ["woman", "gesturing", "no", "female", "girl", "woman", "nope"]
      case .womanGesturingOk: ["woman", "gesturing", "ok", "women", "girl", "female", "pink", "human", "woman"]
      case .womanGettingHaircut: ["woman", "getting", "haircut", "female", "girl", "woman"]
      case .womanGettingMassage: ["woman", "getting", "massage", "female", "girl", "woman", "head"]
      case .womanGolfing: ["woman", "golfing", "sports", "business", "woman", "female"]
      case .womanGuard: ["woman", "guard", "uk", "gb", "british", "female", "royal", "woman"]
      case .womanHealthWorker: ["woman", "health", "worker", "doctor", "nurse", "therapist", "healthcare", "woman", "human"]
      case .womanInLotusPosition: ["woman", "in", "lotus", "position", "woman", "female", "meditation", "yoga", "serenity", "zen", "mindfulness"]
      case .womanInManualWheelchair: ["woman", "in", "manual", "wheelchair", "disability", "accessibility"]
      case .womanInMotorizedWheelchair: ["woman", "in", "motorized", "wheelchair", "disability", "accessibility"]
      case .womanInSteamyRoom: ["woman", "in", "steamy", "room", "female", "woman", "spa", "steamroom", "sauna"]
      case .womanInTuxedo: ["woman", "in", "tuxedo", "formal", "fashion"]
      case .womanJudge: ["woman", "judge", "justice", "court", "woman", "human"]
      case .womanJuggling: ["woman", "juggling", "juggle", "balance", "skill", "multitask"]
      case .womanKneeling: ["woman", "kneeling", "respectful", "pray"]
      case .womanLiftingWeights: ["woman", "lifting", "weights", "sports", "training", "exercise", "woman", "female"]
      case .womanMage: ["woman", "mage", "woman", "female", "mage", "witch"]
      case .womanMechanic: ["woman", "mechanic", "plumber", "woman", "human", "wrench"]
      case .womanMountainBiking:
         ["woman", "mountain", "biking", "bicycle", "bike", "cyclist", "transportation", "sports", "human", "race", "woman", "female"]
      case .womanOfficeWorker: ["woman", "office", "worker", "business", "manager", "woman", "human"]
      case .womanPilot: ["woman", "pilot", "aviator", "plane", "woman", "human"]
      case .womanPlayingHandball: ["woman", "playing", "handball", "sports"]
      case .womanPlayingWaterPolo: ["woman", "playing", "water", "polo", "sports", "pool"]
      case .womanPoliceOfficer: ["woman", "police", "officer", "woman", "police", "law", "legal", "enforcement", "arrest", "911", "female"]
      case .womanPouting: ["woman", "pouting", "female", "girl", "woman"]
      case .womanRaisingHand: ["woman", "raising", "hand", "female", "girl", "woman"]
      case .womanRedHair: ["woman", "red", "hair", "hairstyle"]
      case .womanRowingBoat: ["woman", "rowing", "boat", "sports", "hobby", "water", "ship", "woman", "female"]
      case .womanRunning: ["woman", "running", "woman", "walking", "exercise", "race", "running", "female"]
      case .womanSBoot: ["woman", "s", "boot", "shoes", "fashion"]
      case .womanSClothes: ["woman", "s", "clothes", "fashion", "shopping", "bags", "female"]
      case .womanSHat: ["woman", "s", "hat", "fashion", "accessories", "female", "lady", "spring"]
      case .womanSSandal: ["woman", "s", "sandal", "shoes", "fashion", "flip", "flops"]
      case .womanScientist: ["woman", "scientist", "biologist", "chemist", "engineer", "physicist", "woman", "human"]
      case .womanShrugging: ["woman", "shrugging", "woman", "female", "girl", "confused", "indifferent", "doubt"]
      case .womanSinger: ["woman", "singer", "rockstar", "entertainer", "woman", "human"]
      case .womanStanding: ["woman", "standing", "still"]
      case .womanStudent: ["woman", "student", "graduate", "woman", "human"]
      case .womanSuperhero: ["woman", "superhero", "woman", "female", "good", "heroine", "superpowers"]
      case .womanSupervillain: ["woman", "supervillain", "woman", "female", "evil", "bad", "criminal", "heroine", "superpowers"]
      case .womanSurfing: ["woman", "surfing", "sports", "ocean", "sea", "summer", "beach", "woman", "female"]
      case .womanSwimming: ["woman", "swimming", "sports", "exercise", "human", "athlete", "water", "summer", "woman", "female"]
      case .womanTeacher: ["woman", "teacher", "instructor", "professor", "woman", "human"]
      case .womanTechnologist:
         ["woman", "technologist", "coder", "developer", "engineer", "programmer", "software", "woman", "human", "laptop", "computer"]
      case .womanTippingHand: ["woman", "tipping", "hand", "female", "girl", "woman", "human", "information"]
      case .womanVampire: ["woman", "vampire", "woman", "female"]
      case .womanWalking: ["woman", "walking", "human", "feet", "steps", "woman", "female"]
      case .womanWearingTurban: ["woman", "wearing", "turban", "female", "indian", "hinduism", "arabs", "woman"]
      case .womanWhiteHair: ["woman", "white", "hair", "old", "elder"]
      case .womanWithHeadscarf: ["woman", "with", "headscarf", "female", "hijab", "mantilla", "tichel"]
      case .womanWithProbingCane: ["woman", "with", "probing", "cane", "blind"]
      case .womanWithVeil: ["woman", "with", "veil", "wedding", "marriage"]
      case .womanZombie: ["woman", "zombie", "woman", "female", "undead", "walking", "dead"]
      case .womenHoldingHands: ["women", "holding", "hands", "pair", "friendship", "couple", "love", "like", "female", "people", "human"]
      case .womenSRoom: ["women", "s", "room", "purple-square", "woman", "female", "toilet", "loo", "restroom", "gender"]
      case .womenWithBunnyEars: ["women", "with", "bunny", "ears", "female", "bunny", "women", "girls"]
      case .womenWrestling: ["women", "wrestling", "sports", "wrestlers"]
      case .wood: ["wood", "nature", "timber", "trunk"]
      case .woozyFace: ["woozy", "face", "face", "dizzy", "intoxicated", "tipsy", "wavy"]
      case .worldMap: ["world", "map", "location", "direction"]
      case .worm: ["worm", "animal"]
      case .worriedFace: ["worried", "face", "face", "concern", "nervous", ":("]
      case .wrappedGift: ["wrapped", "gift", "present", "birthday", "christmas", "xmas"]
      case .wrench: ["wrench", "tools", "diy", "ikea", "fix", "maintainer"]
      case .writingHand: ["writing", "hand", "lower", "left", "ballpoint", "pen", "stationery", "write", "compose"]
      case .xray: ["xray", "skeleton", "medicine"]
      case .yarn: ["yarn", "ball", "crochet", "knit"]
      case .yawningFace: ["yawning", "face", "tired", "sleepy"]
      case .yellowCircle: ["yellow", "circle", "round"]
      case .yellowHeart: ["yellow", "heart", "love", "like", "affection", "valentines"]
      case .yellowSquare: ["yellow", "square"]
      case .yenBanknote: ["yen", "banknote", "money", "sales", "japanese", "dollar", "currency"]
      case .yinYang: ["yin", "yang", "balance"]
      case .yoYo: ["yo", "yo", "toy"]
      case .zanyFace: ["zany", "face", "face", "goofy", "crazy"]
      case .zebra: ["zebra", "animal", "nature", "stripes", "safari"]
      case .zipperMouthFace: ["zipper", "mouth", "face", "face", "sealed", "zipper", "secret"]
      case .zombie: ["zombie", "dead"]
      case .zzz: ["zzz", "sleepy", "tired", "dream"]
      }
   }
}

extension Emoji: ExpressibleByStringLiteral {
   /// Initializes an `Emoji` from a string literal. If the string does not match any predefined emoji, it defaults to `.exclamationQuestionMark`.
   ///
   /// Example:
   /// ```
   /// let emoji: Emoji = "🥇"
   /// print(emoji) // Outputs: firstPlaceMedal
   /// ```
   public init(stringLiteral value: StringLiteralType) {
      self = Emoji(rawValue: value) ?? .exclamationQuestionMark
   }
}
