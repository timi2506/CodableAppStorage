import SwiftUI

@propertyWrapper
public struct CodableAppStorage<T: Codable>: DynamicProperty {
    private let key: String
    private let defaultValue: T
    private let userDefaults: UserDefaults

    @State private var value: T

    public var wrappedValue: T {
        get { value }
        nonmutating set {
            value = newValue
            save(newValue)
        }
    }

    public init(wrappedValue: T, _ key: String, store: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = wrappedValue
        self.userDefaults = store
        self._value = State(initialValue: Self.load(key: key, defaultValue: wrappedValue, store: store))
    }

    private func save(_ newValue: T) {
        do {
            let data = try JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
        } catch {
            print("CodableAppStorage encode failed:", error)
        }
    }

    private static func load(key: String, defaultValue: T, store: UserDefaults) -> T {
        guard let data = store.data(forKey: key) else { return defaultValue }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("CodableAppStorage decode failed:", error)
            return defaultValue
        }
    }
}
