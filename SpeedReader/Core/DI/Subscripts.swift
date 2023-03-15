/// Добавить сабскрипт созданного ассембли в контейнер
extension Container {
    subscript <Value> (dynamicMember keyPath: KeyPath<NavigationContorllerAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
    
    subscript <Value> (dynamicMember keyPath: KeyPath<RouterAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
    
    subscript <Value> (dynamicMember keyPath: KeyPath<MainViewAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
}
