// Добавить сабскрипт созданного ассембли в контейнер

extension Container {
    subscript <Value> (dynamicMember keyPath: KeyPath<ServiceAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
    
    subscript <Value> (dynamicMember keyPath: KeyPath<ViewAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
}
