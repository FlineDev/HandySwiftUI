import SwiftUI

/// An enum representing a selection of various SF Symbols. Each case is an SF Symbol with a specific meaning.
/// This type is designed to be used in a ``SearchableGridPicker``.
public enum SFSymbol: String, CaseIterable, Codable {
   case airplane = "airplane"
   case airplaneArrival = "airplane.arrival"
   case airplaneDeparture = "airplane.departure"
   case alarm = "alarm"
   case alt = "alt"
   case ant = "ant"
   case appleIntelligence = "apple.intelligence"
   case appleLogo = "apple.logo"
   case appleWatch = "applewatch"
   case archivebox = "archivebox"
   case arrowDown = "arrow.down"
   case arrowDownCircle = "arrow.down.circle"
   case arrowDownSquare = "arrow.down.square"
   case arrowLeft = "arrow.left"
   case arrowLeftCircle = "arrow.left.circle"
   case arrowLeftSquare = "arrow.left.square"
   case arrowRight = "arrow.right"
   case arrowRightCircle = "arrow.right.circle"
   case arrowRightSquare = "arrow.right.square"
   case arrowUp = "arrow.up"
   case arrowUpArrowDown = "arrow.up.arrow.down"
   case arrowUpCircle = "arrow.up.circle"
   case arrowUpSquare = "arrow.up.square"
   case asteriskCircle = "asterisk.circle"
   case atBadgeMinus = "at.badge.minus"
   case atBadgePlus = "at.badge.plus"
   case atCircle = "at.circle"
   case atom = "atom"
   case bag = "bag"
   case bandage = "bandage"
   case barcode = "barcode"
   case battery100 = "battery.100"
   case bedDouble = "bed.double"
   case bell = "bell"
   case bellBadge = "bell.badge"
   case bellSlash = "bell.slash"
   case binXmark = "bin.xmark"
   case birthdayCake = "birthday.cake"
   case book = "book"
   case bookCircle = "book.circle"
   case bookmark = "bookmark"
   case brain = "brain"
   case briefcase = "briefcase"
   case bubbleLeft = "bubble.left"
   case bubbleMiddleBottom = "bubble.middle.bottom"
   case bubbleRight = "bubble.right"
   case buildingColumns = "building.columns"
   case calendar = "calendar"
   case calendarBadgeClock = "calendar.badge.clock"
   case calendarBadgeExclamationmark = "calendar.badge.exclamationmark"
   case camera = "camera"
   case candybarphone = "candybarphone"
   case car = "car"
   case cart = "cart"
   case chartBar = "chart.bar"
   case chartPie = "chart.pie"
   case checkmark = "checkmark"
   case checkmarkCircle = "checkmark.circle"
   case checkmarkSquare = "checkmark.square"
   case clock = "clock"
   case cloud = "cloud"
   case cloudBolt = "cloud.bolt"
   case cloudDrizzle = "cloud.drizzle"
   case cloudFog = "cloud.fog"
   case cloudHail = "cloud.hail"
   case cloudHeavyrain = "cloud.heavyrain"
   case cloudMoon = "cloud.moon"
   case cloudRain = "cloud.rain"
   case cloudSnow = "cloud.snow"
   case cloudSun = "cloud.sun"
   case cpu = "cpu"
   case creditCard = "creditcard"
   case cross = "cross"
   case crown = "crown"
   case cube = "cube"
   case cupAndSaucer = "cup.and.saucer"
   case desktopComputer = "desktopcomputer"
   case diamond = "diamond"
   case dice = "dice"
   case display = "display"
   case doc = "doc"
   case docAppend = "doc.append"
   case docOnClipboard = "doc.on.clipboard"
   case docPlaintext = "doc.plaintext"
   case docRichtext = "doc.richtext"
   case docText = "doc.text"
   case dollarSignCircle = "dollarsign.circle"
   case drop = "drop"
   case ear = "ear"
   case earbuds = "earbuds"
   case envelope = "envelope"
   case envelopeBadge = "envelope.badge"
   case equalCircle = "equal.circle"
   case exclamationmarkTriangle = "exclamationmark.triangle"
   case eye = "eye"
   case eyeSlash = "eye.slash"
   case faceDashed = "face.dashed"
   case faceid = "faceid"
   case faceSmiling = "face.smiling"
   case figureStand = "figure.stand"
   case figureWalk = "figure.walk"
   case film = "film"
   case fireExtinguisher = "fire.extinguisher"
   case flag = "flag"
   case flame = "flame"
   case flashlightOnFill = "flashlight.on.fill"
   case folder = "folder"
   case folderBadgePlus = "folder.badge.plus"
   case forkKnife = "fork.knife"
   case forward = "forward"
   case gamecontroller = "gamecontroller"
   case gauge = "gauge"
   case gear = "gear"
   case gift = "gift"
   case globe = "globe"
   case graduationcap = "graduationcap"
   case hammer = "hammer"
   case handRaised = "hand.raised"
   case hands = "hands.clap"
   case headphones = "headphones"
   case heart = "heart"
   case heartTextClipboard = "heart.text.clipboard"
   case hourglass = "hourglass"
   case house = "house"
   case icloud = "icloud"
   case infinity = "infinity"
   case ipad = "ipad"
   case iphone = "iphone"
   case key = "key"
   case keyboard = "keyboard"
   case laptopcomputer = "laptopcomputer"
   case laserBurst = "laser.burst"
   case leaf = "leaf"
   case lifepreserver = "lifepreserver"
   case lightbulb = "lightbulb"
   case link = "link"
   case listBullet = "list.bullet"
   case location = "location"
   case locationCircle = "location.circle"
   case lock = "lock"
   case lockOpen = "lock.open"
   case macbook = "macbook"
   case magnifyingglass = "magnifyingglass"
   case mail = "mail"
   case mailStack = "mail.stack"
   case map = "map"
   case medal = "medal"
   case megaphone = "megaphone"
   case memories = "memories"
   case menubarRectangle = "menubar.rectangle"
   case message = "message"
   case mic = "mic"
   case microbe = "microbe"
   case minusCircle = "minus.circle"
   case moon = "moon"
   case moonStars = "moon.stars"
   case musicNote = "music.note"
   case network = "network"
   case newspaper = "newspaper"
   case number = "number"
   case opticaldisc = "opticaldisc"
   case paintbrush = "paintbrush"
   case paintpalette = "paintpalette"
   case paperclip = "paperclip"
   case paperplane = "paperplane"
   case parkingsign = "parkingsign"
   case pawprint = "pawprint"
   case pencil = "pencil"
   case person = "person"
   case person2 = "person.2"
   case person3 = "person.3"
   case personCircle = "person.circle"
   case phone = "phone"
   case phoneArrowUpRight = "phone.arrow.up.right"
   case pills = "pills"
   case pin = "pin"
   case play = "play"
   case plus = "plus"
   case plusCircle = "plus.circle"
   case popcorn = "popcorn"
   case printer = "printer"
   case puzzlepiece = "puzzlepiece"
   case qrcode = "qrcode"
   case questionmark = "questionmark"
   case questionmarkCircle = "questionmark.circle"
   case quote = "quote.bubble"
   case rainbow = "rainbow"
   case rectangle = "rectangle"
   case rectangleStack = "rectangle.stack"
   case rosette = "rosette"
   case ruler = "ruler"
   case safari = "safari"
   case scale = "scale.3d"
   case scissors = "scissors"
   case scroll = "scroll"
   case server = "server.rack"
   case shield = "shield"
   case shieldSlash = "shield.slash"
   case shippingbox = "shippingbox"
   case shower = "shower"
   case signature = "signature"
   case sleep = "sleep"
   case sliderHorizontal = "slider.horizontal.3"
   case sparkles = "sparkles"
   case speaker = "speaker"
   case sportscourt = "sportscourt"
   case star = "star"
   case starCircle = "star.circle"
   case stethoscope = "stethoscope"
   case stopwatch = "stopwatch"
   case suitcase = "suitcase"
   case sunMax = "sun.max"
   case sunrise = "sunrise"
   case sunset = "sunset"
   case tag = "tag"
   case target = "target"
   case terminal = "terminal"
   case thermometer = "thermometer"
   case ticket = "ticket"
   case timer = "timer"
   case tornado = "tornado"
   case touchid = "touchid"
   case trash = "trash"
   case tray = "tray"
   case trophy = "trophy"
   case tv = "tv"
   case umbrella = "umbrella"
   case visionPro = "vision.pro"
   case video = "video"
   case walletBifold = "wallet.bifold"
   case wand = "wand.and.stars"
   case waveform = "waveform"
   case wifi = "wifi"
   case wifiRouter = "wifi.router"
   case wind = "wind"
   case wrench = "wrench"
   case xmark = "xmark"
   case zzz = "zzz"
}

extension SFSymbol: SearchableOption {
   public var id: Self { self }

   /// A SwiftUI view that displays the SF Symbol in a large font size.
   ///
   /// - Note: No need to use this directly. It will be used inside a ``SearchableGridPicker``.
   ///
   /// Example:
   /// ```
   /// var body: some View {
   ///     SFSymbol.alarm.view
   /// }
   /// // Displays the alarm SF Symbol ⏰ in large size.
   /// ```
   public var view: some View {
      Image(systemName: self.rawValue)
         .font(.title3)
   }

   #warning("🧑‍💻 localize the search terms to support more languages")
   /// Search terms related to each SF Symbol. This can be used to filter or find symbols based on keywords.
   ///
   /// - Note: No need to use this directly. It will be used inside a ``SearchableGridPicker``.
   ///
   /// Example:
   /// ```
   /// let searchTerms = SFSymbol.airplane.searchTerms
   /// print(searchTerms) // Outputs: ["airplane", "flight", "travel", "transport"]
   /// ```
   public var searchTerms: [String] {
      switch self {
      case .airplane: ["flight", "travel", "plane", "transportation", "journey"]
      case .airplaneArrival: ["landing", "arrive", "airport", "destination", "travel"]
      case .airplaneDeparture: ["takeoff", "depart", "airport", "start", "travel"]
      case .alarm: ["clock", "time", "reminder", "alert", "wake"]
      case .alt: ["alternative", "key", "option", "modify", "keyboard"]
      case .ant: ["insect", "bug", "small", "nature", "creature"]
      case .appleIntelligence: ["apple", "intelligence", "ai", "smart", "future", "brain", "robot"]
      case .appleLogo: ["apple", "brand", "logo", "company", "tech"]
      case .appleWatch: ["apple", "watch", "clock", "band", "arm", "time", "wearable"]
      case .archivebox: ["storage", "backup", "history", "archive", "file"]
      case .arrowDown: ["down", "direction", "move", "descend", "below"]
      case .arrowDownCircle: ["down", "circle", "direction", "descend", "button"]
      case .arrowDownSquare: ["down", "square", "direction", "descend", "button"]
      case .arrowLeft: ["left", "direction", "move", "back", "previous"]
      case .arrowLeftCircle: ["left", "circle", "direction", "back", "button"]
      case .arrowLeftSquare: ["left", "square", "direction", "back", "button"]
      case .arrowRight: ["right", "direction", "move", "next", "forward"]
      case .arrowRightCircle: ["right", "circle", "direction", "next", "button"]
      case .arrowRightSquare: ["right", "square", "direction", "next", "button"]
      case .arrowUp: ["up", "direction", "move", "ascend", "above"]
      case .arrowUpArrowDown: ["up", "down", "toggle", "sort", "order"]
      case .arrowUpCircle: ["up", "circle", "direction", "ascend", "button"]
      case .arrowUpSquare: ["up", "square", "direction", "ascend", "button"]
      case .asteriskCircle: ["asterisk", "circle", "star", "important", "required"]
      case .atBadgeMinus: ["at", "remove", "email", "contact", "delete"]
      case .atBadgePlus: ["at", "add", "email", "contact", "new"]
      case .atCircle: ["at", "circle", "email", "contact", "address"]
      case .atom: ["science", "physics", "particle", "energy", "nuclear"]
      case .bag: ["shopping", "bag", "store", "purchase", "retail"]
      case .bandage: ["medical", "health", "first-aid", "injury", "care"]
      case .barcode: ["scan", "product", "identifier", "retail", "inventory"]
      case .battery100: ["power", "charging", "energy", "full", "battery"]
      case .bedDouble: ["sleep", "rest", "hotel", "bedroom", "accommodation"]
      case .bell: ["alert", "notification", "bell", "reminder", "alarm"]
      case .bellBadge: ["notification", "alert", "update", "badge", "new"]
      case .bellSlash: ["mute", "silence", "bell", "quiet", "disable"]
      case .binXmark: ["delete", "remove", "bin", "trash", "clean"]
      case .birthdayCake: ["celebration", "party", "anniversary", "birthday", "event"]
      case .book: ["read", "book", "text", "literature", "study"]
      case .bookCircle: ["read", "book", "circle", "study", "literature"]
      case .bookmark: ["save", "bookmark", "favorite", "mark", "remember"]
      case .brain: ["brain", "thinking", "mind", "intelligence", "cognitive"]
      case .briefcase: ["work", "business", "professional", "job", "career"]
      case .bubbleLeft: ["chat", "message", "bubble", "communication", "text"]
      case .bubbleMiddleBottom: ["chat", "bubble", "middle", "message", "communication"]
      case .bubbleRight: ["chat", "message", "bubble", "communication", "text"]
      case .buildingColumns: ["building", "institution", "columns", "bank", "government"]
      case .calendar: ["date", "calendar", "schedule", "time", "event"]
      case .calendarBadgeClock: ["schedule", "time", "reminder", "appointment", "deadline"]
      case .calendarBadgeExclamationmark: ["urgent", "important", "deadline", "warning", "calendar"]
      case .camera: ["photo", "camera", "picture", "image", "capture"]
      case .candybarphone: ["phone", "old", "candybar"]
      case .car: ["vehicle", "drive", "automobile", "car"]
      case .cart: ["shopping", "store", "checkout", "cart"]
      case .chartBar: ["chart", "statistics", "bar", "graph"]
      case .chartPie: ["statistics", "analytics", "data", "pie"]
      case .checkmark: ["check", "done", "complete", "tick"]
      case .checkmarkCircle: ["check", "circle", "done", "tick"]
      case .checkmarkSquare: ["check", "square", "done", "tick"]
      case .clock: ["time", "schedule", "deadline", "clock"]
      case .cloud: ["weather", "cloud", "storage", "sky"]
      case .cloudBolt: ["storm", "lightning", "cloud", "thunder"]
      case .cloudDrizzle: ["drizzle", "rain", "weather", "cloud"]
      case .cloudFog: ["fog", "mist", "weather", "cloud"]
      case .cloudHail: ["hail", "storm", "weather", "cloud"]
      case .cloudHeavyrain: ["rain", "storm", "weather", "cloud"]
      case .cloudMoon: ["cloud", "moon", "night", "weather"]
      case .cloudRain: ["rain", "weather", "cloud", "shower"]
      case .cloudSnow: ["snow", "weather", "cloud", "winter"]
      case .cloudSun: ["weather", "sun", "cloud", "day"]
      case .cpu: ["processor", "cpu", "chip", "hardware"]
      case .creditCard: ["payment", "money", "transaction", "credit"]
      case .cross: ["cross", "religion", "symbol", "faith"]
      case .crown: ["royalty", "king", "queen", "monarch"]
      case .cube: ["3d", "shape", "cube", "geometry"]
      case .cupAndSaucer: ["coffee", "drink", "cup", "tea"]
      case .desktopComputer: ["computer", "desktop", "workspace", "pc"]
      case .diamond: ["premium", "luxury", "value", "gem"]
      case .dice: ["game", "chance", "dice", "luck"]
      case .display: ["screen", "monitor", "output", "display"]
      case .doc: ["document", "file", "doc", "text"]
      case .docAppend: ["document", "file", "add", "append"]
      case .docOnClipboard: ["clipboard", "document", "file", "copy"]
      case .docPlaintext: ["document", "text", "plain", "file"]
      case .docRichtext: ["document", "rich", "text", "format"]
      case .docText: ["document", "text", "file", "doc"]
      case .dollarSignCircle: ["money", "dollar", "currency", "circle"]
      case .drop: ["water", "liquid", "hydration", "drop"]
      case .ear: ["hearing", "ear", "sound", "listen"]
      case .earbuds: ["audio", "wireless", "music", "earphones"]
      case .envelope: ["mail", "email", "envelope", "letter"]
      case .envelopeBadge: ["mail", "notification", "message", "badge"]
      case .equalCircle: ["equal", "circle", "math", "balance"]
      case .exclamationmarkTriangle: ["warning", "alert", "exclamation", "triangle"]
      case .eye: ["view", "eye", "see", "watch"]
      case .eyeSlash: ["hide", "eye", "invisible", "conceal"]
      case .faceDashed: ["face", "dashed", "outline", "incomplete"]
      case .faceid: ["security", "authentication", "face", "biometric"]
      case .faceSmiling: ["smile", "happy", "face", "joy"]
      case .figureStand: ["stand", "person", "still", "figure"]
      case .figureWalk: ["walk", "person", "movement", "figure"]
      case .film: ["movie", "video", "cinema", "film"]
      case .fireExtinguisher: ["safety", "emergency", "fire", "extinguisher"]
      case .flag: ["flag", "country", "symbol", "banner"]
      case .flame: ["fire", "hot", "flame", "heat"]
      case .flashlightOnFill: ["light", "torch", "brightness", "flashlight"]
      case .folder: ["files", "organization", "storage", "folder"]
      case .folderBadgePlus: ["folder", "add", "badge", "plus"]
      case .forkKnife: ["food", "fork", "knife", "eat"]
      case .forward: ["next", "move", "forward", "advance"]
      case .gamecontroller: ["game", "controller", "play", "console"]
      case .gauge: ["measure", "gauge", "speed", "meter"]
      case .gear: ["settings", "gear", "cog", "preferences"]
      case .gift: ["present", "surprise", "package", "gift"]
      case .globe: ["world", "internet", "international", "globe"]
      case .graduationcap: ["education", "graduation", "cap", "school"]
      case .hammer: ["tool", "build", "hammer", "construction"]
      case .handRaised: ["volunteer", "participation", "attention", "raise"]
      case .hands: ["applause", "celebration", "approval", "clap"]
      case .headphones: ["audio", "music", "headphones", "listen"]
      case .heart: ["love", "like", "heart", "favorite"]
      case .heartTextClipboard: ["heart", "message", "text", "love"]
      case .hourglass: ["time", "waiting", "progress", "hourglass"]
      case .house: ["home", "house", "building", "residence"]
      case .icloud: ["cloud", "backup", "sync", "icloud"]
      case .infinity: ["infinity", "forever", "loop", "endless"]
      case .ipad: ["tablet", "device", "mobile", "ipad"]
      case .iphone: ["phone", "mobile", "device", "iphone"]
      case .key: ["unlock", "key", "password", "security"]
      case .keyboard: ["typing", "input", "hardware", "keyboard"]
      case .laptopcomputer: ["laptop", "computer", "portable", "notebook"]
      case .laserBurst: ["laser", "beam", "light", "device"]
      case .leaf: ["nature", "environment", "eco", "leaf"]
      case .lifepreserver: ["help", "safety", "support", "lifesaver"]
      case .lightbulb: ["idea", "light", "bulb", "innovation"]
      case .link: ["url", "link", "chain", "connection"]
      case .listBullet: ["list", "bullet", "task", "items"]
      case .location: ["map", "pin", "location", "place"]
      case .locationCircle: ["location", "circle", "map", "pin"]
      case .lock: ["secure", "lock", "closed", "security"]
      case .lockOpen: ["unlock", "open", "lock", "security"]
      case .macbook: ["mac", "macbook", "notebook", "laptop", "computer"]
      case .magnifyingglass: ["search", "find", "zoom", "magnify"]
      case .mail: ["mail", "email", "letter", "message"]
      case .mailStack: ["mail", "email", "stack", "letters"]
      case .map: ["navigation", "map", "location", "directions"]
      case .medal: ["achievement", "award", "recognition", "medal"]
      case .megaphone: ["announcement", "loud", "megaphone", "broadcast"]
      case .memories: ["photos", "history", "moments", "memories"]
      case .menubarRectangle: ["menu", "bar", "interface", "navigation"]
      case .message: ["message", "chat", "fill", "communication"]
      case .mic: ["record", "microphone", "voice", "audio"]
      case .microbe: ["virus", "bacteria", "health", "microbe"]
      case .minusCircle: ["remove", "minus", "circle", "subtract"]
      case .moon: ["night", "moon", "dark", "sky"]
      case .moonStars: ["moon", "stars", "night", "sky"]
      case .musicNote: ["music", "note", "audio", "song"]
      case .network: ["connection", "internet", "topology", "wifi"]
      case .newspaper: ["news", "articles", "information", "media"]
      case .number: ["digit", "number", "count", "numeral", "hashtag"]
      case .opticaldisc: ["cd", "dvd", "storage", "media"]
      case .paintbrush: ["art", "draw", "paint", "brush"]
      case .paintpalette: ["art", "colors", "creative", "painting"]
      case .paperclip: ["attachment", "paperclip", "clip", "document"]
      case .paperplane: ["send", "message", "fly", "email"]
      case .parkingsign: ["parking", "car", "location", "sign"]
      case .pawprint: ["animal", "pet", "paw", "track"]
      case .pencil: ["edit", "write", "draw", "pencil"]
      case .person2: ["group", "people", "multiple"]
      case .person3: ["group", "team", "community"]
      case .person: ["user", "person", "human", "individual"]
      case .personCircle: ["user", "circle", "person", "profile"]
      case .phone: ["call", "phone", "talk", "communication"]
      case .phoneArrowUpRight: ["outgoing", "call", "phone", "arrow"]
      case .pills: ["medicine", "health", "prescription", "drugs"]
      case .pin: ["location", "attach", "marker", "map"]
      case .play: ["start", "play", "media", "video"]
      case .plus: ["add", "plus", "new", "increase"]
      case .plusCircle: ["add", "circle", "plus", "new"]
      case .popcorn: ["movie", "snack", "entertainment", "theater"]
      case .printer: ["print", "printer", "document", "paper"]
      case .puzzlepiece: ["puzzle", "piece", "game", "fit"]
      case .qrcode: ["code", "scan", "link", "qr"]
      case .questionmark: ["help", "question", "unknown", "query"]
      case .questionmarkCircle: ["help", "question", "circle", "unknown"]
      case .quote: ["speech", "quote", "text", "quotation"]
      case .rainbow: ["colors", "rainbow", "weather", "arc"]
      case .rectangle: ["shape", "rectangle", "box", "geometry"]
      case .rectangleStack: ["layers", "stack", "multiple", "rectangle"]
      case .rosette: ["award", "achievement", "decoration", "ribbon"]
      case .ruler: ["measure", "ruler", "tool", "scale"]
      case .safari: ["browser", "internet", "web", "compass"]
      case .scale: ["measure", "weight", "balance", "scale"]
      case .scissors: ["cut", "scissors", "tool", "trim"]
      case .scroll: ["document", "ancient", "roll", "scroll"]
      case .server: ["datacenter", "hosting", "infrastructure", "network"]
      case .shield: ["protection", "shield", "security", "defense"]
      case .shieldSlash: ["protection", "shield", "broken", "security"]
      case .shippingbox: ["delivery", "package", "shipping", "box"]
      case .shower: ["bathroom", "clean", "water", "hygiene"]
      case .signature: ["sign", "authorize", "approve", "signature"]
      case .sleep: ["rest", "night", "bed", "zzz"]
      case .sliderHorizontal: ["control", "slider", "adjust", "horizontal"]
      case .sparkles: ["magic", "special", "effect", "sparkle"]
      case .speaker: ["sound", "speaker", "volume", "audio"]
      case .sportscourt: ["sports", "game", "athletic", "court"]
      case .star: ["favorite", "star", "rating", "highlight"]
      case .starCircle: ["favorite", "star", "circle", "highlight"]
      case .stethoscope: ["medical", "doctor", "health", "diagnosis"]
      case .stopwatch: ["time", "stopwatch", "timer", "countdown"]
      case .suitcase: ["travel", "luggage", "trip", "bag"]
      case .sunMax: ["day", "sun", "light", "brightness"]
      case .sunrise: ["morning", "sun", "light", "daybreak"]
      case .sunset: ["evening", "sun", "light", "dusk"]
      case .tag: ["price", "tag", "label", "category"]
      case .target: ["goal", "aim", "objective", "focus"]
      case .terminal: ["command", "terminal", "console", "code"]
      case .thermometer: ["temperature", "thermometer", "heat", "cold"]
      case .ticket: ["event", "admission", "pass", "entry"]
      case .timer: ["countdown", "time", "duration", "clock"]
      case .tornado: ["weather", "storm", "disaster", "wind"]
      case .touchid: ["fingerprint", "security", "authentication", "biometrics"]
      case .trash: ["delete", "remove", "trash", "bin"]
      case .tray: ["storage", "tray", "file", "holder"]
      case .trophy: ["winner", "achievement", "success", "award"]
      case .tv: ["television", "media", "tv", "screen"]
      case .umbrella: ["rain", "protection", "weather", "shelter"]
      case .visionPro: ["vision", "pro", "apple", "vr", "ar", "3d", "spatial", "computer"]
      case .video: ["record", "video", "camera", "media"]
      case .walletBifold: ["money", "payment", "cards", "wallet"]
      case .wand: ["magic", "wand", "effect", "spark"]
      case .waveform: ["audio", "sound", "music", "wave"]
      case .wifi: ["network", "wifi", "internet", "wireless"]
      case .wifiRouter: ["network", "internet", "wireless", "router"]
      case .wind: ["weather", "wind", "breeze", "air"]
      case .wrench: ["tool", "fix", "wrench", "repair"]
      case .xmark: ["cancel", "close", "remove", "x"]
      case .zzz: ["sleep", "rest", "tired", "zzz"]
      }
   }
}

