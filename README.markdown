![Emojicode](https://raw.githubusercontent.com/nate-parrott/emojicode/master/Emojicode.png)

**Emojicode** takes _binary data_ and transforms it into a _sequence of emoji_ (and back!).

It's like [Base64](https://en.wikipedia.org/wiki/Base64) but using emoji instead of letters and numbers.

This repository contains [`Swift code`](https://github.com/nate-parrott/emojicode/blob/master/BaseEmoji/NSData%2BEmojicode.swift) for the algorithm, but it should be easy to translate to other languages.

## Why?

_Why not?_

**Pretty URLs**

In all seriousness, Emojicode might be remotely useful if you're currently using Base64 for some user-visible strings (like URLs) and you'd like to add some extra flair. Because who'd want to see `mysite.ex/cG9zdCBhZXN0aGV0aWNz` in their URL bar when they _could_ be seeing `mysite.com/✋👋👇👉🌎💧🔏🚽👉👀👉👍💨👇` ?

**(Dubious) compactness**

It's also much more compact *if you're counting characters*: 3 bytes of data pack into 4 base64 characters, but 9 bytes back into 8 Emojicode characters. So, if you're trying to cram binary data into a Tweet for god-knows-what-reason, it's way more efficient.

**Memorization**

You can encode the IP address `216.58.192.14` as 🐢👲🐭😳. Definitely easier to remember.

You can encode the IPv6 address `21a1:647:4e01:63ae:71a2:b8e2:3c51:873e` as 😠👜🌿👼🙀😃🔓💗🛀👤🐬👮😾💁💂. A bit of a handful, but you might be able to commit this one to memory of you came up with some sort of story, like:

```
😠! My 👜 is full of 🌿!
Is that an 👼? 🙀!
So happy 😃!
Someone's 🔓 my 💗.
Every day in the 🛀, I can't stop thinking about 👤.
The intelligence of a 🐬, with the confidence of a 👮.
😾 You know what I mean? No? What's "💁" supposed to mean?
Stop giving me that blank look like you're one of those 💂.
```

Not the best. But I dare you to write a better story about `21a1:647:4e01:63ae:71a2:b8e2:3c51:873e`.

## How?

First, we've gotta pick a set of emoji to use. The Unicode standard, which defines all emoji, is constantly being updated For example, it includes a taco emoji that isn't supported by any platform. So I found some arbitrary list of 845 basic emoji that seem to be supported by a lot of platforms, and went with it.

Now that we've got our emoji, we need some scheme for representing bytes with them. The most mathematically efficient way to do this would be to [radix (base) conversion](https://en.wikipedia.org/wiki/Radix) — just like you'd convert base-10 numbers into base-16 (hex) numbers or base-2 (binary) numbers, you could treat each byte as one of 256 digits, and convert from base-256 to base-845. The only algorithm I know for radix conversion relies on treating the entire data set as a single number, and I'm not very good at math, so I needed an easier approach.

The _easiest_ approach would be to map each of the 256 values of a byte to one of 256 emoji. But that's a huge waste. If we used 512 different emoji, we could have each one represent a 9-bit number (since it takes 9 bits to represent the numbers 0-511). So for each emoji in our code, we get a whole byte (8 bits) plus one extra bit for 🆓. 

Here's how it works: we create a lookup table with 512 emoji; to encode a byte + extra bit, we treat the byte as a number (0-255), add 256 to it if we're setting the extra bit to 1, then insert the emoji corresponding to that number (now between 0-511, inclusive). To decode, convert the emoji back to its number; the extra bit was 1 if the number is greater than 255, and the original byte is just the number `mod` 256. Every 8th byte we decode, we've got enough extra bits for a full byte, so we insert it into the decoded data.

There's a little problem, though: what if we're decoding some data that was originally 8 bytes long? We'll decode all 8 bytes, but then we'll get an extra byte from all those extra bits. We need some way to tell the decoder to sometimes ignore the extra byte. Emojicode does this by special-purposing the extra bit from the _very first emoji_ in the message — if it's set, ignore the last extra byte. The first extra bit is special, so we don't start using the extra bits to encode extra bytes until _after_ the first emoji.
