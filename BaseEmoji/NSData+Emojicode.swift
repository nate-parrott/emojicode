//  Created by Nate Parrott on 8/16/15.
//  Copyright © 2015 Nate Parrott. All rights reserved.
//

import Foundation

private struct _LookupTable {
    init() {
        let emoji = "😄😃😀😊☺️😉😍😘😚😗😙😜😝😛😳😁😔😌😒😞😣😢😂😭😪😥😰😅😓😩😫😨😱😠😡😤😖😆😋😷😎😴😵😲😟😦😧😈👿😮😬😐😕😯😶😇😏😑👲👳👮👷💂👶👦👧👨👩👴👵👱👼👸😺😸😻😽😼🙀😿😹😾👹👺🙈🙉🙊💀👽💩🔥✨🌟💫💥💢💦💧💤💨👂👀👃👅👄👍👎👌👊✊✌️👋✋👐👆👇👉👈🙌🙏☝️👏💪🚶🏃💃👫👪👬👭💏💑👯🙆🙅💁🙋💆💇💅👰🙎🙍🙇🎩👑👒👟👞👡👠👢👕👔👚👗🎽👖👘👙💼👜👝👛👓🎀🌂💄💛💙💜💚❤️💔💗💓💕💖💞💘💌💋💍💎👤👥💬👣💭🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩🐾💐🌸🌷🍀🌹🌻🌺🍁🍃🍂🌿🌾🍄🌵🌴🌲🌳🌰🌱🌼🌐🌞🌝🌚🌑🌒🌓🌔🌕🌖🌗🌘🌜🌛🌙🌍🌎🌏🌋🌌🌠⭐☀️⛅☁️⚡☔❄️⛄🌀🌁🌈🌊🎍💝🎎🎒🎓🎏🎆🎇🎐🎑🎃👻🎅🎄🎁🎋🎉🎊🎈🎌🔮🎥📷📹📼💿📀💽💾💻📱☎️📞📟📠📡📺📻🔊🔉🔈🔇🔔🔕📢📣⏳⌛⏰⌚🔓🔒🔏🔐🔑🔎💡🔦🔆🔅🔌🔋🔍🛁🛀🚿🚽🔧🔩🔨🚪🚬💣🔫🔪💊💉💰💴💵💷💶💳💸📲📧📥📤✉️📩📨📯📫📪📬📭📮📦📝📄📃📑📊📈📉📜📋📅📆📇📁📂✂️📌📎✒️✏️📏📐📕📗📘📙📓📔📒📚📖🔖📛🔬🔭📰🎨🎬🎤🎧🎼🎵🎶🎹🎻🎺🎷🎸👾🎮🃏🎴🀄🎲🎯🏈🏀⚽⚾️🎾🎱🏉🎳⛳🚵🚴🏁🏇🏆🎿🏂🏊🏄🎣☕🍵🍶🍼🍺🍻🍸🍹🍷🍴🍕🍔🍟🍗🍖🍝🍛🍤🍱🍣🍥🍙🍘🍚🍜🍲🍢🍡🍳🍞🍩🍮🍦🍨🍧🎂🍰🍪🍫🍬🍭🍯🍎🍏🍊🍋🍒🍇🍉🍓🍑🍈🍌🍐🍍🍠🍆🍅🌽🏠🏡🏫🏢🏣🏥🏦🏪🏩🏨💒⛪🏬🏤🌇🌆🏯🏰⛺🏭🗼🗾🗻🌄🌅🌃🗽🌉🎠🎡⛲🎢🚢⛵🚤🚣⚓🚀✈️💺🚁🚂🚊🚉🚞🚆🚄🚅🚈🚇🚝🚋🚃🚎🚌🚍🚙🚘🚗🚕🚖🚛🚚🚨🚓🚔🚒🚑🚐🚲🚡🚟🚠🚜💈🚏🎫🚦🚥⚠️🚧🔰⛽🏮🎰♨️🗿🎪🎭📍🚩🇯🇵🇰🇷🇩🇪🇨🇳🇺🇸🇫🇷🇪🇸🇮🇹🇷🇺🇬🇧1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣0️⃣🔟🔢#️⃣🔣⬆️⬇️⬅️➡️🔠🔡🔤↗️↖️↘️↙️↔️↕️🔄◀️▶️🔼🔽↩️↪️ℹ️⏪⏩⏫⏬⤵️⤴️🆗🔀🔁🔂🆕🆙🆒🆓🆖📶🎦🈁🈯🈳🈵🈴🈲🉐🈹🈺🈶🈚🚻🚹🚺🚼🚾🚰🚮🅿️♿🚭🈷️🈸🈂️Ⓜ️🛂🛄🛅🛃🉑㊙️㊗️🆑🆘🆔🚫🔞📵🚯🚱🚳🚷🚸⛔✳️❇️❎✅✴️💟🆚📳📴🅰️🅱️🆎🅾️💠➿♻️♈♉♊♋♌♍♎♏♐♑♒♓⛎🔯🏧💹💲💱©️®️™️❌‼️⁉️❗❓❕❔⭕🔝🔚🔙🔛🔜🔃🕛🕧🕐🕜🕑🕝🕒🕞🕓🕟🕔🕠🕕🕖🕗🕘🕙🕚🕡🕢🕣🕤🕥🕦✖️➕➖➗♠️♥️♣️♦️💮💯✔️☑️🔘🔗➰〰️〽️🔱◼️◻️◾◽▪️▫️🔺🔲🔳⚫⚪🔴🔵🔻⬜⬛🔶🔷🔸🔹"
        
        var emojiByIndex = [String]()
        emoji.enumerateSubstringsInRange(emoji.startIndex..<emoji.endIndex, options: NSStringEnumerationOptions.ByComposedCharacterSequences) {(charOpt: String?, _, _, _) in
            if emojiByIndex.count < 512 {
                if let c = charOpt {emojiByIndex.append(c)}
            }
        }
        self.emojiByIndex = emojiByIndex
        
        var indexByEmoji = [String: Int]()
        var i: Int
        for i=0; i<512; i++ {
            indexByEmoji[emojiByIndex[i]] = i
        }
        self.indexByEmoji = indexByEmoji
    }
    let emojiByIndex: [String]
    let indexByEmoji: [String: Int]
}

private func _bitsFromByte(byte: UInt8) -> [Bool] {
    var b = byte
    var bits = [Bool]()
    var i: Int
    for i=0; i<8; i++ {
        bits.append((b % 2) == 1)
        b = b / 2
    }
    return bits
}

private func _byteFromBits(bits: [Bool]) -> UInt8 {
    var byte: UInt8 = 0
    var mult: Int = 1
    for bit in bits {
        byte += UInt8((bit ? 1 : 0) * mult)
        mult *= 2
    }
    return byte
}

extension NSData {
    private func _enumerateEvery9Bytes(initialOffset: Int, callback: [UInt8] -> ()) {
        let data = UnsafePointer<UInt8>(self.bytes)
        var i: Int
        for i=initialOffset; i<length; i+=9 {
            var bytes = [UInt8]()
            var j: Int
            for j=i; j<min(length, i+9); j++ {
                bytes.append(data[j])
            }
            callback(bytes)
        }
    }
    var emojicodeString: String {
        get {
            if length > 0 {
                let lookup = _LookupTable()
                let data = UnsafePointer<UInt8>(self.bytes)
                var encoded = ""
                var ignoreLastExtraBit = true
                _enumerateEvery9Bytes(1) { (bytes) in
                    ignoreLastExtraBit = bytes.count == 8
                    let extraBits = _bitsFromByte(bytes.count == 9 ? bytes.last! : 0)
                    for (byte, extraBit) in Zip2Sequence(bytes, extraBits) {
                        encoded += lookup.emojiByIndex[Int(byte) + (extraBit ? 256 : 0)]
                    }
                }
                let first = lookup.emojiByIndex[Int(data[0]) + (ignoreLastExtraBit ? 256 : 0)]
                return first + encoded
            } else {
                return ""
            }
        }
    }
    
    convenience init(emojicodeString: String) {
        let lookup = _LookupTable()
        var bytes = [UInt8]()
        var extraBits = [Bool]()
        var ignoreLastExtraByte: Bool?
        emojicodeString.enumerateSubstringsInRange(emojicodeString.startIndex..<emojicodeString.endIndex, options: NSStringEnumerationOptions.ByComposedCharacterSequences) {(charOpt: String?, _, _, _) in
            if let char = charOpt {
                if let index = lookup.indexByEmoji[char] {
                    bytes.append(UInt8(index & 255))
                    let highBitSet = (index & 256) == 256
                    if ignoreLastExtraByte == nil {
                        ignoreLastExtraByte = highBitSet
                    } else {
                        extraBits.append(highBitSet)
                        if extraBits.count == 8 {
                            bytes.append(_byteFromBits(extraBits))
                            extraBits.removeAll()
                        }
                    }
                }
            }
        }
        if let ignore = ignoreLastExtraByte {
            if ignore {
                bytes.removeLast()
            }
        }
        self.init(bytes: bytes, length: bytes.count)
    }
}

private func _printBytes(data: NSData) {
    var bytes = [UInt8]()
    let dataBytes = UnsafePointer<UInt8>(data.bytes)
    var i: Int
    for i=0; i<data.length; i++ {
        bytes.append(dataBytes[i])
    }
    print("\(bytes)")
}

func _testEmojicode() {
    for i: UInt8 in [0, 1, 3, 255, 201, 51, 30] {
        // print("\(_bitsFromByte(i))")
        // print("\(_byteFromBits(_bitsFromByte(i)))")
        assert(_byteFromBits(_bitsFromByte(i)) == i)
    }
    for s in ["abc", "xyz", "(*#)(", "1234567", "12345678", "123456789", "1234567890", "123456789012345678901234567890", "🔨3🚪x", "你好吗"] {
        print(s)
        let d = s.dataUsingEncoding(NSUTF8StringEncoding)!
        _printBytes(d)
        _printBytes(NSData(emojicodeString: d.emojicodeString))
        assert(NSData(emojicodeString: d.emojicodeString) == d)
        
        print(NSUUID().emojicodeString)
    }
}

extension NSUUID {
    var emojicodeString: String {
        get {
            var bytes = [UInt8]()
            bytes.reserveCapacity(16)
            getUUIDBytes(&bytes)
            let data = NSData(bytes: &bytes, length: 16)
            return data.emojicodeString
        }
    }
}
