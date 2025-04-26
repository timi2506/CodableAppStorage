# CodableAppStorage

## What does this Package do?
Very simple: It adds a new Property Wrapper (@CodableAppStorage) that works very similar to @AppStorage, only difference: It allows any Codable Struct to be saved and retrieved by automatically en- and decoding it from UserDefaults

## Installation
### Using Xcode's built-in Package Manager 
Go to File > Add Package Dependencies...

then, in the Search-Bar enter: 

```https://github.com/timi2506/CodableAppStorage.git``` 

and press "Add Package" and make sure to link it to your target.
<img width="362" alt="Screenshot 2025-03-04 at 11 16 34" src="https://github.com/user-attachments/assets/8b3672b9-9345-4d6b-9b0d-26d03bd189c7" />

## Usage
Very similar to @AppStorage!
### Examples
**@CodableAppStorage(keyName) var variableName: DecodableType = DefaultValue** *Property Wrapper*
```swift
struct ContentView: View {
    @CodableAppStorage("key") var key: [String] = []
    var body: some View {
        VStack {
            List(key, id: \.self) { key in
               Text(key)
            }
            
            Button(action: {
                key.append("New item")
            }) {
                Text("Press To Add to Array")
            }
        }
    }
}
```
- **keyName** *Required*
  - The Name of the UserDefaults Key to Save to
 
***Required*** means you NEED to define this value and it can't be nil

**Recommended Usecases:**
- ✅ Persistant Data

## Issues or Questions

If you have any issues or questions feel free to open an [issue](https://github.com/timi2506/CodableAppStorage/issues/new/choose) or contact me on [Twitter](https://x.com/timi2506)

## Requirements
- iOS 14+
