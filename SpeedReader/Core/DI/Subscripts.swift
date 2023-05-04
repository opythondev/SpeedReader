// Добавить сабскрипт созданного ассембли в контейнер

extension Container {
    subscript <Value> (dynamicMember keyPath: KeyPath<MainAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
    
    subscript <Value> (dynamicMember keyPath: KeyPath<CoordinatorAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
    
    subscript <Value> (dynamicMember keyPath: KeyPath<ViewModelAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
}
