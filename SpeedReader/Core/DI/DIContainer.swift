import Foundation

/// Перечисление влияющее на тип вызова объекта в контейнере
enum Scope {
    case prototype
    case lazySingleton
}

/// Обертка в которой хранится тип скоупа и инструкция
struct Definition<Value> {
    var scope: Scope = .prototype
    var factory: (Container) -> Value
}

/// Все ассембли конформят протоколу, если нет свойств для инициализации
protocol Assembly {
    init()
}

protocol ContainerProtocol {
    func resolve<AssemblyType: Assembly, Value>(keyPath: KeyPath<AssemblyType, Definition<Value>>) -> Value
}

/// Контейнер для хранения объектов
@dynamicMemberLookup
final class Container: ContainerProtocol {
    private var singletons: [ObjectIdentifier: Any] = [:]
}

extension Container {
    /// Имплементация вызова объекта в соответствии с типом скоупа
    func resolve<AssemblyType: Assembly, Value>(keyPath: KeyPath<AssemblyType, Definition<Value>>) -> Value {
        let definition = AssemblyType()[keyPath: keyPath]
        
        switch definition.scope {
        case .prototype:
            return definition.factory(self)
        case .lazySingleton:
            let id = ObjectIdentifier(Value.self)
            if let existingValue = singletons[id] as? Value {
                return existingValue
            }
            let newValue = definition.factory(self)
            singletons[id] = newValue
            return newValue
        }
    }
}
